function [Data] = SNOMGetMeasFromFolder(fileList,Type)

if isempty(regexp(fileList(1).name,'.gsf')) == 1
    for i = 1:length(fileList)
        si = regexp(fileList(i).name,Type);
        if isempty(si) == 0
            StructTemp = readDUMP([fileList(i).folder,'\',fileList(i).name]);
            if exist('Data','var') == 0
                Data = StructTemp.Data;
            else
                Data(:,:,size(Data,3)+1) = StructTemp.Data;
            end
        end
    end
else
    for i = 1:length(fileList)
        si = regexp(fileList(i).name,Type);
        if isempty(si) == 0
            StructTemp = readGwySimpleField([fileList(i).folder,'\',fileList(i).name]);
%             Data = readGwySimpleField([fileList(i).folder,'\',fileList(i).name]);
            if exist('Data','var') == 0
                Data = StructTemp.Data;
            else
                Data(:,:,size(Data,3)+1) = StructTemp.Data;
            end
        end
    end
end