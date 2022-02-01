% 
% Author: Irodotos Karatsoris
% 

clc;
clear all;
close all;

tic
% import image
I=imread('bags 026.jpg');

% figure, imshow(I), title('Original Image');

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

R=imsharpen(R,'Radius',3,'Amount',2,'Threshold',1);
G=imsharpen(G,'Radius',3,'Amount',2,'Threshold',1);
B=imsharpen(B,'Radius',3,'Amount',2,'Threshold',1);

Radhist=adapthisteq(R);
Gadhist=adapthisteq(G);
Badhist=adapthisteq(B);

% figure,imshow(Radhist);
% figure,imshow(Gadhist);
% figure,imshow(Badhist);

%% Convert image to binary
Rbw=im2bw(Radhist,0.8);
Gbw=im2bw(Gadhist,0.8);
Bbw=im2bw(Badhist,0.8);

% Salt&Pepper Noise Removal
RKmedian = medfilt2(Rbw,[14 14]);
GKmedian = medfilt2(Gbw,[14 14]);
BKmedian = medfilt2(Bbw,[14 14]);

% figure,imshow(RKmedian);
% figure,imshow(GKmedian);
% figure,imshow(BKmedian);

%% Circle detection
% Radius 5-10 px

[centers1, radii1, metric1] = imfindcircles(R,[5 10],'ObjectPolarity','bright',...
    'Sensitivity',0.91);

[centers2, radii2, metric2] = imfindcircles(G,[5 10],'ObjectPolarity','bright',...
    'Sensitivity',0.91);

[centers3, radii3, metric3] = imfindcircles(B,[5 10],'ObjectPolarity','bright',...
    'Sensitivity',0.91);

[centers4, radii4, metric4] = imfindcircles(Radhist,[5 10],'ObjectPolarity','bright',...
    'Sensitivity',0.91);

[centers5, radii5, metric5] = imfindcircles(Gadhist,[5 10],'ObjectPolarity','bright',...
    'Sensitivity',0.91);

[centers6, radii6, metric6] = imfindcircles(Badhist,[5 10],'ObjectPolarity','bright',...
    'Sensitivity',0.91);

[fcenters, fradii, fmetric]=similar_center(centers1,radii1,metric1,centers2,radii2,metric2);
[fcenters, fradii, fmetric]=similar_center(fcenters,fradii,fmetric,centers3,radii3,metric3);
[fcenters, fradii, fmetric]=similar_center(fcenters,fradii,fmetric,centers4,radii4,metric4);
[fcenters, fradii, fmetric]=similar_center(fcenters,fradii,fmetric,centers5,radii5,metric5);
[fcenters, fradii, fmetric]=similar_center(fcenters,fradii,fmetric,centers6,radii6,metric6);

figure01=figure();
imshow(Radhist), title('Radius: 5-10');
h = viscircles(fcenters, fradii,'EdgeColor','b');
saveas(figure01, '01.bmp');

%% Radius: 10-20 px

[centers1, radii1, metric1] = imfindcircles(R,[10 20],'ObjectPolarity','bright',...
    'Sensitivity',0.91);

[centers2, radii2, metric2] = imfindcircles(G,[10 20],'ObjectPolarity','bright',...
    'Sensitivity',0.91);

[centers3, radii3, metric3] = imfindcircles(B,[10 20],'ObjectPolarity','bright',...
    'Sensitivity',0.91);

[centers4, radii4, metric4] = imfindcircles(Radhist,[10 20],'ObjectPolarity','bright',...
    'Sensitivity',0.91);

[centers5, radii5, metric5] = imfindcircles(Gadhist,[10 20],'ObjectPolarity','bright',...
    'Sensitivity',0.91);

[centers6, radii6, metric6] = imfindcircles(Badhist,[10 20],'ObjectPolarity','bright',...
    'Sensitivity',0.91);

