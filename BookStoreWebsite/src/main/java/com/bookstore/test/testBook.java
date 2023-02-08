package com.bookstore.test;

import java.util.Arrays;

public class testBook {
	 public static void main(String[] args) {
		 int arr[] = {1,2,4};
		  int a[] = new int[3] ; 
				
		 System.arraycopy(arr, 0, a, 0, 3);
		 System.out.println("is Equal ==> " + a.equals(arr));
	    for(int i = 0 ;i<3 ; i++) {
	    	 System.out.println(a[i]);
	    }
		  
	}
	
	
	
	
}
