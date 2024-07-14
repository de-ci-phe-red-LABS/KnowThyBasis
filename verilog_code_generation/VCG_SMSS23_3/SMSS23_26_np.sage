F=GF(2);
k3.<z>=PolynomialRing(F);k3 
h=z^6 +z^4+z^3+z+1; 
F3.<c>=F.extension(h);
k1.<x>=PolynomialRing(F); 
f=x^2+x+1; 
F1.<a>=F.extension(f); 
k2.<y>=PolynomialRing(F1);
G=[y^3+y^2+y+a,y^3+y^2+y+a+1,y^3 + y^2 + (a + 1)*y + a,y^3 + y^2 + a*y + a + 1,y^3 + a*y^2 + y + a + 1,y^3 + (a + 1)*y^2 + y + a,y^3 + a*y^2 + (a + 1)*y + a + 1,y^3 + (a + 1)*y^2 + a*y + a,y^3 + a*y^2 + (a + 1)*y + a,y^3 + (a + 1)*y^2 + a*y + a + 1,y^3 + a*y^2 + a*y + a,y^3 + (a + 1)*y^2 + (a + 1)*y + a + 1];
k=0
A=[27,27,9,9,9,9,27,27,27,27,9,9]
Index=[[1,2,4,8,16,32],[1,2,4,8,16,32],[13,19,26,38,41,52],[13,19,26,38,41,52],[5,10,17,20,34,40],[5,10,17,20,34,40],[11,22,25,37,44,50],[11,22,25,37,44,50],[23,29,43,46,53,58],[23,29,43,46,53,58],[31,47,55,59,61,62],[31,47,55,59,61,62]];
for g in G:
	k=k+1	
	F2.<b>=k2.quotient_ring(g);
	l=0;
	for ind in Index[k-1]:
		l=l+1;
		t1=b^ind; 
		for iv in range(63):
			if((t1^iv==a)):
				s=iv; 
		for iv in range(63):
			if((t1^iv==b)):
				p=iv;
		B1=((A[k-1]*p)%63,(s+A[k-1]*p)%63,(4*A[k-1]*p)%63,(s+4*A[k-1]*p)%63,(16*A[k-1]*p)%63,(s+16*A[k-1]*p)%63);
		X=[];
		Y=[];
		for i in B1:
			for i1 in F:
				for i2 in F:
					for i3 in F:
						for i4 in F:
							for i5 in F:
								for i6 in F:
									if(i1+i2*c+i3*c^2+i4*c^3+i5*c^4+i6*c^5==c^i):
										X.append([i1,i2,i3,i4,i5,i6]);
		U=matrix(GF(2),X);
		U1=U.transpose();
		P1=matrix(GF(2),[[1,0,1,0,0,0],[0,1,0,0,0,0],[0,0,1,0,0,0],[0,0,0,1,0,0],[0,0,0,0,1,0],[0,0,0,0,0,1]])
		Q=matrix(GF(2),[[1,1,1,0,0,0],[0,0,0,0,1,0],[0,1,0,1,0,0],[0,0,1,1,0,0],[1,1,0,0,1,1],[1,1,0,1,0,1]])
		V=Q*U1
		fname = f'/home/dilip/Desktop/6-bit_Sbox/supplementary_material/verilogcode/SMSS23_3/SMSS23_26_np_{k}_{l}.v'
		with open(fname, "w") as f:
			f.write("`timescale 1ns/100ps\n");
			f.write("module SMSS23_26_np_{}_{}(x,y);\n".format(k,l));
			f.write("\t input [5:0] x;\n");
			f.write("\t output [5:0] y;\n");
			f.write("\t wire [5:0] w;\n");
			f.write("\t wire [5:0] p;\n");
			f.write("\t isomorphism C2 (x,w);\n");
			f.write("\t power_26 C3 (w,p);\n");
			f.write("\t inv_isomorphism C4 (p,y);\n");
			f.write("endmodule\n");
			f.write("\n");
			f.write("module square_base(a,b);\n");
			f.write("\t input [1:0] a;\n");
			f.write("\t output [1:0] b;\n");
			f.write("\t assign b[0]=a[0]^a[1];\n");
			f.write("\t assign b[1]=a[1];\n");
			f.write("endmodule\n");
			f.write("\n")
			f.write("module add_base(a,b,c);\n");
			f.write("\t input [1:0] a;\n");
			f.write("\t input [1:0] b;\n");
			f.write("\t output [1:0] c;\n");
			f.write("\t assign c[0]=a[0]^b[0];\n");
			f.write("\t assign c[1]=a[1]^b[1];\n");
			f.write("endmodule\n");
			f.write("\n")
			f.write("module multiplication_base(a,b,c);\n");
			f.write("\t input [1:0] a;\n");
			f.write("\t input [1:0] b;\n");
			f.write("\t output [1:0] c;\n");
			f.write("\t wire t;\n");
			f.write("\t assign t=(a[1]&b[1]);\n");
			f.write("\t assign c[0]=(a[0]&b[0])^t;\n");
			f.write("\t assign c[1]=(a[0]&b[1])^(a[1]&b[0])^t;\n");
			f.write("endmodule\n");
			f.write("\n")
			f.write("module multi_qube_base(a,b,c);\n");
			f.write("\t input [1:0] a;\n");
			f.write("\t input [1:0] b;\n");
			f.write("\t output [1:0] c;\n");
			f.write("\t wire t;\n");
			f.write("\t assign t=a[0]^(~a[0]&a[1]);\n");
			f.write("\t assign c[0]=t&b[0];\n");
			f.write("\t assign c[1]=t&b[1];\n");
			f.write("endmodule\n");
			f.write("\n")
			f.write("module power_26(a,b);\n");
			f.write("\t input [5:0] a;\n");
			f.write("\t output [5:0] b;\n");
			f.write("\t wire [1:0] x_0;\n");
			f.write("\t wire [1:0] x_1;\n");
			f.write("\t wire [1:0] x_2;\n");
			f.write("\t wire [1:0] x_3;\n");
			f.write("\t wire [1:0] x_4;\n");
			f.write("\t wire [1:0] x_5;\n");
			f.write("\t wire [1:0] x_6;\n");
			f.write("\t wire [1:0] x_7;\n");
			f.write("\t wire [1:0] x_8;\n");
			f.write("\t wire [1:0] x_9;\n");
			f.write("\t wire [1:0] x_10;\n");
			f.write("\t wire [1:0] x_11;\n");
			f.write("\t wire [1:0] x_12;\n");
			f.write("\t wire [1:0] x_13;\n");
			f.write("\t wire [1:0] x_14;\n");
			f.write("\t wire [1:0] y_0;\n");
			f.write("\t wire [1:0] y_1;\n");
			f.write("\t wire [1:0] y_2;\n");
			f.write("\t wire [1:0] y_3;\n");
			f.write("\t wire [1:0] y_4;\n");
			f.write("\t wire [1:0] y_5;\n");
			f.write("\t wire [1:0] z_00;\n");
			f.write("\t wire [1:0] z_01;\n");
			f.write("\t wire [1:0] z_02;\n");
			f.write("\t wire [1:0] z_03;\n");
			f.write("\t wire [1:0] z_04;\n");
			f.write("\t wire [1:0] z_05;\n");
			f.write("\t wire [1:0] z_06;\n");
			f.write("\t wire [1:0] z_07;\n");
			f.write("\t wire [1:0] z_10;\n");
			f.write("\t wire [1:0] z_11;\n");
			f.write("\t wire [1:0] z_12;\n");
			f.write("\t wire [1:0] z_13;\n");
			f.write("\t wire [1:0] z_14;\n");
			f.write("\t wire [1:0] z_15;\n");
			f.write("\t wire [1:0] z_16;\n");
			f.write("\t wire [1:0] z_17;\n");
			f.write("\t wire [1:0] z_20;\n");
			f.write("\t wire [1:0] z_21;\n");
			f.write("\t wire [1:0] z_22;\n");
			f.write("\t wire [1:0] z_23;\n");
			f.write("\t wire [1:0] z_24;\n");
			f.write("\t wire [1:0] z_25;\n");
			f.write("\t wire [1:0] z_26;\n");
			f.write("\t wire [1:0] z_27;\n");
			f.write("\t assign y_0[0]=a[0];\n");	
			f.write("\t assign y_0[1]=a[1];\n");
			f.write("\t assign y_1[0]=a[2];\n");	
			f.write("\t assign y_1[1]=a[3];\n");
			f.write("\t assign y_2[0]=a[4];\n");	
			f.write("\t assign y_2[1]=a[5];\n");
			f.write("\t square_base  SB1 (y_0,x_0);\n");
			f.write("\t square_base SB2 (y_1,x_1);\n");
			f.write("\t square_base SB3 (y_2,x_2);\n");
			f.write("\t multi_qube_base MQB1 (y_1,x_0,x_3);\n");
			f.write("\t multi_qube_base MQB2 (y_2,x_0,x_4);\n");
			f.write("\t multi_qube_base MQB3 (y_0,x_1,x_5);\n");
			f.write("\t multi_qube_base MQB4 (y_2,x_1,x_6);\n");
			f.write("\t multi_qube_base MQB5 (y_0,x_2,x_7);\n");
			f.write("\t multi_qube_base MQB6 (y_1,x_2,x_8);\n");
			f.write("\t multiplication_base MB1 (y_0,y_1,x_9);\n");
			f.write("\t multiplication_base MB2 (y_0,y_2,x_10);\n");
			f.write("\t multiplication_base MB3 (y_1,y_2,x_11);\n");
			f.write("\t multiplication_base MB4 (x_1,x_2,y_3);\n");
			f.write("\t multiplication_base MB5 (y_0,y_3,x_12);\n");
			f.write("\t multiplication_base MB6 (x_0,x_2,y_4);\n");
			f.write("\t multiplication_base MB7 (y_1,y_4,x_13);\n");
			f.write("\t multiplication_base MB8 (x_0,x_1,y_5);\n");
			f.write("\t multiplication_base MB9 (y_2,y_5,x_14);\n");
			f.write("\t add_base AB00 (x_1,x_2,z_00);\n");
			f.write("\t add_base AB01 (x_4,z_00,z_01);\n");
			f.write("\t add_base AB02 (x_5,z_01,z_02);\n");
			f.write("\t add_base AB03 (x_6,z_02,z_03);\n");
			f.write("\t add_base AB04 (x_9,z_03,z_04);\n");
			f.write("\t add_base AB05 (x_11,z_04,z_05);\n");
			f.write("\t add_base AB06 (x_12,z_05,z_06);\n");
			f.write("\t add_base AB07 (x_13,z_06,z_07);\n");
			f.write("\t add_base AB10 (x_0,x_2,z_10);\n");
			f.write("\t add_base AB11 (x_5,z_10,z_11);\n");
			f.write("\t add_base AB12 (x_7,z_11,z_12);\n");
			f.write("\t add_base AB13 (x_8,z_12,z_13);\n");
			f.write("\t add_base AB14 (x_10,z_13,z_14);\n");
			f.write("\t add_base AB15 (x_11,z_14,z_15);\n");
			f.write("\t add_base AB16 (x_13,z_15,z_16);\n");
			f.write("\t add_base AB17 (x_14,z_16,z_17);\n");
			f.write("\t add_base AB20 (x_0,x_1,z_20);\n");
			f.write("\t add_base AB21 (x_3,z_20,z_21);\n");
			f.write("\t add_base AB22 (x_4,z_21,z_22);\n");
			f.write("\t add_base AB23 (x_8,z_22,z_23);\n");
			f.write("\t add_base AB24 (x_9,z_23,z_24);\n");
			f.write("\t add_base AB25 (x_10,z_24,z_25);\n");
			f.write("\t add_base AB26 (x_12,z_25,z_26);\n");
			f.write("\t add_base AB27 (x_14,z_26,z_27);\n");                  
			f.write("\t assign b[0]=z_07[0];\n");
			f.write("\t assign b[1]=z_07[1];\n");
			f.write("\t assign b[2]=z_17[0];\n");
			f.write("\t assign b[3]=z_17[1];\n");
			f.write("\t assign b[4]=z_27[0];\n");
			f.write("\t assign b[5]=z_27[1];\n");
			f.write("endmodule\n");
			V0=[];
			V1=[];
			V2=[];
			V3=[];
			V4=[];
			V5=[];
			for ii in range(6):
			  if(V[0][ii]==1):
				  V0.append(ii);
			  if(V[1][ii]==1):
				  V1.append(ii);
			  if(V[2][ii]==1):
				  V2.append(ii);
			  if(V[3][ii]==1):
				  V3.append(ii);
			  if(V[4][ii]==1):
				  V4.append(ii);
			  if(V[5][ii]==1):
				  V5.append(ii);
			f.write("\n")
			f.write("module inv_isomorphism(a,b);\n");
			f.write("\t input [5:0] a;\n");
			f.write("\t output [5:0] b;\n");
			f.write("\t assign b[0]=")
			for ii in range(len(V0)-1):
			  f.write("a[{}]^".format(V0[ii]))
			f.write("a[{}];\n".format(V0[len(V0)-1]))
			f.write("\t assign b[1]=")
			for ii in range(len(V1)-1):
			  f.write("a[{}]^".format(V1[ii]))
			f.write("a[{}];\n".format(V1[len(V1)-1]))
			f.write("\t assign b[2]=")
			for ii in range(len(V2)-1):
			  f.write("a[{}]^".format(V2[ii]))
			f.write("a[{}];\n".format(V2[len(V2)-1]))
			f.write("\t assign b[3]=")
			for ii in range(len(V3)-1):
			  f.write("a[{}]^".format(V3[ii]))
			f.write("a[{}];\n".format(V3[len(V3)-1]))
			f.write("\t assign b[4]=")
			for ii in range(len(V4)-1):
			  f.write("a[{}]^".format(V4[ii]))
			f.write("a[{}];\n".format(V4[len(V4)-1]))
			f.write("\t assign b[5]=")
			for ii in range(len(V5)-1):
			  f.write("a[{}]^".format(V5[ii]))
			f.write("a[{}];\n".format(V5[len(V5)-1]))
			f.write("endmodule\n");
			W1=U1.inverse();
			W=W1*P1
			W0=[];
			W1=[];
			W2=[];
			W3=[];
			W4=[];
			W5=[];
			for ii in range(6):
			  if(W[0][ii]==1):
				  W0.append(ii);
			  if(W[1][ii]==1):
				  W1.append(ii);
			  if(W[2][ii]==1):
				  W2.append(ii);
			  if(W[3][ii]==1):
				  W3.append(ii);
			  if(W[4][ii]==1):
				  W4.append(ii);
			  if(W[5][ii]==1):
				  W5.append(ii);
			f.write("\n")
			f.write("module isomorphism(a,b);\n");
			f.write("\t input [5:0] a;\n");
			f.write("\t output [5:0] b;\n");
			f.write("\t assign b[0]=")
			for ii in range(len(W0)-1):
			  f.write("a[{}]^".format(W0[ii]))
			f.write("a[{}];\n".format(W0[len(W0)-1]))
			f.write("\t assign b[1]=")
			for ii in range(len(W1)-1):
			  f.write("a[{}]^".format(W1[ii]))
			f.write("a[{}];\n".format(W1[len(W1)-1]))
			f.write("\t assign b[2]=")
			for ii in range(len(W2)-1):
			  f.write("a[{}]^".format(W2[ii]))
			f.write("a[{}];\n".format(W2[len(W2)-1]))
			f.write("\t assign b[3]=")
			for ii in range(len(W3)-1):
			  f.write("a[{}]^".format(W3[ii]))
			f.write("a[{}];\n".format(W3[len(W3)-1]))
			f.write("\t assign b[4]=")
			for ii in range(len(W4)-1):
			  f.write("a[{}]^".format(W4[ii]))
			f.write("a[{}];\n".format(W4[len(W4)-1]))
			f.write("\t assign b[5]=")
			for ii in range(len(W5)-1):
			  f.write("a[{}]^".format(W5[ii]))
			f.write("a[{}];\n".format(W5[len(W5)-1]))
			f.write("endmodule\n");	  
			f.write("\n")
