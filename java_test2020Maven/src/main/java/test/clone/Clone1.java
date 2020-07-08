package test.clone;

public class Clone1 {
    public static void main(String[] args) throws CloneNotSupportedException {
        //引用
  /*      Student s1 = new Student();
        s1.setName("暴躁哥");
        s1.setAddress("垃圾场");
        s1.setAge(80);
        s1.setPhone("13444444444");
        Student s2 = s1;
        System.out.println("s1="+s1);
        System.out.println("s2="+s2);
        System.out.println(s1==s2);
        s2.setName("暴躁老哥");
        System.out.println("s1="+s1);
        System.out.println("s2="+s2);
        System.out.println(s1==s2);*/

        //浅拷贝 实体类实现Cloneable接口重写父类clone方法
      /*  Student s1 = new Student();
        s1.setName("暴躁哥");
        s1.setAddress("垃圾场");
        s1.setAge(80);
        s1.setPhone("13444444444");
        Student s2 = (Student) s1.clone();
        System.out.println("s1="+s1);
        System.out.println("s2="+s2);
        System.out.println(s1==s2);
        s2.setName("暴躁老哥");
        System.out.println("s1="+s1);
        System.out.println("s2="+s2);
        System.out.println(s1==s2);

        System.out.println(s1.getAddress() == s2.getAddress());*/

        //深拷贝  方式1：通过流将对象序列化
       /* Student s1 = new Student();
        s1.setName("暴躁哥");
        s1.setAddress("垃圾场");
        s1.setAge(80);
        s1.setPhone("13444444444");
        Student s2 = (Student) s1.deepClone();
        System.out.println("s1="+s1);
        System.out.println("s2="+s2);
        System.out.println(s1==s2);
        s2.setName("暴躁老哥");
        System.out.println("s1="+s1);
        System.out.println("s2="+s2);
        System.out.println(s1==s2);
        System.out.println(s1.getAddress() == s2.getAddress());*/

        //深拷贝  方式2：将对象转为json再转为对象
        Student s1 = new Student();
        s1.setName("暴躁哥");
        s1.setAddress("垃圾场");
        s1.setAge(80);
        s1.setPhone("13444444444");
        Student s2 = (Student) s1.deepCloneByJson();
        System.out.println("s1="+s1);
        System.out.println("s2="+s2);
        System.out.println(s1==s2);
        s2.setName("暴躁老哥");
        System.out.println("s1="+s1);
        System.out.println("s2="+s2);
        System.out.println(s1==s2);
        System.out.println(s1.getAddress() == s2.getAddress());
        System.out.println(s1.getName());
        System.out.println(s2.getName());
    }
}
