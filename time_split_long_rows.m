%%time_split_long_rows

now_time = 1;
delta_time = 120;

while true
  
[~,new_time] =  min(abs((totledata(now_time,1) + delta_time)-totledata(:,1)));

split_data = totledata(now_time:new_time,:);

plotfig1
totle_static
edge1

end