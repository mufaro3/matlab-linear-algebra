addpath('../common');

a = [ 2 2 0; 2 1 0; 0 1 -2 ];

begin_exercise ( '1(b/c)' );
    e1 = [ 1/2 0 0; 0 1 0; 0 0 1 ];
    e2 = [ 1 0 0; -2 1 0; 0 0 1 ];
    e3 = [ 1 0 0; 0 1 0; 0 1 1 ];
    e4 = [ 1 1 0; 0 1 0; 0 0 1 ];
    e5 = [ 1 0 0; 0 -1 0; 0 0 1 ];
    e6 = [ 1 0 0; 0 1 0; 0 0 -1/2 ];

    alpha = var( 'e5 * .. * a',
                 e6 * e5 * e4 * e3 * e2 * e1 * a );
    beta  = var( 'I', eye(3) );
    
    check_equality ( alpha, beta );
end_exercise ();

begin_exercise ( '1(d)' );
    E = e6 * e5 * e4 * e3 * e2 * e1;

    alpha = var ( 'inv(E)', inv(E) );
    beta  = var ( 'a', a );

    check_equality ( alpha, beta );
end_exercise();

% part 2

begin_exercise ( '2(a)' );
    a=[1 2 0; 0 1 3; 1 2 6];
    b=[7; 10; 0];
    disp( inv(a) );
    disp( inv(a)*b );
end_exercise ();
