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

%%計算分割魚缸上下的縣
left_point=(b(2,:)+b(1,:))/2
right_point=(c(2,:)+c(1,:))/2

linex=[left_point(1),right_point(1)];
liney=[left_point(2),right_point(2)];

%%校正魚缸四點
%%coeff;
%%calibrationxy;
%%作魚缸-魚路徑圖
figure2=figure;
createaxes(figure2, totledatare(:,3), totledatare(:,4), figurex, figurey, linex,liney )
%%做格狀的(頻率-區域圖)
figure3 =figure ; 
nbins = 2 %%分成幾塊
xedges = linspace(min(figurex),max(figurex),nbins+1);
yedges = linspace(min(figurey),max(figurey),nbins+1);
hist2d(totledatare(:,3),totledatare(:,4),)
[n,xbin,ybin]=hist2d(totledatare(:,3),totledatare(:,4),xedges,yedges);
ybin = rot90(fliplr(ybin));
ybin = [0;ybin];
persentofarea=n/sum(sum(n));
n=round(persentofarea*1000)/10;
persent = [xbin;n];
persent = [ybin persent];
persent= num2cell(persent);
%%儲存座標速度和頻率區域資料

[filename, filepath] = uiputfile({'*.xls';'*.csv'},'Save As...',[[filepath,'temp'] '.xlsx']);
    if filename ~=0
        if exist([filename, filepath],'file')
            delete([filename, filepath]);
        end
    else
    filename = 'temp.xlsx';
    end
    xlswrite([filepath filename],celltotledata,'totledata')
    
    xlswrite([filepath filename],persent,'posistion');
%%儲存圖片(魚缸-魚路徑圖、頻率-區域圖)
figure1=1;
saveas(figure1,[filepath,'path-speed.png']);
saveas(figure2,[filepath,'path-edge.png'],'png');
saveas(figure3,[filepath,'friquency.png'],'png');
