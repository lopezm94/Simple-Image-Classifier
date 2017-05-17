im=imread('image_0072.jpg');
imgBin=im2bw(im,graythresh(im));
ee = strel('disk',2);
imgMarkers = imerode(imgBin,ee);
imgReconstruct=imreconstruct(imgMarkers,imgBin);

%% descriptores sencillos: circularidad/rectangularidad, compacidad

stats= regionprops(double(imgReconstruct),'Eccentricity', 'Solidity');
circularidad = 1 - stats.Eccentricity
compacidad = stats.Solidity
