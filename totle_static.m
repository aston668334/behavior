%%上速度 距離
%將魚缸四點排序 b(2,:)左上 b(1,:)左下 c(2,:)右上 c(1,1) 右下
up_distance = 0;
up_speed = [];
up_mean_speed = 0;
up_max_1_persent_speed = 0;

%%和速度大於0.5cm
totledata(:,9) = 0;
faster_speed_time = 0;

for i = 1:length(totledata)

  %%逆時針為正
  test_point = [totledata(i,3),totledata(i,4)];
  center_edge = [mean(figurex(1:4)),mean(figurey(1:4))];
  base_vector = right_point - center_edge;
 
  test_vector = test_point - center_edge;
  
  [angle_ab,Quadrant] = posistioninQuadrant(test_vector,base_vector);
  
  totledata(i,7) = angle_ab;
  totledata(i,8) = Quadrant;
  
  if (i > 1) && ( Quadrant == 2 || Quadrant == 1 ) && ( totledata(i-1,8) == 2 || totledata(i-1,8) == 1)
    
  up_distance = norm(totledata(i,3:4)-totledata(i-1,3:4)) + up_distance;
  
  up_speed = [up_speed ; totledata(i,6)];
  
  end
  if (i > 1) && (totledata(i,6) > 0.5) && (totledata(i-1,6) > 0.5)
    
    totledata(i,9) = 1; 
    faster_speed_time = (totledata(i,1) - totledata(i-1,1)) + faster_speed_time; 
    

  elseif i == 1
    
    totledata((totledata(i,6) > 0.5) , 9) = 1;
  
  end  
end
if ~isempty(up_speed)
  
  up_mean_speed = mean(up_speed);
  up_max_1_persent_speed = mean(sort(up_speed,'descend')(1:round(length(up_speed)/100)));
end
%% 準備存檔檔案
static_data = [up_distance,up_mean_speed,up_max_1_persent_speed,faster_speed_time];
cell_static_data = num2cell(static_data);
title = {'up_distance','up_mean_speed','up_max_1_persent_speed','speed_faster_tnan_half_cm_per_sec'};
cell_static_data = [title ; cell_static_data];
