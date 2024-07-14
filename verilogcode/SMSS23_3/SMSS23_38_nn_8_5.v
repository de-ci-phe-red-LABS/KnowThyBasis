`timescale 1ns/100ps
module SMSS23_38_nn_8_5(x,y);
	 input [5:0] x;
	 output [5:0] y;
	 wire [5:0] w;
	 wire [5:0] p;
	 isomorphism C2 (x,w);
	 power_38 C3 (w,p);
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

module multi_qube_base(a,b,c);
	 input [1:0] a;
	 input [1:0] b;
	 output [1:0] c;
	 wire t;
	 assign t=a[0]^(~a[0]&a[1]);
	 assign c[0]=t&b[0];
	 assign c[1]=t&b[1];
endmodule

module power_38(a,b);
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
	 wire [1:0] z_00;
	 wire [1:0] z_01;
	 wire [1:0] z_02;
	 wire [1:0] z_03;
	 wire [1:0] z_04;
	 wire [1:0] z_05;
	 wire [1:0] z_06;
	 wire [1:0] z_07;
	 wire [1:0] z_10;
	 wire [1:0] z_11;
	 wire [1:0] z_12;
	 wire [1:0] z_13;
	 wire [1:0] z_14;
	 wire [1:0] z_15;
	 wire [1:0] z_16;
	 wire [1:0] z_17;
	 wire [1:0] z_20;
	 wire [1:0] z_21;
	 wire [1:0] z_22;
	 wire [1:0] z_23;
	 wire [1:0] z_24;
	 wire [1:0] z_25;
	 wire [1:0] z_26;
	 wire [1:0] z_27;
	 assign y_0[0]=a[0];
	 assign y_0[1]=a[1];
	 assign y_1[0]=a[2];
	 assign y_1[1]=a[3];
	 assign y_2[0]=a[4];
	 assign y_2[1]=a[5];
	 square_base  SB1 (y_0,x_0);
	 square_base SB2 (y_1,x_1);
	 square_base SB3 (y_2,x_2);
	 multi_qube_base MQB1 (y_1,x_0,x_3);
	 multi_qube_base MQB2 (y_2,x_0,x_4);
	 multi_qube_base MQB3 (y_0,x_1,x_5);
	 multi_qube_base MQB4 (y_2,x_1,x_6);
	 multi_qube_base MQB5 (y_0,x_2,x_7);
	 multi_qube_base MQB6 (y_1,x_2,x_8);
	 multiplication_base MB1 (y_0,y_1,x_9);
	 multiplication_base MB2 (y_0,y_2,x_10);
	 multiplication_base MB3 (y_1,y_2,x_11);
	 multiplication_base MB4 (x_1,x_2,y_3);
	 multiplication_base MB5 (y_0,y_3,x_12);
	 multiplication_base MB6 (x_0,x_2,y_4);
	 multiplication_base MB7 (y_1,y_4,x_13);
	 multiplication_base MB8 (x_0,x_1,y_5);
	 multiplication_base MB9 (y_2,y_5,x_14);
	 add_base AB00 (x_1,x_2,z_00);
	 add_base AB01 (x_4,z_00,z_01);
	 add_base AB02 (x_5,z_01,z_02);
	 add_base AB03 (x_6,z_02,z_03);
	 add_base AB04 (x_9,z_03,z_04);
	 add_base AB05 (x_11,z_04,z_05);
	 add_base AB06 (x_12,z_05,z_06);
	 add_base AB07 (x_13,z_06,z_07);
	 add_base AB10 (x_0,x_2,z_10);
	 add_base AB11 (x_5,z_10,z_11);
	 add_base AB12 (x_7,z_11,z_12);
	 add_base AB13 (x_8,z_12,z_13);
	 add_base AB14 (x_10,z_13,z_14);
	 add_base AB15 (x_11,z_14,z_15);
	 add_base AB16 (x_13,z_15,z_16);
	 add_base AB17 (x_14,z_16,z_17);
	 add_base AB20 (x_0,x_1,z_20);
	 add_base AB21 (x_3,z_20,z_21);
	 add_base AB22 (x_4,z_21,z_22);
	 add_base AB23 (x_8,z_22,z_23);
	 add_base AB24 (x_9,z_23,z_24);
	 add_base AB25 (x_10,z_24,z_25);
	 add_base AB26 (x_12,z_25,z_26);
	 add_base AB27 (x_14,z_26,z_27);
	 assign b[0]=z_17[0];
	 assign b[1]=z_17[1];
	 assign b[2]=z_27[0];
	 assign b[3]=z_27[1];
	 assign b[4]=z_07[0];
	 assign b[5]=z_07[1];
endmodule

module inv_isomorphism(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[2]^a[3]^a[4];
	 assign b[1]=a[1]^a[5];
	 assign b[2]=a[0]^a[1]^a[3];
	 assign b[3]=a[0]^a[2];
	 assign b[4]=a[1]^a[2]^a[4]^a[5];
	 assign b[5]=a[1]^a[2]^a[5];
endmodule

module isomorphism(a,b);
	 input [5:0] a;
	 output [5:0] b;
	 assign b[0]=a[0]^a[1]^a[5];
	 assign b[1]=a[0]^a[2]^a[3];
	 assign b[2]=a[0]^a[2]^a[4]^a[5];
	 assign b[3]=a[0]^a[1]^a[2];
	 assign b[4]=a[0]^a[2]^a[5];
	 assign b[5]=a[0]^a[4]^a[5];
endmodule

