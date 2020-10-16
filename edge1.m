%%�@����-�����|��
figure2=figure;
createaxes(figure2, splitdata(:,3), splitdata(:,4), figurex, figurey, linex,liney )
%%���檬��(�W�v-�ϰ��)
figure3 =figure ; 
nbins = 2 %%�����X��
xedges = linspace(min(figurex),max(figurex),nbins+1);
yedges = linspace(min(figurey),max(figurey),nbins+1);
[n,xbin,ybin]=hist2d(splitdata(:,3),splitdata(:,4),xedges,yedges);

ybin = [8.3,16.6]
xbin = [11.5,23]

ybin = rot90(fliplr(ybin));
ybin = [0;ybin];
persentofarea=n/sum(sum(n));
n=round(persentofarea*1000)/10;
persent = [xbin;n];
persent = [ybin persent];
persent= num2cell(persent);

%% �ǳƦs���ɮ�
[m,n]=size(splitdata);
cellsplitdata=num2cell(splitdata);
title={'Time(s)','Track','Pos.X(cm)','Pos.Y(cm)','Label','Current Speed (cm/s)','Angle_to_base_vector','Quadrant','wheather_speed < 0.5 cm/s'};
cellsplitdata=[title ; cellsplitdata];


%%�x�s�y�гt�שM�W�v�ϰ���

file_name_prefix = [excel_filename(1:end-5),'_',num2str(now_time),'s','-',num2str(new_time),'s'];

xlswrite([[excel_filepath,[file_name_prefix,'_temp']] '.xlsx'],cellsplitdata,'splitdata')

xlswrite([[excel_filepath,[file_name_prefix,'_temp']] '.xlsx'],persent,'posistion');

xlswrite([[excel_filepath,[file_name_prefix,'_temp']] '.xlsx'],cell_static_data,'stastic');
    
%%�x�s�Ϥ�(����-�����|�ϡB�W�v-�ϰ��)
figure1=1;
saveas(figure1,[excel_filepath,[file_name_prefix,'path-speed.png']],'png');
saveas(figure2,[excel_filepath,[file_name_prefix,'path-edge.png']],'png');
saveas(figure3,[excel_filepath,[file_name_prefix,'friquency.png']],'png');

