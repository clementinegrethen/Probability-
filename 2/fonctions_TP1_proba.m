
% TP1 de Probabilites : fonctions a completer et rendre sur Moodle
% Nom :
% Prénom : 
% Groupe : 1SN-

function varargout = fonctions_TP1_proba(varargin)

    switch varargin{1}     
        case 'ecriture_RVB'
            varargout{1} = feval(varargin{1},varargin{2:end});
        case {'vectorisation_par_colonne','decorrelation_colonnes'}
            [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});
        case 'calcul_parametres_correlation'
            [varargout{1},varargout{2},varargout{3}] = feval(varargin{1},varargin{2:end}); 
    end

end

% Fonction ecriture_RVB (exercice_0.m) ------------------------------------
% (Copiez le corps de la fonction ecriture_RVB du fichier du meme nom)
function image_RVB = ecriture_RVB(image_originale)
    image_B=image_originale(2:2:end,1:2:end)
    image_R=image_originale(1:2:end,2:2:end)
    image_v1=image_originale(1:2:end,1:2:end)
    image_v2=image_originale(2:2:end,2:2:end)
    image_V=(image_v1+image_v2)/2
    image_RVB=cat(3,image_R,image_V,image_B)
end





% Fonction vectorisation_par_colonne (exercice_1.m) -----------------------
function [Vd,Vg] = vectorisation_par_colonne(I)
[n,m]=size(I);
mat1=I(:,1:m-1);
mat2=I(:,2:m);
Vg = mat1(:);
Vd = mat2(:);
end

% Fonction calcul_parametres_correlation (exercice_1.m) -------------------
function [r,a,b] = calcul_parametres_correlation(Vd,Vg)
    [n,m]=size(Vd)
    moyd=mean(Vd);
    moyg=mean(Vg);
    Vd1=Vd'*Vd;
    Vg2=Vg'*Vg;
    Vg3=Vg'*Vd;
    vard=(Vd1)/n-moyd^2;
    varg=(Vg2)/n-moyg^2;
    ecd=sqrt(vard);
    ecg=sqrt(varg);
    cov=mean(Vd.*Vg)-moyd*moyg;
    r=cov/(ecg*ecd);
    a=cov/vard;
    b=moyg-moyd*a;

end

% Fonction decorrelation_colonnes (exercice_2.m) --------------------------
function [I_decorrelee,I_min] = decorrelation_colonnes(I,I_max)
I_decorrelee=I;
I_decorrelee(:,2:end)=I_decorrelee(:,2:end)-I(:,1:end-1);
I_min=-255;


end



