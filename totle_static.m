%%上速度 距離
%將魚缸四點排序 b(2,:)左上 b(1,:)左下 c(2,:)右上 c(1,1) 右下
up_distance = 0;
up_speed = [];
up_mean_speed = 0;
up_max_1_persent_speed = 0;

%%和速度小於0.5cm
splitdata(:,9) = 0;
faster_speed_time = 0;


center_edge = [mean(figurex(1:4)),mean(figurey(1:4))];
base_vector = right_point - center_edge;
vertical_vector = top_point - center_edge;

vertical_vector_dot_center_edge = vertical_vector(1)*base_vector(1)+vertical_vector(2)*base_vector(2);
vertical_vector_cross_center_edge = vertical_vector(1)*base_vector(2)-vertical_vector(2)*base_vector(1);
vertical_angle = atan2(vertical_vector_cross_center_edge,vertical_vector_dot_center_edge);


parfor i = 1:length(splitdata)

  %%逆時針為正
  test_point = [splitdata(i,3),splitdata(i,4)];
  test_vector = test_point - center_edge;
  
  [angle_ab,Quadrant] = posistioninQuadrant(test_vector,base_vector,vertical_angle);
  
  splitdata(i,7) = angle_ab;
  splitdata(i,8) = Quadrant;
  
  if (i > 1) && ( Quadrant == 2 || Quadrant == 1 ) && ( splitdata(i-1,8) == 2 || splitdata(i-1,8) == 1)
    
  up_distance = norm(splitdata(i,3:4)-splitdata(i-1,3:4)) + up_distance;
  
  up_speed = [up_speed ; splitdata(i,6)];
  
  end
  if (i > 1) && (splitdata(i,6) < 0.5) && (splitdata(i-1,6) < 0.5)
    
    splitdata(i,9) = 1; 
    faster_speed_time = (splitdata(i,1) - splitdata(i-1,1)) + faster_speed_time; 
    

  elseif i == 1
    
    splitdata((splitdata(i,6) < 0.5) , 9) = 1;
  
  end  
end
if ~isempty(up_speed)
  
  up_mean_speed = mean(up_speed);
  up_max_1_persent_speed = mean(sort(up_speed,'descend')(1:round(length(up_speed)/100)));
end
%% 準備存檔檔案
static_data = [up_distance,up_mean_speed,up_max_1_persent_speed,faster_speed_time];
cell_static_data = num2cell(static_data);
title = {'up_distance','up_mean_speed','up_max_1_persent_speed','speed_slower_tnan_half_cm_per_sec'};
cell_static_data = [title ; cell_static_data];
