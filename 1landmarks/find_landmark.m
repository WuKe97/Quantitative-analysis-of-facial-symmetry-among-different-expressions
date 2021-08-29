clear;
clc;
load('Chehra_f1.0.mat');
load('origin_images.mat');

image_landmark=zeros(213,98);

ge=1;

ge=ge+1;
image_classone=image_class(ge,:);
image_one=im2double(reshape(image_classone,256,256));
image_landmark(ge,:)=features(image_one,refShape,RegMat);

figure;
imshow(image_one);hold on;
plot(image_landmark(ge,1:49),image_landmark(ge,50:98),'g*','MarkerSize',6);hold on;  

for i=1:49
    c=num2str(i);
    c=[' ',c];
    text(image_landmark(ge,i),image_landmark(ge,i+49),c)
end
hold on;

[x,y] = ginput(10);
image_landmark(ge,1)=x(1);
image_landmark(ge,1+49)=y(1);
image_landmark(ge,2)=x(2);
image_landmark(ge,2+49)=y(2);
image_landmark(ge,3)=x(3);
image_landmark(ge,3+49)=y(3);
image_landmark(ge,4)=x(4);
image_landmark(ge,4+49)=y(4);
image_landmark(ge,5)=x(5);
image_landmark(ge,5+49)=y(5);
image_landmark(ge,6)=x(6);
image_landmark(ge,6+49)=y(6);
image_landmark(ge,7)=x(7);
image_landmark(ge,7+49)=y(7);
image_landmark(ge,8)=x(8);
image_landmark(ge,8+49)=y(8);
image_landmark(ge,9)=x(9);
image_landmark(ge,9+49)=y(9);
image_landmark(ge,10)=x(10);
image_landmark(ge,10+49)=y(10);

% clearvars -except image_class  label_class image_landmark
% save images_landmark.mat