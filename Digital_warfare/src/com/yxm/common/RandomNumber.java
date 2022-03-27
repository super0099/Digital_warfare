package com.yxm.common;

import java.util.Random;

public class RandomNumber {
    //创建一个随机数
    public String RandomN(Integer sice){
        String strNumber = "";
        String data = "1234567890";
        Random random = new Random();//
        for(int i = 0;i<sice;i++) {
            int position = random.nextInt(data.length());//产生一个整数的索引值
            String str = data.substring(position, position+1);//substring获取字符串，（）内的参数是开始和结束的索引值
            strNumber+=str;
        }
        return strNumber;
    }
}
