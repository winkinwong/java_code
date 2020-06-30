package test.list;

public class DoubleLinkedListTest {

    public static void main(String[] args) {
       Student student1 = new Student("暴躁老哥",50,"BD0001");
       Student student2 = new Student("传递大师",40,"BD0002");
       Student student3 = new Student("划水怪",30,"BD0003");
       Student student4 = new Student("自闭怪",60,"BD0004");
       Student student5 = new Student("躺尸怪",60,"BD0005");
       Student student6 = new Student("吹牛逼大师",17,"BD0006");
       DoubleLinkedList doubleLinkedList = new DoubleLinkedList();
       doubleLinkedList.add(student1);
       doubleLinkedList.add(student2);
       doubleLinkedList.add(student3);
       doubleLinkedList.add(student4);
       doubleLinkedList.add(student5);
       doubleLinkedList.add(student6);
       doubleLinkedList.delete("BD0004");
       Student update = new Student("草拟吗暴躁老哥",99,"BD0001");
       doubleLinkedList.update(update);
       doubleLinkedList.list();
    }

    static class DoubleLinkedList{
        //先初始化一个头节点，头节点不能动，不放具体数据
        private Student headNode = new Student("",0,"");

        public Student getHeadNode(){
            return headNode;
        }

        //添加节点到双向链表--(尾部添加)
        public void add(Student student){
            //因为head节点不能动，因此我们需要一个辅助遍历temp
            Student temp = headNode;
            while (true){
                if (temp.next ==null){
                    break;
                }
                //若未找到尾部则继续后移
                temp=temp.next;
            }
            //当退出while循环是 temp就指向链表的最后节点
            //形成双向链表
            temp.next=student;//尾部指向后一个为头部
            student.pre=temp;//头部的前一个指向为尾部
        }

        // 修改节点的信息，根据编号来修改，即studentNo不能修改
        public void update(Student newStudent){
            //判断链表是否为空
            if (headNode.next==null){
                System.out.println("当前链表为空");
                return;
            }
            // 找到需要修改的节点，根据studentNo编号
            // 定义一个辅助变量
            Student temp = headNode.next;
            boolean flag = false;//表示是否找到该节点
            while (true){
                if (temp == null){
                    break;
                }
                if (temp.studentNo == newStudent.studentNo){
                    flag=true;
                    break;
                }
                temp=temp.next;
            }
            // 根据flag 判断是否找到要修改的节点
            if (flag){
                temp.name = newStudent.name;
                temp.age = newStudent.age;
            }else {
                System.out.println("没有找到当前编号数据");
            }
        }

        //根据studentNo编号 删除指定数据
        public int delete(String studentNo){
            //判断链表是否为空
            if (headNode.next==null){
                System.out.println("当前链表为空");
                return 0;
            }
            boolean flag = false;
            // 找到需要删除的节点，根据no编号
            // 定义一个辅助变量
            Student temp = headNode.next;
            while (true){
                if (temp == null){
                    break;
                }
                if (temp.studentNo == studentNo){
                    flag=true;
                    break;
                }
                temp=temp.next;
            }
            if (flag){
                temp.pre.next=temp.next;
                if (temp.next!=null){ // temp不是最后一个节点时
                    temp.next.pre=temp.pre;
                }
                return 1;
            }else {
                System.out.println("没有找到当前编号数据");
                return 0;
            }
        }
        public void list(){
            //判断链表是否为空
            if (headNode.next==null){
                System.out.println("当前链表为空");
                return ;
            }
            // 定义一个辅助变量
            Student temp = headNode.next;
            while (true){
                if (temp==null){
                    break;
                }
                System.out.println(temp);
                temp=temp.next;
            }
        }

    }
    //定义一个Node，每一个Student对象就是一个节点
    static class Student{
        private String name;
        private int age;
        private String studentNo;
        private Student pre;//前驱 指向前一个节点 默认为null
        private Student next;//后驱 指向后一个节点 默认为null

        public Student(String name, int age, String studentNo) {
            this.name = name;
            this.age = age;
            this.studentNo = studentNo;
        }

        @Override
        public String toString() {
            return "Student{" +
                    "name='" + name + '\'' +
                    ", age=" + age +
                    ", studentNo='" + studentNo + '\'' +
                    '}';
        }
    }
}
