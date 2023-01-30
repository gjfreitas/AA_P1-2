clear all
close all
clc


P = 0.75;


Size =[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]; %K =0.125; %P =0.75;
Op_Exaustive1 =[20, 30, 42, 56, 24, 27, 30, 33, 36, 39, 42, 45, 32, 34, 36, 38, 180, 189, 198, 207, 48, 50, 52, 216, 224, 232, 240];
Op_Heuristic1 =[0, 0, 0, 0, 64, 81, 100, 121, 144, 169, 196, 225, 32, 34, 36, 38, 180, 189, 198, 207, 48, 50, 52, 216, 224, 232, 240];
Times_Exaustive1 =[0.000147800000377174, 0.00017609999940759735, 0.00022879999960423447, 0.00018350000027567148, 0.0001762000001690467, 0.00017599999955564272, 0.0001548000000184402, 0.00018739999995887047, 0.00022819999958301196, 0.00017039999966073083, 0.00019800000063696643, 0.00019499999962135917, 0.0002119999999194988, 0.00022220000028028153, 0.0002154000003429246, 0.00018970000019180588, 0.0007851000000300701, 0.00044629999956669053, 0.0005008999996789498, 0.00046779999956925167, 0.00042810000013560057, 0.0005492999998750747, 0.0004988000000594184, 0.0008120000002236338, 0.0007713999993939069, 0.000738900000214926, 0.0009002999995573191];
Times_Heuristic1 =[0.0001523000000815955, 0.00011850000009872019, 0.00013530000069295056, 0.00012900000001536682, 0.0002142000003004796, 0.0002547000003687572, 0.0003160999995088787, 0.000457500000266009, 0.0005478000002767658, 0.0011643999996522325, 0.0013035000001764274, 0.0030755000007047784, 0.00020109999968553893, 0.00017269999989366625, 0.00024980000034702243, 0.00018149999959859997, 0.0005182000004424481, 0.0005183000002944027, 0.000452199999926961, 0.0004992000003767316, 0.00048179999976127874, 0.00035990000014862744, 0.00034049999976559775, 0.0005098000001453329, 0.0006045000000085565, 0.0006032999999661115, 0.0005965999998807092];
N_Solutions_Exaustive1 =[0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Solutions_Heuristic1 =[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Configurations_Exaustive1 =[5, 6, 7, 8, 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 9, 9, 9, 9, 2, 2, 2, 8, 8, 8, 8];
N_Configurations_Heuristic1 =[0, 0, 0, 0, 8, 9, 10, 11, 12, 13, 14, 15, 2, 2, 2, 2, 9, 9, 9, 9, 2, 2, 2, 8, 8, 8, 8];

%Size =[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]; %K =0.25; %P =0.75;
Op_Exaustive2 =[12, 15, 18, 21, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
Op_Heuristic2 =[16, 25, 36, 49, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
Times_Exaustive2 =[0.00016330000016751, 0.00015559999974357197, 0.0001756999999997788, 0.00022119999994174577, 0.00014830000054644188, 0.0001472000003559515, 0.00017870000010589138, 0.0001570999993418809, 0.00020850000055361306, 0.00018850000014936086, 0.00017500000012660166, 0.00018309999995835824, 0.0005265999998300686, 0.00048010000045906054, 0.0004896000000371714, 0.0006462000001192791, 0.0023213999993458856, 0.00252719999934925, 0.003925299999536946, 0.0037251000003379886, 0.018281699999533885, 0.023447000000487606, 0.03593689999979688, 0.040331700000024284, 0.16832020000038028, 0.22765100000015082, 0.2882332999997743];
Times_Heuristic2 =[0.00017780000052880496, 0.00016449999930046033, 0.00016790000063338084, 0.00018939999972644728, 0.00016430000050604576, 0.0001505999998698826, 0.00014770000052521937, 0.000161899999511661, 0.00019870000051014358, 0.00017240000033780234, 0.0001691999996182858, 0.00017909999951370992, 0.0003772999998545856, 0.0004596999997374951, 0.00037909999991825316, 0.0008619999998700223, 0.0014873000000079628, 0.0021529999994527316, 0.00236620000032417, 0.0033968999996432103, 0.013460099999974773, 0.016637400000035996, 0.021578799999588227, 0.02758220000032452, 0.12428129999989324, 0.16030599999976403, 0.21088359999976092];
N_Solutions_Exaustive2 =[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Solutions_Heuristic2 =[0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Configurations_Exaustive2 =[3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Configurations_Heuristic2 =[4, 5, 6, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

%Size =[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]; %K =0.5; %P =0.75;
Op_Exaustive3 =[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
Op_Heuristic3 =[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
Times_Exaustive3 =[0.0001548000000184402, 0.0002715999999054475, 0.00018120000004273606, 0.0001961999996638042, 0.0001765000006344053, 0.00020820000008825446, 0.00022939999962545699, 0.0003037999995285645, 0.0005264000001261593, 0.0005246999999144464, 0.0010240999999950873, 0.001598099999682745, 0.0031423000000359025, 0.005555400000048394, 0.011310599999887927, 0.019745200000215846, 0.046311099999911676, 0.08209369999985938, 0.1901489000001675, 0.3426783000004434, 0.7599669000001086, 1.3479738000005455, 3.013922199999797, 5.392178299999614, 12.13118410000061, 22.05071229999976, 49.03161279999949];
Times_Heuristic3 =[0.0001446999995096121, 0.00024620000021968735, 0.00020489999951678328, 0.00022939999962545699, 0.00018590000036056153, 0.00023849999979574932, 0.00025319999986095354, 0.0003372999999555759, 0.0005169999994905083, 0.0006272000000535627, 0.0011827999996967264, 0.001638499999899068, 0.0038676000003761146, 0.00568089999978838, 0.011973499999839987, 0.020523299999695155, 0.04866039999978966, 0.08574660000067524, 0.21297750000030646, 0.3623195999998643, 0.8547539000001052, 1.5041271000000052, 3.4437589999997726, 6.034378199999992, 14.201556799999707, 25.09505050000007, 58.100522400000045];
N_Solutions_Exaustive3 =[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Solutions_Heuristic3 =[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Configurations_Exaustive3 =[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
N_Configurations_Heuristic3 =[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];

%Size =[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]; %K =0.75; %P =0.75;
Op_Exaustive4 =[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
Op_Heuristic4 =[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30];
Times_Exaustive4 =[0.00013180000041757012, 0.00014319999991130317, 0.00015499999972234946, 0.00014869999995426042, 0.00018929999987449264, 0.0001678000007814262, 0.00021549999928538455, 0.000311100000544684, 0.0003650999997262261, 0.0009976999999707914, 0.0010528000002523186, 0.001898800000162737, 0.0036718999999720836, 0.007726600000751205, 0.014763199999833887, 0.029258100000333798, 0.06401869999990595, 0.11697309999999561, 0.23472289999972418, 0.4675262999999177, 0.936580700000377, 1.8495138999996925, 3.766125000000102, 7.448823099999572, 14.892531299999973, 30.374207099999694, 60.64846350000062];
Times_Heuristic4 =[0.00015040000016597332, 0.00015309999980672728, 0.00016119999963848386, 0.00014819999978499254, 0.00017329999991488876, 0.00017209999987244373, 0.00022820000049250666, 0.00032249999912892235, 0.00040950000038719736, 0.0011004999996657716, 0.0016318999996656203, 0.0032228000000031898, 0.0049307999997836305, 0.009888700000374229, 0.019571499999983644, 0.04000089999954071, 0.0790872000006857, 0.15984060000027966, 0.32848550000016985, 0.6349046000004819, 1.3169090999999753, 2.7276216999998724, 5.398824399999285, 10.903103900000133, 22.291397799999686, 45.24095980000038, 92.00756749999982];
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


