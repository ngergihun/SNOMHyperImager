function [subFolders] = SNOMListSubfolders(folderMain)
fileList = dir(folderMain);
dirFlags = [fileList.isdir];
subFolders = {fileList(dirFlags).name}';
subFolders(ismember(subFolders,{'.','..'})) = [];
