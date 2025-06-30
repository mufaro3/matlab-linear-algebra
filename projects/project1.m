n=1;
table=zeros(5,5);
for i=1:5
    for j=1:5
        table(i,j)=n;
        n=n+1;
    end;
end;
n=1;

adj=zeros(25,25);
for i=1:5
    for j=1:5
        n = table(i,j);
        if i > 1
            adj(n, table(i-1,j)) = 1;
        end
        if j > 1
            adj(n, table(i,j-1)) = 1;
        end
        if i < 5
            adj(n, table(i+1,j)) = 1;
        end
        if j < 5
            adj(n, table(i,j+1)) = 1;
        end
    end
end

state = ones(25,1);
state
