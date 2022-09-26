
% TP3 de Probabilites : fonctions a completer et rendre sur Moodle
% Nom :grethen
% Prénom :clementine 
% Groupe : 1SN-N

function varargout = fonctions_TP3_proba(varargin)

    switch varargin{1}
        
        case 'matrice_inertie'
            
            [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});
            
        case {'ensemble_E_recursif','calcul_proba'}
            
            [varargout{1},varargout{2},varargout{3}] = feval(varargin{1},varargin{2:end});
    
    end
end

% Fonction ensemble_E_recursif (exercie_1.m) ------------------------------
function [E,contour,G_somme] = ...
    ensemble_E_recursif(E,contour,G_somme,i,j,voisins,G_x,G_y,card_max,cos_alpha)

contour(i,j) = 0;
G_somme_norme = G_somme/norm(G_somme);
nbvoisins = size(voisins,1);

p = 1;
while p<=nbvoisins & size(E,1)<=card_max
	i_v= voisins(p,1) + i;			
	j_v = voisins(p,2) + j;
   
	G = [G_x(i,j), G_y(i,j)];
    G_N = G/norm(G);
    if contour(i_v,j_v)
        produit_scl = dot(G_somme_norme,G_N);
        if produit_scl > cos_alpha
            E = [E;i_v j_v];
        [E,contour,G_somme] = ensemble_E_recursif(E,contour,G_somme,i_v,j_v,voisins,G_x,G_y,card_max,cos_alpha);

		end
	end
	p= p+1;
end
end

% Fonction matrice_inertie (exercice_2.m) ---------------------------------
function [M_inertie,C] = matrice_inertie(E,G_norme_E)
 


Pi=sum(G_norme_E);
E_prime=(fliplr(E));
M_inertie=zeros(2,2);
xbarre = sum((E_prime(:,1)).*G_norme_E)/Pi;
ybarre = sum((E_prime(:,2)).*G_norme_E)/Pi;
C = [xbarre , ybarre];
M_inertie(1,2)= sum( G_norme_E.*( (E_prime(:,1)-xbarre)).*(E_prime(:,2)-ybarre))/Pi;
M_inertie(1,1)=  sum(G_norme_E.*(E_prime(:,1)-xbarre).^2)/Pi;                       
M_inertie(2,1)=M_inertie(1,2);
M_inertie(2,2)=sum(G_norme_E.*(E_prime(:,2)-ybarre).^2)/Pi;



end

% Fonction calcul_proba (exercice_2.m) ------------------------------------
function [x_min,x_max,probabilite] = calcul_proba(E_nouveau_repere,p)
y_min = min(E_nouveau_repere(:,2));
y_max = max(E_nouveau_repere(:,2));
x_min = min(E_nouveau_repere(:,1));
x_max = max(E_nouveau_repere(:,1));
N=(x_max-x_min)*(y_max-y_min);
probabilite=1-binocdf(length(E_nouveau_repere),floor(N),p);

end
