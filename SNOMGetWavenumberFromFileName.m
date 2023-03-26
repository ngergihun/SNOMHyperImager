function [wn] = SNOMGetWavenumberFromFileName(filename)
%_cm-1
if isempty(regexp(filename,'_cm-1')) == 0
    indxstart = regexp(filename,'_cm-1');
%-cm-1
elseif isempty(regexp(filename,'-cm-1')) == 0
    indxstart = regexp(filename,'-cm-1');
%_cm_1
elseif isempty(regexp(filename,'_cm_1')) == 0
    indxstart = regexp(filename,'_cm_1');
%-cm_1
elseif isempty(regexp(filename,'-cm_1')) == 0
    indxstart = regexp(filename,'-cm_1');
%cm_1
elseif isempty(regexp(filename,'cm_1')) == 0
    indxstart = regexp(filename,'cm_1');
%cm-1
elseif isempty(regexp(filename,'cm-1')) == 0
    indxstart = regexp(filename,'cm-1');
else
end

indx = indxstart-1;
while strcmp(filename(indx),'_') == 0 && strcmp(filename(indx),'-') == 0
    indx=indx-1;
end

wn = str2num(filename(indx+1:indxstart-1));