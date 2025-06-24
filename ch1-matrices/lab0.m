% exercise 1a
table1 = zeros(1,6)
for i = 1:6
    table1(i) = 4 * i;
end;
disp( table1 );
fprintf( '\n' );

% exercise 1b
disp( table1(5) );
fprintf( '\n' );

% exercise 1c
a1 = zeros(5);
for i = 1:5
    a1(i,i) = 1;
end;
disp( a1 );
fprintf( '\n' );

% exercise 2a
a2 = zeros(5);
for j = 1:5
    for i = 1:5
        a2(i,i) = 1;
        if i < j
            a2(i,j) = 2;
        end;
    end;
end;
disp( a2 );
fprintf( '\n' );

% exercise 2b
a3 = zeros(5);
for i = 1:5
    for j = 1:5
        if i == 1 || j == 1
            a3(i,j) = 1;
        end;
    end;
end;
disp ( a3 );
fprintf( '\n' );

