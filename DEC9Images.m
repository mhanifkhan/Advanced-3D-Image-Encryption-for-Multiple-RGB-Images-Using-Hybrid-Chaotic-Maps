function res = DEC9Images(bigimg)

[m,n,p] = size(bigimg);

%%%%%%%%%%%%%%%%%%%% HASH VALUES %%%%%%%%%%%%%%%%%%%%%%%
% %%%%% Images	Images	384	9 x 128     %%%%%%%%%%%%%
% HashValue = [122	85	1	12	137	26	108	194;	2	225	42	36	173	182	20	175;	61	5	162	85	58	55	161	6;	80	177	62	4	216	177	223	79];
% UserKey = [253	69	133	211	126	202	176	184;	125	86	92	130	159	24	100	44;	195	132	180	157	219	197	208	43;	50	130	125	134	77	37	68	100];


%%%%% Images	1536	9 x 512     %%%%%%%%%%%%%
HashValue = [43	192	133	9	124	115	160	211;	188	241	155	37	183	116	244	117;	120	201	102	210	209	237	7	206;	6	0	18	141	184	30	19	79];
UserKey = [56	104	253	249	61	139	92	145;	114	20	198	103	164	228	127	1;	46	132	16	122	187	59	196	3;	122	53	173	140	228	215	29	193];


% %%%%% Images	3072	9 x 1024     %%%%%%%%%%%%%
% HashValue = [38	108	220	186	51	50	235	98;	126	207	102	175	147	63	151	9;	240	254	2	75	89	153	125	202;	187	77	36	180	109	202	150	128];
% UserKey = [115	245	105	227	155	70	32	52;	222	249	9	138	216	118	93	130;	50	172	221	205	246	99	110	172;	146	68	131	38	94	87	59	111];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

XORof = bitxor(HashValue,UserKey);

XORofSum = sum(XORof,1); % sum of columns

% row1 = XORofSum(1,1);
% row2 = XORofSum(2,1);
% row3 = XORofSum(3,1);
% row4 = XORofSum(4,1);


col1 = XORofSum(1,1);
col2 = XORofSum(1,2);
col3 = XORofSum(1,3);
col4 = XORofSum(1,4);
col5 = XORofSum(1,5);
col6 = XORofSum(1,6);
col7 = XORofSum(1,7);
col8 = XORofSum(1,8);

for_K1 = bitxor(col1,col5);
for_K2 = bitxor(col2,col6);
for_K3 = bitxor(col3,col7);
for_mue = bitxor(col4,col8);

k1 = (for_K1/256)+33.5;
k2 = (for_K2/256)+37.9;
k3 = (for_K3/256)+35.7;
mue = (for_mue/256)/3;

% a = mue * k1 * k2;

x0 = mod((mue * k1 * k2 * k3) , 0.5);
y0 = mod((((x0 * ((k2 * k3)/ mue)) ) + k1), 0.5);
z0 = mod((((x0 * k3) / (y0 * k2)) * (mue * k1)), 2.5);
b0 = mod((x0*((((y0+mue)*(z0+k1))*k2) / (k2*256))), 0.2); 
n0 = mod((y0*(((k1*z0)*(k2*b0))/256)), 0.3); 

key = [k1, k2, k3, mue, x0, y0, z0, b0, n0];



%%%%%%%%%%%%%%%%  Keys sensitivity = x0, y0, z0, mue, k1, k2, k3   %%%%%%%%%%%%%%%%%%%%%%%
x0 =  x0;    % key 0 = K0
% x0 =  x0 + (10^-14);    % key 1 = K1
% x0 =  x0 - (10^-14);    % key 2 = K2
% y0 = y0 + (10^-14);     % key 3 = K3
% y0 = y0 - (10^-14);     % key 4 = K4
% z0 = z0 + (10^-14);     % key 5 = K5
% z0 = z0 - (10^-14);     % key 6 = K6
% b0 = b0 + (10^-14);     % key 7 = K7
% b0 = b0 - (10^-14);     % key 8 = K8
% n0 = n0 + (10^-14);     % key 9 = K9
% n0 = n0 - (10^-14);     % key 10 = K10
% k1 = k1 + (10^-14);     % key 11 = K11
% k1 = k1 - (10^-14);     % key 12 = K12
% k2 = k2 + (10^-13);     % key 13 = K13
% k2 = k2 - (10^-14);     % key 14 = K14
% k3 = k3 + (10^-14);     % key 15 = K15
% k3 = k3 - (10^-14);     % key 16 = K16
% mue = mue + (10^-14);     % key 17 = K17
% mue = mue - (10^-14);     % key 18 = K18


%%%%%%%%%%%%%%%% End of Keys   %%%%%%%%%%%%%%%%%%%%%%%

                %The Intertwining Logistic Map
                %Initializing the value of x0 to u , y0 to v, and z0 t0 w
                u(1) = x0;
                v(1) = y0;
                w(1) = z0;
                bb(1) = b0;
                nn(1) = n0;
                               
                 for i = 1 : m*n*p-1    % -1 is used because first time the value is already assigned to u, v, w, i.e. u(1), v(1), w(1) it will start form u(2)...
                
                     %%%%%%%The Intertwining Logistic Map, (ITLM)
                
                    u(i + 1) = mod ( mue * k1 * v(i) * (1 - u(i)) + w(i) , 1);
                    v(i + 1) = mod ( mue * k2 * v(i) + w(i) * 1 / (1 + (u(i + 1) ^2)) , 1);
                    w(i + 1) = mod ( mue * (u (i + 1) + v(i + 1) + k3) * sin(w(i)) , 1);
                
                    %%%%%%%%The Piecewise Linear Chaotic Map, (PWLCM)

                    dv = bb(i) / nn(1);
                    dv = floor (dv);
                    mul = dv * nn(1);
                    sub = bb(i) - mul;
                    bb(i + 1) = sub / nn(1);
                    
                end
                              
%                 for i = 501: m*n*P
%                     w(i-500) = w(i);
%                 end
%                
 
 %Step 3.5 Generate the Random collection by given equation 4
                    
                    pic1 = ((mod(floor (u * (10^14)), p))+1);
                    row1 = ((mod(floor (v * (10^14)), m))+1);                   
                    col1 = ((mod(floor (w * (10^14)), n))+1);
                    pic2 = ((mod(floor (u * (10^14)), p))+1);
                    row2 = ((mod(floor (v * (10^14)), m))+1);                   
                    col2 = ((mod(floor (w * (10^14)), n))+1);
                    
               
                    st1 = (mod(floor (bb * (10^14)), 256));
                  
                    ranimg = reshape (st1, [m, n,p]);                  
                    Defuse = bitxor(bigimg,ranimg);
                    bigimg = Defuse;

 ss=m*n*p;
                    
for i = 1:m*n*p
    
    im1 = pic1(i);       % First Value of Array
    im2 = pic2(ss);    % Last Value of Array
    r1 = row1(i);
    r2 = row2(ss);
    c1 = col1(i);
    c2 = col2(ss);
     
    c = bigimg(:, c1,im1);   % image 1 row 3 
    d = bigimg(:, c2,im2);   % image 1 row 3 
        
    bigimg(:, c1,im1) = d;
    bigimg(:, c2,im2) = c;
    
    
    a = bigimg(r1, :,im1);   % image 1 row 3 
    b = bigimg(r2, :,im2);   % image 1 row 3 
    
    bigimg(r1, :,im1) = b;
    bigimg(r2, :,im2) = a;
    
    ss = ss-1;
    
end
                   
                    
res = bigimg;

end
