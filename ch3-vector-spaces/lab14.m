addpath('../common');

function lab14 ()
end

a = [1 2 3; 0 5 6; 0 0 0];
b = [1 2 3; 0 5 6; 0 0 5];
m = [1 2; 2 4];

begin_exercise('1(a)');
    print_variable('eig(A)', eig(a));
    print_variable('eig(B)', eig(b));
    print_variable('eig(M)', eig(m));
end_exercise();

function linearly_independent (name, value)
    if det(value) == 0
        fprintf('%s is linearly dependent\n', name);
    else
        fprintf('%s is linearly independent\n', name);
    end
end

begin_exercise('1(c)');
    [vb,eb]=eig(b);
    print_variable('eigenvectors of b', vb);
    linearly_independent('eigenvectors of b', vb);
    [vm,em]=eig(m);
    print_variable('eigenvectors of m', vm);
    linearly_independent('eigenvectors of m', vm);
end_exercise();

begin_exercise('1(h-i)');
    print_variable('poly(b)', poly(b));
    print_variable('roots(poly(b))', roots(poly(b)));
end_exercise();

begin_exercise('1(j)');
    print_variable('p(B)', mpower(b,3)-11*mpower(b,2)+35*b-25*eye(3));
end_exercise();

begin_exercise('Cayley-Hamilton');
     ch = var( 'CAYLEY-HAMILTON B INVERSE', (1/det(b))*(mpower(b,2)-11*b+35*eye(3)) );
     binv = var( 'b^-1', inv(b) );
     check_equality(ch, binv);
end_exercise();
