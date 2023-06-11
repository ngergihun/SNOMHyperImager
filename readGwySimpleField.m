function [DataStruct] = readGwySimpleField(filename)

% [filename1,filepath1]=uigetfile({'*.*','All Files'},'Select Flat File 1');
fid = fopen(filename);

DataStruct = struct;
MagicLine = fgetl(fid);
headerSize = length(MagicLine);

% for i=1:16
fieldname = "";
while fieldname ~= "Neaspec_WavenumberScaling"
    linestring = fgetl(fid);
    headerSize = headerSize + length(linestring);
    indx = strfind(linestring,'=');
    fieldname = linestring(1:indx-1);
    value = linestring(indx+1:end);
    val = str2double(value);
    if isnan(val)
        DataStruct.(fieldname) = value;
    else
        DataStruct.(fieldname) = val;
    end
end

HeaderEnd = ftell(fid);
NullPadSize = 4-mod(HeaderEnd,4);
% fseek(fid,NullPadSize,'bof');

DataSize = DataStruct.XRes*DataStruct.YRes;
Nulla = fread(fid,NullPadSize);

DataStruct.Data = fread(fid,DataSize,'float32',0,'l');
% NullPadSize = mod(length(DataStruct.Data),DataSize);
% DataStruct.Data = DataStruct.Data(NullPadSize+1:end);
DataStruct.Data = transpose(reshape(DataStruct.Data,DataStruct.XRes,DataStruct.YRes));

fclose(fid);
% imagesc(DataStruct.Data)