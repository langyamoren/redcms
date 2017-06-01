package com.redcms.util;

public class RecomeCode 
{
  //²»×ãÈýÎ»CV
   public static char org[]=new char[]{'B','M','S','F','G','H','K','W','E','R'};
   public static String orgs="BMSFGHKWER";
   public static String num2code(int num)
   {
	   StringBuilder sb=new StringBuilder();
	   if(num<10)sb.append("CV");
	   if(num>9 && num<100)sb.append("T");
	   String strnum=String.valueOf(num);
	   char bitnum[]=strnum.toCharArray();
	   if(null!=bitnum&&bitnum.length>0)
	   {
		  for(int i=0;i<bitnum.length;i++)
		  {
			  sb.append(org[(int)bitnum[i]-48]);
		  }
	   }
	   
	   return sb.toString();
	   
   }
   public static int code2num(String code)
   {
	   int re=0;  
	   StringBuilder sb=new StringBuilder();
	   if(code.startsWith("CV"))
	   {
		code=code.substring(2);   
	   }else if(code.startsWith("T"))
	   {
		 code=code.substring(1);  
	   }
	   char []codechar=code.toCharArray();
	   for(char tem:codechar)
	   {
		   int index=orgs.indexOf(tem);
		   sb.append(index);
	   }
	   re=Integer.valueOf(sb.toString());
	  return re; 
   }
   public static void main(String[] args) 
   {
	  
	   for(int i=0;i<10000;i++)
	   {
		   String str=num2code(i);
		   System.out.println(i+"\t"+str+"\t"+code2num(str));
	   }
   }
}
