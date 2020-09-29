function pixel_to_cm = calobration(x,y)

  %%魚缸大小(單位cm)
  
  weight = 20
  height = 15.5
  
  
  %%將魚缸四點排序 b(2,:)左上 b(1,:)左下 c(2,:)右上 c(1,:) 右下
  totledatare(end,4)=NaN;
  [a,~]=sortrows([x,y],1);
  [b,~]=sortrows(a(1:2,:),2);
  [c,~]=sortrows(a(3:4,:),2);
  %%figurex 左上 右上 右下 左下
  figurex=([b(2,1);c(2,1);c(1,1);b(1,1);b(2,1)]);
  figurey=([b(2,2);c(2,2);c(1,2);b(1,2);b(2,2)]);
  
  weight_in_pixel = (abs(figurex(2)-figurex(1))+abs(figurex(3)-figurex(4)))/2
  height_in_pixel = (abs(figurey(2)-figurey(4))+abs(figurey(2)-figurey(3)))/2
  
  weight_pixel_to_cm = weight / weight_in_pixel
  height_pixel_to_cm = height / height_in_pixel
  
  pixel_to_cm = ( weight_pixel_to_cm + height_pixel_to_cm ) / 2
  
  %和raw data 進行相同處理
  %%figurex=figurex-minx; %xposistion
  %%figurey=abs(figurey-maxy); %yposistion
  
  
  
  end