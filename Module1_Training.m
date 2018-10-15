[fname path] = uigetfile('.jpg',"Open face as input for training");
fname = strcat(path,fname);
im = imread(fname);
im = imresize(im , [100,100]);
imshow(im)
title("Input face");
c = input('Enter the class');

F = FeatureStatistical(im);
try
    load db;
    F = [F c];    
    db  = [db;F];
    save  db.mat db
catch
    db = [F c];
    save  db.mat db
end