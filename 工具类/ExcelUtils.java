package com.kuaicto.jumax.member.techtrans.util;


import java.io.*;
import java.util.*;


import com.kuaicto.jumax.member.techtrans.controller.TechTransController;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;




/**
 * by zfy
 * 2018/9/20
 */
public class ExcelUtils {

    /**
     *
     * @param filePath  需要读取的文件路径
     * @param column  指定需要获取的列数，例如第一列 1
     * @param startRow 指定从第几行开始读取数据
     * @param  endRow 指定结束行
     * @return 返回读取列数据的set
     */
    public static HashSet<String> getColumnSet(String filePath, int column, int startRow , int endRow){
        Workbook wb = readExcel(filePath); //文件
        Sheet sheet = wb.getSheetAt(0); //sheet
        int rownum = sheet.getPhysicalNumberOfRows(); //行数
        Row row = null;
        HashSet<String> result = new HashSet<>();
        String cellData = null;
        if(wb != null){
            for (int i=startRow-1; i<endRow; i++){
                System.out.println(i);
                row = sheet.getRow(i);
                if(row !=null){
                    cellData = (String) getCellFormatValue(row.getCell(column-1));
                    result.add(cellData.replaceAll(" ", ""));
                }else{
                    break;
                }
                System.out.println(cellData);
            }
        }
        return  result;
    }

    /**
     *
     * @param filePath 需要读取的文件路径
     * @param column 指定需要获取的列数，例如第一列 1
     * @param startRow 指定从第几行开始读取数据
     * @return  返回读取列数据的set
     */
    public static HashSet<String> getColumnSet(String filePath, int column, int startRow){
        Workbook wb = readExcel(filePath); //文件
        Sheet sheet = wb.getSheetAt(0); //sheet
        int rownum = sheet.getPhysicalNumberOfRows(); //行数
        System.out.println("sumrows " + rownum);

        return  getColumnSet(filePath, column, startRow , rownum-1);
    }



    //读取excel
    public static Workbook readExcel(String filePath){
        Workbook wb = null;
        if(filePath==null){
            return null;
        }
        String extString = filePath.substring(filePath.lastIndexOf("."));
        InputStream is = null;
        try {
            is = new FileInputStream(filePath);
            if(".xls".equals(extString)){
                return wb = new HSSFWorkbook(is);
            }else if(".xlsx".equals(extString)){
                return wb = new XSSFWorkbook(is);
            }else{
                return wb = null;
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return wb;
    }

    public static Object getCellFormatValue(Cell cell){
        Object cellValue = null;
        if(cell!=null){
            //判断cell类型
            switch(cell.getCellType()){
                case NUMERIC:{
                    cell.setCellType(CellType.STRING);  //将数值型cell设置为string型
                    cellValue = cell.getStringCellValue();
                    break;
                }
                case FORMULA:{
                    //判断cell是否为日期格式
                    if(DateUtil.isCellDateFormatted(cell)){
                        //转换为日期格式YYYY-mm-dd
                        cellValue = cell.getDateCellValue();
                    }else{
                        //数字
                        cellValue = String.valueOf(cell.getNumericCellValue());
                    }
                    break;
                }
                case STRING:{
                    cellValue = cell.getRichStringCellValue().getString();
                    break;
                }
                default:
                    cellValue = "";
            }
        }else{
            cellValue = "";
        }
        return cellValue;
    }

    public static void main(String[] args) throws IOException {
        String filePath = System.getProperty("user.dir") + File.separator +"0514.xlsx";
        HashSet<String> columnSet = ExcelUtils.getColumnSet(filePath, 4, 2);  //读取第一列的从第90行开始往后的数据 到set
        System.out.println("size:"+columnSet.size());
        System.out.println("data:"+columnSet.toString());
        Iterator iterator = columnSet.iterator();
        Map<String,String>resultMap = new HashMap<>();
        while (iterator.hasNext()){
            String phoneNumber = (String) iterator.next();
//            System.out.println(phoneNumber);
            TechTransController techTransController = new TechTransController();
            String vipcode = techTransController.vipInfo(phoneNumber);
            if (vipcode!=null && vipcode!=""){
                resultMap.put(phoneNumber,vipcode);
            }
        }
        System.out.println("resultSize:"+resultMap.size());
        //TODO 导出文件
        long totalCnt = resultMap.size();
        if (totalCnt>0){
            SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook(500);
            CellStyle style = sxssfWorkbook.createCellStyle();
            // 设置样式
            style.setFillForegroundColor(Short.parseShort("40"));//设置单元格着色
            int page_size = 10000;// 定义每页数据数量
            int list_count = Integer.parseInt(totalCnt + "");
            //总数量除以每页显示条数等于页数
            int export_times = list_count % page_size > 0 ? list_count / page_size
                    + 1 : list_count / page_size;
            for (int m = 0; m < export_times; m++) {
                //新建sheet
                Sheet sheet = sxssfWorkbook.createSheet("sheet" + m);
                // 创建属于上面Sheet的Row，参数0可以是0～65535之间的任何一个，
                Row header = sheet.createRow(0); // 第0行
                // 产生标题列，每个sheet页产生一个标题
                Cell cell;
                String[] headerArr= new String[]{"手机号","核实后会员编码"};
                for (int j = 0; j < headerArr.length; j++) {
                    cell = header.createCell((short) j);
                    cell.setCellStyle(style);
                    cell.setCellValue(headerArr[j]);
                    int colWidth = sheet.getColumnWidth(j)*2;
                    sheet.setColumnWidth(j, colWidth < 3000 ? 3000 : colWidth);
                }
                //迭代数据
                int rowNum = 1;
               for (String key:resultMap.keySet()){
                   sheet.setDefaultColumnWidth((short) 50);
                   Row row = sheet.createRow(rowNum++);
                   row.createCell((short) 0).setCellValue(key);
                   row.createCell((short) 1).setCellValue(resultMap.get(key));
               }
            }
            resultMap.clear();
            File file = new File(System.getProperty("user.dir") + File.separator +"result.xlsx");
            if (file.isFile() && file.exists()){
                //若存在相同名称文件，则删除文件
                file.delete();
            }
            OutputStream os=new FileOutputStream(System.getProperty("user.dir") + File.separator +"result.xlsx");
            sxssfWorkbook.write(os);
            if (sxssfWorkbook != null){
                sxssfWorkbook.dispose();
            }
            os.close();
        }
    }

}
