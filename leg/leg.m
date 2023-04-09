clc,clear;
%��ʼ����r1,l1,a,b,theta3,l2
param=[12,16,27,55.84,2.58,45];
%��ʼ�����Ĵ���ֵ
cost(param);
%  Set options for fminunc
options = optimset('GradObj', 'off', 'MaxIter', 400);
%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[param, J] = ...
	fminunc(@(t)(cost(t)), param, options);
draw(param);
