`timescale 1ns/100ps
module SMS23_20_np_5_6(x,y);
	 input [5:0] x;
	 output [5:0] y;
	 wire [5:0] w;
	 wire [5:0] p;
	 isomorphism C2 (x,w);
	 power_20 C3 (w,p);
	 inv_isomorphism C4 (p,y);
endmodule

module square_base(a,b);
	 input [1:0] a;
	 output [1:0] b;
	 assign b[0]=a[0]^a[1];
	 assign b[1]=a[1];
endmodule

module add_base(a,b,c);
	 input [1:0] a;
	 input [1:0] b;
	 output [1:0] c;
	 assign c[0]=a[0]^b[0];
	 assign c[1]=a[1]^b[1];
endmodule

module constant_multiplication_base_0(a,b);
	 input [1:0] a;
	 output [1:0] b;
	 assign b[0]=0;
	 assign b[1]=0;
endmodule

module constant_multiplication_base_1(a,b);
	 input [1:0] a;
	 output [1:0] b;
	 assign b[0]=a[0];
	 assign b[1]=a[1];
endmodule

module constant_multiplication_base_2(a,b);
	 input [1:0] a;
	 output [1:0] b;
	 assign b[0]=a[1];
	 assign b[1]=a[0]^a[1];
endmodule

module constant_multiplication_base_3(a,b);
	 input [1:0] a;
	 output [1:0] b;
	 assign b[0]=a[0]^a[1];
	 assign b[1]=a[0];
endmodule

module multiplication_base(a,b,c);
	 input [1:0] a;
	 input [1:0] b;
	 output [1:0] c;
	 wire t;
	 assign t=(a[1]&b[1]);
	 assign c[0]=(a[0]&b[0])^t;
	 assign c[1]=(a[0]&b[1])^(a[1]&b[0])^t;
endmodule
module power_20(a,b);
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
	 wire [1:0] z_02;
	 wire [1:0] z_03;
	 wire [1:0] z_04;
	 wire [1:0] z_10;
	 wire [1:0] z_11;
	 wire [1:0] z_12;
	 wire [1:0] z_13;
	 wire [1:0] z_14;
	 wire [1:0] z_20;
	 wire [1:0] z_21;
	 wire [1:0] z_22;
	 wire [1:0] z_23;
	 wire [1:0] z_24;
	 wire [1:0] w_00;
	 wire [1:0] w_01;
	 wire [1:0] w_02;
	 wire [1:0] w_03;
	 wire [1:0] w_04;
	 wire [1:0] w_05;
	 wire [1:0] w_10;
	 wire [1:0] w_11;
	 wire [1:0] w_12;
	 wire [1:0] w_13;
	 wire [1:0] w_14;
	 wire [1:0] w_15;
	 wire [1:0] w_20;
	 wire [1:0] w_21;
	 wire [1:0] w_22;
	 wire [1:0] w_23;
	 wire [1:0] w_24;
	 wire [1:0] w_25;
	 assign x_0[0]=a[0];
	 assign x_0[1]=a[1];
	 assign x_1[0]=a[2];
	 assign x_1[1]=a[3];
	 assign x_2[0]=a[4];
	 assign x_2[1]=a[5];
	 square_base  A1 (x_0,y_0);
	 square_base A2 (x_1,y_1);
	 square_base A3 (x_2,y_2);
	 multiplication_base A4 (x_0,x_1,y_3);
	 multiplication_base A5 (x_0,x_2,y_4);
	 multiplication_base A6 (x_1,x_2,y_5);
	 constant_multiplication_base_0 MC00 (y_0,w_00);
	 constant_multiplication_base_1 MC01 (y_1,w_01);
	 constant_multiplication_base_2 MC02 (y_2,w_02);
	 constant_multiplication_base_3 MC03 (y_3,w_03);
	 constant_multiplication_base_3 MC04 (y_4,w_04);
	 constant_multiplication_base_1 MC05 (y_5,w_05);
	 constant_multiplication_base_2 MC10 (y_0,w_10);
	 constant_multiplication_base_0 MC11 (y_1,w_11);
	 constant_multiplication_base_1 MC12 (y_2,w_12);
	 constant_multiplication_base_3 MC13 (y_3,w_13);
	 constant_multiplication_base_1 MC14 (y_4,w_14);
	 constant_multiplication_base_3 MC15 (y_5,w_15);
	 constant_multiplication_base_1 MC20 (y_0,w_20);
	 constant_multiplication_base_2 MC21 (y_1,w_21);
	 constant_multiplication_base_0 MC22 (y_2,w_22);
	 constant_multiplication_base_1 MC23 (y_3,w_23);
	 constant_multiplication_base_3 MC24 (y_4,w_24);
	 constant_multiplication_base_3 MC25 (y_5,w_25);
	 add_base B00 (w_00,w_01,z_00);
	 add_base B01 (w_02,w_03,z_01);
	 add_base B02 (w_04,w_05,z_02);
	 add_base B03 (z_00,z_01,z_03);
	 add_base B04 (z_03,z_02,z_04);
	 add_base B10 (w_10,w_11,z_10);
	 add_base B11 (w_12,w_13,z_11);
	 add_base B12 (w_14,w_15,z_12);
	 add_base B13 (z_10,z_11,z_13);
	 add_base B14 (z_13,z_12,z_14);
	 add_base B20 (w_20,w_21,z_20);
	 add_base B21 (w_22,w_23,z_21);
	 add_base B22 (w_24,w_25,z_22);
	 add_base B23 (z_20,z_21,z_23);
	 add_base B24 (z_23,z_22,z_24);
	 assign b[0]=z_04[0];
	 assign b[1]=z_04[1];
	 assign b[2]=z_14[0];
	 assign b[3]=z_14[1];
	 assign b[4]=z_24[0];
	 assign b[5]=z_24[1];
endmodule

module inv_isomorphism(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[1]^a[2];
	 assign b[1]=a[2]^a[3];
	 assign b[2]=a[0]^a[1]^a[2];
	 assign b[3]=a[0]^a[1]^a[2]^a[3]^a[4];
	 assign b[4]=a[2]^a[3]^a[4];
	 assign b[5]=a[0]^a[2]^a[3]^a[4]^a[5];
endmodule

module isomorphism(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[0]^a[2]^a[3];
	 assign b[1]=a[3]^a[4]^a[5];
	 assign b[2]=a[1]^a[3]^a[5];
	 assign b[3]=a[3]^a[5];
	 assign b[4]=a[0]^a[4];
	 assign b[5]=a[1]^a[2]^a[3]^a[5];
endmodule

