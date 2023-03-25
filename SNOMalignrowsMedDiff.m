function [Zdata,CorrectionFactor] = SNOMalignrowsMedDiff(Zdata,DataType)
% RowCorrected = Zdata;

switch DataType
    case 'Amp'
%         RowCorrected(1,:) = Zdata(1,:);
        for i=1:size(Zdata,1)-1
            CorrectionFactor(i) = median(Zdata(i+1,:)./Zdata(i,:));
            Zdata(i+1,:) = Zdata(i+1,:)./CorrectionFactor(i);
        end
    case 'Phase'
%         RowCorrected(1,:) = Zdata(1,:);
        for i=1:size(Zdata,1)-1
            CorrectionFactor(i) = median(Zdata(i+1,:)-Zdata(i,:));
            Zdata(i+1,:) = Zdata(i+1,:)-CorrectionFactor(i);
        end
end