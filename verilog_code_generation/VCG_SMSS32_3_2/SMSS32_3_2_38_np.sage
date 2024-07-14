F=GF(2)
k3.<z>=PolynomialRing(F);k3 
h=z^6 +z^4+z^3+z+1; 
F3.<c>=F.extension(h);                                                                                                                                                                                              
k1.<x>=PolynomialRing(F)
f=x^3+x^2+1
k=0;
H=[];
Index=[];
F1.<a>=F.extension(f);
k2.<y>=PolynomialRing(F1);
for p in k2.polynomials(2):
	if p.is_primitive():
		if p.monomial_coefficient(y^2)==1:
			H.append(p);
for g in H:
	T=[];
	k=k+1;
	F2.<b>=F1.extension(g)
	for i in range(2^6-1):
	      if(h(b^i)==0):
		      T.append(i);
	Index.append(T);
	l=0;
	for index in T:
		l=l+1;
		t=b^index; 
		for i1 in range(63):
		    if((t^i1==a)):
			    s=i1; 
		for i1 in range(63):
		    if((t^i1==b)):
			    p=i1;
		B1=[(21*p)%63,(s+21*p)%63,(2*s+21*p)%63,(168*p)%63,(s+168*p)%63,(2*s+168*p)%63];
		X=[];
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
		Q=matrix(GF(2),[[0,1,1,1,0,0],[1,1,0,0,0,0],[0,0,1,1,1,1],[1,0,1,1,1,0],[0,1,1,0,1,0],[0,0,1,1,0,1]])
		V=Q*U1		
		fname = f'/home/dilip/Desktop/6-bit_Sbox/supplementary_material/verilogcode/SMSS32_3_2/SMSS32_2_38_np_{k}_{l}.v'
		with open(fname, "w") as f:
			f.write("`timescale 1ns/100ps\n");
			f.write("module SMSS32_2_38_np_{}_{}(x,y);\n".format(k,l));
			f.write("\t input [5:0] x;\n");
			f.write("\t output [5:0] y;\n");
			f.write("\t wire [5:0] z;\n");
			f.write("\t wire [5:0] w;\n");
			f.write("\t wire [5:0] p;\n");
			f.write("\t isomorphism C1 (x,z);\n");
			f.write("\t power_38 C2 (z,w);\n");
			f.write("\t inv_isomorphism C3 (w,p);\n");
			f.write("\t addition C4 (p,x,y);\n");
			f.write("endmodule\n");
			f.write("\n")
			f.write("module add_base(a,b,c);\n");
			f.write("\t input [2:0] a;\n");
			f.write("\t input [2:0] b;\n");
			f.write("\t output [2:0] c;\n");
			f.write("\t assign c[0]=a[0]^b[0];\n");
			f.write("\t assign c[1]=a[1]^b[1];\n");
			f.write("\t assign c[2]=a[2]^b[2];\n");
			f.write("endmodule\n");
			f.write("\n")
			f.write("module multiplication_base(a,b,c);\n");
			f.write("\t input [2:0] a;\n");
			f.write("\t input [2:0] b;\n");
			f.write("\t output [2:0] c;\n");
			f.write("\t assign c[0]=(a[0]&b[0])^(a[1]&b[2])^(a[2]&b[1])^(a[2]&b[2]);\n");
			f.write("\t assign c[1]=(a[0]&b[1])^(a[1]&b[0])^(a[2]&b[2]);\n");
			f.write("\t assign c[2]=(a[2]&b[0])^(a[1]&b[1])^(a[0]&b[2])^(a[1]&b[2])^(a[2]&b[1])^(a[2]&b[2]);\n");
			f.write("endmodule\n");
			f.write("\n")
			f.write("module square_base(a,b);\n");
			f.write("\t input [2:0] a;\n");
			f.write("\t output[2:0] b;\n");
			f.write("\t assign b[0]=a[0]^a[2];\n");
			f.write("\t assign b[1]=a[2];\n");
			f.write("\t assign b[2]=a[1]^a[2];\n");
			f.write("endmodule\n");
			f.write("\n")
			f.write("module four_base(a,b);\n");
			f.write("\t input [2:0] a;\n");
			f.write("\t output[2:0] b;\n");
			f.write("\t assign b[0]=a[0]^a[1];\n");
			f.write("\t assign b[1]=a[1]^a[2];\n");
			f.write("\t assign b[2]=a[1];\n");
			f.write("endmodule\n");
			f.write("\n")
			f.write("module power_38(a,b);\n");
			f.write("\t input [5:0] a;\n");
			f.write("\t output [5:0] b;\n");
			f.write("\t wire [2:0] x_0;\n");
			f.write("\t wire [2:0] x_1;\n");
			f.write("\t wire [2:0] x_2;\n");
			f.write("\t wire [2:0] x_3;\n");
			f.write("\t wire [2:0] x_4;\n");
			f.write("\t wire [2:0] x_5;\n");
			f.write("\t wire [2:0] x_6;\n");
			f.write("\t wire [2:0] x_7;\n");
			f.write("\t wire [2:0] y_0;\n");
			f.write("\t wire [2:0] y_1;\n");
			f.write("\t assign x_0[0]=a[0];\n");	
			f.write("\t assign x_0[1]=a[1];\n");
			f.write("\t assign x_0[2]=a[2];\n");	
			f.write("\t assign x_1[0]=a[3];\n");
			f.write("\t assign x_1[1]=a[4];\n");	
			f.write("\t assign x_1[2]=a[5];\n");
			f.write("\t square_base  A1 (x_0,x_2);\n");
			f.write("\t square_base  A2 (x_1,x_3);\n");                  
			f.write("\t multiplication_base A3 (x_0,x_1,x_4);\n");
			f.write("\t four_base  A4 (x_4,x_5);\n");
			f.write("\t add_base A5 (x_0,x_1,x_6);\n");
			f.write("\t add_base A6 (x_5,x_6,x_7);\n");
			f.write("\t multiplication_base A7 (x_2,x_7,y_0);\n");
			f.write("\t multiplication_base A8 (x_3,x_7,y_1);\n");
			f.write("\t assign b[0]=y_1[0];\n");
			f.write("\t assign b[1]=y_1[1];\n");
			f.write("\t assign b[2]=y_1[2];\n");
			f.write("\t assign b[3]=y_0[0];\n");
			f.write("\t assign b[4]=y_0[1];\n");
			f.write("\t assign b[5]=y_0[2];\n");
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
