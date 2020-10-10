%%上速度 距離
%將魚缸四點排序 b(2,:)左上 b(1,:)左下 c(2,:)右上 c(1,1) 右下
for i = 1:length(totledata)

  %%逆時針為正
  test_point = [totledata(i,3),totledata(i,4)];
  center_edge = [mean(figurex(1:4)),mean(figurey(1:4))];
  base_vector = right_point - center_edge;
 
  test_vector = test_point - center_edge;
  
  [angle_ab,Quadrant] = posistioninQuadrant(test_vector,base_vector);
  
  totledata(i,7) = angle_ab;
  totledata(i,8) = Quadrant;
  
end
%%速度大於0.5cm


%%time split_long_rows





