function [Zfitted]=SNOMFitWithMask(gridX,gridY,Zdata,Mask,FitType)
VecIndx = find(Mask(:));
vectorX=gridX(:); vectorY=gridY(:);
sf = fit([vectorX(VecIndx), vectorY(VecIndx)],Zdata(VecIndx),FitType);
Zfitted = feval(sf,gridX,gridY);
