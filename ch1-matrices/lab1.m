% intro
a = [1 2 3;
     4 5 6];
disp( size ( a ) );

% exercise 1a
b = [3 4;
     6 7;
     9 10];

% exercise 1b
disp ( size( b ) );

% exercise 1c
%
% The dimensions of a matrix, the (rows and columns), tell
% you how tall (rows) and wide (columns) the matrix is.

% exercise 2a

% The correct code would be:
%
%   disp ( a + b );
%
% but this is incorrect because a and b have different
% matrix sizes: (2,3) and (3,2).

% exercise 2b
m = [4 5 1; -1 3 2];
disp ( 'a + m' );
disp ( a + m );
disp ( 'm + a' );
disp ( m + a );

fprintf( '\n' );

% verdict: as a + m = m + a, matrix addition is
%          commutative.

% exercise 2c

% The addition of two matrices is based on
% adding like indices together (which is why
% the two input dimensions must be equal and
% the output dimension will be equal to both
% input dimensions).

% 3 - scalar multiplication

% exercise 3a

disp( '3 * a' );
disp( 3 * a );

disp( 'a * 3' );
disp( a * 3 );

fprintf( '\n' );

% verdict: 3 * a = a * 3

% 4 - matrix multiplication

% 4a
disp( 'a * b' );
disp( a * b );
disp( 'b * a' );
disp( b * a );
fprintf( '\n' );

% matrix multiplication is not commutative

% 3 - transpose

% exercise 3a

a_t = a';
disp( 'transposed a:' );
disp( a_t );

fprintf( '\n' );

% exercise 3b
% dimensions: 3x2

% exercise 3c

disp( (a')' );
% (aT)T = a

fprintf( '\n' );

% exercise 3d
disp( '(a + m)T' );
disp( (a + m)' );
disp( 'aT + mT' );
disp( a' + m' );
fprintf( '\n' );

% yes, (a+m)T = aT + mT

% exercise 3e

disp( '(a*b)T' );
disp( (a*b)' );
disp( 'aT * bT' );
disp( a' * b' );
fprintf( '\n' );

% exercise 3f

% (a*b)T != aT * bT

disp( 'bT * aT' );
disp( b' * a' );
fprintf( '\n' );

% bT * aT = (a*b)T

% exercise 3g

disp( '(3*a)T' );
disp( (3*a)' );
fprintf( '\n' );

% this would be equal to 3*aT

% exercise 3h

% 1. (a*b)T = bT * aT
% 2. for scalar s, (s*a)T = s*aT
% 3. (a+b)T = aT + bT
% 4. (aT)T = a

% 4 - trace

% definitions

u = [1 2  3;
     4 5  0;
     0 2 -1];
v = [1 0  0;
     4 3  0;
     0 0  2];

% exercise 4a

fprintf( 'trace(u)=%4.2f\n',   trace(u) );
fprintf( 'trace(v)=%4.2f\n\n', trace(v) );

% exercise 4b

fprintf( 'trace(u)+trace(v)=%4.2f\n',   trace(u)+trace(v) );
fprintf( 'trace(u+v)=%4.2f\n\n',        trace(u+v) );

% tr(u)+tr(v)=tr(u+v)

% exercise 4c

fprintf( 'trace(uT)=%4.2f\n\n', trace(u') );

% tr(uT) = tr(u)

% exercise 4d

fprintf( 'trace(u)*trace(v)=%4.2f\n',   trace(u)*trace(v) );
fprintf( 'trace(u*v)=%4.2f\n\n',        trace(u*v) );

% tr(u)*tr(v) != tr(u*v)

% exercise 4e

fprintf( 'trace(v*u)=%4.2f\n\n', trace(v*u) );
% tr(u*v) = tr(v*u)
