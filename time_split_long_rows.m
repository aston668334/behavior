%%time_split_long_rows
now_frame = 1;
new_frame = 1;
%% time to split
delta_time = 30;
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
%%totle time

%%time_split_long_rows
now_frame = 1;
new_frame = length(totledata);

splitdata = totledata(now_frame:new_frame,:);
now_time = totledata(now_frame,1);
new_time = totledata(new_frame,1);
plotfig1
totle_static
edge1


close all