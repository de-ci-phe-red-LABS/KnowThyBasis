`timescale 1ns/100ps
module SMSS32_52_nn_12_5(x,y);
	 input [5:0] x;
	 output [5:0] y;
	 wire [5:0] w;
	 wire [5:0] p;
	 isomorphism C2 (x,w);
	 power_52 C3 (w,p);
	 inv_isomorphism C4 (p,y);
endmodule

module add_base(a,b,c);
	 input [2:0] a;
	 input [2:0] b;
	 output [2:0] c;
	 assign c[0]=a[0]^b[0];
	 assign c[1]=a[1]^b[1];
	 assign c[2]=a[2]^b[2];
endmodule

module multiplication_base(a,b,c);
	 input [2:0] a;
	 input [2:0] b;
	 output [2:0] c;
	 assign c[0]=(a[2]&b[2])^(a[0]&b[1])^(a[1]&b[0])^(a[1]&b[2])^(a[2]&b[1]);
	 assign c[1]=(a[0]&b[0])^(a[0]&b[2])^(a[2]&b[0])^(a[1]&b[2])^(a[2]&b[1]);
	 assign c[2]=(a[1]&b[1])^(a[0]&b[1])^(a[1]&b[0])^(a[0]&b[2])^(a[2]&b[0]);
endmodule

module square_base(a,b);
	 input [2:0] a;
	 output[2:0] b;
	 assign b[0]=a[2];
	 assign b[1]=a[0];
	 assign b[2]=a[1];
endmodule

module four_base(a,b);
	 input [2:0] a;
	 output[2:0] b;
	 assign b[0]=a[1];
	 assign b[1]=a[2];
	 assign b[2]=a[0];
endmodule

module power_52(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 wire [2:0] x_0;
	 wire [2:0] x_1;
	 wire [2:0] x_2;
	 wire [2:0] x_3;
	 wire [2:0] x_4;
	 wire [2:0] x_5;
	 wire [2:0] x_6;
	 wire [2:0] x_7;
	 wire [2:0] y_0;
	 wire [2:0] y_1;
	 assign x_0[0]=a[0];
	 assign x_0[1]=a[1];
	 assign x_0[2]=a[2];
	 assign x_1[0]=a[3];
	 assign x_1[1]=a[4];
	 assign x_1[2]=a[5];
	 square_base  A1 (x_0,x_2);
	 square_base  A2 (x_1,x_3);
	 multiplication_base A3 (x_0,x_1,x_4);
	 four_base  A4 (x_4,x_5);
	 add_base A5 (x_0,x_1,x_6);
	 add_base A6 (x_5,x_6,x_7);
	 multiplication_base A7 (x_2,x_7,y_0);
	 multiplication_base A8 (x_3,x_7,y_1);
	 assign b[0]=y_0[0];
	 assign b[1]=y_0[1];
	 assign b[2]=y_0[2];
	 assign b[3]=y_1[0];
	 assign b[4]=y_1[1];
	 assign b[5]=y_1[2];
endmodule

module inv_isomorphism(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[0]^a[1]^a[4]^a[5];
	 assign b[1]=a[2]^a[4]^a[5];
	 assign b[2]=a[0]^a[2]^a[3];
	 assign b[3]=a[3]^a[5];
	 assign b[4]=a[0]^a[1]^a[5];
	 assign b[5]=a[0]^a[1];
endmodule

module isomorphism(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[0]^a[1]^a[5];
	 assign b[1]=a[0]^a[2]^a[5];
	 assign b[2]=a[0]^a[2]^a[4]^a[5];
	 assign b[3]=a[0]^a[2]^a[3];
	 assign b[4]=a[0]^a[4]^a[5];
	 assign b[5]=a[0]^a[1]^a[2];
endmodule

