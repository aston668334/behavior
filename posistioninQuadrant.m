function [angle_ab,Quadrant] = posistioninQuadrant(test_vector,base_vector)
  
  %%°f®É°w¬°¥¿

  
  test_vector_dot_center_edge = test_vector(1)*base_vector(1)+test_vector(2)*base_vector(2);
  test_vector_cross_center_edge = test_vector(1)*base_vector(2)-test_vector(2)*base_vector(1);
  angle_ab = atan2(test_vector_cross_center_edge,test_vector_dot_center_edge);

  if     0 <= angle_ab && angle_ab < pi/2
    
    Quadrant = 1;
    
  elseif pi/2 <= angle_ab && angle_ab < pi
    
    Quadrant = 2;
    
  elseif 0 > angle_ab && angle_ab >= -pi/2
    
    Quadrant = 4;
    
  elseif -pi/2 > angle_ab || angle_ab == pi
       
    Quadrant = 3;
    
  end
  
  
endfunction