[fcenters2, fradii2, fmetric2]=similar_center(centers1,radii1,metric1,centers2,radii2,metric2);
[fcenters2, fradii2, fmetric2]=similar_center(fcenters2,fradii2,fmetric2,centers3,radii3,metric3);
[fcenters2, fradii2, fmetric2]=similar_center(fcenters2,fradii2,fmetric2,centers4,radii4,metric4);
[fcenters2, fradii2, fmetric2]=similar_center(fcenters2,fradii2,fmetric2,centers5,radii5,metric5);
[fcenters2, fradii2, fmetric2]=similar_center(fcenters2,fradii2,fmetric2,centers6,radii6,metric6);

figure02=figure();
imshow(Radhist), title('Radius: 10-20');
h = viscircles(fcenters2, fradii2,'EdgeColor','b');
saveas(figure02, '02.bmp');

%% Radius 20-30 px

[centers1, radii1, metric1] = imfindcircles(R,[20 30],'ObjectPolarity','bright',...
    'Sensitivity',0.94);

[centers2, radii2, metric2] = imfindcircles(G,[20 30],'ObjectPolarity','bright',...
    'Sensitivity',0.94);

[centers3, radii3, metric3] = imfindcircles(B,[20 30],'ObjectPolarity','bright',...
    'Sensitivity',0.94);

[centers4, radii4, metric4] = imfindcircles(Radhist,[20 30],'ObjectPolarity','bright',...
    'Sensitivity',0.94);

[centers5, radii5, metric5] = imfindcircles(Gadhist,[20 30],'ObjectPolarity','bright',...
    'Sensitivity',0.94);

[centers6, radii6, metric6] = imfindcircles(Badhist,[20 30],'ObjectPolarity','bright',...
    'Sensitivity',0.94);

[fcenters3, fradii3, fmetric3]=similar_center(centers1,radii1,metric1,centers2,radii2,metric2);
[fcenters3, fradii3, fmetric3]=similar_center(fcenters3,fradii3,fmetric3,centers3,radii3,metric3);
[fcenters3, fradii3, fmetric3]=similar_center(fcenters3,fradii3,fmetric3,centers4,radii4,metric4);
[fcenters3, fradii3, fmetric3]=similar_center(fcenters3,fradii3,fmetric3,centers5,radii5,metric5);
[fcenters3, fradii3, fmetric3]=similar_center(fcenters3,fradii3,fmetric3,centers6,radii6,metric6);

figure03=figure();
imshow(Radhist), title('Radius: 20-30');
h = viscircles(fcenters3, fradii3,'EdgeColor','b');
saveas(figure03, '03.bmp');

%% Radius: 30-45 px

[centers7, radii7, metric7] = imfindcircles(RKmedian,[30 45],'ObjectPolarity','bright',...
    'Sensitivity',0.89);

[centers8, radii8, metric8] = imfindcircles(GKmedian,[30 45],'ObjectPolarity','bright',...
    'Sensitivity',0.89);

[centers9, radii9, metric9] = imfindcircles(BKmedian,[30 45],'ObjectPolarity','bright',...
    'Sensitivity',0.89);

[fcenters4, fradii4, fmetric4]=similar_center(centers7,radii7,metric7,centers8,radii8,metric8);
[fcenters4, fradii4, fmetric4]=similar_center(fcenters4,fradii4,fmetric4,centers9,radii9,metric9);

figure04=figure();
imshow(Radhist), title('Radius: 30-45');
h = viscircles(fcenters4, fradii4,'EdgeColor','b');
saveas(figure04, '04.bmp');
 
%% Radius 45-60 px

[centers7, radii7, metric7] = imfindcircles(RKmedian,[45 60],'ObjectPolarity','bright',...
    'Sensitivity',0.93);

[centers8, radii8, metric8] = imfindcircles(GKmedian,[45 60],'ObjectPolarity','bright',...
    'Sensitivity',0.93);

[centers9, radii9, metric9] = imfindcircles(BKmedian,[45 60],'ObjectPolarity','bright',...
    'Sensitivity',0.93);

[fcenters5, fradii5, fmetric5]=similar_center(centers7,radii7,metric7,centers8,radii8,metric8);
[fcenters5, fradii5, fmetric5]=similar_center(fcenters5,fradii5,fmetric5,centers9,radii9,metric9);

