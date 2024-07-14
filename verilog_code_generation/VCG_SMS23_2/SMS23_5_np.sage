####Verilog Code generation for SMS5 with respect to basis N-P_2^3#####
F=GF(2);
k3.<z>=PolynomialRing(F);
h=z^6 +z^4+z^3+z+1; 
F3.<c>=F.extension(h);
k1.<x>=PolynomialRing(F); 
f=x^2+x+1; 
F1.<a>=F.extension(f); 
k2.<y>=PolynomialRing(F1);

#Listing primitive polynomials
G=[y^3+y^2+y+a,y^3+y^2+y+a+1,y^3 + y^2 + (a + 1)*y + a,y^3 + y^2 + a*y + a + 1,y^3 + a*y^2 + y + a + 1,y^3 + (a + 1)*y^2 + y + a,y^3 + a*y^2 + (a + 1)*y + a + 1,y^3 + (a + 1)*y^2 + a*y + a,y^3 + a*y^2 + (a + 1)*y + a,y^3 + (a + 1)*y^2 + a*y + a + 1,y^3 + a*y^2 + a*y + a,y^3 + (a + 1)*y^2 + (a + 1)*y + a + 1];
k=0

#The array idicates the powers for which {b^K,(b^K)^4,(b^K)^16} forms a normal basis
A=[3,3,1,1,1,1,3,3,3,3,1,1]

#Listing all isomorphisms
Index=[[1,2,4,8,16,32],[1,2,4,8,16,32],[13,19,26,38,41,52],[13,19,26,38,41,52],[5,10,17,20,34,40],[5,10,17,20,34,40],[11,22,25,37,44,50],[11,22,25,37,44,50],[23,29,43,46,53,58],[23,29,43,46,53,58],[31,47,55,59,61,62],[31,47,55,59,61,62]];

