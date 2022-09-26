function [Vd,Vg] = vectorisation_par_colonnes(I)
[n,m]=size(M);
mat1=I([1:n],[1:m-1]);
mat2=I([1:n],[2,m]);
vg=mat1(:);
vd=mat2(:);
end
