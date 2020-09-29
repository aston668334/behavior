%% 讀資料
pkg load io

delete('temp.xlsx')
%%讀檔
[filename ,filepath]=uigetfile('*.xlsx','please choose the excel file');
[ ~, ~, rawData,~ ] = xlsread(([filepath filename]),2); 
%%取有效偵數
[m,n]=find(strcmp(rawData,{'Visible Frames'}));
totleframe=cell2mat(rawData(m,n+1));
%%取檔案的座標資料
[m2,n2]=find(strcmp(rawData,{'POSITIONS'}));
posistionxy = cell2mat(rawData(m2+3:totleframe+m2+2,n2:n2+4));
%%取檔案的速度資料
[m3,n3]=find(strcmp(rawData,{'INSTANT SPEED'}));
speed= cell2mat(rawData(m3+3:totleframe+m3+2,n3:n3+2));
%% 計算第一個(座標和速度時間一樣)共同偵
firstframe=1;
for i=1:totleframe
  if (posistionxy(i,1)==speed(1,1))
      firstframe=i;
      break
  end
end
%% 計算最後一個(座標和速度時間一樣)共同偵
lastframe=1;
for i=1:totleframe
  if (posistionxy(i,1)==speed(size(speed,1)-1,1))
      lastframe=i;
      break
  end
end
%% 合併速度和位置
totledata=[posistionxy(firstframe:lastframe,:) speed(1:size(speed,1)-1,3)]; 
%% 畫圖
totledata=[totledata ; [1:6]];
totledata(end,:) = NaN;
minx=min(totledata(:,3));
maxy=max(totledata(:,4));

totledatare(:,3)=totledata(:,3); %xposistion
totledatare(:,4)=totledata(:,4); %yposistion

%%totledatare(:,3)=totledata(:,3)-minx; %xposistion
%%totledatare(:,4)=abs(totledata(:,4)-maxy); %yposistion
createfigure( totledata(:,1),totledatare(:,4),totledatare(:,3),  totledata(:,6))

%% 準備存檔檔案
[m,n]=size(totledata);
celltotledata=num2cell(totledata);
title={'Time(s)','Track','Pos.X(mm)','Pos.Y(mm)','Label','Current Speed (mm/s)'};
celltotledata=[title ; celltotledata];

%%讀影像檔
pkg load video
[filename ,filepath]=uigetfile('*.mp4','please choose the video file ',filepath);
%%取影像的魚缸座標
figure2=figure;
vidFrame= aviread([filepath filename],1);%% 讀取影片檔 讀取偵圖像
image(vidFrame);
[x,y,~] = ginput(4);%%點選邊界
close;
clear currAxes v vidFrame
%%將魚缸四點排序 b(2,:)左上 b(1,:)左下 c(2,:)右上 c(1,:) 右下
totledatare(end,4)=NaN;
[a,~]=sortrows([x,y],1);
[b,~]=sortrows(a(1:2,:),2);
[c,~]=sortrows(a(3:4,:),2);
figurex=([b(2,1);c(2,1);c(1,1);b(1,1);b(2,1)]);
figurey=([b(2,2);c(2,2);c(1,2);b(1,2);b(2,2)]);
%和raw data 進行相同處理
%%figurex=figurex-minx; %xposistion
%%figurey=abs(figurey-maxy); %yposistion

%% 
clear fileType i lastframe posistionxy  sheets speedframe firstframe j number rawData speed text totleframe m n title m2 m3 n2 n3