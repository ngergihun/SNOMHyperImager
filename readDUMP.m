function [DataStruct] = readDUMP(filename)
fid = fopen(filename);

DataStruct = struct;

for i=1:6
    linestring = fgetl(fid);
    fieldname = linestring(9:strfind(linestring,'=')-1);
    value = linestring(strfind(linestring,'=')+1:end);
    if i>2
        DataStruct.(fieldname) = str2double(value);
    else
%         DataStruct.(fieldname) = value;
    end
end

plusLine = fgetl(fid);
fread(fid,1);

DataSize = DataStruct.xres*DataStruct.yres;

DataStruct.Data = fread(fid,DataSize,'double',0,'l');
DataStruct.Data = transpose(reshape(DataStruct.Data,DataStruct.xres,DataStruct.yres));