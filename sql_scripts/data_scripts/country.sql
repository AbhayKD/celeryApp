--
-- Dumping data for table `country`
--
INSERT INTO
    country (
        id,
        continent_id,
        name,
        area,
        hospital_count,
        national_park_count,
        population
    )
VALUES
    (
        1,
        1,
        'Afghanistan',
        floor(random() * 10) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        11,
        1,
        'Armenia',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        25,
        1,
        'Bhutan',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        44,
        1,
        'China',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        96,
        1,
        'Hong Kong',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        99,
        1,
        'India',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        100,
        1,
        'Indonesia',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        101,
        1,
        'Iran',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        107,
        1,
        'Japan',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        102,
        1,
        'Iraq',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        113,
        1,
        'Korea, Republic of',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        177,
        1,
        'Russian Federation',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        10,
        2,
        'Argentina',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        21,
        2,
        'Belgium',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        14,
        2,
        'Austria',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        33,
        2,
        'Bulgaria',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        58,
        2,
        'Denmark',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        105,
        2,
        'Italy',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        73,
        2,
        'France',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        80,
        2,
        'Germany',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        97,
        2,
        'Hungary',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        199,
        2,
        'Spain',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        225,
        2,
        'United Kingdom',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        8,
        7,
        'Antarctica',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        153,
        6,
        'New Zealand',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        13,
        6,
        'Australia',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        30,
        4,
        'Brazil',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        62,
        4,
        'Ecuador',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        106,
        4,
        'Jamaica',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        138,
        4,
        'Mexico',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        216,
        4,
        'Trinidad and Tobago',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        38,
        3,
        'Canada',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        84,
        3,
        'Greenland',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        226,
        3,
        'United States',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        63,
        5,
        'Egypt',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        197,
        5,
        'South Africa',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        156,
        5,
        'Nigeria',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        178,
        5,
        'Rwanda',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        239,
        5,
        'Zimbabwe',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    ),
    (
        251,
        5,
        'South Sudan',
        floor(random() * 100) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int,
        floor(random() * 1000) :: int
    );