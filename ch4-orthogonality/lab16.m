addpath('../common');

u=[3 2]
v=[2 0]
w=[0 2]

dot(u,v)

norm(u)

k=1/2
norm(k*v)

% gram-schmidt
begin_exercise('gram schmidt');

% projection of b onto a
function [outputvector] = proj(a,b)
    outputvector = (dot(a,b)/(norm(a)^2))*a;
end

function [unitvec] = unitnorm(a)
    unitvec = a/norm(a);
end

function [orthos] = gs(inputvecs)
    n = length(inputvecs);
    mat=zeros(n,n);
    for i=1:n
        if length(inputvecs{i}) ~= n
            error('incorrect vector set dimensions, vectors are not of size n');
        else
            mat(i,:) = inputvecs{i};
        end
    end
    
    if det(mat) == 0
        error('input vectors are not linearly independent');
    end

    bases = cell(1,n);
    orthos = cell(1,n);
    
    bases{1} = inputvecs{1};
    orthos{1} = unitnorm(inputvecs{1});
    
    for i = 2:n
        projsum = zeros(1, n);
        for j = 1:i-1
            projsum = projsum + proj(bases{j}, inputvecs{i});
        end
        bases{i}  = inputvecs{i} - projsum;
        orthos{i} = unitnorm(bases{i});
    end
end

disp( gs({ [1 2 2], [4 5 6], [8 9 1] }) );

end_exercise();
