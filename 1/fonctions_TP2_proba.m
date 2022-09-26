
% TP2 de Probabilites : fonctions a completer et rendre sur Moodle
% Nom :grethen
% Prenom : clémentine
% Groupe : 1SN-N

function varargout = fonctions_TP2_proba(varargin)

    switch varargin{1}
        
        case {'calcul_frequences_caracteres','determination_langue','coeff_compression','gain_compression','partitionnement_frequences'}

            varargout{1} = feval(varargin{1},varargin{2:end});
            
        case {'recuperation_caracteres_presents','tri_decroissant_frequences','codage_arithmetique'}
            
            [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});
            
        case 'calcul_parametres_correlation'
            
            [varargout{1},varargout{2},varargout{3}] = feval(varargin{1},varargin{2:end});
            
    end

end

% Fonction calcul_frequences_caracteres (exercice_0.m) --------------------
function frequences = calcul_frequences_caracteres(texte,alphabet)
    % Note : initialiser le vecteur avec 'size(alphabet)' pour garder la bonne orientation
   frequences=zeros(size(alphabet));
    for i=1:length(alphabet)
        frequences(i)=length(find(texte==alphabet(i)))/length(texte);
    end


end

% Fonction recuperation_caracteres_presents (exercice_0.m) ----------------
function [selection_frequences,selection_alphabet] = ...
                      recuperation_caracteres_presents(frequences,alphabet) 

indices=find(frequences>0);
selection_alphabet=alphabet(indices);
selection_frequences=frequences(indices);
end

% Fonction tri_decremental_frequences (exercice_0.m) ----------------------
function [frequences_triees,indices_frequences_triees] = ...
                           tri_decroissant_frequences(selection_frequences)
[frequences_triees,indices_frequences_triees]=sort(selection_frequences,'descend');
end

% Fonction determination_langue (exercice_1.m) ----------------------------
function indice_langue = determination_langue(frequences_texte, frequences_langue, nom_norme)
    % Note : la variable nom_norme peut valoir 'L1', 'L2' ou 'Linf'.
    switch nom_norme
        case {'L1'}
             [~,indice_langue]=min(sum((frequences_texte-frequences_langue).^2,2));
        case {'L2'}
           [~,indice_langue]=min(sum(abs(frequences_texte-frequences_langue),2)) ;
        case {'Linf'}
            [~,indice_langue]=min(max(abs(frequences_texte-frequences_langue)'));
    end
end

% Fonction coeff_compression (exercice_2.m) -------------------------------
function coeff_comp = coeff_compression(signal_non_encode,signal_encode)
coeff_comp=(length(signal_encode)/length(signal_non_encode))*8
end

% Fonction coeff_compression (exercice_2bis.m) -------------------------------
function gain_comp = gain_compression(coeff_comp_avant,coeff_comp_apres)
gain_comp=coeff_comp_apres/coeff_comp_avant
end

% Fonction partitionnement_frequences (exercice_3.m) ----------------------
function bornes = partitionnement_frequences(selection_frequences)
[m,n]=size(selection_frequences)
bornes=zeros(2,m);
bornes(1,1)=0;
bornes(2,1)=selection_frequences(1);
bornes
for i=2:(m)
    bornes(1,i)=selection_frequences(i)+bornes(1,i-1);
    bornes(2,i)=selection_frequences(i)+bornes(2,i-1);
    bornes
end
end

% Fonction codage_arithmetique (exercice_3.m) -----------------------------
function [borne_inf,borne_sup] = ...
                       codage_arithmetique(texte,selection_alphabet,bornes)
                   
borne_inf=0
borne_sup=1
largeur=borne_sup-borne_inf
for i=1:size(texte)
    largeur=borne_sup-borne_inf
    j=find(selection_alphabet=='texte(i)')
    borne_sup=borne_inf+largeur*bornes(2,j)
    borne_inf=borne_inf+largeur*bornes(1,j)
end 


    
end