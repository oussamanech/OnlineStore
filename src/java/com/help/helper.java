
package com.help;

public class helper {
    
    public static String get10Words(String s){
        String str[] = s.split(" ");
        
        if (str.length>10) {
            String res="";
            for(int i=0;i<10;i++){
                res=res+str[i]+" ";
            }
            return (res+"...");
            
        }else{
            return s+" ...";
        }
        
    }
    
    //return number
    public String extractDigits(String src) {
    StringBuilder builder = new StringBuilder();
    for (int i = 0; i < src.length(); i++) {
        char c = src.charAt(i);
        if (Character.isDigit(c)) {
            builder.append(c);
        }
    }
    return builder.toString();
}
    
    
}
