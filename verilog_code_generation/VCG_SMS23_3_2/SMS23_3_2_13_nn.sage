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
A=[3,3,1,1,1,1,3,3,3,3,1,1]
Index=[[1,2,4,8,16,32],[1,2,4,8,16,32],[13,19,26,38,41,52],[13,19,26,38,41,52],[5,10,17,20,34,40],[5,10,17,20,34,40],[11,22,25,37,44,50],[11,22,25,37,44,50],[23,29,43,46,53,58],[23,29,43,46,53,58],[31,47,55,59,61,62],[31,47,55,59,61,62]];
for g in G:
	k=k+1	
	F2.<b>=k2.quotient_ring(g);
	t=b^A[k-1]	    
	B=(t^13,t^52,t^19,t^16+t^25,t^10+t^28,t^40+t^49,t+t^37,t^4+t^22,t^7+t^34,t^28+t^37,t^7+t^25,t^22+t^49,t^13+t^40,t^34+t^52,t^10+t^19);
	T=[];
	for m in B:
		for i in F1: 
			for j in F1: 
				for l in F1: 
					if((i*t+j*t^4+l*t^16)==m):  
						T.append([i,j,l]);  
	S=matrix(F1,T);
	P=S.transpose();
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
		B1=((s+A[k-1]*p)%63,(2*s+A[k-1]*p)%63,(s+4*A[k-1]*p)%63,(2*s+4*A[k-1]*p)%63,(s+16*A[k-1]*p)%63,(2*s+16*A[k-1]*p)%63);
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
		P1=matrix(GF(2),[[1,0,0,0,0,0],[0,1,0,0,0,0],[0,0,1,0,0,0],[0,0,0,1,0,0],[0,0,1,0,1,0],[0,0,0,0,0,1]])
		Q=matrix(GF(2),[[0,0,0,0,1,0],[0,1,1,1,1,1],[1,1,1,0,0,1],[1,1,0,0,1,0],[0,0,1,1,1,1],[0,1,0,1,1,0]])
		V=Q*U1
		fname = f'/home/dilip/Desktop/6-bit_Sbox/supplementary_material/verilogcode/SMS23_3_2/SMS23_2_13_nn_{k}_{l}.v'
		with open(fname, "w") as f:
			f.write("`timescale 1ns/100ps\n");
			f.write("module SMS23_2_13_nn_{}_{}(x,y);\n".format(k,l));
			f.write("\t input [5:0] x;\n");
			f.write("\t output [5:0] y;\n");
			f.write("\t wire [5:0] z;\n");
			f.write("\t wire [5:0] w;\n");
			f.write("\t wire [5:0] p;\n");
			f.write("\t isomorphism C1 (x,z);\n");
			f.write("\t power_13 C2 (z,w);\n");
			f.write("\t inv_isomorphism C3 (w,p);\n");
			f.write("\t addition C4 (p,x,y);\n");
			f.write("endmodule\n");
			f.write("\n")
			f.write("module square_base(a,b);\n");
			f.write("\t input [1:0] a;\n");
			f.write("\t output [1:0] b;\n");
			f.write("\t assign b[0]=a[1];\n");
			f.write("\t assign b[1]=a[0];\n");
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
			f.write("module constant_multiplication_base_0(a,b);\n");
			f.write("\t input [1:0] a;\n");
			f.write("\t output [1:0] b;\n");
			f.write("\t assign b[0]=0;\n");
			f.write("\t assign b[1]=0;\n");
			f.write("endmodule\n");
			f.write("\n")
			f.write("module constant_multiplication_base_1(a,b);\n");
			f.write("\t input [1:0] a;\n");
			f.write("\t output [1:0] b;\n");
			f.write("\t assign b[0]=a[0];\n");
			f.write("\t assign b[1]=a[1];\n");
			f.write("endmodule\n");
			f.write("\n")
			f.write("module constant_multiplication_base_2(a,b);\n");
			f.write("\t input [1:0] a;\n");
			f.write("\t output [1:0] b;\n");
			f.write("\t assign b[0]=a[1];\n");
			f.write("\t assign b[1]=a[0]^a[1];\n");
			f.write("endmodule\n");
			f.write("\n")
			f.write("module constant_multiplication_base_3(a,b);\n");
			f.write("\t input [1:0] a;\n");
			f.write("\t output [1:0] b;\n");
			f.write("\t assign b[0]=a[0]^a[1];\n");
			f.write("\t assign b[1]=a[0];\n");
			f.write("endmodule\n");
			f.write("\n")
			f.write("module multiplication_base(a,b,c);\n");
			f.write("\t input [1:0] a;\n");
			f.write("\t input [1:0] b;\n");
			f.write("\t output [1:0] c;\n");
			f.write("\t wire t;\n");
			f.write("\t assign t=(a[0]&b[1])^(a[1]&b[0]);\n");
			f.write("\t assign c[0]=(a[1]&b[1])^t;\n");
			f.write("\t assign c[1]=(a[0]&b[0])^t;\n");
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
			f.write("module power_13(a,b);\n");
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
			f.write("\t wire [1:0] w_0_0;\n");
			f.write("\t wire [1:0] w_0_1;\n");
			f.write("\t wire [1:0] w_0_2;\n");
			f.write("\t wire [1:0] w_0_3;\n");
			f.write("\t wire [1:0] w_0_4;\n");
			f.write("\t wire [1:0] w_0_5;\n");
			f.write("\t wire [1:0] w_0_6;\n");
			f.write("\t wire [1:0] w_0_7;\n");
			f.write("\t wire [1:0] w_0_8;\n");
			f.write("\t wire [1:0] w_0_9;\n");
			f.write("\t wire [1:0] w_0_10;\n");
			f.write("\t wire [1:0] w_0_11;\n");
			f.write("\t wire [1:0] w_0_12;\n");
			f.write("\t wire [1:0] w_0_13;\n");
			f.write("\t wire [1:0] w_0_14;\n");
			f.write("\t wire [1:0] w_1_0;\n");
			f.write("\t wire [1:0] w_1_1;\n");
			f.write("\t wire [1:0] w_1_2;\n");
			f.write("\t wire [1:0] w_1_3;\n");
			f.write("\t wire [1:0] w_1_4;\n");
			f.write("\t wire [1:0] w_1_5;\n");
			f.write("\t wire [1:0] w_1_6;\n");
			f.write("\t wire [1:0] w_1_7;\n");
			f.write("\t wire [1:0] w_1_8;\n");
			f.write("\t wire [1:0] w_1_9;\n");
			f.write("\t wire [1:0] w_1_10;\n");
			f.write("\t wire [1:0] w_1_11;\n");
			f.write("\t wire [1:0] w_1_12;\n");
			f.write("\t wire [1:0] w_1_13;\n");
			f.write("\t wire [1:0] w_1_14;\n");
			f.write("\t wire [1:0] w_2_0;\n");
			f.write("\t wire [1:0] w_2_1;\n");
			f.write("\t wire [1:0] w_2_2;\n");
			f.write("\t wire [1:0] w_2_3;\n");
			f.write("\t wire [1:0] w_2_4;\n");
			f.write("\t wire [1:0] w_2_5;\n");
			f.write("\t wire [1:0] w_2_6;\n");
			f.write("\t wire [1:0] w_2_7;\n");
			f.write("\t wire [1:0] w_2_8;\n");
			f.write("\t wire [1:0] w_2_9;\n");
			f.write("\t wire [1:0] w_2_10;\n");
			f.write("\t wire [1:0] w_2_11;\n");
			f.write("\t wire [1:0] w_2_12;\n");
			f.write("\t wire [1:0] w_2_13;\n");
			f.write("\t wire [1:0] w_2_14;\n");
			f.write("\t wire [1:0] z_0_0;\n");
			f.write("\t wire [1:0] z_0_1;\n");
			f.write("\t wire [1:0] z_0_2;\n");
			f.write("\t wire [1:0] z_0_3;\n");
			f.write("\t wire [1:0] z_0_4;\n");
			f.write("\t wire [1:0] z_0_5;\n");
			f.write("\t wire [1:0] z_0_6;\n");
			f.write("\t wire [1:0] z_0_7;\n");
			f.write("\t wire [1:0] z_0_8;\n");
			f.write("\t wire [1:0] z_0_9;\n");
			f.write("\t wire [1:0] z_0_10;\n");
			f.write("\t wire [1:0] z_0_11;\n");
			f.write("\t wire [1:0] z_0_12;\n");
			f.write("\t wire [1:0] z_0_13;\n");
			f.write("\t wire [1:0] z_1_0;\n");
			f.write("\t wire [1:0] z_1_1;\n");
			f.write("\t wire [1:0] z_1_2;\n");
			f.write("\t wire [1:0] z_1_3;\n");
			f.write("\t wire [1:0] z_1_4;\n");
			f.write("\t wire [1:0] z_1_5;\n");
			f.write("\t wire [1:0] z_1_6;\n");
			f.write("\t wire [1:0] z_1_7;\n");
			f.write("\t wire [1:0] z_1_8;\n");
			f.write("\t wire [1:0] z_1_9;\n");
			f.write("\t wire [1:0] z_1_10;\n");
			f.write("\t wire [1:0] z_1_11;\n");
			f.write("\t wire [1:0] z_1_12;\n");
			f.write("\t wire [1:0] z_1_13;\n");
			f.write("\t wire [1:0] z_2_0;\n");
			f.write("\t wire [1:0] z_2_1;\n");
			f.write("\t wire [1:0] z_2_2;\n");
			f.write("\t wire [1:0] z_2_3;\n");
			f.write("\t wire [1:0] z_2_4;\n");
			f.write("\t wire [1:0] z_2_5;\n");
			f.write("\t wire [1:0] z_2_6;\n");
			f.write("\t wire [1:0] z_2_7;\n");
			f.write("\t wire [1:0] z_2_8;\n");
			f.write("\t wire [1:0] z_2_9;\n");
			f.write("\t wire [1:0] z_2_10;\n");
			f.write("\t wire [1:0] z_2_11;\n");
			f.write("\t wire [1:0] z_2_12;\n");
			f.write("\t wire [1:0] z_2_13;\n");
			f.write("\t assign x_0[0]=a[0];\n");	
			f.write("\t assign x_0[1]=a[1];\n");
			f.write("\t assign x_1[0]=a[2];\n");	
			f.write("\t assign x_1[1]=a[3];\n");
			f.write("\t assign x_2[0]=a[4];\n");	
			f.write("\t assign x_2[1]=a[5];\n");
			f.write("\t square_base  SB1 (x_0,y_0);\n");
			f.write("\t square_base SB2 (x_1,y_1);\n");
			f.write("\t square_base SB3 (x_2,y_2);\n");
			f.write("\t multi_qube_base MQB1 (x_0,x_1,x_3);\n");
			f.write("\t multi_qube_base MQB2 (x_0,x_2,x_4);\n");
			f.write("\t multi_qube_base MQB3 (x_1,x_0,x_5);\n");
			f.write("\t multi_qube_base MQB4 (x_1,x_2,x_6);\n");
			f.write("\t multi_qube_base MQB5 (x_2,x_0,x_7);\n");
			f.write("\t multi_qube_base MQB6 (x_2,x_1,x_8);\n");
			f.write("\t multiplication_base MB1 (y_0,y_1,x_9);\n");
			f.write("\t multiplication_base MB2 (y_0,y_2,x_10);\n");
			f.write("\t multiplication_base MB3 (y_1,y_2,x_11);\n");
			f.write("\t multiplication_base MB4 (x_1,x_2,y_3);\n");
			f.write("\t multiplication_base MB5 (y_0,y_3,x_12);\n");
			f.write("\t multiplication_base MB6 (x_0,x_2,y_4);\n");
			f.write("\t multiplication_base MB7 (y_1,y_4,x_13);\n");
			f.write("\t multiplication_base MB8 (x_0,x_1,y_5);\n");
			f.write("\t multiplication_base MB9 (y_2,y_5,x_14);\n");
			for iii in range(3):
				for jjj in range(15):
					if(P[iii][jjj]==0):
					    f.write("\t constant_multiplication_base_0 MC{}{} (x_{},w_{}_{});\n".format(iii,jjj,jjj,iii,jjj));
					if(P[iii][jjj]==1):
					    f.write("\t constant_multiplication_base_1 MC{}{} (x_{},w_{}_{});\n".format(iii,jjj,jjj,iii,jjj));
					if(P[iii][jjj]==a):
					    f.write("\t constant_multiplication_base_2 MC{}{} (x_{},w_{}_{});\n".format(iii,jjj,jjj,iii,jjj));
					if(P[iii][jjj]==a+1):
					    f.write("\t constant_multiplication_base_3 MC{}{} (x_{},w_{}_{});\n".format(iii,jjj,jjj,iii,jjj));
			f.write("\t add_base AB00 (w_0_0,w_0_1,z_0_0);\n");
			f.write("\t add_base AB01 (w_0_2,z_0_0,z_0_1);\n");
			f.write("\t add_base AB02 (w_0_3,z_0_1,z_0_2);\n");
			f.write("\t add_base AB03 (w_0_4,z_0_2,z_0_3);\n");
			f.write("\t add_base AB04 (w_0_5,z_0_3,z_0_4);\n");
			f.write("\t add_base AB05 (w_0_6,z_0_4,z_0_5);\n");
			f.write("\t add_base AB06 (w_0_7,z_0_5,z_0_6);\n");
			f.write("\t add_base AB07 (w_0_8,z_0_6,z_0_7);\n");
			f.write("\t add_base AB08 (w_0_9,z_0_7,z_0_8);\n");
			f.write("\t add_base AB09 (w_0_10,z_0_8,z_0_9);\n");
			f.write("\t add_base AB010 (w_0_11,z_0_9,z_0_10);\n");
			f.write("\t add_base AB011 (w_0_12,z_0_10,z_0_11);\n");
			f.write("\t add_base AB012 (w_0_13,z_0_11,z_0_12);\n");
			f.write("\t add_base AB013 (w_0_14,z_0_12,z_0_13);\n");
			f.write("\t add_base AB10 (w_1_0,w_1_1,z_1_0);\n");
			f.write("\t add_base AB11 (w_1_2,z_1_0,z_1_1);\n");
			f.write("\t add_base AB12 (w_1_3,z_1_1,z_1_2);\n");
			f.write("\t add_base AB13 (w_1_4,z_1_2,z_1_3);\n");
			f.write("\t add_base AB14 (w_1_5,z_1_3,z_1_4);\n");
			f.write("\t add_base AB15 (w_1_6,z_1_4,z_1_5);\n");
			f.write("\t add_base AB16 (w_1_7,z_1_5,z_1_6);\n");
			f.write("\t add_base AB17 (w_1_8,z_1_6,z_1_7);\n");
			f.write("\t add_base AB18 (w_1_9,z_1_7,z_1_8);\n");
			f.write("\t add_base AB19 (w_1_10,z_1_8,z_1_9);\n");
			f.write("\t add_base AB110 (w_1_11,z_1_9,z_1_10);\n");
			f.write("\t add_base AB111 (w_1_12,z_1_10,z_1_11);\n");
			f.write("\t add_base AB112 (w_1_13,z_1_11,z_1_12);\n");
			f.write("\t add_base AB113 (w_1_14,z_1_12,z_1_13);\n");
			f.write("\t add_base AB20 (w_2_0,w_2_1,z_2_0);\n");
			f.write("\t add_base AB21 (w_2_2,z_2_0,z_2_1);\n");
			f.write("\t add_base AB22 (w_2_3,z_2_1,z_2_2);\n");
			f.write("\t add_base AB23 (w_2_4,z_2_2,z_2_3);\n");
			f.write("\t add_base AB24 (w_2_5,z_2_3,z_2_4);\n");
			f.write("\t add_base AB25 (w_2_6,z_2_4,z_2_5);\n");
			f.write("\t add_base AB26 (w_2_7,z_2_5,z_2_6);\n");
			f.write("\t add_base AB27 (w_2_8,z_2_6,z_2_7);\n");
			f.write("\t add_base AB28 (w_2_9,z_2_7,z_2_8);\n");
			f.write("\t add_base AB29 (w_2_10,z_2_8,z_2_9);\n");
			f.write("\t add_base AB210 (w_2_11,z_2_9,z_2_10);\n");
			f.write("\t add_base AB211 (w_2_12,z_2_10,z_2_11);\n");
			f.write("\t add_base AB212 (w_2_13,z_2_11,z_2_12);\n");
			f.write("\t add_base AB213 (w_2_14,z_2_12,z_2_13);\n");
			f.write("\t assign b[0]=z_0_13[0];\n");
			f.write("\t assign b[1]=z_0_13[1];\n");
			f.write("\t assign b[2]=z_1_13[0];\n");
			f.write("\t assign b[3]=z_1_13[1];\n");
			f.write("\t assign b[4]=z_2_13[0];\n");
			f.write("\t assign b[5]=z_2_13[1];\n");
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
			f.write("module addition(a,b,c);\n");
			f.write("\t input [5:0] a;\n");
			f.write("\t input [5:0] b;\n");
			f.write("\t wire t;\n");
			f.write("\t output [5:0] c;\n");
			f.write("\t assign t=b[2]^b[4];\n");
			f.write("\t assign c[0]=a[0]^t;\n");
			f.write("\t assign c[1]=a[1]^t;\n");
			f.write("\t assign c[2]=a[2]^t;\n");
			f.write("\t assign c[3]=a[3]^t;\n");
			f.write("\t assign c[4]=a[4]^t;\n");
			f.write("\t assign c[5]=a[5]^t;\n");
			f.write("endmodule\n");
			f.write("\n")
