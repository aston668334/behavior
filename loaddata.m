%% Ū���
pkg load io
pkg load video

%%Ūexcel��
[excel_filename ,excel_filepath]=uigetfile('*.xlsx','please choose the excel file');
%%Ū�v����
[mp4_filename ,mp4_filepath]=uigetfile('*.mp4','please choose the video file ',excel_filepath);
%%���v���������y��
figure2=figure;
vidFrame= aviread([mp4_filepath mp4_filename],1800);%% Ū���v���� Ū�����Ϲ�
image(vidFrame);
[x,y,~] = ginput(4);%%�I�����
close;
clear currAxes v vidFrame

edge_data = num2cell([x;y]);

%%Ū��
[ ~, ~, rawData,~ ] = xlsread(([excel_filepath excel_filename]),2); 
