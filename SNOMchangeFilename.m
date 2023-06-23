function [newfilename] = SNOMchangeFilename(fileName,harmonic)
% change the file name to read a different harmonics
% dataTypeBoolean is 1 if type is Amplitude and 0 if type if Phase or Z

% indx = regexp(fileName,'.gsf');

%for dump file - OLD snom
if isempty(regexp(fileName,'.gsf')) == 1
    indx = regexp(fileName,'.dump');
    Type = fileName(indx-8:indx-1);
end

%for gsf file - NEW snom
if ~isempty(regexp(fileName,'.gsf')) == 1
    indx = regexp(fileName,'.gsf');
    if strcmp(fileName(indx-3:indx-1),'raw') == 1
        Type = fileName(indx-8:indx-4);
        if strcmp(Type(1),'-') == 1
            Type = fileName(indx-10:indx-4);
        end
        if ~isempty(regexp(Type,' Z')) == 1
            Type = fileName(indx-6:indx-1);
        elseif ~isempty(regexp(Type,'-Z')) == 1
            Type = fileName(indx-8:indx-1);
        end
    else
        Type = fileName(indx-4:indx-1);
        if strcmp(Type(1),'-') == 1
            Type = fileName(indx-5:indx-1);
        else
        end
    end
    
    idx = regexp(fileName,Type);
    newfilename = fileName;
    newfilename(idx+2) = num2str(harmonic);
end