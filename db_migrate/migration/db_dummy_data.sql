\echo ' -- INSERTING DUMMY DATA -- '
SET search_path = :schema, 'public';

\echo ' -- INSERTING UTILIZADORES -- '
INSERT INTO utilizadores(username, password, email)
VALUES ('User1', 'sha1$c69c46e3$1$201b71a64042e843303f479dd4d1e48ff84665ee', 'User1@gmail.com');

INSERT INTO utilizadores(username, password, email)
VALUES ('User2', 'sha1$ae3e8362$1$51fe1a9d68dfdcfc9e547a3db5d61b05ae724375', 'User2@gmail.com');

INSERT INTO utilizadores(username, password, email)
VALUES ('User3', 'sha1$a41bbc2c$1$76750d6ce2043a034acad3c6d8c715deb00e51f2', 'User3@gmail.com');

INSERT INTO utilizadores(username, password, email)
VALUES ('User4', 'sha1$0e2d313b$1$76816dab358ddce9cd40f2f0ede3e83387db5ec1', 'User4@gmail.com');

\echo ' -- DONE INSERTING UTILIZADORES -- '

\echo ' -- INSERTING PERCURSOS -- '

INSERT INTO percursos(geom, nome, descricao, id_utilizador)
VALUES (
	ST_SetSRID(
		ST_MakeLine(ARRAY[	
			ST_MakePoint(-7.74401324200568, 41.2961235262365),
			ST_MakePoint(-7.74384896858675, 41.2970011741126),
			ST_MakePoint(-7.74359343215729, 41.2973302890216),
			ST_MakePoint(-7.74257128643948, 41.297645689251),
			ST_MakePoint(-7.74165865633429, 41.2980159397482),
			ST_MakePoint(-7.74161986955482, 41.2980313668066),
			ST_MakePoint(-7.74194385324216, 41.2981205008506),
			ST_MakePoint(-7.74256444171369, 41.2983296225525),
			ST_MakePoint(-7.74265114157369, 41.2983639047348),
			ST_MakePoint(-7.74236366309055, 41.2986210205273),
			ST_MakePoint(-7.74199861104847, 41.298980980934),
			ST_MakePoint(-7.74184346393059, 41.2992552351485),
			ST_MakePoint(-7.74178870612428, 41.2994129307996),
			ST_MakePoint(-7.74199861104847, 41.2994129307996),
			ST_MakePoint(-7.74242754719791, 41.2990426882328),
			ST_MakePoint(-7.74280172554104, 41.2988095714643),
			ST_MakePoint(-7.7430755145726, 41.2986175923234),
			ST_MakePoint(-7.74358658743151, 41.2987478639449),
			ST_MakePoint(-7.74371663722151, 41.2987581485355),
			ST_MakePoint(-7.7438649396136, 41.2987410075502),
			ST_MakePoint(-7.74404518405938, 41.2987221524613)])
		,4326), 
	'PercurosoTeste1', 
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
	sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
	Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
	nisi ut aliquip ex ea commodo consequat. 
	Duis aute irure dolor in reprehenderit in voluptate velit esse cillum 
	dolore eu fugiat nulla pariatur. 
	Excepteur sint occaecat cupidatat non proident, sunt in culpa qui 
	officia deserunt mollit anim id est laborum.', 
	1);

INSERT INTO percursos(geom, nome, descricao, id_utilizador)
VALUES (
	ST_SetSRID(
		ST_MakeLine(ARRAY[
			ST_MakePoint(-7.74499431936878, 41.2966669150834),
			ST_MakePoint(-7.74476616184248, 41.2971125934083),
			ST_MakePoint(-7.74468402513301, 41.2973182900697),
			ST_MakePoint(-7.74468402513301, 41.2974828469317),
			ST_MakePoint(-7.74453800431618, 41.2977159684422),
			ST_MakePoint(-7.74441023610145, 41.2980382232759),
			ST_MakePoint(-7.74422771008041, 41.2984221844032),
			ST_MakePoint(-7.74407256296253, 41.2986553025564),
			ST_MakePoint(-7.74378052132887, 41.2991832435288),
			ST_MakePoint(-7.74352498489941, 41.2996426172615),
			ST_MakePoint(-7.74326944846996, 41.3001225565111),
			ST_MakePoint(-7.74306866984681, 41.300040281462),
			ST_MakePoint(-7.74268536520263, 41.2999031561495),
			ST_MakePoint(-7.74232031316055, 41.2997797431218),
			ST_MakePoint(-7.74198264002163, 41.2996151920548),
			ST_MakePoint(-7.74181836660269, 41.2995603416069),
			ST_MakePoint(-7.74154457757113, 41.3000471377201),
			ST_MakePoint(-7.7413985567543, 41.3003213874513)])
		,4326), 
	'PercurosoTeste2', 
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
	sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
	Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
	nisi ut aliquip ex ea commodo consequat. 
	Duis aute irure dolor in reprehenderit in voluptate velit esse cillum 
	dolore eu fugiat nulla pariatur. 
	Excepteur sint occaecat cupidatat non proident, sunt in culpa qui 
	officia deserunt mollit anim id est laborum.', 
	2);

