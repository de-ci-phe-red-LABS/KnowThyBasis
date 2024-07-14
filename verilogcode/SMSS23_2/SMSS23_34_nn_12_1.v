`timescale 1ns/100ps
module SMSS23_34_nn_12_1(x,y);
	 input [5:0] x;
	 output [5:0] y;
	 wire [5:0] w;
	 wire [5:0] p;
	 isomorphism C2 (x,w);
	 power_34 C3 (w,p);
	 inv_isomorphism C4 (p,y);
endmodule

module square_base(a,b);
	 input [1:0] a;
	 output [1:0] b;
	 assign b[0]=a[1];
	 assign b[1]=a[0];
endmodule

module add_base(a,b,c);
	 input [1:0] a;
	 input [1:0] b;
	 output [1:0] c;
	 assign c[0]=a[0]^b[0];
	 assign c[1]=a[1]^b[1];
endmodule

module multiplication_base(a,b,c);
	 input [1:0] a;
	 input [1:0] b;
	 output [1:0] c;
	 wire t;
	 assign t=(a[0]&b[1])^(a[1]&b[0]);
	 assign c[0]=(a[1]&b[1])^t;
	 assign c[1]=(a[0]&b[0])^t;
endmodule
module power_34(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 wire [1:0] x_0;
	 wire [1:0] x_1;
	 wire [1:0] x_2;
	 wire [1:0] y_0;
	 wire [1:0] y_1;
	 wire [1:0] y_2;
	 wire [1:0] y_3;
	 wire [1:0] y_4;
	 wire [1:0] y_5;
	 wire [1:0] z_00;
	 wire [1:0] z_01;
	 wire [1:0] z_10;
	 wire [1:0] z_11;
	 wire [1:0] z_20;
	 wire [1:0] z_21;
	 assign x_0[0]=a[0];
	 assign x_0[1]=a[1];
	 assign x_1[0]=a[2];
	 assign x_1[1]=a[3];
	 assign x_2[0]=a[4];
	 assign x_2[1]=a[5];
	 square_base  A1 (x_0,y_0);
	 square_base A2 (x_1,y_1);
	 square_base A3 (x_2,y_2);
	 multiplication_base A4 (y_0,y_1,y_3);
	 multiplication_base A5 (y_0,y_2,y_4);
	 multiplication_base A6 (y_1,y_2,y_5);
	 add_base B00 (x_0,x_2,z_00);
	 add_base B01 (y_3,z_00,z_01);
	 add_base B10 (x_0,x_1,z_10);
	 add_base B11 (y_5,z_10,z_11);
	 add_base B20 (x_1,x_2,z_20);
	 add_base B21 (y_4,z_20,z_21);
	 assign b[0]=z_11[0];
	 assign b[1]=z_11[1];
	 assign b[2]=z_21[0];
	 assign b[3]=z_21[1];
	 assign b[4]=z_01[0];
	 assign b[5]=z_01[1];
endmodule

module inv_isomorphism(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[1];
	 assign b[1]=a[2]^a[3]^a[5];
	 assign b[2]=a[3];
	 assign b[3]=a[1]^a[4];
	 assign b[4]=a[1]^a[3]^a[4]^a[5];
	 assign b[5]=a[0]^a[1]^a[3];
endmodule

module isomorphism(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[1]^a[2]^a[5];
	 assign b[1]=a[0]^a[3];
	 assign b[2]=a[4]^a[5];
	 assign b[3]=a[0]^a[1];
	 assign b[4]=a[5];
	 assign b[5]=a[2]^a[4]^a[5];
endmodule