figure05=figure();
imshow(Radhist), title('Radius: 45-60');
h = viscircles(fcenters5, fradii5,'EdgeColor','b');
saveas(figure05, '05.bmp');

%% Radius 60-80 px

[centers7, radii7, metric7] = imfindcircles(RKmedian,[60 80],'ObjectPolarity','bright',...
    'Sensitivity',0.94);

[centers8, radii8, metric8] = imfindcircles(GKmedian,[60 80],'ObjectPolarity','bright',...
    'Sensitivity',0.94);

[centers9, radii9, metric9] = imfindcircles(BKmedian,[60 80],'ObjectPolarity','bright',...
    'Sensitivity',0.94);

[fcenters6, fradii6, fmetric6]=similar_center(centers7,radii7,metric7,centers8,radii8,metric8);
[fcenters6, fradii6, fmetric6]=similar_center(fcenters6,fradii6,fmetric6,centers9,radii9,metric9);

figure06=figure();
imshow(Radhist), title('Radius: 60-80');
h = viscircles(fcenters6, fradii6,'EdgeColor','b');
saveas(figure06, '06.bmp');

%% Radius: 80-120 px
[centers7, radii7, metric7] = imfindcircles(RKmedian,[80 120],'ObjectPolarity','bright',...
    'Sensitivity',0.96);

[centers8, radii8, metric8] = imfindcircles(GKmedian,[80 120],'ObjectPolarity','bright',...
    'Sensitivity',0.96);

[centers9, radii9, metric9] = imfindcircles(BKmedian,[80 120],'ObjectPolarity','bright',...
    'Sensitivity',0.96);

[fcenters7, fradii7, fmetric7]=similar_center(centers7,radii7,metric7,centers8,radii8,metric8);
[fcenters7, fradii7, fmetric7]=similar_center(fcenters7,fradii7,fmetric7,centers9,radii9,metric9);

figure07=figure();
imshow(Radhist), title('Radius: 80-120');
h = viscircles(fcenters7, fradii7,'EdgeColor','b');
saveas(figure07, '07.bmp');

%% Radius: 120-180 px

[centers7, radii7, metric7] = imfindcircles(RKmedian,[120 180],'ObjectPolarity','bright',...
    'Sensitivity',0.97);

[centers8, radii8, metric8] = imfindcircles(GKmedian,[120 180],'ObjectPolarity','bright',...
    'Sensitivity',0.97);

[centers9, radii9, metric9] = imfindcircles(BKmedian,[120 180],'ObjectPolarity','bright',...
    'Sensitivity',0.98);

[fcenters8, fradii8, fmetric8]=similar_center(centers7,radii7,metric7,centers8,radii8,metric8);
[fcenters8, fradii8, fmetric8]=similar_center(fcenters8,fradii8,fmetric8,centers9,radii9,metric9);

figure08=figure();
imshow(Radhist), title('Radius: 120-180');
% d = imdistline;
h = viscircles(fcenters8, fradii8,'EdgeColor','b');
saveas(figure08, '08.bmp');

%% exclude circles that have similar centers
[fcenters1, fradii1, fmetric1]=similar_center(fcenters2,fradii2,fmetric2,fcenters,fradii,fmetric);
figure09=figure();
imshow(Radhist), title('Radius: 5-20');
h = viscircles(fcenters1, fradii1,'EdgeColor','b');
saveas(figure09,'09.bmp');

%% unify all the extracted data
all_centers = cat(1, fcenters1,fcenters3,fcenters4,fcenters5,fcenters6,fcenters7,fcenters8);
all_radii = cat(1,fradii1,fradii3,fradii4,fradii5,fradii6,fradii7,fradii8);
all_metric = cat(1,fmetric1,fmetric3,fmetric4,fmetric5,fmetric6,fmetric7,fmetric8);
 
%% View histogram figure of all the detected circles based on radius
figure, histogram(all_radii,40), xlabel('Radius');

toc