INSERT INTO percursos(geom, nome, descricao, id_utilizador)
VALUES (
	ST_SetSRID(
		ST_MakeLine(ARRAY[		
			ST_MakePoint(-7.74099699950802, 41.3019668616203),
			ST_MakePoint(-7.74077796828277, 41.3033654820208),
			ST_MakePoint(-7.74037641103648, 41.3045172645332),
			ST_MakePoint(-7.74004786419861, 41.3056690267017),
			ST_MakePoint(-7.73993834858599, 41.3062449001571),
			ST_MakePoint(-7.73877018205134, 41.3070675676992),
			ST_MakePoint(-7.73730997388302, 41.3075337413656),
			ST_MakePoint(-7.73555772408104, 41.3084386572035),
			ST_MakePoint(-7.73490975670635, 41.3087437206969),
			ST_MakePoint(-7.73456295726638, 41.308990512591),
			ST_MakePoint(-7.73341304333383, 41.3090453551072),
			ST_MakePoint(-7.73246390802442, 41.3091276187951),
			ST_MakePoint(-7.7314417623066, 41.309264724711),
			ST_MakePoint(-7.73062039521193, 41.309374409236),
			ST_MakePoint(-7.7300180593425, 41.3094978041062),
			ST_MakePoint(-7.72945222867727, 41.309703461704),
			ST_MakePoint(-7.72919669224782, 41.3102655891616),
			ST_MakePoint(-7.72890465061416, 41.3106906091436),
			ST_MakePoint(-7.72841183035735, 41.311047075379),
			ST_MakePoint(-7.72760871586478, 41.3115817710776),
			ST_MakePoint(-7.72720715861849, 41.3117737120535),
			ST_MakePoint(-7.72689686438272, 41.3119656524643),
			ST_MakePoint(-7.72651355973854, 41.3119108124046),
			ST_MakePoint(-7.72598423427753, 41.3117188718323),
			ST_MakePoint(-7.72545490881651, 41.3114446700345),
			ST_MakePoint(-7.72512636197864, 41.3108962629788),
			ST_MakePoint(-7.72514461458075, 41.3101147749536),
			ST_MakePoint(-7.72521762498916, 41.3097857245616),
			ST_MakePoint(-7.72518111978495, 41.3095526461957),
			ST_MakePoint(-7.72474305733446, 41.3094840935766),
			ST_MakePoint(-7.72426848967976, 41.3094840935766),
			ST_MakePoint(-7.72377566942295, 41.3093332775607),
			ST_MakePoint(-7.72300906013458, 41.3092373035509),
			ST_MakePoint(-7.72246148207147, 41.3090727763481),
			ST_MakePoint(-7.72182264099783, 41.3091276187951),
			ST_MakePoint(-7.72129331553681, 41.3094155408853)])
		,4326), 
	'PercurosoTeste3', 
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
	sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
	Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
	nisi ut aliquip ex ea commodo consequat. 
	Duis aute irure dolor in reprehenderit in voluptate velit esse cillum 
	dolore eu fugiat nulla pariatur. 
	Excepteur sint occaecat cupidatat non proident, sunt in culpa qui 
	officia deserunt mollit anim id est laborum.', 
	3);

