
function fp = features(test_image,refShape,RegMat)
% %   fitting_model='models/Chehra_f1.0.mat';
% % load(fitting_model);
% % % test_image=im2double(imread(impath));
% % %     imshow(test_image);hold on;
    faceDetector = vision.CascadeObjectDetector();
    bbox = step(faceDetector, test_image);  
 test_init_shape = InitShape(bbox,refShape);
    test_init_shape = reshape(test_init_shape,49,2);
MaxIter=6;
    test_points = Fitting(test_image,test_init_shape,RegMat,MaxIter);
fp=reshape(test_points,1,98);
end