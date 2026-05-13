CREATE TABLE IF NOT EXISTS employees(
    employee_id SERIAL PRIMARY KEY,
    last_name VARCHAR(50),
    first_name VARCHAR(50),
    title VARCHAR(100),
    reports_to INTEGER,
    levels VARCHAR(20),
    birthdate DATE,
    hire_date DATE,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    phone VARCHAR(20),
    fax VARCHAR(20),
    email VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    company VARCHAR(100),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    phone VARCHAR(20),
    fax VARCHAR(20),
    email VARCHAR(100),
    support_rep_id INTEGER
);

CREATE TABLE IF NOT EXISTS invoices (
    invoice_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    invoice_date DATE,
    billing_address VARCHAR(255),
    billing_city VARCHAR(100),
    billing_state VARCHAR(100),
    billing_country VARCHAR(100),
    billing_postal_code VARCHAR(20),
    total NUMERIC(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

);

CREATE TABLE IF NOT EXISTS playlists(
    playlist_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS artists(
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS albums(
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    artist_id INTEGER,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);



CREATE TABLE IF NOT EXISTS genres(
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS media_types(
    media_type_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS tracks(
    track_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    album_id INTEGER,
    media_type_id INTEGER,
    genre_id INTEGER,
    composer VARCHAR(255),
    milliseconds INTEGER,
    bytes INTEGER,
    unit_price NUMERIC(10, 2),
    FOREIGN KEY (album_id) REFERENCES albums(album_id),
    FOREIGN KEY (media_type_id) REFERENCES media_types(media_type_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
    
);

CREATE TABLE IF NOT EXISTS playlist_track(
    playlist_id	INTEGER,
    track_id INTEGER,
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id)
);


CREATE TABLE IF NOT EXISTS invoice_lines (
    invoice_line_id SERIAL ,
    invoice_id INTEGER,
    track_id INTEGER,
    unit_price NUMERIC(10, 2),
    quantity INTEGER,
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
    FOREIGN KEY (track_id) REFERENCES tracks(track_id)

);


