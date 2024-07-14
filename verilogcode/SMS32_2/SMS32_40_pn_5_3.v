`timescale 1ns/100ps
module SMS32_40_pn_5_3(x,y);
	 input [5:0] x;
	 output [5:0] y;
	 wire [5:0] w;
	 wire [5:0] p;
	 isomorphism C2 (x,w);
	 power_40 C3 (w,p);
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
	 assign b[0]=a[1];
	 assign b[1]=a[0]^a[2];
	 assign b[2]=a[1]^a[2];
endmodule

module constant_multiplication_base_3(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[0]^a[2];
	 assign b[1]=a[2];
	 assign b[2]=a[0]^a[1];
endmodule

module constant_multiplication_base_4(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[2];
	 assign b[1]=a[1]^a[2];
	 assign b[2]=a[0]^a[1]^a[2];
endmodule

module constant_multiplication_base_5(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[1]^a[2];
	 assign b[1]=a[0]^a[1];
	 assign b[2]=a[0];
endmodule

module constant_multiplication_base_6(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[0]^a[1];
	 assign b[1]=a[0]^a[1]^a[2];
	 assign b[2]=a[1];
endmodule

module constant_multiplication_base_7(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[0]^a[1]^a[2];
	 assign b[1]=a[0];
	 assign b[2]=a[0]^a[2];
endmodule

module multiplication_base(a,b,c);
	 input [2:0] a;
	 input [2:0] b;
	 output [2:0] c;
	 assign c[0]=(a[2]&b[2])^(a[0]&b[1])^(a[1]&b[0])^(a[1]&b[2])^(a[2]&b[1]);
	 assign c[1]=(a[0]&b[0])^(a[0]&b[2])^(a[2]&b[0])^(a[1]&b[2])^(a[2]&b[1]);
	 assign c[2]=(a[1]&b[1])^(a[0]&b[1])^(a[1]&b[0])^(a[0]&b[2])^(a[2]&b[0]);
endmodule

module four_base(a,b);
	 input [2:0] a;
	 output[2:0] b;
	 assign b[0]=a[1];
	 assign b[1]=a[2];
	 assign b[2]=a[0];
endmodule

module five_base(a,b);
	 input [2:0] a;
	 output [2:0] b;
	 assign b[0]=a[1]^a[2]^(a[0]&a[1]);
	 assign b[1]=a[0]^a[2]^(a[1]&a[2]);
	 assign b[2]=a[0]^a[1]^(a[0]&a[2]);
endmodule

module power_40(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 wire [2:0] x_0;
	 wire [2:0] x_1;
	 wire [2:0] x_2;
	 wire [2:0] x_3;
	 wire [2:0] y_0;
	 wire [2:0] y_1;
	 wire [2:0] y_2;
	 wire [2:0] y_3;
	 wire [2:0] z_00;
	 wire [2:0] z_01;
	 wire [2:0] z_02;
	 wire [2:0] z_10;
	 wire [2:0] z_11;
	 wire [2:0] z_12;
	 wire [2:0] w_00;
	 wire [2:0] w_01;
	 wire [2:0] w_02;
	 wire [2:0] w_03;
	 wire [2:0] w_10;
	 wire [2:0] w_11;
	 wire [2:0] w_12;
	 wire [2:0] w_13;
	 assign x_0[0]=a[0];
	 assign x_0[1]=a[1];
	 assign x_0[2]=a[2];
	 assign x_1[0]=a[3];
	 assign x_1[1]=a[4];
	 assign x_1[2]=a[5];
	 five_base A1 (x_0,y_0);
	 five_base A2 (x_1,y_3);
	 four_base  A3 (x_0,x_2);
	 four_base A4 (x_1,x_3);
	 multiplication_base A5 (x_0,x_3,y_1);
	 multiplication_base A6 (x_1,x_2,y_2);
	 constant_multiplication_base_1 MC00 (y_0,w_00);
	 constant_multiplication_base_6 MC01 (y_1,w_01);
	 constant_multiplication_base_3 MC02 (y_2,w_02);
	 constant_multiplication_base_7 MC03 (y_3,w_03);
	 constant_multiplication_base_0 MC10 (y_0,w_10);
	 constant_multiplication_base_7 MC11 (y_1,w_11);
	 constant_multiplication_base_1 MC12 (y_2,w_12);
	 constant_multiplication_base_6 MC13 (y_3,w_13);
	 add_base B00 (w_00,w_01,z_00);
	 add_base B01 (w_02,w_03,z_01);
	 add_base B02 (z_00,z_01,z_02);
	 add_base B10 (w_10,w_11,z_10);
	 add_base B11 (w_12,w_13,z_11);
	 add_base B12 (z_10,z_11,z_12);
	 assign b[0]=z_02[0];
	 assign b[1]=z_02[1];
	 assign b[2]=z_02[2];
	 assign b[3]=z_12[0];
	 assign b[4]=z_12[1];
	 assign b[5]=z_12[2];
endmodule

module inv_isomorphism(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[2]^a[3];
	 assign b[1]=a[0]^a[1]^a[3];
	 assign b[2]=a[0]^a[2]^a[3]^a[4];
	 assign b[3]=a[2]^a[5];
	 assign b[4]=a[0]^a[4]^a[5];
	 assign b[5]=a[1];
endmodule

module isomorphism(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[0]^a[1]^a[2]^a[3];
	 assign b[1]=a[2]^a[3]^a[5];
	 assign b[2]=a[1]^a[2]^a[3]^a[5];
	 assign b[3]=a[0]^a[1]^a[2]^a[5];
	 assign b[4]=a[3];
	 assign b[5]=a[0]^a[1]^a[4]^a[5];
endmodule

