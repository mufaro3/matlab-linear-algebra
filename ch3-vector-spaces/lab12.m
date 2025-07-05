addpath( '../common' );

a = [1 2; 2 4];
b = [1 2 3; 4 5 6; 0 1 2];
m = [1 0 5 0; 0 1 3 -1; -2 0 1 4];

begin_exercise( '2(a-b)' );
    print_variable( 'null(a)', null(a) );
    print_variable( 'null(b)', null(b) );
end_exercise ();

begin_exercise('2(d)');
    null_at = null(a');
    null_bt = null(b');

    alpha = var( 'null(a)', null(a) );
    beta  = var( 'null(b)', null(b) );
    gamma = var( 'null(aT)', null_at );
    delta = var( 'null(bT)', null_bt );
    
    print_variable( 'null(aT)', null_at );
    print_variable( 'null(bT)', null_bt );

    check_equality(alpha, gamma);
    check_equality(beta, delta);
end_exercise();

begin_exercise('2(e)');
    print_variable( 'null(m)', null(m) );
end_exercise();
