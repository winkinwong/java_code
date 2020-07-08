package test;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class Test01 {

    private static int[] arr = {1,4,1,4,2,5,4,5,8,7,8,77,88,5,4,9,6,2,4,1,5};

    public static void main(String[] args) {
        Map<Integer,Integer> record = new HashMap<>();
        Arrays.stream(arr).forEach((x)->{
            if (record.containsKey(x)){
                record.put(x,record.get(x)+1);
            }else {
                record.put(x,1);
            }
        });
        record.forEach((k,v)->{
            System.out.println(k+"出现："+v+"次");
        });
        Arrays.sort(arr);
        System.out.println(Arrays.toString(arr));

        //冒泡排序
        System.out.println("length:"+arr.length);
        for(int i=1;i<arr.length;i++){
            for (int j=0;j<arr.length-i;j++){
                if (arr[j]<arr[j+1]){
                    int temp = arr[j];
                    arr[j]=arr[j+1];
                    arr[j+1]=temp;
                }
            }
        }
        System.out.println(Arrays.toString(arr)+" length:"+arr.length);
    }
}
