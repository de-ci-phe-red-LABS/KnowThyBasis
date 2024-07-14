`timescale 1ns/100ps
module SMS_5_ANF(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[0]&a[2] ^ a[0]&a[4] ^ a[1]&a[2] ^ a[1]&a[4] ^ a[1] ^ a[2]&a[4] ^ a[2]&a[5] ^ a[3] ^ a[4] ^ a[5];
	 assign b[1]=a[0]&a[1] ^ a[0]&a[3] ^ a[0] ^ a[1]&a[3] ^ a[1]&a[4] ^ a[1] ^ a[2]&a[3] ^ a[2]&a[4] ^ a[3]&a[4] ^ a[4] ^ a[5];
	 assign b[2]=a[0]&a[3] ^ a[0]&a[5] ^ a[0] ^ a[1]&a[2] ^ a[1]&a[3] ^ a[2]&a[3] ^ a[2]&a[5] ^ a[3] ^ a[4] ^ a[5];
	 assign b[3]=a[0]&a[2] ^ a[0]&a[4] ^ a[0] ^ a[1]&a[2] ^ a[1]&a[4] ^ a[1]&a[5] ^ a[1] ^ a[2]&a[3] ^ a[2]&a[4] ^ a[3]&a[4] ^ a[4]&a[5] ^ a[4];
	 assign b[4]=a[0]&a[1] ^ a[1] ^ a[2] ^ a[3]&a[4] ^ a[3]&a[5] ^ a[3] ^ a[4]&a[5] ^ a[4];
	 assign b[5]=a[0]&a[5] ^ a[0] ^ a[1] ^ a[2]&a[3] ^ a[2]&a[4] ^ a[2] ^ a[3]&a[4] ^ a[3] ^ a[5];
endmodule
