function dis = distance(point1,point2)
%DISTANCE 计算两点距离
%point(1)为x坐标，point(2)为y坐标
dis = ((point1(1)-point2(1))^2 + (point1(2)-point2(2))^2)^0.5;
end

