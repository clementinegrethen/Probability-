function image_RVB = ecriture_RVB(image_originale)
    image_B=image_originale(2:2:end,1:2:end)
    image_R=image_originale(1:2:end,2:2:end)
    image_v1=image_originale(1:2:end,1:2:end)
    image_v2=image_originale(2:2:end,2:2:end)
    image_V=(image_v1+image_v2)/2
    image_RVB=cat(3,image_R,image_V,image_B)
end