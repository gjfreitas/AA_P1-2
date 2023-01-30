clear all
close all
clc


P = 0.50;

Size =[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]; %K =0.125; %P =0.5;
Op_Exaustive1 =[20, 30, 42, 56, 512, 729, 1000, 1331, 1728, 2197, 2744, 3375, 592, 663, 738, 817, 900, 987, 1078, 1173, 624, 675, 728, 783, 840, 899, 960];
Op_Heuristic1 =[0, 0, 0, 0, 64, 81, 100, 121, 144, 169, 196, 225, 3600, 4352, 5202, 6156, 7220, 8400, 9702, 11132, 624, 675, 728, 783, 840, 899, 960];
Times_Exaustive1 =[0.00022919999992154771, 0.0001793000001271139, 0.00020089999998162966, 0.00020349999977042899, 0.000890600000275299, 0.0008092999996733852, 0.0011124000002382672, 0.0012981999998373794, 0.0016998999999486841, 0.0025561000002198853, 0.003291500000159431, 0.004185799999504525, 0.0007218000000648317, 0.001067000000148255, 0.0007174000002123648, 0.0008565000007365597, 0.0008473000007143128, 0.0012326000005487003, 0.001092699999389879, 0.0011823999993794132, 0.0010531999996601371, 0.0008280000001832377, 0.0015401000000565546, 0.0009991000006266404, 0.0022427000003517605, 0.00192590000006021, 0.0020571999993990175];
Times_Heuristic1 =[0.00017519999983051093, 0.00014140000075713033, 0.00013449999914882937, 0.00015770000027259812, 0.00020909999966534087, 0.0003071999999519903, 0.00044410000009520445, 0.000393899999835412, 0.0009618000003683846, 0.001197399999909976, 0.0016063000002759509, 0.002601800000775256, 0.007274999999935972, 0.012885199999800534, 0.022884899999553454, 0.042945899999722315, 0.083625000000211, 0.16532900000038353, 0.32195409999985714, 0.6587073000000601, 0.0007414000001517707, 0.001419200000782439, 0.0010669000002963003, 0.001051999999617692, 0.0012389000003167894, 0.001943799999935436, 0.0020803999996132916];
N_Solutions_Exaustive1 =[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Solutions_Heuristic1 =[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1];
N_Configurations_Exaustive1 =[5, 6, 7, 8, 64, 81, 100, 121, 144, 169, 196, 225, 37, 39, 41, 43, 45, 47, 49, 51, 26, 27, 28, 29, 30, 31, 32];
N_Configurations_Heuristic1 =[0, 0, 0, 0, 8, 9, 10, 11, 12, 13, 14, 15, 225, 256, 289, 324, 361, 400, 441, 484, 26, 27, 28, 29, 30, 31, 32];

%Size =[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]; %K =0.25; %P =0.5;
Op_Exaustive2 =[64, 125, 216, 343, 16, 2592, 350, 297, 36, 39, 42, 45, 32, 34, 72, 76, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
Op_Heuristic2 =[16, 25, 36, 49, 16, 576, 810, 1100, 36, 39, 42, 45, 32, 34, 72, 76, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
Times_Exaustive2 =[0.00020510000013018725, 0.0002809999996316037, 0.0005145000004631584, 0.0004211000004943344, 0.0001750999999785563, 0.0021977999995215214, 0.0004549999994196696, 0.0006427999996958533, 0.0002508000006855582, 0.0002319999994142563, 0.00026959999922837596, 0.00026499999967199983, 0.00038749999930587364, 0.0005338999999366933, 0.0007765999998810003, 0.0005728999994971673, 0.002063799999632465, 0.002484100000401668, 0.0031855000006544287, 0.0042492000002312125, 0.01852560000043013, 0.024449799999274546, 0.0314674000001105, 0.04030889999921783, 0.17201469999963592, 0.22748810000030062, 0.2890028000001621];
Times_Heuristic2 =[0.0001813000008041854, 0.00019099999917671084, 0.0002417999994577258, 0.00021519999972952064, 0.00020140000015089754, 0.0005830000000059954, 0.0011508000006870134, 0.0019277999999758322, 0.0001967999996850267, 0.00019799999972747173, 0.00020940000013069948, 0.0002355999995415914, 0.0003318999997645733, 0.00045569999929284677, 0.0007199000001492095, 0.0004890000000159489, 0.0018181999994340003, 0.00405620000037743, 0.003191700000570563, 0.0029524000001401873, 0.013529799999560055, 0.016987999999400927, 0.02107620000060706, 0.026628100000380073, 0.12723839999944175, 0.15597319999960746, 0.20963749999918946];
N_Solutions_Exaustive2 =[0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Solutions_Heuristic2 =[0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Configurations_Exaustive2 =[16, 25, 36, 49, 2, 288, 35, 27, 3, 3, 3, 3, 2, 2, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Configurations_Heuristic2 =[4, 5, 6, 7, 2, 64, 81, 100, 3, 3, 3, 3, 2, 2, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

%Size =[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]; %K =0.5; %P =0.5;
Op_Exaustive3 =[4, 10, 6, 7, 8, 18, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
Op_Heuristic3 =[4, 10, 6, 7, 8, 18, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
Times_Exaustive3 =[0.00017190000016853446, 0.00016570000025240006, 0.00014600000031350646, 0.00018710000040300656, 0.00016460000006190967, 0.00017440000010537915, 0.0002206999997724779, 0.00022769999941374408, 0.0003612000000430271, 0.0004727000005004811, 0.0016731999994590296, 0.0021387000006143353, 0.0038494999998874846, 0.005191899999772431, 0.010755900000731344, 0.02118590000009135, 0.04869539999981498, 0.08533350000016071, 0.18894509999972797, 0.35049119999985123, 0.7782207000000199, 1.4044021999998222, 3.060649299999568, 5.38907029999973, 12.200879600000007, 22.011252799999966, 48.81470669999999];
Times_Heuristic3 =[0.00015829999938432593, 0.00015170000006037299, 0.0001461000001654611, 0.0001681000003372901, 0.00015350000012404053, 0.0001947999999174499, 0.0001806999998734682, 0.00033960000018851133, 0.00038219999987632036, 0.0003987000000051921, 0.0020046999998157844, 0.0022263000000748434, 0.0043997999991916, 0.005856599999788159, 0.012437800000043353, 0.02012890000059997, 0.05164929999955348, 0.09115180000026157, 0.2209775000001173, 0.37581950000003417, 0.8668933999997535, 1.543794500000331, 3.5154249999995955, 6.072140299999774, 14.366553799999565, 25.162702100000388, 58.415610000000015];
N_Solutions_Exaustive3 =[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Solutions_Heuristic3 =[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Configurations_Exaustive3 =[1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Configurations_Heuristic3 =[1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

%Size =[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]; %K =0.75; %P =0.5;
Op_Exaustive4 =[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
Op_Heuristic4 =[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
Times_Exaustive4 =[0.0002581999997346429, 0.00022259999968810007, 0.0002248999999210355, 0.0002795000000332948, 0.00021160000051168026, 0.00023440000040864106, 0.000388800000109768, 0.00038250000034167897, 0.0005883000003450434, 0.0009307000000262633, 0.0019228999999540974, 0.0020387000004120637, 0.004580799999530427, 0.008020799999940209, 0.015292099999896891, 0.028926099999807775, 0.05630139999993844, 0.11538010000003851, 0.2302772000002733, 0.45144259999960923, 0.9324861000004603, 1.8679366000005757, 3.7111629000000903, 7.6405577000005, 14.965902400000232, 30.097060399999464, 60.51331499999924];
Times_Heuristic4 =[0.0002944999996543629, 0.00023599999985890463, 0.0002123000003848574, 0.0002590000003692694, 0.0002444000001560198, 0.00028330000077403383, 0.00037060000067867804, 0.0004032000006191083, 0.0005621000000246568, 0.0010076999997181701, 0.00151099999948201, 0.002711799999815412, 0.0053144000003158, 0.010095199999341276, 0.020821000000069034, 0.03918100000009872, 0.07675780000045052, 0.15789010000025883, 0.3186753999998473, 0.6525665999997727, 1.3383825000000797, 2.660283399999571, 5.3429863000001205, 10.975812499999847, 22.684533999999985, 45.364810600000055, 92.40478080000048];
N_Solutions_Exaustive4 =[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Solutions_Heuristic4 =[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Configurations_Exaustive4 =[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Configurations_Heuristic4 =[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
%subplot(1,2,2)
hold on
plot(Size,log(Times_Exaustive1),'b.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(Times_Exaustive2),'r.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(Times_Heuristic1),'k.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(Times_Heuristic2),'m.-','LineWidth',1,'MarkerSize',10)
ylabel('Log(Time)')
xlabel('Nº vertices (V)')
legend('Exaustive K = 0.125','Exaustive K = 0.25','Heuristic K = 0.125','Heuristic K = 0.25','Location','northwest')
title(['P = ',num2str(P)])
axis([4 25 -10 6])
drawnow


figure(2)
%subplot(1,2,1)
hold on
plot(Size,log(Times_Exaustive3),'b.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(Times_Exaustive4),'r.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(Times_Heuristic3),'k.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(Times_Heuristic4),'m.-','LineWidth',1,'MarkerSize',10)
ylabel('Log(Time)')
xlabel('Nº vertices (V)')
legend('Exaustive K = 0.50','Exaustive K = 0.75','Heuristic K = 0.50','Heuristic K = 0.75','Location','northwest')
title(['P = ',num2str(P)])
axis([4 25 -10 6])
drawnow


figure(3)
%subplot(1,2,1)
hold on
plot(Size,log(Op_Exaustive1),'b.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(Op_Exaustive2),'r.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(Op_Heuristic1),'k.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(Op_Heuristic2),'m.-','LineWidth',1,'MarkerSize',10)
ylabel('log(Operações)')
xlabel('Nº vertices (V)')
legend('Exaustive K = 0.125','Exaustive K = 0.25','Heuristic K = 0.125','Heuristic K = 0.25','Location','northwest')
title(['P = ',num2str(P)])
axis([4 25 2 20])
drawnow

figure(4)
%subplot(1,2,2)
hold on
plot(Size,log(Op_Exaustive3),'b.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(Op_Exaustive4),'r.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(Op_Heuristic3),'k.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(Op_Heuristic4),'m.-','LineWidth',1,'MarkerSize',10)
ylabel('log(Operações)')
xlabel('Nº vertices (V)')
legend('Exaustive K = 0.50','Exaustive K = 0.75','Heuristic K = 0.50','Heuristic K = 0.75','Location','northwest')
title(['P = ',num2str(P)])
axis([4 25 0 18])
drawnow

figure(5)
%subplot(1,2,2)
hold on
plot(Size,log(N_Configurations_Exaustive1),'b.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(N_Configurations_Exaustive2),'r.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(N_Configurations_Heuristic1),'k.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(N_Configurations_Heuristic2),'m.-','LineWidth',1,'MarkerSize',10)
ylabel('log(Configurações)')
xlabel('Nº vertices (V)')
legend('Exaustive K = 0.125','Exaustive K = 0.25','Heuristic K = 0.125','Heuristic K = 0.25','Location','northwest')
title(['P = ',num2str(P)])
axis([4 25 0 18])
drawnow

figure(6)
%subplot(1,2,2)
hold on
plot(Size,log(N_Configurations_Exaustive3),'b.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(N_Configurations_Exaustive4),'r.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(N_Configurations_Heuristic3),'k.-','LineWidth',1,'MarkerSize',10)
plot(Size,log(N_Configurations_Heuristic4),'m.-','LineWidth',1,'MarkerSize',10)
ylabel('log(Configurações)')
xlabel('Nº vertices (V)')
legend('Exaustive K = 0.50','Exaustive K = 0.75','Heuristic K = 0.50','Heuristic K = 0.75','Location','northwest')
title(['P = ',num2str(P)])
axis([4 25 0 18])
drawnow


