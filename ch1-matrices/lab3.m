addpath('../common')

function lab3 ()
    % do nothing
end

% lab 3 - powers, inverses, special matrices
% part 1 - powers

a = [ 1 2  0;
      2 1  0;
      0 1 -2 ];
b = [ 1 -1;
      9  3;
      0  4 ];
m = [ 1 2 3;
      0 5 6;
      7 8 9 ];
p = [ 1 4 0;
      2 5 0;
      3 6 0 ];

begin_exercise ( '1(a)' );
    print_variable ( 'a^2 (a*a)', a^2 );

    a_sq = a;
    for r = 1:3;
        for c = 1:3;
            a_sq(r,c) = a(r,c) * a(r,c);
        end;
    end;

    print_variable ( 'all entries of a, squared', a_sq );
end_exercise ();

begin_exercise ( '1(b)' );
    % print_variable ( 'b^2 (b*b)', b^2 );
    % does not work because (3x2) * (3x2) -> rows != cols
end_exercise ();

begin_exercise ( '1(c)' );
    print_variable ( 'a^0', mpower(a, 0) );
    % its the identity matrix
end_exercise ();

begin_exercise ( '1(d)' );
    fi = @(varargin)varargin{length(varargin)-varargin{1}};

    % example values 
    r = 3;
    s = 5;

    % addition

    individual = mpower(a,r) * mpower(a,s);
    combined   = mpower(a,r+s); 

    fprintf( 'VERDICT: A^r * A^s is %s to A^(r+s)\n', 
             fi( isequal(individual,combined), 'EQUAL', 'NOT EQUAL' ) );

    % multiplication
    
    mult_indiv = mpower(mpower(a,r),s);
    mult_combd = mpower(a,r*s);

    fprintf( 'VERDICT: (A^r)^s is %s to A^(r*s)\n',
             fi( isequal(mult_indiv, mult_combd), 'EQUAL', 'NOT EQUAL' ));
end_exercise ();

% section 2 - inverses

begin_exercise ( '2(a)' );
    a_inv = inv ( a );
    print_variable ( 'a_inv', a_inv );
    print_variable ( 'a * a_inv', a * a_inv );
    print_variable ( 'a_inv * a', a_inv * a );
    % identity matrices
end_exercise ();

begin_exercise ( '2(b)' );
    print_variable ( '(A^-1)^-1', inv( a_inv ) );
    % its just A
end_exercise ();

begin_exercise ( '2(c)' );
    alpha = var( '(AM)^-1',     inv( a * m ));
    beta  = var( '(MA)^-1',     inv( m * a ));
    gamma = var( 'A^-1 * M^-1', inv( a ) * inv( m ));
    delta = var( 'M^-1 * A^-1', inv( m ) * inv( a ));

    check_equality(alpha, beta);
    check_equality(alpha, gamma);
    check_equality(alpha, delta);
    check_equality(beta,  gamma);
    check_equality(beta,  delta);
    check_equality(gamma, delta);
end_exercise ();

begin_exercise ( '2(d)' );
    alpha = var( '(A^T)^-1', inv( a' ) );
    beta  = var( '(A^-1)^T',  (inv( a ))' );
    check_equality( alpha, beta );

    alpha = var( '((AM)^T)^-1', inv( (a * m)' ) );
    beta  = var( '((MA)^T)^-1', inv( (m * a)' ) );
    delta = var( '(A^-1)^T * (M^-1)^T', inv( a )' * inv( m )' );
    gamma = var( '(M^-1)^T * (A^-1)^T', inv( m )' * inv( a )' );
    check_equality(alpha, beta);
    check_equality(alpha, gamma);
    check_equality(alpha, delta);
    check_equality(beta,  gamma);
    check_equality(beta,  delta);
    check_equality(gamma, delta);    
end_exercise ();

begin_exercise ( '2(e)' );
    % print_variable ( 'P^-1', inv(p) );
    % P isn't invertible because of the column of 0s along its right edge
end_exercise ();

% part 3 - special matrices

begin_exercise ( '3(b)' );
    q = [ 1 0; 2 3 ];
    print_variable ( 'q^-1', inv(q) );
end_exercise ();
