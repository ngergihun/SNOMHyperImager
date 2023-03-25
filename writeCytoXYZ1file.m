function [] = writeCytoXYZ1file(M,wn,filepath,filename)
% write to CYtoSpec compatible XYZ1 hyperspectral file format
fileID = fopen([filepath filename],'w');
fprintf(fileID,'\t\t');
fprintf(fileID,'%10.5f\t',wn');
fprintf(fileID,'\n');
fprintf(fileID, [repmat('%10.5f\t', 1, size(M,2)) '\n'], M');
fclose(fileID);