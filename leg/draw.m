function OK = draw(param)
%Draw ��������
resolution=0.01; %�����Ƕȷֱ���
m=ceil(2*pi/resolution);
x=zeros(m,1);
y=zeros(m,1);
%�õ�ĩ�������ϸ����������
for i=1:m
    %fprintf('%d\n',i);
    [x(i),y(i)]=caculate(i*2*pi/m,param);
end
%��������
plot(x,y);
OK=1;
end

