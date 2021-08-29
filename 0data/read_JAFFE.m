clear;
clc;

images_files = dir(fullfile('JAFFE','*.tiff')); 
images_length = length(images_files);

image_class1=[]; 
image_class2=[];
image_class3=[];
image_class4=[];
image_class5=[];
image_class6=[];
image_class7=[];
label_class1=[];  
label_class2=[];
label_class3=[];
label_class4=[];
label_class5=[];
label_class6=[];
label_class7=[];
for i = 1:images_length
    image_name=images_files(i).name;
    image_origin = imread(strcat('JAFFE\',image_name)); 
    image_name_label=image_name(4:5);
    image_one=reshape(image_origin,1,65536); 
    %AN1.DI2.FE3.HA4.NE5.SA6.SU7.
    if strcmp(image_name(4:5),'AN')   
          label_class1=[label_class1;1];  
          image_class1=[image_class1; image_one];
    elseif strcmp(image_name(4:5),'DI')
          label_class2=[label_class2;2];
          image_class2=[image_class2; image_one];
    elseif strcmp(image_name(4:5),'FE')
          label_class3=[label_class3;3];  
          image_class3=[image_class3; image_one];
    elseif strcmp(image_name(4:5),'HA')
          label_class4=[label_class4;4];
          image_class4=[image_class4; image_one];
    elseif strcmp(image_name(4:5),'NE')
          label_class5=[label_class5;5];
          image_class5=[image_class5; image_one];
    elseif strcmp(image_name(4:5),'SA')
          label_class6=[label_class6;6];
          image_class6=[image_class6; image_one];
    elseif strcmp(image_name(4:5),'SU')
          label_class7=[label_class7;7];
          image_class7=[image_class7; image_one];
    end
end
image_class=[image_class1; image_class2; image_class3; image_class4; image_class5; image_class6; image_class7];  
label_class=[label_class1; label_class2; label_class3; label_class4; label_class5; label_class6; label_class7];  

clearvars -except image_class label_class
save origin_images.mat