INSERT INTO percursos(geom, nome, descricao, id_utilizador)
VALUES (
	ST_SetSRID(
		ST_MakeLine(ARRAY[		
			ST_MakePoint(-7.73520179834001, 41.3098542768635),
			ST_MakePoint(-7.73480024109373, 41.3106494782987),
			ST_MakePoint(-7.73439868384744, 41.3119930724769),
			ST_MakePoint(-7.73392411619274, 41.3128430871457),
			ST_MakePoint(-7.73366857976328, 41.3133092195166),
			ST_MakePoint(-7.73260992884125, 41.3130076048337),
			ST_MakePoint(-7.73198934036972, 41.3127882478241),
			ST_MakePoint(-7.73155127791923, 41.3131447025898),
			ST_MakePoint(-7.73129574148977, 41.3136930907311),
			ST_MakePoint(-7.73089418424349, 41.3142140551922),
			ST_MakePoint(-7.72976252291304, 41.3146527588776),
			ST_MakePoint(-7.72815629392789, 41.3158591787883),
			ST_MakePoint(-7.72720715861849, 41.3163252895919),
			ST_MakePoint(-7.72655006494275, 41.3166817250163),
			ST_MakePoint(-7.72505335157023, 41.3167639790682),
			ST_MakePoint(-7.72421373187344, 41.3164075440936),
			ST_MakePoint(-7.72333760697245, 41.316078525464),
			ST_MakePoint(-7.72220594564201, 41.3158591787883),
			ST_MakePoint(-7.72092826349474, 41.3156672498415),
			ST_MakePoint(-7.719395044918, 41.3156124128958),
			ST_MakePoint(-7.71815386797494, 41.3155849944056),
			ST_MakePoint(-7.71727774307395, 41.3155849944056),
			ST_MakePoint(-7.71640161817296, 41.3155849944056),
			ST_MakePoint(-7.71534296725093, 41.3158865971631),
			ST_MakePoint(-7.71406528510366, 41.3165446346991),
			ST_MakePoint(-7.712897118569, 41.3167365610624),
			ST_MakePoint(-7.71143691040069, 41.316626888924),
			ST_MakePoint(-7.70939261896505, 41.3164075440936),
			ST_MakePoint(-7.70837047324723, 41.3162430349864),
			ST_MakePoint(-7.70698327548733, 41.3163527077707),
			ST_MakePoint(-7.70523102568535, 41.3171752477707),
			ST_MakePoint(-7.70384382792545, 41.3188202966303),
			ST_MakePoint(-7.70158050526456, 41.3214522884427),
			ST_MakePoint(-7.70055835954674, 41.3229875679128),
			ST_MakePoint(-7.69993777107521, 41.3226037514362),
			ST_MakePoint(-7.69935368780788, 41.3227134135173),
			ST_MakePoint(-7.69971873984996, 41.3234810429181),
			ST_MakePoint(-7.70052185434253, 41.3241938335508),
			ST_MakePoint(-7.7008504011804, 41.3252355904504),
			ST_MakePoint(-7.70106943240565, 41.3262225026763),
			ST_MakePoint(-7.7008138959762, 41.3266337116921),
			ST_MakePoint(-7.69997427627942, 41.3267433669914),
			ST_MakePoint(-7.69909815137843, 41.3268256083447),
			ST_MakePoint(-7.69833154209006, 41.3270723317819),
			ST_MakePoint(-7.69796649004798, 41.3276206027418),
			ST_MakePoint(-7.69844105770268, 41.328059216188),
			ST_MakePoint(-7.69928067739947, 41.3284430005313),
			ST_MakePoint(-7.6994266982163, 41.328799369683),
			ST_MakePoint(-7.69836804729427, 41.3316228409802),
			ST_MakePoint(-7.69825853168164, 41.3331578808209),
			ST_MakePoint(-7.69920766699105, 41.3344736004663),
			ST_MakePoint(-7.70004728668783, 41.3354329626208),
			ST_MakePoint(-7.7012884636309, 41.336090802789),
			ST_MakePoint(-7.70464694241802, 41.3387220970233),
			ST_MakePoint(-7.7054500569106, 41.3403666019381),
			ST_MakePoint(-7.70585161415688, 41.3420932874078),
			ST_MakePoint(-7.70552306731901, 41.3434636401156),
			ST_MakePoint(-7.70461043721382, 41.3450258070272),
			ST_MakePoint(-7.70300420822867, 41.3465605310053),
			ST_MakePoint(-7.70169002087718, 41.3480130043089),
			ST_MakePoint(-7.70088690638461, 41.3491914022374),
			ST_MakePoint(-7.70143448444773, 41.3525072447476),
			ST_MakePoint(-7.70231060934872, 41.3554666970704),
			ST_MakePoint(-7.7022375989403, 41.3567819660255),
			ST_MakePoint(-7.70187254689822, 41.3585904174421),
			ST_MakePoint(-7.70136147403931, 41.3595220243191),
			ST_MakePoint(-7.7012884636309, 41.3599056232748),
			ST_MakePoint(-7.70387120682861, 41.3597891738308),
			ST_MakePoint(-7.70484772104117, 41.3597206740606),
			ST_MakePoint(-7.70538617280323, 41.3596384742411),
			ST_MakePoint(-7.70613452948949, 41.3595083243146),
			ST_MakePoint(-7.7066273497463, 41.3595631243153),
			ST_MakePoint(-7.70722968561573, 41.3596932741323),
			ST_MakePoint(-7.70766774806623, 41.3599124732356),
			ST_MakePoint(-7.70781376888306, 41.3600837220214),
			ST_MakePoint(-7.70804192640936, 41.3603371693974),
			ST_MakePoint(-7.7082609576346, 41.3609468090431),
			ST_MakePoint(-7.70828833653776, 41.3614399964878),
			ST_MakePoint(-7.70827921023671, 41.3616180910354),
			ST_MakePoint(-7.70804192640936, 41.3630154313407),
			ST_MakePoint(-7.70802367380725, 41.3636113467561),
			ST_MakePoint(-7.70810581051672, 41.364159310138),
			ST_MakePoint(-7.70829746283881, 41.3646524732364),
			ST_MakePoint(-7.70860775707458, 41.3651730302298),
			ST_MakePoint(-7.70897280911666, 41.3656524869343),
			ST_MakePoint(-7.70981699196396, 41.3663305696704),
			ST_MakePoint(-7.71052884344602, 41.3667141284931),
			ST_MakePoint(-7.71166963107751, 41.3671730262565),
			ST_MakePoint(-7.71250012447324, 41.3675565801129),
			ST_MakePoint(-7.7130020710311, 41.3681798503071),
			ST_MakePoint(-7.71305682883741, 41.3687003790807),
			ST_MakePoint(-7.71294731322479, 41.3691387158704),
			ST_MakePoint(-7.7126689610427, 41.3694948623375),
			ST_MakePoint(-7.71259595063428, 41.3696523880376),
			ST_MakePoint(-7.71171069943224, 41.3703372779517),
			ST_MakePoint(-7.7113000158849, 41.3708509406557),
			ST_MakePoint(-7.71124525807859, 41.3712344728299),
			ST_MakePoint(-7.71131826848701, 41.3716727925461),
			ST_MakePoint(-7.71163768902383, 41.3720905632768),
			ST_MakePoint(-7.71213050928063, 41.3724466935845),
			ST_MakePoint(-7.7129153711711, 41.3727548817003),
			ST_MakePoint(-7.7138280012763, 41.3732890709757),
			ST_MakePoint(-7.7144942212531, 41.3741314374584),
			ST_MakePoint(-7.71490490480043, 41.3753025142004),
			ST_MakePoint(-7.71530646204672, 41.3763023642071),
			ST_MakePoint(-7.7156532614867, 41.3767474979642),
			ST_MakePoint(-7.71628297625928, 41.3771172990766),
			ST_MakePoint(-7.71677579651609, 41.3773227432305)])
		,4326), 
	'PercurosoTeste4', 
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
	sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
	Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
	nisi ut aliquip ex ea commodo consequat. 
	Duis aute irure dolor in reprehenderit in voluptate velit esse cillum 
	dolore eu fugiat nulla pariatur. 
	Excepteur sint occaecat cupidatat non proident, sunt in culpa qui 
	officia deserunt mollit anim id est laborum.', 
	4);