#Iterate over the primitive polynomials
for g in G:
	k=k+1	
	F2.<b>=k2.quotient_ring(g);
	t=b^A[k-1]	    
	B=(t^5,t^20,t^17,t^8+t^17,t^2+t^20,t^5+t^32);
	T=[];
	#Finding the scalar multiplication with respect to different choices of primitive polynimials
	for m in B:
		for i in F1: 
    			for j in F1: 
    				for l in F1: 
    					if((i*t+j*t^4+l*t^16)==m):  
    						T.append([i,j,l]);  
	S=matrix(F1,T);
	P=S.transpose();
	l=0;
	
	#Finding the transformation matrix
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
		#Input and Output matrix
		P1=matrix(GF(2),[[1,0,0,0,0,0],[0,1,0,0,0,0],[0,0,1,0,0,0],[0,0,0,1,0,0],[0,0,0,0,1,0],[1,0,0,0,0,1]])
		Q=matrix(GF(2),[[1,0,0,0,0,1],[0,0,1,0,1,1],[1,1,1,1,1,0],[1,1,1,0,0,1],[0,1,0,0,0,1],[1,1,0,0,1,1]])
		V=Q*U1
		fname = f'/home/dilip/Desktop/6-bit_Sbox/supplementary_material/verilogcode/SMS23_2/SMS23_5_np_{k}_{l}.v'
		with open(fname, "w") as f:
			f.write("`timescale 1ns/100ps\n");
			f.write("module SMS23_5_np_{}_{}(x,y);\n".format(k,l));
			f.write("\t input [5:0] x;\n");
			f.write("\t output [5:0] y;\n");
			f.write("\t wire [5:0] w;\n");
			f.write("\t wire [5:0] p;\n");
			f.write("\t isomorphism C2 (x,w);\n");
			f.write("\t power_5 C3 (w,p);\n");
			f.write("\t inv_isomorphism C4 (p,y);\n");
			f.write("endmodule\n");
			f.write("\n");
			
			#Square in GF(2^2)
			f.write("module square_base(a,b);\n");
			f.write("\t input [1:0] a;\n");
			f.write("\t output [1:0] b;\n");
			f.write("\t assign b[0]=a[0]^a[1];\n");
			f.write("\t assign b[1]=a[1];\n");
			f.write("endmodule\n");
			f.write("\n")
			
			#Addition in GF(2^2)
			f.write("module add_base(a,b,c);\n");
			f.write("\t input [1:0] a;\n");
			f.write("\t input [1:0] b;\n");
			f.write("\t output [1:0] c;\n");
			f.write("\t assign c[0]=a[0]^b[0];\n");
			f.write("\t assign c[1]=a[1]^b[1];\n");
			f.write("endmodule\n");
			f.write("\n")
			
			#Scalar Multiplication in GF(2^2)	
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
			
			#Multiplication in GF(2^2)
			f.write("module multiplication_base(a,b,c);\n");
			f.write("\t input [1:0] a;\n");
			f.write("\t input [1:0] b;\n");
			f.write("\t output [1:0] c;\n");
			f.write("\t wire t;\n");
			f.write("\t assign t=(a[1]&b[1]);\n");
			f.write("\t assign c[0]=(a[0]&b[0])^t;\n");
			f.write("\t assign c[1]=(a[0]&b[1])^(a[1]&b[0])^t;\n");
			f.write("endmodule\n");
			
			#Finding x^5 in the composite field
			f.write("module power_5(a,b);\n");
			f.write("\t input [5:0] a;\n");
			f.write("\t output [5:0] b;\n");
			f.write("\t wire [1:0] x_0;\n");
			f.write("\t wire [1:0] x_1;\n");
			f.write("\t wire [1:0] x_2;\n");
			f.write("\t wire [1:0] y_0;\n");
			f.write("\t wire [1:0] y_1;\n");
			f.write("\t wire [1:0] y_2;\n");
			f.write("\t wire [1:0] y_3;\n");
			f.write("\t wire [1:0] y_4;\n");
			f.write("\t wire [1:0] y_5;\n");
			f.write("\t wire [1:0] z_00;\n")
			f.write("\t wire [1:0] z_01;\n")
			f.write("\t wire [1:0] z_02;\n")
			f.write("\t wire [1:0] z_03;\n")
			f.write("\t wire [1:0] z_04;\n")
			f.write("\t wire [1:0] z_10;\n")
			f.write("\t wire [1:0] z_11;\n")
			f.write("\t wire [1:0] z_12;\n")
			f.write("\t wire [1:0] z_13;\n")
			f.write("\t wire [1:0] z_14;\n")
			f.write("\t wire [1:0] z_20;\n")
			f.write("\t wire [1:0] z_21;\n")
			f.write("\t wire [1:0] z_22;\n")
			f.write("\t wire [1:0] z_23;\n")
			f.write("\t wire [1:0] z_24;\n")
			f.write("\t wire [1:0] w_00;\n");
			f.write("\t wire [1:0] w_01;\n");
			f.write("\t wire [1:0] w_02;\n");
			f.write("\t wire [1:0] w_03;\n");
			f.write("\t wire [1:0] w_04;\n");
			f.write("\t wire [1:0] w_05;\n");
			f.write("\t wire [1:0] w_10;\n");
			f.write("\t wire [1:0] w_11;\n");
			f.write("\t wire [1:0] w_12;\n");
			f.write("\t wire [1:0] w_13;\n");
			f.write("\t wire [1:0] w_14;\n");
			f.write("\t wire [1:0] w_15;\n");
			f.write("\t wire [1:0] w_20;\n");
			f.write("\t wire [1:0] w_21;\n");
			f.write("\t wire [1:0] w_22;\n");
			f.write("\t wire [1:0] w_23;\n");
			f.write("\t wire [1:0] w_24;\n");
			f.write("\t wire [1:0] w_25;\n");
			f.write("\t assign x_0[0]=a[0];\n");	
			f.write("\t assign x_0[1]=a[1];\n");
			f.write("\t assign x_1[0]=a[2];\n");	
			f.write("\t assign x_1[1]=a[3];\n");
			f.write("\t assign x_2[0]=a[4];\n");	
			f.write("\t assign x_2[1]=a[5];\n");
			f.write("\t square_base  A1 (x_0,y_0);\n");
			f.write("\t square_base A2 (x_1,y_1);\n");
			f.write("\t square_base A3 (x_2,y_2);\n");
			f.write("\t multiplication_base A4 (x_0,x_1,y_3);\n");
			f.write("\t multiplication_base A5 (x_0,x_2,y_4);\n");
			f.write("\t multiplication_base A6 (x_1,x_2,y_5);\n");
			for iii in range(3):
			  for jjj in range(6):
				  if(P[iii][jjj]==0):
					  f.write("\t constant_multiplication_base_0 MC{}{} (y_{},w_{}{});\n".format(iii,jjj,jjj,iii,jjj))
				  if(P[iii][jjj]==1):
					  f.write("\t constant_multiplication_base_1 MC{}{} (y_{},w_{}{});\n".format(iii,jjj,jjj,iii,jjj))
				  if(P[iii][jjj]==a):
					  f.write("\t constant_multiplication_base_2 MC{}{} (y_{},w_{}{});\n".format(iii,jjj,jjj,iii,jjj))
				  if(P[iii][jjj]==a+1):
					  f.write("\t constant_multiplication_base_3 MC{}{} (y_{},w_{}{});\n".format(iii,jjj,jjj,iii,jjj))
			f.write("\t add_base B00 (w_00,w_01,z_00);\n")
			f.write("\t add_base B01 (w_02,w_03,z_01);\n")
			f.write("\t add_base B02 (w_04,w_05,z_02);\n")
			f.write("\t add_base B03 (z_00,z_01,z_03);\n")
			f.write("\t add_base B04 (z_03,z_02,z_04);\n")
			f.write("\t add_base B10 (w_10,w_11,z_10);\n")
			f.write("\t add_base B11 (w_12,w_13,z_11);\n")
			f.write("\t add_base B12 (w_14,w_15,z_12);\n")
			f.write("\t add_base B13 (z_10,z_11,z_13);\n")
			f.write("\t add_base B14 (z_13,z_12,z_14);\n")
			f.write("\t add_base B20 (w_20,w_21,z_20);\n")
			f.write("\t add_base B21 (w_22,w_23,z_21);\n")
			f.write("\t add_base B22 (w_24,w_25,z_22);\n")
			f.write("\t add_base B23 (z_20,z_21,z_23);\n")
			f.write("\t add_base B24 (z_23,z_22,z_24);\n")
			f.write("\t assign b[0]=z_04[0];\n");
			f.write("\t assign b[1]=z_04[1];\n");
			f.write("\t assign b[2]=z_14[0];\n");
			f.write("\t assign b[3]=z_14[1];\n");
			f.write("\t assign b[4]=z_24[0];\n");
			f.write("\t assign b[5]=z_24[1];\n");
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
			
			#Inverse Isomorphism
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
			
			#Inverse Isomorphism
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
