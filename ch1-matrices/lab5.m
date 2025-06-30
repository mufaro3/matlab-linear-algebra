addpath('../common');

% section 2 - determinants

a = [ 2 2 0; 2 1 0; 0 1 -2 ];
b = [ 2 4; 4 8 ];
m = [ 1 2 3; 0 5 6; 7 8 9 ];
p = [ 1 4; 2 5 ];
v = [ 1 0 0; 4 3 0; 0 0 2 ];
w = [ 5 0 0; 0 4 0; 0 0 -1 ];

begin_exercise ( '2(a)' );
    print_variable ( 'det(a)', det(a) );
    print_variable ( 'det(a^-1)', det(inv(a)) );
    % det(a^-1) = det(a)/8
end_exercise ();

begin_exercise ( '2(b)' );
    print_variable ( 'det(b)', det(b) );
    % print_variable ( 'inv(b)', inv(b) );
    % b is not invertible, det(b) == 0
end_exercise ();

begin_exercise ( '2(c)' );
    print_variable ( 'det(I-2)', det(eye(2)) );
    print_variable ( 'det(I-3)', det(eye(3)) );
    % det ( I-n ) = 1 for all n
end_exercise ();

begin_exercise ( '2(d)' );
    print_variable ( 'det(aT)', det(a') );
    % det ( aT ) = det( a )
end_exercise ();

begin_exercise ( '2(e)' );
    % they're all multiples of the original det
    print_variable ( 'det(2A)/det(A)', det( 2 * a ) / det( a ) );
    print_variable ( 'det(2P)/det(P)', det( 2 * p ) / det( p ) );
    print_variable ( 'det(3A)/det(A)', det( 3 * a ) / det( a ) );
    print_variable ( 'det(3P)/det(P)', det( 3 * p ) / det( p ) );
end_exercise ();

begin_exercise ( '2(f)' );
    alpha = var ( 'det(AM)', det( a * m ) );
    beta  = var ( 'det(MA)', det( m * a ) );
    check_equality ( alpha, beta );
end_exercise ();

begin_exercise ( '2(g)' );
    alpha = var ( 'det (A + M)', det ( a + m ) );
    beta  = var ( 'det (M + A)', det ( m + a ) );
    check_equality ( alpha, beta );
end_exercise ();

begin_exercise ( '2(h)' );
    alpha = var ( 'det (A + M)', det( a + m ) );
    beta  = var ( 'det A + det M', det(a) + det(m) );
    check_equality ( alpha, beta );
end_exercise ();

begin_exercise ( '2(i)' );
    print_variable ( 'det(V)', det(v) );
    % det v is just the product of the main diagonal
    print_variable ( 'det(W)', det(w) );
    % det W is just the product of the main diagonal

    % the determinant of a triangular matrix is just the product of the main diagonal
end_exercise ();

begin_exercise ( '2(j)' );
    alpha = var ( 'first eq', ( trace(p) ^ 2 - trace(mpower(p, 2))) / 2 );
    beta  = var ( 'second eq', ( trace(m) ^ 3 - 3 * trace(mpower(m, 2)) * trace(m) + 2 * trace(mpower(m, 3)) )/6 );
    pdet = var ( 'det(p)', det (p) );
    mdet = var ( 'det(m)', det (m) );
    check_equality ( alpha, pdet );
    check_equality ( beta,  mdet );
end_exercise ();

% part 3 - determinants of elementary matrices as they relate to blah blah

e1 = [ 1/2 0; 0 1 ];
e2 = [ 1 0; -4 1 ];
e3 = [ 0 1 0; 1 0 0; 0 0 1 ];

begin_exercise ( '3(a,b,c)' );
    print_variable ( 'det(e1)', det(e1) );
    print_variable ( 'det(e2)', det(e2) );
    print_variable ( 'det(e3)', det(e3) );
end_exercise ();

% theorems

alpha = var ( 'det(AM)', det (a * m) );
beta  = var ( 'det(A) * det(M)', det( a ) * det( m ) );

check_equality ( alpha, beta );
