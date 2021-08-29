clear;
clc;
load('modify_image.mat');
land_lastg=zeros(213,98);

ge=1;
ge=ge+1;
image_classone=image_last(ge,:);
image_one=reshape(image_classone,252,252);
figure;
imshow(image_one);hold on;
plot(land_last(ge,1:49),land_last(ge,50:98),'g*','MarkerSize',6);hold on;  
for i=1:49
    c=num2str(i);
    c=[' ',c];
    text(land_last(ge,i),land_last(ge,i+49),c)
end
hold on;


%modify
zuo=-1
shang=0
for shu=1:49
    land_lastg(ge,shu)=land_last(ge,shu)-zuo;
    land_lastg(ge,shu+49)=land_last(ge,shu+49)-shang;
end
figure;
imshow(image_one);hold on;
plot(land_lastg(ge,1:49),land_lastg(ge,50:98),'g*','MarkerSize',6);hold on;  
for i=1:49
    c=num2str(i);
    c=[' ',c];
    text(land_lastg(ge,i),land_lastg(ge,i+49),c)
end
hold on;


%manual
[x,y] = ginput(1);
land_lastg(ge,1)=x(1);
land_lastg(ge,1+49)=y(1);

% clearvars -except label_class image_last land_lastg
% save modify_landmark.mat