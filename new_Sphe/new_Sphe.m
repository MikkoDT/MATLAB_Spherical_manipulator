syms a1 a2 a3 a4
a1 = 6;
a2 = 3;
a3 = 3;
a4 = .5;
a5 = .5;
a6 = 1;

%% D-H Parameters [theta, d, r, alpha, offset]
H1 = Link([0,a1,0,pi/2,0]);
H1.qlim = pi/180*[-90 90];
H2 = Link([0,0,a2,pi/2,0,pi/2]);
H2.qlim = pi/180*[-90 90];
H3 = Link([0,0,0,0,1,a3]);
H3.qlim = [0 3];

H4 = Link([0,a4,0,pi/2,0,pi]);
H4.qlim = pi/180*[-90 90];
H5 = Link([0,0,0,pi/2,0,pi/2]);
H5.qlim = pi/180*[0 90];
H6 = Link([0,a5+a6,0,0,0]);
H6.qlim = pi/180*[-90 90];

NS = SerialLink([H1 H2 H3 H4 H5 H6],'name','new sphe')
NS.plot([0 0 0 0 0 0],'workspace',[-15 15 -15 15 -15 15])
NS.teach

%% fkine

% AF_1 = [(0)*pi/180 (0)*pi/180 0];
% NS_FK = NS.fkine(AF_1)

%% ikine command
% qready = [0 0 0];
% Trans = transl([3 0 9]);
% IK = (NS.ikine(Trans,qready,'mask',[1 1 1 0 0 0])) 

%% FK and IK using D-H Notation Formula

% syms tn an rn dn t1 t2 d3 a1 a2 a3 
% 
% Hm_n = [cos(tn) -sin(tn)*cos(an) sin(tn)*sin(an) rn*cos(tn); sin(tn) cos(tn)*cos(an) -cos(tn)*sin(an) rn*sin(tn); 0 sin(an) cos(an) dn; 0 0 0 1];
% H0_1 = subs(Hm_n,[tn an rn dn], [t1 pi/2 0 a1]);
% H1_2 = subs(Hm_n,[tn an rn dn], [t2+pi/2 pi/2 a2 0]);
% H2_3 = subs(Hm_n,[tn an rn dn], [0 0 0 a3+d3]);
% H0_3 = H0_1*H1_2*H2_3



 