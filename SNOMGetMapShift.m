function [yshift,xshift] = SNOMGetMapShift(NextMeas,Meas)
C = normxcorr2_general(Meas,NextMeas);

borderSizeY = round(size(Meas,1)/10);
borderSizeX = round(size(Meas,2)/10);

C(1:borderSizeY,:) = 0; C(end-borderSizeY:end,:) = 0;
C(:,1:borderSizeX) = 0; C(:,end-borderSizeX:end) = 0;

[ypeak,xpeak] = find(C==max(C(:)));
yshift = ypeak-size(Meas,1);
xshift = xpeak-size(Meas,2);