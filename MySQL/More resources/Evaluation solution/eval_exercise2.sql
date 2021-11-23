/* (a) Retrieve artists under 50 years old. */
SELECT name, age
FROM artists
WHERE age < 50

/* (b) Collect gender ('gender') artists. */
SELECT DISTINCT gender
FROM artists

/* (c) Recover songs that begin with the letter 's'. */
SELECT name, release_date
FROM songs
WHERE name LIKE 's%';

/* (d) Recover songs that end with the letter 's'. */
SELECT name, release_date
FROM songs
WHERE name LIKE '%s';

/* (e) Recover songs that do not contain the letter 's'. */
SELECT name, release_date
FROM songs
WHERE name NOT LIKE '%s%';


/* (f) Get the number of playlists, all users combined. */
SELECT COUNT(*) as playlistNumber
FROM playlists

/* (g) Recover only the artists who appear on at least one playlist. */
/* The definition of the INNER JOIN is exaclty what we asked for */
SELECT a.name, a.gender
FROM artists a
INNER JOIN songs s ON a.id_artist = s.id_artist
INNER JOIN playlist_content pc ON s.id_song = pc.id_song


/* (h) For each song, count how many times it appears in a playlist. */
SELECT s.name, COUNT(*)
FROM playlist_content pc
INNER JOIN songs s ON s.id_song = pc.id_song
GROUP BY pc.id_song

/* (i) For each user, get his nickname and the number of playlists he has created. */
SELECT username, COUNT(*)
FROM playlists pc
INNER JOIN users u ON u.ref_user = pc.ref_user
GROUP BY u.ref_user

/* (j) Recover users who do not have a playlist. */
SELECT username
FROM users u
LEFT JOIN playlists pc ON u.ref_user = pc.ref_user

/* (k) Recover all users who have at least one music from 'Madonna' on one of their
playlist. */

SELECT username
FROM users u
INNER JOIN playlist_content pc ON u.ref_user = pc.ref_user 
WHERE a.name = 'Madonna';


/* (l) Count the number of users who have at least one 'Madonna' music on one of
their playlist. */
SELECT COUNT(*)
FROM users u
INNER JOIN playlist_content pc ON u.ref_user = pc.ref_user 
WHERE a.name = 'Madonna';


/* (m)Insert a new playlist with the name "rap playlist" for the user with the ID 5. */
INSERT INTO playlists(name, creation_date, ref_user)
VALUES ('rap playlist', '2021-05-17', 1);

/* (n) Update the address of the user "jimmy_punchline" with "5 rue du manoir
14000 CAEN" */
UPDATE users
SET address = '5 rue du manoir 14000 CAEN'
WHERE name = 'jimmy_punchline';

/* (o) Delete the user "orselan57" regardless of referential integrity (between keys). */
DELETE *
FROM users
WHERE username = 'orselan57';
