function [angle_ab,Quadrant] = posistioninQuadrant(test_vector,base_vector,vertical_angle)
  
  %%°f®É°w¬°¥¿

  
  test_vector_dot_center_edge = test_vector(1)*base_vector(1)+test_vector(2)*base_vector(2);
  test_vector_cross_center_edge = test_vector(1)*base_vector(2)-test_vector(2)*base_vector(1);
  angle_ab = atan2(test_vector_cross_center_edge,test_vector_dot_center_edge);

  if     0 <= angle_ab && angle_ab < vertical_angle
    
    Quadrant = 1;
    
  elseif vertical_angle <= angle_ab && angle_ab < pi
    
    Quadrant = 2;
    
  elseif 0 > angle_ab && angle_ab >= -vertical_angle
    
    Quadrant = 4;
    
  elseif -vertical_angle > angle_ab || angle_ab == pi
       
    Quadrant = 3;
    
  end
  
  
endfunction