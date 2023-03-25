function [RowCorrected] = SNOMalignrows(Zdata,DataType)
RowCorrected = zeros(size(Zdata));
switch DataType
    case 'Amp'
        for i=1:size(Zdata,1)
            RowCorrected(i,:) = Zdata(i,:)./median(Zdata(i,:));
        end
    case 'Phase'
        for i=1:size(Zdata,1)
            RowCorrected(i,:) = Zdata(i,:)-median(Zdata(i,:));
        end
end