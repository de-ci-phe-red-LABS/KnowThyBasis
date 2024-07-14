`timescale 1ns/100ps
module SMS23_2_13_np_5_4(x,y);
	 input [5:0] x;
	 output [5:0] y;
	 wire [5:0] z;
	 wire [5:0] w;
	 wire [5:0] p;
	 isomorphism C1 (x,z);
	 power_13 C2 (z,w);
	 inv_isomorphism C3 (w,p);
	 addition C4 (p,x,y);
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

module multi_qube_base(a,b,c);
	 input [1:0] a;
	 input [1:0] b;
	 output [1:0] c;
	 wire t;
	 assign t=a[0]^(~a[0]&a[1]);
	 assign c[0]=t&b[0];
	 assign c[1]=t&b[1];
endmodule

module power_13(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 wire [1:0] x_0;
	 wire [1:0] x_1;
	 wire [1:0] x_2;
	 wire [1:0] x_3;
	 wire [1:0] x_4;
	 wire [1:0] x_5;
	 wire [1:0] x_6;
	 wire [1:0] x_7;
	 wire [1:0] x_8;
	 wire [1:0] x_9;
	 wire [1:0] x_10;
	 wire [1:0] x_11;
	 wire [1:0] x_12;
	 wire [1:0] x_13;
	 wire [1:0] x_14;
	 wire [1:0] y_0;
	 wire [1:0] y_1;
	 wire [1:0] y_2;
	 wire [1:0] y_3;
	 wire [1:0] y_4;
	 wire [1:0] y_5;
	 wire [1:0] w_0_0;
	 wire [1:0] w_0_1;
	 wire [1:0] w_0_2;
	 wire [1:0] w_0_3;
	 wire [1:0] w_0_4;
	 wire [1:0] w_0_5;
	 wire [1:0] w_0_6;
	 wire [1:0] w_0_7;
	 wire [1:0] w_0_8;
	 wire [1:0] w_0_9;
	 wire [1:0] w_0_10;
	 wire [1:0] w_0_11;
	 wire [1:0] w_0_12;
	 wire [1:0] w_0_13;
	 wire [1:0] w_0_14;
	 wire [1:0] w_1_0;
	 wire [1:0] w_1_1;
	 wire [1:0] w_1_2;
	 wire [1:0] w_1_3;
	 wire [1:0] w_1_4;
	 wire [1:0] w_1_5;
	 wire [1:0] w_1_6;
	 wire [1:0] w_1_7;
	 wire [1:0] w_1_8;
	 wire [1:0] w_1_9;
	 wire [1:0] w_1_10;
	 wire [1:0] w_1_11;
	 wire [1:0] w_1_12;
	 wire [1:0] w_1_13;
	 wire [1:0] w_1_14;
	 wire [1:0] w_2_0;
	 wire [1:0] w_2_1;
	 wire [1:0] w_2_2;
	 wire [1:0] w_2_3;
	 wire [1:0] w_2_4;
	 wire [1:0] w_2_5;
	 wire [1:0] w_2_6;
	 wire [1:0] w_2_7;
	 wire [1:0] w_2_8;
	 wire [1:0] w_2_9;
	 wire [1:0] w_2_10;
	 wire [1:0] w_2_11;
	 wire [1:0] w_2_12;
	 wire [1:0] w_2_13;
	 wire [1:0] w_2_14;
	 wire [1:0] z_0_0;
	 wire [1:0] z_0_1;
	 wire [1:0] z_0_2;
	 wire [1:0] z_0_3;
	 wire [1:0] z_0_4;
	 wire [1:0] z_0_5;
	 wire [1:0] z_0_6;
	 wire [1:0] z_0_7;
	 wire [1:0] z_0_8;
	 wire [1:0] z_0_9;
	 wire [1:0] z_0_10;
	 wire [1:0] z_0_11;
	 wire [1:0] z_0_12;
	 wire [1:0] z_0_13;
	 wire [1:0] z_1_0;
	 wire [1:0] z_1_1;
	 wire [1:0] z_1_2;
	 wire [1:0] z_1_3;
	 wire [1:0] z_1_4;
	 wire [1:0] z_1_5;
	 wire [1:0] z_1_6;
	 wire [1:0] z_1_7;
	 wire [1:0] z_1_8;
	 wire [1:0] z_1_9;
	 wire [1:0] z_1_10;
	 wire [1:0] z_1_11;
	 wire [1:0] z_1_12;
	 wire [1:0] z_1_13;
	 wire [1:0] z_2_0;
	 wire [1:0] z_2_1;
	 wire [1:0] z_2_2;
	 wire [1:0] z_2_3;
	 wire [1:0] z_2_4;
	 wire [1:0] z_2_5;
	 wire [1:0] z_2_6;
	 wire [1:0] z_2_7;
	 wire [1:0] z_2_8;
	 wire [1:0] z_2_9;
	 wire [1:0] z_2_10;
	 wire [1:0] z_2_11;
	 wire [1:0] z_2_12;
	 wire [1:0] z_2_13;
	 assign x_0[0]=a[0];
	 assign x_0[1]=a[1];
	 assign x_1[0]=a[2];
	 assign x_1[1]=a[3];
	 assign x_2[0]=a[4];
	 assign x_2[1]=a[5];
	 square_base  SB1 (x_0,y_0);
	 square_base SB2 (x_1,y_1);
	 square_base SB3 (x_2,y_2);
	 multi_qube_base MQB1 (x_0,x_1,x_3);
	 multi_qube_base MQB2 (x_0,x_2,x_4);
	 multi_qube_base MQB3 (x_1,x_0,x_5);
	 multi_qube_base MQB4 (x_1,x_2,x_6);
	 multi_qube_base MQB5 (x_2,x_0,x_7);
	 multi_qube_base MQB6 (x_2,x_1,x_8);
	 multiplication_base MB1 (y_0,y_1,x_9);
	 multiplication_base MB2 (y_0,y_2,x_10);
	 multiplication_base MB3 (y_1,y_2,x_11);
	 multiplication_base MB4 (x_1,x_2,y_3);
	 multiplication_base MB5 (y_0,y_3,x_12);
	 multiplication_base MB6 (x_0,x_2,y_4);
	 multiplication_base MB7 (y_1,y_4,x_13);
	 multiplication_base MB8 (x_0,x_1,y_5);
	 multiplication_base MB9 (y_2,y_5,x_14);
	 constant_multiplication_base_3 MC00 (x_0,w_0_0);
	 constant_multiplication_base_2 MC01 (x_1,w_0_1);
	 constant_multiplication_base_0 MC02 (x_2,w_0_2);
	 constant_multiplication_base_0 MC03 (x_3,w_0_3);
	 constant_multiplication_base_0 MC04 (x_4,w_0_4);
	 constant_multiplication_base_3 MC05 (x_5,w_0_5);
	 constant_multiplication_base_1 MC06 (x_6,w_0_6);
	 constant_multiplication_base_3 MC07 (x_7,w_0_7);
	 constant_multiplication_base_0 MC08 (x_8,w_0_8);
	 constant_multiplication_base_1 MC09 (x_9,w_0_9);
	 constant_multiplication_base_2 MC010 (x_10,w_0_10);
	 constant_multiplication_base_0 MC011 (x_11,w_0_11);
	 constant_multiplication_base_3 MC012 (x_12,w_0_12);
	 constant_multiplication_base_0 MC013 (x_13,w_0_13);
	 constant_multiplication_base_1 MC014 (x_14,w_0_14);
	 constant_multiplication_base_0 MC10 (x_0,w_1_0);
	 constant_multiplication_base_3 MC11 (x_1,w_1_1);
	 constant_multiplication_base_2 MC12 (x_2,w_1_2);
	 constant_multiplication_base_3 MC13 (x_3,w_1_3);
	 constant_multiplication_base_0 MC14 (x_4,w_1_4);
	 constant_multiplication_base_0 MC15 (x_5,w_1_5);
	 constant_multiplication_base_0 MC16 (x_6,w_1_6);
	 constant_multiplication_base_1 MC17 (x_7,w_1_7);
	 constant_multiplication_base_3 MC18 (x_8,w_1_8);
	 constant_multiplication_base_2 MC19 (x_9,w_1_9);
	 constant_multiplication_base_0 MC110 (x_10,w_1_10);
	 constant_multiplication_base_1 MC111 (x_11,w_1_11);
	 constant_multiplication_base_1 MC112 (x_12,w_1_12);
	 constant_multiplication_base_3 MC113 (x_13,w_1_13);
	 constant_multiplication_base_0 MC114 (x_14,w_1_14);
	 constant_multiplication_base_2 MC20 (x_0,w_2_0);
	 constant_multiplication_base_0 MC21 (x_1,w_2_1);
	 constant_multiplication_base_3 MC22 (x_2,w_2_2);
	 constant_multiplication_base_1 MC23 (x_3,w_2_3);
	 constant_multiplication_base_3 MC24 (x_4,w_2_4);
	 constant_multiplication_base_0 MC25 (x_5,w_2_5);
	 constant_multiplication_base_3 MC26 (x_6,w_2_6);
	 constant_multiplication_base_0 MC27 (x_7,w_2_7);
	 constant_multiplication_base_0 MC28 (x_8,w_2_8);
	 constant_multiplication_base_0 MC29 (x_9,w_2_9);
	 constant_multiplication_base_1 MC210 (x_10,w_2_10);
	 constant_multiplication_base_2 MC211 (x_11,w_2_11);
	 constant_multiplication_base_0 MC212 (x_12,w_2_12);
	 constant_multiplication_base_1 MC213 (x_13,w_2_13);
	 constant_multiplication_base_3 MC214 (x_14,w_2_14);
	 add_base AB00 (w_0_0,w_0_1,z_0_0);
	 add_base AB01 (w_0_2,z_0_0,z_0_1);
	 add_base AB02 (w_0_3,z_0_1,z_0_2);
	 add_base AB03 (w_0_4,z_0_2,z_0_3);
	 add_base AB04 (w_0_5,z_0_3,z_0_4);
	 add_base AB05 (w_0_6,z_0_4,z_0_5);
	 add_base AB06 (w_0_7,z_0_5,z_0_6);
	 add_base AB07 (w_0_8,z_0_6,z_0_7);
	 add_base AB08 (w_0_9,z_0_7,z_0_8);
	 add_base AB09 (w_0_10,z_0_8,z_0_9);
	 add_base AB010 (w_0_11,z_0_9,z_0_10);
	 add_base AB011 (w_0_12,z_0_10,z_0_11);
	 add_base AB012 (w_0_13,z_0_11,z_0_12);
	 add_base AB013 (w_0_14,z_0_12,z_0_13);
	 add_base AB10 (w_1_0,w_1_1,z_1_0);
	 add_base AB11 (w_1_2,z_1_0,z_1_1);
	 add_base AB12 (w_1_3,z_1_1,z_1_2);
	 add_base AB13 (w_1_4,z_1_2,z_1_3);
	 add_base AB14 (w_1_5,z_1_3,z_1_4);
	 add_base AB15 (w_1_6,z_1_4,z_1_5);
	 add_base AB16 (w_1_7,z_1_5,z_1_6);
	 add_base AB17 (w_1_8,z_1_6,z_1_7);
	 add_base AB18 (w_1_9,z_1_7,z_1_8);
	 add_base AB19 (w_1_10,z_1_8,z_1_9);
	 add_base AB110 (w_1_11,z_1_9,z_1_10);
	 add_base AB111 (w_1_12,z_1_10,z_1_11);
	 add_base AB112 (w_1_13,z_1_11,z_1_12);
	 add_base AB113 (w_1_14,z_1_12,z_1_13);
	 add_base AB20 (w_2_0,w_2_1,z_2_0);
	 add_base AB21 (w_2_2,z_2_0,z_2_1);
	 add_base AB22 (w_2_3,z_2_1,z_2_2);
	 add_base AB23 (w_2_4,z_2_2,z_2_3);
	 add_base AB24 (w_2_5,z_2_3,z_2_4);
	 add_base AB25 (w_2_6,z_2_4,z_2_5);
	 add_base AB26 (w_2_7,z_2_5,z_2_6);
	 add_base AB27 (w_2_8,z_2_6,z_2_7);
	 add_base AB28 (w_2_9,z_2_7,z_2_8);
	 add_base AB29 (w_2_10,z_2_8,z_2_9);
	 add_base AB210 (w_2_11,z_2_9,z_2_10);
	 add_base AB211 (w_2_12,z_2_10,z_2_11);
	 add_base AB212 (w_2_13,z_2_11,z_2_12);
	 add_base AB213 (w_2_14,z_2_12,z_2_13);
	 assign b[0]=z_0_13[0];
	 assign b[1]=z_0_13[1];
	 assign b[2]=z_1_13[0];
	 assign b[3]=z_1_13[1];
	 assign b[4]=z_2_13[0];
	 assign b[5]=z_2_13[1];
endmodule

module inv_isomorphism(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[2]^a[3]^a[4]^a[5];
	 assign b[1]=a[0]^a[1]^a[2]^a[4];
	 assign b[2]=a[1]^a[2]^a[4];
	 assign b[3]=a[0]^a[1]^a[3];
	 assign b[4]=a[1]^a[5];
	 assign b[5]=a[1]^a[2]^a[4]^a[5];
endmodule

module isomorphism(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[0]^a[2]^a[3]^a[4];
	 assign b[1]=a[0];
	 assign b[2]=a[0]^a[2];
	 assign b[3]=a[0]^a[1]^a[3];
	 assign b[4]=a[0]^a[1]^a[5];
	 assign b[5]=a[0]^a[3]^a[4]^a[5];
endmodule

module addition(a,b,c);
	 input [5:0] a;
	 input [5:0] b;
	 wire t;
	 output [5:0] c;
	 assign t=b[2]^b[4];
	 assign c[0]=a[0]^t;
	 assign c[1]=a[1]^t;
	 assign c[2]=a[2]^t;
	 assign c[3]=a[3]^t;
	 assign c[4]=a[4]^t;
	 assign c[5]=a[5]^t;
endmodule

