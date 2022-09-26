function [r,a,b] = calcul_parametres_correlation(Vd,Vg)
[n,m]=size(vd);
moyd=mean(Vd);
moyg=mean(Vg);
Vd2=Vd*Vd;
Vg2=Vg*Vg;
Vg3=Vg*Vd;
vard=(mean(Vd2))-moyd*moyd;
varg=(mean(Vg2))-moyg*moyg;
ecd=sqrt(vard);
ecg=sqrt(varg);
cov=mean(Vg3)-moyd*moyg;
r=cov/(ecg*ecd);
a=cov/vard;
b=moyg-moyd*a;











  
    