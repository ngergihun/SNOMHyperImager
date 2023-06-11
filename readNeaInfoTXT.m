function [wn] = readNeaInfoTXT(filename)

fid = fopen(filename);
linestring = '';
Nlines = 1;

while ~contains(linestring,'Version:')
    Nlines = Nlines + 1;
    linestring = fgetl(fid);
    if contains(linestring,'Target Wavelength:')
        ct = strsplit(linestring,'\t');
        wstring = ct{3};
        idx = strfind(wstring,',');
        wstring(idx) = [];
        if strcmp(ct{2},'[µm]')
            wn = round(10000/str2double(wstring));
        else
            wn = str2double(wstring);
        end
    end
end

%C_header = textscan(fid,'%s',16,'Delimiter','\t');
%C_header = C_header{1};

