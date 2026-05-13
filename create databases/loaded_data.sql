COPY employees
FROM 'C:\Program Files\PostgreSQL\17\employee.csv'
DELIMITER ',' CSV HEADER;

COPY customers
FROM 'C:\Program Files\PostgreSQL\17\customer.csv'
DELIMITER ',' CSV HEADER;

COPY albums
FROM 'C:\Program Files\PostgreSQL\17\album2.csv'
DELIMITER ',' CSV HEADER;

COPY artists
FROM 'C:\Program Files\PostgreSQL\17\artist.csv'
DELIMITER ',' CSV HEADER;

COPY genres
FROM 'C:\Program Files\PostgreSQL\17\genre.csv'
DELIMITER ',' CSV HEADER;

COPY invoice_lines
FROM 'C:\Program Files\PostgreSQL\17\invoice_line.csv'
DELIMITER ',' CSV HEADER;

COPY invoices
FROM 'C:\Program Files\PostgreSQL\17\invoice.csv'
DELIMITER ',' CSV HEADER;

COPY media_types
FROM 'C:\Program Files\PostgreSQL\17\media_type.csv'
DELIMITER ',' CSV HEADER;

COPY playlist_track
FROM 'C:\Program Files\PostgreSQL\17\playlist_track.csv'
DELIMITER ',' CSV HEADER;

COPY playlists
FROM 'C:\Program Files\PostgreSQL\17\playlist.csv'
DELIMITER ',' CSV HEADER;

COPY tracks
FROM 'C:\Program Files\PostgreSQL\17\track.csv'
DELIMITER ',' CSV HEADER;


