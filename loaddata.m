%% 讀資料
pkg load io
pkg load video

%%讀excel檔
[excel_filename ,excel_filepath]=uigetfile('*.xlsx','please choose the excel file');
%%讀影像檔
[mp4_filename ,mp4_filepath]=uigetfile('*.mp4','please choose the video file ',excel_filepath);
%%取影像的魚缸座標
figure2=figure;
vidFrame= aviread([mp4_filepath mp4_filename],1800);%% 讀取影片檔 讀取偵圖像
image(vidFrame);
[x,y,~] = ginput(4);%%點選邊界
close;
clear currAxes v vidFrame

edge_data = num2cell([x;y]);

%%讀檔
[ ~, ~, rawData,~ ] = xlsread(([excel_filepath excel_filename]),2); 
