%% 畫圖
totledatare = totledata;
totledatare = [totledatare; 1:6 ];
totledatare(end,:)=NaN;
createfigure( totledatare(:,1),totledatare(:,4),totledatare(:,3),  totledatare(:,6))

%% 準備存檔檔案
[m,n]=size(totledata);
celltotledata=num2cell(totledata);
title={'Time(s)','Track','Pos.X(cm)','Pos.Y(cm)','Label','Current Speed (cm/s)'};
celltotledata=[title ; celltotledata];

%% 
clear fileType i lastframe posistionxy  sheets speedframe firstframe j number rawData speed text totleframe m n title m2 m3 n2 n3