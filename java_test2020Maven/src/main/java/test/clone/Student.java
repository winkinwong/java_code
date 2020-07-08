package test.clone;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import lombok.Getter;
import lombok.Setter;

import java.io.*;

@Getter
@Setter
public class Student implements Cloneable,Serializable {
    private String name;
    private String address;
    private Integer age;
    private String phone;

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

    public Object deepClone(){
        try {
            ByteArrayOutputStream bos  = new ByteArrayOutputStream();
            ObjectOutputStream oos = new ObjectOutputStream(bos);
            oos.writeObject(this);
            ByteArrayInputStream bis = new ByteArrayInputStream(bos.toByteArray());
            ObjectInputStream ois = new ObjectInputStream(bis);
            Student student = (Student) ois.readObject();
            return student;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Object deepCloneByJson(){
        return JSON.toJavaObject(JSONObject.parseObject(JSON.toJSONString(this)), Student.class);
    }

}
