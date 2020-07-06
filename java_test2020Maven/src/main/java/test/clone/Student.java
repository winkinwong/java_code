package test.clone;

import java.io.Serializable;

public class Student implements Cloneable,Serializable {
    private String name;
    private String address;
    private Integer age;
    private String phone;

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

    protected Object clone(Object object){
        return null;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
