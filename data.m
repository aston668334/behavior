%% Ū���
pkg load io

delete('temp.xlsx')
%%Ū��
[filename ,filepath]=uigetfile('*.xlsx','please choose the excel file');
[ ~, ~, rawData,~ ] = xlsread(([filepath filename]),2); 
%%�����İ���
[m,n]=find(strcmp(rawData,{'Visible Frames'}));
totleframe=cell2mat(rawData(m,n+1));
%%���ɮת��y�и��
[m2,n2]=find(strcmp(rawData,{'POSITIONS'}));
posistionxy = cell2mat(rawData(m2+3:totleframe+m2+2,n2:n2+4));
%%���ɮת��t�׸��
[m3,n3]=find(strcmp(rawData,{'INSTANT SPEED'}));
speed= cell2mat(rawData(m3+3:totleframe+m3+2,n3:n3+2));
%% �p��Ĥ@��(�y�ЩM�t�׮ɶ��@��)�@�P��
firstframe=1;
for i=1:totleframe
  if (posistionxy(i,1)==speed(1,1))
      firstframe=i;
      break
  end
end
%% �p��̫�@��(�y�ЩM�t�׮ɶ��@��)�@�P��
lastframe=1;
for i=1:totleframe
  if (posistionxy(i,1)==speed(size(speed,1)-1,1))
      lastframe=i;
      break
  end
end
%% �X�ֳt�שM��m
totledata=[posistionxy(firstframe:lastframe,:) speed(1:size(speed,1)-1,3)]; 
%% �e��
totledata=[totledata ; [1:6]];
totledata(end,:) = NaN;
minx=min(totledata(:,3));
maxy=max(totledata(:,4));

totledatare(:,3)=totledata(:,3); %xposistion
totledatare(:,4)=totledata(:,4); %yposistion

%%totledatare(:,3)=totledata(:,3)-minx; %xposistion
%%totledatare(:,4)=abs(totledata(:,4)-maxy); %yposistion
createfigure( totledata(:,1),totledatare(:,4),totledatare(:,3),  totledata(:,6))

%% �ǳƦs���ɮ�
[m,n]=size(totledata);
celltotledata=num2cell(totledata);
title={'Time(s)','Track','Pos.X(mm)','Pos.Y(mm)','Label','Current Speed (mm/s)'};
celltotledata=[title ; celltotledata];

%%Ū�v����
pkg load video
[filename ,filepath]=uigetfile('*.mp4','please choose the video file ',filepath);
%%���v���������y��
figure2=figure;
vidFrame= aviread([filepath filename],1);%% Ū���v���� Ū�����Ϲ�
image(vidFrame);
[x,y,~] = ginput(4);%%�I�����
close;
clear currAxes v vidFrame
%%�N�����|�I�Ƨ� b(2,:)���W b(1,:)���U c(2,:)�k�W c(1,:) �k�U
totledatare(end,4)=NaN;
[a,~]=sortrows([x,y],1);
[b,~]=sortrows(a(1:2,:),2);
[c,~]=sortrows(a(3:4,:),2);
figurex=([b(2,1);c(2,1);c(1,1);b(1,1);b(2,1)]);
figurey=([b(2,2);c(2,2);c(1,2);b(1,2);b(2,2)]);
%�Mraw data �i��ۦP�B�z
%%figurex=figurex-minx; %xposistion
%%figurey=abs(figurey-maxy); %yposistion

%% 
clear fileType i lastframe posistionxy  sheets speedframe firstframe j number rawData speed text totleframe m n title m2 m3 n2 n3