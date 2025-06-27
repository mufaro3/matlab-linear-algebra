addpath('../common');

% lab 4 - graph theory

% section 1

begin_exercise ('1(a)');
    a = [ 0 1 1 1; 
          1 0 0 1; 
          1 0 0 1; 
          1 1 1 0; ];
    print_variable ( 'a', a );
end_exercise ();

% a is symmetric

% graph() does not exist in octave

begin_exercise ( '1(e)' );
    a_sq = mpower(a,2);
    print_variable( 'a^2', a_sq );
    print_variable( '2-step paths between 1 and 4', a_sq(1,4) );
end_exercise ();

% lab4.m - part 2: Ghanaian hospitals

%% --- FUNCTION DEFINITIONS --- %%
function out = make_city(name, population, status, connections)
    out = struct(
        'name',        name,
        'population',  population,
        'status',      status,
        'connections', connections
    );
end

function index = cities_get_index_by_name(cities, name)
    index = -1;
    for i = 1:length(cities)
        if strcmp(name, cities(i).name)
            index = i;
            return;
        end
    end
end

% Status constants
WHITE = 0; % has a hospital
BLACK = 1; % can obtain a hospital but doesn't currently have one
GRAY  = 2; % will not get a hospital

% City data
conn_wa   = {{ 'Sawla', 'Damago', 'Tumu' }};
conn_tumu = {{ 'Wa', 'Bolgatanga' }};
conn_bolg = {{ 'Tumu', 'Tamale' }};
conn_salw = {{ 'Wa', 'Techiman' }};
conn_dama = {{ 'Wa', 'Tamale' }};
conn_tama = {{ 'Damago', 'Bolgatanga' }};
conn_tech = {{ 'Sawla', 'Sunyani' }};
conn_ho   = {{ 'Dumbai', 'Accra' }};
conn_suny = {{ 'Techiman', 'Kumasi' }};
conn_agog = {{ 'Kumasi' }};
conn_accr = {{ 'Ho', 'Cape Coast' }};
conn_kuma = {{ 'Sunyani', 'Agoga' }};
conn_dumb = {{ 'Tamale', 'Ho' }};
conn_cape = {{ 'Accra' }}; 

cities(1)  = make_city('Wa',          2, GRAY,  conn_wa   );
cities(2)  = make_city('Tumu',        1, GRAY,  conn_tumu );
cities(3)  = make_city('Bolgatanga',  3, GRAY,  conn_bolg );
cities(4)  = make_city('Sawla',       4, GRAY,  conn_salw );
cities(5)  = make_city('Damago',      8, BLACK, conn_dama );
cities(6)  = make_city('Tamale',      5, GRAY,  conn_tama );
cities(7)  = make_city('Techiman',   12, WHITE, conn_tech );
cities(8)  = make_city('Ho',          7, GRAY,  conn_ho   );
cities(9)  = make_city('Sunyani',    10, BLACK, conn_suny );
cities(10) = make_city('Agoga',       6, GRAY,  conn_agog );
cities(11) = make_city('Accra',      13, WHITE, conn_accr );
cities(12) = make_city('Kumasi',     11, BLACK, conn_kuma );
cities(13) = make_city('Dumbai',      9, BLACK, conn_dumb );
cities(14) = make_city('Cape Coast', 14, WHITE, conn_cape );

% Initialize adjacency matrix
ghana = zeros(length(cities), length(cities));

% Fill adjacency matrix
for i = 1:length(cities)
    city = cities(i);
    for n = 1:length(city.connections)
        connection_name = city.connections{n};
        j = cities_get_index_by_name(cities, connection_name);
        if j == -1
            fprintf("ERR: Connection '%s' not found from city '%s'\n", connection_name, city.name);
        else
            ghana(i, j) = 1;
        end
    end
end

% Print result matrix
print_variable( 'ghana', ghana );
print_variable( 'ghana, rank 2', mpower(ghana, 2) );
print_variable( 'ghana, rank 3', mpower(ghana, 3) );

% the following 2 exercises are shamelessly stolen
% from ChatGPT because I had absolutely no fucking
% clue what was going on on this problem.

begin_exercise ( '2(a)' );
    hospital_mask = [cities.status] == WHITE;
    adj_1 = ghana;          % direct connection
    adj_2 = ghana^2;        % 2-hop connections

    reachable = (adj_1 | adj_2);  % reachable in <= 2 steps

    for i = 1:numel(cities)
        if cities(i).status ~= WHITE
            can_reach = false;
            for j = 1:numel(cities)
                if hospital_mask(j) && reachable(i,j)
                    can_reach = true;
                    break;
                end
            end
            if ~can_reach
                fprintf("%s cannot reach a hospital in 2 steps.\n", cities(i).name);
            end
        end
    end
end_exercise ();

begin_exercise ( '2(b)' );
    black_ids = find([cities.status] == BLACK);
    best_combo = [];

    for k = 1:length(black_ids)
        combos = nchoosek(black_ids, k);
        for c = 1:size(combos, 1)
            test_status = [cities.status];
            test_status(combos(c, :)) = WHITE;

            hospital_mask = test_status == WHITE;
            reachable = (ghana | ghana^2);
            all_reachable = true;

            for i = 1:numel(cities)
                if test_status(i) ~= WHITE
                    reachable_to_hosp = any(hospital_mask & reachable(i,:));
                    if ~reachable_to_hosp
                        all_reachable = false;
                        break;
                    end
                end
            end

            if all_reachable
                best_combo = combos(c,:);
                break;
            end
        end
        if ~isempty(best_combo)
            break;
        end
    end

    if ~isempty(best_combo)
        fprintf("Minimum hospitals needed: %d\n", length(best_combo));
        fprintf("Place hospitals in: ");
        for i = 1:length(best_combo)
            fprintf("%s ", cities(best_combo(i)).name);
        end
        fprintf("\n");
    else
        fprintf("No combination found.\n");
    end
end_exercise ();
