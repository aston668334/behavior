
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
hist2d(totledatare(:,3),totledatare(:,4),xedges,yedges)
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
