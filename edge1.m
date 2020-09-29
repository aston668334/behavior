
%%�p����γ����W�U����
left_point=(b(2,:)+b(1,:))/2
right_point=(c(2,:)+c(1,:))/2

linex=[left_point(1),right_point(1)];
liney=[left_point(2),right_point(2)];

%%�ե������|�I
%%coeff;
%%calibrationxy;
%%�@����-�����|��
figure2=figure;
createaxes(figure2, totledatare(:,3), totledatare(:,4), figurex, figurey, linex,liney )
%%���檬��(�W�v-�ϰ��)
figure3 =figure ; 
nbins = 2 %%�����X��
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
%%�x�s�y�гt�שM�W�v�ϰ���

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
%%�x�s�Ϥ�(����-�����|�ϡB�W�v-�ϰ��)
figure1=1;
saveas(figure1,[filepath,'path-speed.png']);
saveas(figure2,[filepath,'path-edge.png'],'png');
saveas(figure3,[filepath,'friquency.png'],'png');
