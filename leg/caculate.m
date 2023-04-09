function [x6,y6] = caculate(theta1,Param)
%�ṹ�ߴ����
h=24;
px=8;
r1=Param(1);
l1=Param(2);
a =Param(3);
b =Param(4);
c=80;
theta3=Param(5);
l2=Param(6);
%�Ƕȷֱ���rad
resolution = 0.001;
%�����������
dis_err = 1;

x1 = r1*cos(theta1);
y1 = r1*sin(theta1);

%fprintf('��һ���ؽ� (%f,%f)\n',x1,y1);

right_flag=0;
left_flag =0;
for theta2=0:resolution:2*pi
    x2 = x1 + l1*cos(theta2);
    y2 = y1 + l1*sin(theta2);
    %���ұߵ�2��λ��
    %if��������Ҫ���һ�û���ҵ��ұߵ�
    if (abs(distance([x2,y2],[px,-h])-a)<dis_err)&&(right_flag==0)
        %Ҫת�������½ǵ�֧������ϵ
%        fprintf('���ұߵ�����ѡ�� (%f,%f)������%f\n',x2,y2,distance([x2,y2],[px,-h]));
        x2_r = x2-px;
        y2_r = h+y2;
        theta4 = atan2(y2_r,x2_r);
%        fprintf('theta %f\n',theta4);
        if theta4<1.9
            right_flag=1;
            %����Ҫ��������
        end
    end
    %����ߵ�2��λ��
%    fprintf('theta2 %f,��2�Źؽ�(%f %f)����ߵ������� %f\n',theta2,x2,y2,abs(distance([x2,y2],[-px,-h])-a));
    if (abs(distance([x2,y2],[-px,-h])-a)<dis_err)&&(left_flag==0)
        %Ҫת�������½ǵ�֧������ϵ
%        fprintf('����ߵ�����ѡ�� (%f,%f)������%f\n',x2,y2,distance([x2,y2],[-px,-h]));
        x2_l = x2+px;
        y2_l = h+y2;
        theta4_l = atan2(y2_l,x2_l);
%        fprintf('theta %f\n',theta4_l);
        if theta4_l>1.3
            left_flag=1;
            %����Ҫ��������
        end
    end
end

%fprintf('2�ؽ��� (%f,%f)\n',x2_l,y2_l);
%fprintf('2�ؽ��� (%f,%f)\n',x2_r,y2_r);

theta5   = theta4   - theta3;
theta5_l = theta4_l + theta3;
x3 = b*cos(theta5);
y3 = b*sin(theta5);
x3_l = b*cos(theta5_l);
y3_l = b*sin(theta5_l);

%fprintf('3�ؽ��� (%f,%f)\n',x3_l,y3_l);
%fprintf('3�ؽ��� (%f,%f)\n',x3,y3);

%�������������ϵ�һ������ϵ���棬��ȡ������֧���е�����
x_l=x3_l-px;
y_l=y3_l;
x_r=x3+px;
y_r=y3;
%�����һ���������
x_mid=(x_l+x_r)/2;
y_mid=(y_l+y_r)/2;
theta6 = atan2(y_r-y_l,x_r-x_l) - pi/2;
length=(l2^2-(distance([x_l,y_l],[x_r,y_r])/2)^2)^0.5;
x6=x_mid+length*cos(theta6);
y6=y_mid+length*sin(theta6);
%fprintf('ĩ�˹ؽ� (%f,%f)\n',x6,y6);

end