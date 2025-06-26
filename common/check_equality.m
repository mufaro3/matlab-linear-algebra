function check_equality ( a, b )
    if norm(a.value - b.value, 'fro') < 1e-12
        fprintf ( '%s EQUALS %s\n', a.label, b.label );
    else
        fprintf( '%s DOES NOT EQUAL %s\n', a.label, b.label );
    end
end
