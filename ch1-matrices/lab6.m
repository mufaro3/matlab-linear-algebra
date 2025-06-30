addpath('../common');

% lab 6 - determinants and beyond

a = [ 1 1 0 0;
      1 2 1 0;
      2 1 3 1;
      0 0 1 4 ];

% part 1
disp( det(a) );

b = [ 1 1 0 0;
      0 1 1 0;
      0 -1 3 1;
      0 0 1 4 ];
p = [ 1 1 0 0;
      0 1 1 0;
      0 0 1 4;
      0 0 0 -15 ];
print_variable( 'det(b)', det(b) );
print_variable( 'det(p)', det(p) );
