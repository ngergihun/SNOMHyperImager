function [NewPos] = ShiftedRectCrossSection(Pos1,Pos2)
%Calculates the new Position (x,y,H,W) of the crossection of two rectangles
x1 = Pos1(1); x2 = Pos2(1); y1 = Pos1(2); y2 = Pos2(2);
W1 = Pos1(3); W2 = Pos2(3); H1 = Pos1(4); H2 = Pos2(4);

if y2 > y1 %Positive shift
    Hn = H1-(y2-y1);
    yn = y2;
elseif y2 < y1 && y1+H1>y2+H2 %Negative shift and higher than H2
    Hn = H2+(y2-y1);
    yn = y1;
else
    Hn = H1;
    yn = y1;
end

if x2 > x1 %Positive shift
    Wn = W1-(x2-x1);
    xn = x2;
elseif x2 < x1 && x1+W1>x2+W2 %Negative shift and higher than W2
    Wn = W2+(x2-x1);
    xn = x1;
else
    Wn = W1;
    xn = x1;
end

NewPos = [xn, yn, Wn, Hn];