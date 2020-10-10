%%time_split_long_rows

now_frame = 1;
delta_time = 120;
new_frame = 1;

while true

now_frame = new_frame;  

[~,new_frame] =  min(abs((totledata(now_frame,1) + delta_time)-totledata(:,1)));

splitdata = totledata(now_frame:new_frame,:);

now_time = totledata(now_frame,1);
new_time = totledata(new_frame,1);


  if  now_time == new_time
    
    break

  end
  
  
plotfig1
totle_static
edge1


close all
end