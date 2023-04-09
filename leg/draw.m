function OK = draw(param)
%Draw 绘制曲线
resolution=0.01; %曲柄角度分辨率
m=ceil(2*pi/resolution);
x=zeros(m,1);
y=zeros(m,1);
%得到末端曲线上各个点的坐标
for i=1:m
    %fprintf('%d\n',i);
    [x(i),y(i)]=caculate(i*2*pi/m,param);
end
%绘制曲线
plot(x,y);
OK=1;
end

