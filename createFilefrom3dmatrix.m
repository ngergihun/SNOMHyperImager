function [B] = createFilefrom3dmatrix(A)
%creates a 2d matrix format from the 3d matrix A
rows = size(A,1);
columns = size(A,2);
depth = size(A,3);
B = zeros(rows*columns,depth+2);
for i=1:columns
    for j = 1:rows
        B((i-1)*rows+j,1) = i;
        B((i-1)*rows+j,2) = j;
        B((i-1)*rows+j,3:end) = A(j,i,:);
    end
end