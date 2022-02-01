%
% Author: Irodotos Karatsoris
% 
% Function that eliminates multiple cirlces with common centers and keeps the ones with the largest
% radii
function [centers,radii,metric] = similar_center( centers1,radii1,metric1,centers2,radii2,metric2 )

nrows=size(centers1,1);
nrows2=size(centers2,1);

if (nrows>0 && nrows2>0)
    for i=1:nrows
        x0=centers1(i,1);
        y0=centers1(i,2);
        r=radii1(i);
        j=nrows2;
        while 1
            
            if j==0 || j>nrows2
                break
            end
            
            x=centers2(j,1);
            y=centers2(j,2);
            
            if ((x-x0)^2 + (y-y0)^2 < r^2)
                centers2(j,:)=[];
                radii2(j,:)=[];
                metric2(j,:)=[];
                nrows2=nrows2-1;
            end
            j=j-1;
        end
    end
    
    centers=cat(1,centers1,centers2);
    radii=cat(1,radii1,radii2);
    metric=cat(1,metric1,metric2);
    
elseif size(radii1,1)==0
    centers=centers2;
    radii=radii2;
    metric=metric2;
elseif size(radii2,1)==0
    centers=centers1;
    radii=radii1;
    metric=metric1;
elseif radii1(1,1)<radii2(1,1)
    centers=cat(1,centers1,centers2);
    radii=cat(1,radii1,radii2);
    metric=cat(1,metric1,metric2);
else
    centers=cat(1,centers2,centers1);
    radii=cat(1,radii2,radii1);
    metric=cat(1,metric2,metric1);
end



