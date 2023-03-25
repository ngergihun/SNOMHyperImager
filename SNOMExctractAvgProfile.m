function [profile,posMark1,posMark2] = SNOMExctractAvgProfile(Meas,Position,xref,yref,N)

% Position = roiLine.Position;

lineVec = fliplr([Position(1,1)-Position(2,1), -1*(Position(1,2)-Position(2,2))]);
lineVec = lineVec./norm(lineVec);
lineVec(1) = lineVec(1)*(xref(1)-xref(2))/size(Meas,2);
lineVec(2) = lineVec(2)*(yref(1)-yref(2))/size(Meas,1);

profile = improfile(xref,yref,Meas,Position(:,1),Position(:,2));

posMark1(1,:) = Position(1,:); posMark1(2,:) = Position(1,:);
posMark2(1,:) = Position(2,:); posMark2(2,:) = Position(2,:);

if N > 1
    for i=2:N
        nN = floor(i/2);
        if mod(i,2) == 0
            k=1;
        else
            k=-1;
        end
        
    NewPos = [Position(1,:)+k*nN*lineVec; Position(2,:)+k*nN*lineVec];
    if i==N-1
        posMark1(2,:)=NewPos(1,:);
        posMark2(2,:)=NewPos(2,:);
    elseif i==N
        posMark1(1,:)=NewPos(1,:);
        posMark2(1,:)=NewPos(2,:);
    end
%     drawline(gca,'Position',NewPos);
    profile(:,i) = improfile(xref,yref,Meas,NewPos(:,1),NewPos(:,2));
    end
end

profile=mean(profile,2);