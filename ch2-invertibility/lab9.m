addpath('../common');

a = [ 2+3i 7-8i; 5-i 2 ];
b = [ i 1; 0 -i ];

avar = var( 'a', a );
bvar = var( 'b', b );

begin_exercise ( '1(a)' );
    disp( ctranspose(a) );
end_exercise ();

begin_exercise ( '1(b)' );
    ctcta = ctranspose(ctranspose(a));
    alpha = var( 'ct(ct(a))', ctcta );
    check_equality ( alpha, avar );
end_exercise ();

begin_exercise ( '1(c)' );
    alpha = var ( 'ct(a+b)', ctranspose ( a + b ) );
    beta  = var ( 'ct(a)+ct(b)', ctranspose ( a ) + ctranspose ( b ) );
    check_equality ( alpha, beta );
end_exercise ();

begin_exercise ( '1(d)' );
    alpha = var ( 'ct(ab)', ctranspose ( a * b ) );
    beta  = var ( 'ct(a)ct(b)', ctranspose (a) * ctranspose (b) );
    check_equality ( alpha, beta );
end_exercise ();

% part 2

begin_exercise ( '2(a)' );
    disp( eig ( [ 2 0; 0 3 ] ) );
    disp( eig ( eye(2) ) );
end_exercise ();

begin_exercise ( '2(c)' );
    m = [ 1 4; 2 3 ];
    disp ( eig ( m ) );
    disp ( eig ( m' ) );
end_exercise ();

begin_exercise ( '2(d)' );
    m = [ 1 -i; 2i i ];
    disp ( eig (m) );
    disp ( eig (ctranspose(m)) );
end_exercise ();

begin_exercise ( '2(e)' );
    h = [ 1     2 - i;
          2 + i 1      ];
    alpha = var ( 'h', h );
    beta  = var ( 'ct(h)', ctranspose(h) );

    print_variable( alpha.label, alpha.value );
    print_variable( beta.label, beta.value );
    
    check_equality ( alpha, beta );
end_exercise ();
