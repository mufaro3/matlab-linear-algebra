% part 1 - identity matrix and REF/RREF 

% exercise 1a

disp( eye(4) );
fprintf( "\n" );

% exercise 1b

a = [ 2 5 7; 4 2 10 ];
disp( 'a' );
disp( a );
fprintf( '\n' );

% exercise 1c

disp( 'rref(a)' );
disp( rref(a) );
fprintf( '\n' );

% part 2 - matrix operations

i2 = eye(2);
e1 = [ 0 1; 1 0 ];
e2 = [ 1 0; 0 -1/8 ];
e3 = [ 1 0; -2 1 ];

a2 = [ 2 5; 4 2 ];

disp( 'a' );
disp( a2 );

% exercise 2a

% this matrix swapped the bottom and top rows

disp( 'e1 * a' );
disp( e1 * a2  );
fprintf( '\n' );

% exercise 2b

% this matrix multiplied the bottom row by -1/8 

disp( 'e2 * a' );
disp( e2 * a2  );
fprintf( '\n' );

% exercise 2c

% i genuinely cannot tell how they are related.

disp( 'e3 * a' );
disp( e3 * a2  );
fprintf( '\n' );

% exercise 2d

e4 = [ 1 -5; 0 1 ];
e5 = [ 1/2 0; 0 1 ];

% this produces an identity matrix of size 2

disp( 'e5 * e4 * e2 * e3 * a' );
disp( e5 * e4 * e2 * e3 * a2 );
fprintf( '\n' );

% exercise 2e

b = [ 7; 10 ];

disp( 'b' );
disp( b );

% this solved the system for the values of x and y

disp( 'e5 * e4 * e2 * e3 * b' );
disp( e5 * e4 * e2 * e3 * b );
fprintf ( '\n' );

% exercise 2f

b2 = [ 9; 10 ];

disp( 'solution to b2' );
disp( e5 * e4 * e2 * e3 * b2 );
fprintf( '\n' );

% exercise 2g

% see companion latex document

m = [ 1 2 0; 
      0 0 3; 
      0 1 0 ];
eswap = [ 1 0 0; 
          0 0 1; 
          0 1 0 ];
ediv  = [ 1 0 0; 
          0 1 0; 
          0 0 1/3 ];
eadd  = [ 1 -2 0; 
          0  1 0; 
          0  0 1  ];

disp( 'result:' );
disp( ediv * eadd * eswap * m );
fprintf( '\n' );

% exercise 2h

b = [ 4; 6; 8 ];

disp( 'solution' );
disp( ediv * eadd * eswap * b );
fprintf( '\n' );

% exercise 2i

m = [ 1 2 0; 0 1 3; 0 2 6; ]
disp( 'rref(m)' );
disp( rref(m) );
fprintf( '\n' );

% exercise 2j

system = [ 1 2 0 4; 0 1 3 6; 0 2 6 12 ];
disp( 'system' );
disp( system );
disp( 'rref(system)' );
disp( rref(system) );
fprintf('\n');


