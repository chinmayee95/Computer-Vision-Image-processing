function [error] = match_codewords(vocab_img,husky3)
    error = 0.0;
    for j=1:8
        error = error + abs(vocab_img(j)-husky3(j));
    end
    error =error/8.0;
    
end