\echo ' -- DONE INSERTING PERCURSOS -- '

\echo ' -- INSERTING RATINGS -- '

INSERT INTO ratings(n_estrelas,comentario,id_utilizador,id_percurso)
VALUES (5,'Excelente!', 1, 1);

INSERT INTO ratings(n_estrelas,comentario,id_utilizador,id_percurso)
VALUES (4,'Muito Bom!', 2, 1);

INSERT INTO ratings(n_estrelas,comentario,id_utilizador,id_percurso)
VALUES (1,'Não Gostei!', 3, 2);

INSERT INTO ratings(n_estrelas,comentario,id_utilizador,id_percurso)
VALUES (4,'Muito Bom!', 2, 2);

INSERT INTO ratings(n_estrelas,comentario,id_utilizador,id_percurso)
VALUES (2,'Péssimo!', 4, 4);

INSERT INTO ratings(n_estrelas,comentario,id_utilizador,id_percurso)
VALUES (3,'Nao é mau!', 4, 4);

INSERT INTO ratings(n_estrelas,comentario,id_utilizador,id_percurso)
VALUES (5,'Optimo Percurso!', 3, 3);

INSERT INTO ratings(n_estrelas,comentario,id_utilizador,id_percurso)
VALUES (1,'Exitia uma árvore caída no percurso!', 2, 3);

\echo ' -- DONE INSERTING RATINGS -- '

\echo ' -- DUMMY DATA INSERTED -- '