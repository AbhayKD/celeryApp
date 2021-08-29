--
-- Dumping data for table `city`
--
INSERT INTO
    city (
        country_id,
        name,
        area,
        roads_count,
        trees_count,
        population
    )
VALUES
    (
        1,
        'Kabul',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        11,
        'Yerevan',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        25,
        'Thimphu',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        44,
        'Beijing',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        99,
        'Delhi',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        100,
        'Jakarta',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        101,
        'Tehran',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        107,
        'Tokyo',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        10,
        'Beunos Aires',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        21,
        'Brussels',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        14,
        'Vienna',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        58,
        'Copenhagen',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        105,
        'Rome',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        153,
        'Aukland',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        13,
        'Sydney',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        30,
        'Rio de Janerio',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        106,
        'Kingston',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        138,
        'Mexico City',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        38,
        'Toronto',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        226,
        'New York',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        63,
        'Cairo',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        197,
        'Cape Town',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        156,
        'Lagos',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        178,
        'Kigali',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    );