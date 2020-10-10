%%pixel to cm �ഫ
[pixel_to_cm,figurex,figurey,min_x,min_y] = calobration(x,y)


%%�����İ���
[m,n] = find(strcmp(rawData,{'Visible Frames'}));
totleframe = cell2mat(rawData( m , n+1 ));
%%���ɮת��y�и��
[m2,n2] = find(strcmp(rawData,{'POSITIONS'}));
posistionxy = cell2mat(rawData(m2+3:totleframe+m2+2,n2:n2+4));
%%���ɮת��t�׸��
[m3,n3] = find(strcmp(rawData,{'INSTANT SPEED'}));
speed = cell2mat(rawData(m3+3:totleframe+m3+2,n3:n3+2));
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
for i = totleframe:-1:1
  if (posistionxy(i,1)==speed(size(speed,1)-1,1))
      lastframe=i;
      break
  end
end
%% �X�ֳt�שM��m�îե���cm
totledata=[posistionxy(firstframe:lastframe,:) speed(1:size(speed,1)-1,3)]; 
totledata(:,3)  =  (totledata(:,3)* pixel_to_cm)-min_x;
totledata(:,4)  =  (totledata(:,4)* pixel_to_cm)-min_y;

%%�p����γ����W�U����
left_point=[(figurex(1)+figurex(4))/2,(figurey(1)+figurey(4))/2];
right_point=[(figurex(2)+figurex(3))/2,(figurey(2)+figurey(3))/2];

linex=[left_point(1),right_point(1)];
liney=[left_point(2),right_point(2)];