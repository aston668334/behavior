%%�W�t�� �Z��
%�N�����|�I�Ƨ� b(2,:)���W b(1,:)���U c(2,:)�k�W c(1,1) �k�U
for i = 1:length(totledata)

  %%�f�ɰw����
  test_point = [totledata(i,3),totledata(i,4)];
  center_edge = [mean(figurex(1:4)),mean(figurey(1:4))];
  base_vector = right_point - center_edge;
 
  test_vector = test_point - center_edge;
  
  [angle_ab,Quadrant] = posistioninQuadrant(test_vector,base_vector);
  
  totledata(i,7) = angle_ab;
  totledata(i,8) = Quadrant;
  
end
%%�t�פj��0.5cm


%%time split_long_rows





