`timescale 1ns/100ps
module SMS32_13_np_2_5(x,y);
	 input [5:0] x;
	 output [5:0] y;
	 wire [5:0] w;
	 wire [5:0] p;
	 isomorphism C2 (x,w);
	 power_13 C3 (w,p);
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

module constant_multiplication_base_0(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=0;
	 assign b[1]=0;
	 assign b[2]=0;
endmodule

module constant_multiplication_base_1(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[0];
	 assign b[1]=a[1];
	 assign b[2]=a[2];
endmodule

module constant_multiplication_base_2(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[2];
	 assign b[1]=a[0];
	 assign b[2]=a[1]^a[2];
endmodule

module constant_multiplication_base_3(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[1]^a[2];
	 assign b[1]=a[2];
	 assign b[2]=a[0]^a[1]^a[2];
endmodule

module constant_multiplication_base_4(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[0]^a[1]^a[2];
	 assign b[1]=a[1]^a[2];
	 assign b[2]=a[0]^a[1];
endmodule

module constant_multiplication_base_5(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[0]^a[1];
	 assign b[1]=a[0]^a[1]^a[2];
	 assign b[2]=a[0]^a[2];
endmodule

module constant_multiplication_base_6(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[0]^a[2];
	 assign b[1]=a[0]^a[1];
	 assign b[2]=a[1];
endmodule

module constant_multiplication_base_7(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[1];
	 assign b[1]=a[0]^a[2];
	 assign b[2]=a[0];
endmodule

module multiplication_base(a,b,c);
	 input [2:0] a;
	 input [2:0] b;
	 output [2:0] c;
	 assign c[0]=(a[0]&b[0])^(a[1]&b[2])^(a[2]&b[1])^(a[2]&b[2]);
	 assign c[1]=(a[0]&b[1])^(a[1]&b[0])^(a[2]&b[2]);
	 assign c[2]=(a[2]&b[0])^(a[1]&b[1])^(a[0]&b[2])^(a[1]&b[2])^(a[2]&b[1])^(a[2]&b[2]);
endmodule

module square_base(a,b);
	 input [2:0] a;
	 output[2:0] b;
	 assign b[0]=a[0]^a[2];
	 assign b[1]=a[2];
	 assign b[2]=a[1]^a[2];
endmodule

module four_base(a,b);
	 input [2:0] a;
	 output[2:0] b;
	 assign b[0]=a[0]^a[1];
	 assign b[1]=a[1]^a[2];
	 assign b[2]=a[1];
endmodule

module five_base(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[0]^a[1]^a[2]^(a[0]&a[1]);
	 assign b[1]=a[1]^(a[1]&a[2])^(a[0]&a[2]);
	 assign b[2]=a[2]^(a[0]&a[1])^(a[0]&a[2]);
endmodule

module six_base(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[0]^a[2]^(a[0]&a[1])^(a[0]&a[2])^(a[1]&a[2]);
	 assign b[1]=a[1]^a[2]^(a[1]&a[2])^(a[0]&a[1]);
	 assign b[2]=a[1]^(a[1]&a[2])^(a[0]&a[2]);
endmodule

module power_13(a,b);
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
	 wire [2:0] y_2;
	 wire [2:0] y_3;
	 wire [2:0] y_4;
	 wire [2:0] y_5;
	 wire [2:0] w_00;
	 wire [2:0] w_01;
	 wire [2:0] w_02;
	 wire [2:0] w_03;
	 wire [2:0] w_04;
	 wire [2:0] w_05;
	 wire [2:0] w_10;
	 wire [2:0] w_11;
	 wire [2:0] w_12;
	 wire [2:0] w_13;
	 wire [2:0] w_14;
	 wire [2:0] w_15;
	 wire [2:0] z_00;
	 wire [2:0] z_01;
	 wire [2:0] z_02;
	 wire [2:0] z_03;
	 wire [2:0] z_04;
	 wire [2:0] z_10;
	 wire [2:0] z_11;
	 wire [2:0] z_12;
	 wire [2:0] z_13;
	 wire [2:0] z_14;
	 assign x_0[0]=a[0];
	 assign x_0[1]=a[1];
	 assign x_0[2]=a[2];
	 assign x_1[0]=a[3];
	 assign x_1[1]=a[4];
	 assign x_1[2]=a[5];
	 six_base  A1 (x_0,y_0);
	 six_base A2 (x_1,y_1);
	 five_base A3 (x_0,x_2);
	 five_base A4 (x_1,x_3);
	 four_base  A5 (x_0,x_4);
	 four_base A6 (x_1,x_5);
	 square_base  A7 (x_0,x_6);
	 square_base A8 (x_1,x_7);
	 multiplication_base A9 (x_2,x_1,y_2);
	 multiplication_base A10 (x_3,x_0,y_3);
	 multiplication_base A11 (x_4,x_7,y_4);
	 multiplication_base A12 (x_5,x_6,y_5);
	 constant_multiplication_base_2 MC00 (y_0,w_00);
	 constant_multiplication_base_6 MC01 (y_1,w_01);
	 constant_multiplication_base_7 MC02 (y_2,w_02);
	 constant_multiplication_base_4 MC03 (y_3,w_03);
	 constant_multiplication_base_2 MC04 (y_4,w_04);
	 constant_multiplication_base_6 MC05 (y_5,w_05);
	 constant_multiplication_base_6 MC10 (y_0,w_10);
	 constant_multiplication_base_2 MC11 (y_1,w_11);
	 constant_multiplication_base_4 MC12 (y_2,w_12);
	 constant_multiplication_base_7 MC13 (y_3,w_13);
	 constant_multiplication_base_6 MC14 (y_4,w_14);
	 constant_multiplication_base_2 MC15 (y_5,w_15);
	 add_base AB00 (w_00,w_01,z_00);
	 add_base AB01 (w_02,z_00,z_01);
	 add_base AB02 (w_03,z_01,z_02);
	 add_base AB03 (w_04,z_02,z_03);
	 add_base AB04 (w_05,z_03,z_04);
	 add_base AB10 (w_10,w_11,z_10);
	 add_base AB11 (w_12,z_10,z_11);
	 add_base AB12 (w_13,z_11,z_12);
	 add_base AB13 (w_14,z_12,z_13);
	 add_base AB14 (w_15,z_13,z_14);
	 assign b[0]=z_04[0];
	 assign b[1]=z_04[1];
	 assign b[2]=z_04[2];
	 assign b[3]=z_14[0];
	 assign b[4]=z_14[1];
	 assign b[5]=z_14[2];
endmodule

module inv_isomorphism(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[2]^a[4];
	 assign b[1]=a[0]^a[5];
	 assign b[2]=a[0]^a[4]^a[5];
	 assign b[3]=a[0]^a[1]^a[2];
	 assign b[4]=a[5];
	 assign b[5]=a[1]^a[3];
endmodule

module isomorphism(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[1]^a[2]^a[3]^a[4];
	 assign b[1]=a[0]^a[1]^a[2]^a[3]^a[4];
	 assign b[2]=a[0]^a[1]^a[3]^a[4];
	 assign b[3]=a[1];
	 assign b[4]=a[0]^a[1]^a[3];
	 assign b[5]=a[0]^a[3]^a[5];
endmodule

