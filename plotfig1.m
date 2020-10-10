%% µe¹Ï
splitdatare = splitdata;
splitdatare = [splitdatare; 1:6 ];
splitdatare(end,:)=NaN;
createfigure( splitdatare(:,1),splitdatare(:,4),splitdatare(:,3),splitdatare(:,6))

%% 
clear fileType i lastframe posistionxy  sheets speedframe firstframe j number rawData speed text m n title m2 m3 n2 n3 splitdatare