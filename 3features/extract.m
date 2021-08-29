clear;
clc;
load('modify_landmark.mat');
asymfea=zeros(213,5);

for ge=1:213
image_classone=image_last(ge,:);
image_one=reshape(image_classone,252,252);


%angle
anglebro=atan(abs(land_lastg(ge,3+49)-land_lastg(ge,8+49))/abs(land_lastg(ge,3)-land_lastg(ge,8)));
anglenose=atan(abs(land_lastg(ge,15+49)-land_lastg(ge,19+49))/abs(land_lastg(ge,15)-land_lastg(ge,19)));
anglemou=atan(abs(land_lastg(ge,32+49)-land_lastg(ge,38+49))/abs(land_lastg(ge,32)-land_lastg(ge,38)));
angleland=anglebro+anglenose+anglemou;

%regional asymmetry
middleline=(land_lastg(ge,26)-land_lastg(ge,23))/2+land_lastg(ge,23);

%eyebrow
lbro=0;
for dian=1:5
distances=abs(land_lastg(ge,dian)-middleline);
gdistances=distances*im2double(image_one(floor(land_lastg(ge,dian+49)),floor(land_lastg(ge,dian))));
lbro=lbro+gdistances;
end
rbro=0;
for dian=6:10
distances=abs(land_lastg(ge,dian)-middleline);
gdistances=distances*im2double(image_one(floor(land_lastg(ge,dian+49)),floor(land_lastg(ge,dian))));
rbro=rbro+gdistances;
end
asymbro=min(lbro,rbro)/max(lbro,rbro);

%eye
leye=0;
for dian=20:25
distances=abs(land_lastg(ge,dian)-middleline);
gdistances=distances*im2double(image_one(floor(land_lastg(ge,dian+49)),floor(land_lastg(ge,dian))));
leye=leye+gdistances;
end
reye=0;
for dian=26:31
distances=abs(land_lastg(ge,dian)-middleline);
gdistances=distances*im2double(image_one(floor(land_lastg(ge,dian+49)),floor(land_lastg(ge,dian))));
reye=reye+gdistances;
end
asymeye=min(leye,reye)/max(leye,reye);

%nose
lnose=0;
for dian=15:16
distances=abs(land_lastg(ge,dian)-middleline);
gdistances=distances*im2double(image_one(floor(land_lastg(ge,dian+49)),floor(land_lastg(ge,dian))));
lnose=lnose+gdistances;
end
rnose=0;
for dian=18:19
distances=abs(land_lastg(ge,dian)-middleline);
gdistances=distances*im2double(image_one(floor(land_lastg(ge,dian+49)),floor(land_lastg(ge,dian))));
rnose=rnose+gdistances;
end
asymnose=min(lnose,rnose)/max(lnose,rnose);

%mouth
lmou=0;
for dian=32:34
distances=abs(land_lastg(ge,dian)-middleline);
gdistances=distances*im2double(image_one(floor(land_lastg(ge,dian+49)),floor(land_lastg(ge,dian))));
lmou=lmou+gdistances;
end
for dian=42:44
distances=abs(land_lastg(ge,dian)-middleline);
gdistances=distances*im2double(image_one(floor(land_lastg(ge,dian+49)),floor(land_lastg(ge,dian))));
lmou=lmou+gdistances;
end
dian=49;
distances=abs(land_lastg(ge,dian)-middleline);
gdistances=distances*im2double(image_one(floor(land_lastg(ge,dian+49)),floor(land_lastg(ge,dian))));
lmou=lmou+gdistances;
rmou=0;
for dian=36:40
distances=abs(land_lastg(ge,dian)-middleline);
gdistances=distances*im2double(image_one(floor(land_lastg(ge,dian+49)),floor(land_lastg(ge,dian))));
rmou=rmou+gdistances;
end
for dian=46:47
distances=abs(land_lastg(ge,dian)-middleline);
gdistances=distances*im2double(image_one(floor(land_lastg(ge,dian+49)),floor(land_lastg(ge,dian))));
rmou=rmou+gdistances;
end
asymmou=min(lmou,rmou)/max(lmou,rmou);

asymreg=asymbro+asymeye+asymnose+asymmou;




%left face and right face
dbou=5;
face_xmin=floor(min([land_lastg(ge,1) land_lastg(ge,2) land_lastg(ge,15) land_lastg(ge,20) land_lastg(ge,21) land_lastg(ge,25) land_lastg(ge,32) land_lastg(ge,33) land_lastg(ge,43)]))-dbou;
face_xmax=ceil(max([land_lastg(ge,9) land_lastg(ge,10) land_lastg(ge,19) land_lastg(ge,28) land_lastg(ge,29) land_lastg(ge,30) land_lastg(ge,37) land_lastg(ge,38) land_lastg(ge,39)]))+dbou;
face_ymin=floor(min([land_lastg(ge,1+49) land_lastg(ge,2+49) land_lastg(ge,3+49) land_lastg(ge,4+49) land_lastg(ge,5+49) land_lastg(ge,6+49) land_lastg(ge,7+49) land_lastg(ge,8+49) land_lastg(ge,9+49) land_lastg(ge,10+49)]))-dbou;
face_ymax=ceil(max([land_lastg(ge,32+49) land_lastg(ge,38+49) land_lastg(ge,39+49) land_lastg(ge,40+49) land_lastg(ge,41+49) land_lastg(ge,42+49) land_lastg(ge,43+49)]))+dbou;
if mod((face_xmax-face_xmin)/2,2) == 1
    face_xmax=face_xmax+1;
end
face_middle=(face_xmax-face_xmin)/2+face_xmin;
lface=image_one(face_ymin:face_ymax,face_xmin:face_middle);
rtface=image_one(face_ymin:face_ymax,face_middle:face_xmax);
rface=flipdim(rtface,2);


%centroid
sumimgzuo=sum(sum(lface));
[lx ly]=size(lface);
cen_lx=sum(lface)*(1:ly)'/sumimgzuo;
cen_ly=(1:lx)*sum(lface,2)/sumimgzuo;
sumimgyuo=sum(sum(rface));
[rx ry]=size(rface);
cen_rx=sum(rface)*(1:ry)'/sumimgyuo;
cen_ry=(1:rx)*sum(rface,2)/sumimgyuo;
dcentroid=norm([cen_lx,cen_ly]-[cen_rx,cen_ry]);


%singular value
[lU,lS,lV]=svd(im2double(lface));
[rU,rS,rV]=svd(im2double(rface));
singv=abs(sum(sum(lS))-sum(sum(rS)));


%structural dissimilarity
stru = ssim(lface,rface);


asymfea(ge,1)=angleland;
asymfea(ge,2)=4-asymreg;
asymfea(ge,3)=dcentroid;
asymfea(ge,4)=singv;
asymfea(ge,5)=1-stru;

end

%z-score
zasymfea(:,1)=zscore(asymfea(:,1));
zasymfea(:,2)=zscore(asymfea(:,2));
zasymfea(:,3)=zscore(asymfea(:,3));
zasymfea(:,4)=zscore(asymfea(:,4));
zasymfea(:,5)=zscore(asymfea(:,5));

% clearvars -except label_class image_last land_lastg zasymfea
% save asymfeature.mat