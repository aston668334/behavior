%%作魚缸-魚路徑圖
figure2=figure;
createaxes(figure2, totledatare(:,3), totledatare(:,4), figurex, figurey, linex,liney )
%%做格狀的(頻率-區域圖)
figure3 =figure ; 
nbins = 2 %%分成幾塊
xedges = linspace(min(figurex),max(figurex),nbins+1);
yedges = linspace(min(figurey),max(figurey),nbins+1);
[n,xbin,ybin]=hist2d(totledatare(:,3),totledatare(:,4),xedges,yedges);

ybin = [8.3,16.6]
xbin = [11.5,23]

ybin = rot90(fliplr(ybin));
ybin = [0;ybin];
persentofarea=n/sum(sum(n));
n=round(persentofarea*1000)/10;
persent = [xbin;n];
persent = [ybin persent];
persent= num2cell(persent);
%%儲存座標速度和頻率區域資料

[filename, filepath] = uiputfile({'*.xls';'*.csv'},'Save As...',[[excel_filepath,[excel_filename(1:end-5),'temp']] '.xlsx']);
    if filename ~=0
        if exist([filename, filepath],'file')
            delete([filename, filepath]);
        end
    else
    filename = 'temp.xlsx';
    end
    xlswrite([excel_filepath filename],celltotledata,'totledata')
    
    xlswrite([excel_filepath filename],persent,'posistion');
%%儲存圖片(魚缸-魚路徑圖、頻率-區域圖)
figure1=1;
saveas(figure1,[excel_filepath,[excel_filename(1:end-5),'path-speed.png']],'png');
saveas(figure2,[excel_filepath,[excel_filename(1:end-5),'path-edge.png']],'png');
saveas(figure3,[excel_filepath,[excel_filename(1:end-5),'friquency.png']],'png');
