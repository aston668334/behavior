%%�W�t�� �Z��
%�N�����|�I�Ƨ� b(2,:)���W b(1,:)���U c(2,:)�k�W c(1,1) �k�U
up_distance = 0;
up_speed = [];
up_mean_speed = 0;
up_max_1_persent_speed = 0;

%%�M�t�פj��0.5cm
splitdata(:,9) = 0;
faster_speed_time = 0;

for i = 1:length(splitdata)

  %%�f�ɰw����
  test_point = [splitdata(i,3),splitdata(i,4)];
  center_edge = [mean(figurex(1:4)),mean(figurey(1:4))];
  base_vector = right_point - center_edge;
 
  test_vector = test_point - center_edge;
  
  [angle_ab,Quadrant] = posistioninQuadrant(test_vector,base_vector);
  
  splitdata(i,7) = angle_ab;
  splitdata(i,8) = Quadrant;
  
  if (i > 1) && ( Quadrant == 2 || Quadrant == 1 ) && ( splitdata(i-1,8) == 2 || splitdata(i-1,8) == 1)
    
  up_distance = norm(splitdata(i,3:4)-splitdata(i-1,3:4)) + up_distance;
  
  up_speed = [up_speed ; splitdata(i,6)];
  
  end
  if (i > 1) && (splitdata(i,6) > 0.5) && (splitdata(i-1,6) > 0.5)
    
    splitdata(i,9) = 1; 
    faster_speed_time = (splitdata(i,1) - splitdata(i-1,1)) + faster_speed_time; 
    

  elseif i == 1
    
    splitdata((splitdata(i,6) > 0.5) , 9) = 1;
  
  end  
end
if ~isempty(up_speed)
  
  up_mean_speed = mean(up_speed);
  up_max_1_persent_speed = mean(sort(up_speed,'descend')(1:round(length(up_speed)/100)));
end
%% �ǳƦs���ɮ�
static_data = [up_distance,up_mean_speed,up_max_1_persent_speed,faster_speed_time];
cell_static_data = num2cell(static_data);
title = {'up_distance','up_mean_speed','up_max_1_persent_speed','speed_faster_tnan_half_cm_per_sec'};
cell_static_data = [title ; cell_static_data];
