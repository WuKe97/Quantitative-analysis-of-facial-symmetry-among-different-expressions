clear;
clc;
load('images_landmark.mat');

image_land=image_landmark;
land_last=zeros(213,98);
image_last=uint8(zeros(213,63504));
imx=256;
imy=256;


for ge=1:213
image_classone=image_class(ge,:);
image_one=reshape(image_classone,imx,imy);

%rotate
roangle=(atan((image_land(ge,26+49)-image_land(ge,23+49))/(image_land(ge,26)-image_land(ge,23)))/pi)*180;
image_ro=imrotate(image_one,roangle,'bilinear','crop');
[sizex sizey]=size(image_ro);
for shu=1:49
    x1 = image_land(ge,shu);
    y1 = imy - image_land(ge,shu+49);
    x2 = imx/2;
    y2 = imy - imy/2;
    x = (x1 - x2)*cos(pi / 180.0 * roangle) - (y1 - y2)*sin(pi / 180.0 * roangle) + x2;
    y = (x1 - x2)*sin(pi / 180.0 * roangle) + (y1 - y2)*cos(pi / 180.0 * roangle) + y2;
    land_ro(ge,shu)=x;
    land_ro(ge,shu+49)=imy-y;
end


%zoom
dzeye=norm([land_ro(ge,26),land_ro(ge,26+49)]-[land_ro(ge,23),land_ro(ge,23+49)]);
zoomproportion=50.0/dzeye;
image_zoom=imresize(image_ro,zoomproportion);
[xs ys]=size(image_zoom);
for shu=1:49
    land_zoom(ge,shu)=land_ro(ge,shu)*xs/imx;
    land_zoom(ge,shu+49)=land_ro(ge,shu+49)*ys/imy;
end


%cut
distanl=50;
face_xmin=floor(land_zoom(ge,23)-2*distanl);
face_xmax=ceil(land_zoom(ge,23)+3*distanl);
face_ymin=floor(land_zoom(ge,23+49)-2*distanl);
face_ymax=ceil(land_zoom(ge,23+49)+3*distanl);
faces=imcrop(image_zoom,[face_xmin,face_ymin,abs(face_xmax-face_xmin),abs(face_ymax-face_ymin)]); 

for shu=1:49
    land_last(ge,shu)=land_zoom(ge,shu)-face_xmin;
    land_last(ge,shu+49)=land_zoom(ge,shu+49)-face_ymin;
end

[xf yf]=size(faces);
image_tempf=uint8(zeros(252,252));
image_tempf(1:xf,1:yf)=faces;
image_last(ge,:)=reshape(image_tempf,1,63504);

end

% clearvars -except label_class image_last land_last
% save modify_image.mat