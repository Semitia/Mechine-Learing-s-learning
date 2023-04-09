function J = cost(param)
%COST 计算某组参数的代价值
fprintf('one loop\n');
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
%plot(x,y);
%评判曲线
[mmx,~]=max(y);
[mmn,~]=min(y);
%mmx和mmn都是1x629的向量
mx=mmx(1);
mn=mmn(1);
dh=mx-mn;
stride_range=3;
stride_l=0;
stride_r=0;
for i=1:m
    if (y(i)<(mn+stride_range)) && (y(i)>(mn-stride_range))
        stride_l=min(stride_l,x(i));
        stride_r=max(stride_r,x(i));
    end
end
J=100/dh + 100/(stride_r-stride_l);

end

