DELETE FROM Song;
DELETE FROM Album;
DELETE FROM Artist;
DELETE FROM Genre;

DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Song;


CREATE TABLE `Genre` (
	`GenreId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Label`	TEXT NOT NULL
);


CREATE TABLE `Artist` (
    `ArtistId`    INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `ArtistName`    TEXT NOT NULL,
    `YearEstablished`    INTEGER NOT NULL
);

CREATE TABLE `Album` (
	`AlbumId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Title`  TEXT NOT NULL,
	`ReleaseDate` TEXT NOT NULL,
	`AlbumLength` INTEGER NOT NULL,
	`Label` TEXT NOT NULL,
	`ArtistId` INTEGER NOT NULL,
	`GenreId`	INTEGER,
	FOREIGN KEY(`ArtistId`) REFERENCES `Artist`(`ArtistId`),
	FOREIGN KEY(`GenreId`) REFERENCES `Genre`(`GenreId`)
);


CREATE TABLE `Song` (
	`SongId`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Title`	TEXT NOT NULL,
	`SongLength`	INTEGER NOT NULL,
	`ReleaseDate`	TEXT NOT NULL,
	`GenreId`	INTEGER,
	`ArtistId` INTEGER NOT NULL,
	`AlbumId` INTEGER NOT NULL,
	FOREIGN KEY(`GenreId`) REFERENCES `Genre`(`GenreId`),
	FOREIGN KEY(`ArtistId`) REFERENCES `Artist`(`ArtistId`),
	FOREIGN KEY(`AlbumId`) REFERENCES `Album`(`AlbumId`)
);

	/* INSERT GENRES */
INSERT INTO Genre VALUES (null, 'Soul');
INSERT INTO Genre VALUES (null, 'Rock');
INSERT INTO Genre VALUES (null, 'Blues');
INSERT INTO Genre VALUES (null, 'Jazz');
INSERT INTO Genre VALUES (null, 'Heavy Metal');
INSERT INTO Genre VALUES (null, 'R&B');
INSERT INTO Genre VALUES (null, 'Pop');
INSERT INTO Genre VALUES (null, 'Bluegrass');
INSERT INTO Genre VALUES (null, 'Punk');
INSERT INTO Genre VALUES (null, 'Classical');
INSERT INTO Genre VALUES (null, 'Country');
INSERT INTO Genre VALUES (null, 'Latin');
INSERT INTO Genre VALUES (null, 'Rap');
INSERT INTO Genre VALUES (null, 'Electronic');
INSERT INTO Genre VALUES (null, 'Folk');

	/* INSERT ARTISTS */
INSERT INTO Artist VALUES (null, "Judas Priest", 1969);
INSERT INTO Artist VALUES (null, "Def Leppard", 1977);
INSERT INTO Artist VALUES (null, "ZZTop", 1969);
INSERT INTO Artist VALUES (null, "Genesis", 1967);
INSERT INTO Artist VALUES (null, "Journey", 1973);
INSERT INTO Artist VALUES (null, "Beatles", 1960);
INSERT INTO Artist VALUES (null, "Howlin' Wolf", 1959);
INSERT INTO Artist VALUES (null, "Black Flag", 1981);
INSERT INTO Artist VALUES (null, "Porcupine Tree", 1987);
INSERT INTO Artist VALUES (null, "Grateful Dead", 1965);
INSERT INTO Artist VALUES (null, "The Shins", 1996);
INSERT INTO Artist VALUES (null, "Rush", 1968);
INSERT INTO Artist VALUES (null, "The Features", 1998);
INSERT INTO Artist VALUES (null, "Squeeze", 1977);
INSERT INTO Artist VALUES (null, "Midnight Oil", 1976);
INSERT INTO Artist VALUES (null, "Dire Straits", 1977);
INSERT INTO Artist VALUES (null, "Hoodoo Gurus", 1981);
INSERT INTO Artist VALUES (null, "U2", 1976);
INSERT INTO Artist VALUES (null, "Mayer Hawthorne", 2009);
INSERT INTO Artist VALUES (null, "David Bowie", 1968);
INSERT INTO Artist VALUES (null, "Sigur Ros", 1997);
INSERT INTO Artist VALUES (null, "deadmau5", 2006);
INSERT INTO Artist VALUES (null, "Justice", 2007);
INSERT INTO Artist VALUES (null, "Miles Davis", 1948);
INSERT INTO Artist VALUES (null, "The Sheepdogs", 2006);
INSERT INTO Artist VALUES (null, "Coheed & Cambria", 2001);
INSERT INTO Artist VALUES (null, "Jay Z", 1986);
INSERT INTO Artist VALUES (null, "Avett Brothers", 2000);
INSERT INTO Artist VALUES (null, "Vampire Weekend", 2006);


	/* INSERT ALBUMS */
INSERT INTO Album 
	SELECT null, 
		   "True Sadness", 
		   '6/24/2016', 
		   SUBSTR(ABS(RANDOM())||'', 0, 5),
		   'American', 
		   ArtistId,
		   g.GenreId
	FROM Artist a, Genre g WHERE a.ArtistName = "Avett Brothers" AND g.Label = "Folk";

INSERT INTO Album 
	SELECT null, 
		   "I and Love and You", 
		   '11/29/2009', 
		   SUBSTR(ABS(RANDOM())||'', 0, 5),
		   'American', 
		   ArtistId,
		   g.GenreId
	FROM Artist a, Genre g WHERE a.ArtistName = "Avett Brothers" AND g.Label = "Folk";

INSERT INTO Album 
	SELECT null, 
		   "The Black Album", 
		   '11/14/2003', 
		   SUBSTR(ABS(RANDOM())||'', 0, 5),
		   'Def Jam', 
		   ArtistId,
		   g.GenreId
	FROM Artist a, Genre g WHERE a.ArtistName = "Jay Z" AND g.Label = "Rap";

INSERT INTO Album 
	SELECT null, 
		   "A Strange Arrangement", 
		   '09/08/2009', 
		   2082, 
		   'Stones Throw Records', 
		   ArtistId,
		   g.GenreId
	FROM Artist a, Genre g WHERE a.ArtistName = "Mayer Hawthorne" AND g.Label = "Soul";

INSERT INTO Album 
	SELECT null, 
		   "How Do You Do", 
		   '10/11/2011', 
		   2357, 
		   'Stones Throw Records', 
		   ArtistId,
		   g.GenreId
	FROM Artist a, Genre g WHERE a.ArtistName = "Mayer Hawthorne" AND g.Label = "Soul";

INSERT INTO Album 
	SELECT null, 
		   "Where Does This Door Go", 
		   '06/16/2013', 
		   3114, 
		   'Stones Throw Records', 
		   a.ArtistId,
		   g.GenreId
	FROM Artist a, Genre g WHERE a.ArtistName = "Mayer Hawthorne" AND g.Label = "Soul";

INSERT INTO Album VALUES (null, "Revolver", '08/05/1966', 2083, 'Parlophone', 6, 2);
INSERT INTO Album VALUES (null, "Sgt. Pepper's Lonely Hearts Club Band", '06/01/1967', 2392, 'Stones Throw Records', 6, 2);
INSERT INTO Album VALUES (null, "Magical Mystery Tour", '11/27/1967', 1148, 'Stones Throw Records', 6, 2);

INSERT INTO Album VALUES (null, 'Screaming for Vengeance', '06/17/1982', 2322, 'Columbia', 1, 2);
INSERT INTO Album VALUES (null, 'Point of Entry', '02/26/1981', 2262, 'Columbia', 1, 2);
INSERT INTO Album VALUES (null, 'Defenders of the Faith', '01/04/1984', 2383, 'Columbia', 1, 2);

INSERT INTO Album VALUES (null, 'Round About Midnight', '03/06/1957', 2327, 'Columbia', 24, 4);
INSERT INTO Album VALUES (null, 'Miles Ahead', '10/21/1957', 2132, 'Columbia', 24, 4);
INSERT INTO Album VALUES (null, 'Milestones', '09/02/1958', 2856, 'Columbia', 24, 4);

INSERT INTO Album VALUES (null, "Moanin' in the Moonlight", '05/14/1959', 2033, 'Chess', 7, 3);
INSERT INTO Album VALUES (null, "Howlin' Wolf", '10/21/1957', 1917, 'Chess', 7, 3);
INSERT INTO Album VALUES (null, "The Howlin' Wolf Album", '09/02/1969', 2459, 'Chess', 7, 3);

INSERT INTO Album 
  SELECT null, "Eliminator", '3/23/1983', 2668, 'Warner Bros.', 
    a.ArtistId, g.GenreId
FROM Artist a, Genre g
WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock";

INSERT INTO Album 
SELECT null, "Afterburner", '1/1/2011', SUBSTR(ABS(RANDOM())||'', 0, 4),
		'Warner Bros.', ArtistId, GenreId
FROM Artist a, Genre g
WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock";

INSERT INTO Album 
SELECT null, "Tres Hombres", '6/14/1979', SUBSTR(ABS(RANDOM())||'', 0, 4),
		'Warner Bros.', ArtistId, GenreId
FROM Artist a, Genre g
WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock";

INSERT INTO Album VALUES (null, "Damaged", '12/05/1981', 2098, 'SST', 8, 9);
INSERT INTO Album VALUES (null, "TV Party", '07/12/1982', 409, 'SST', 8, 9);
INSERT INTO Album VALUES (null, "Everything Went Black", '12/03/1982', 3718, 'SST', 8, 9);

INSERT INTO Album 
SELECT null, "Contra", '6/1/2010', SUBSTR(ABS(RANDOM())||'', 0, 4),
		'XL Recordings.', ArtistId, GenreId
FROM Artist a, Genre g
WHERE a.ArtistName = "Vampire Weekend" AND g.Label = "Rock";

	/*  INSERT SONGS  */
INSERT INTO Song
	SELECT null, 
		   "Walcott", 
		   61, 
		   '2/03/2008', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Vampire Weekend" AND g.Label = "Rock" AND al.Title = "Contra";
	
INSERT INTO Song
	SELECT null, 
		   "Revenge", 
		   61, 
		   '12/03/1982', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Black Flag" AND g.Label = "Punk" AND al.Title = "Everything Went Black";	

INSERT INTO Song
	SELECT null, 
		   "White Minority", 
		   69, 
		   '12/03/1982', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Black Flag" AND g.Label = "Punk" AND al.Title = "Everything Went Black";

INSERT INTO Song
	SELECT null, 
		   "Gimme Gimme Gimme", 
		   120, 
		   '12/03/1982', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Black Flag" AND g.Label = "Punk" AND al.Title = "Everything Went Black";

INSERT INTO Song
	SELECT null, 
		   "No Values", 
		   118, 
		   '12/03/1982', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Black Flag" AND g.Label = "Punk" AND al.Title = "Everything Went Black";

INSERT INTO Song
	SELECT null, 
		   "TV Party", 
		   232, 
		   '06/12/1982', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Black Flag" AND g.Label = "Punk" AND al.Title = "TV Party";

INSERT INTO Song
	SELECT null, 
		   "I've Got To Run", 
		   105, 
		   '06/12/1982', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Black Flag" AND g.Label = "Punk" AND al.Title = "TV Party";

INSERT INTO Song
	SELECT null, 
		   "My Rules", 
		   71, 
		   '06/12/1982', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Black Flag" AND g.Label = "Punk" AND al.Title = "TV Party";

INSERT INTO Song
	SELECT null, 
		   "Gimme All Your Lovin", 
		   SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '3/23/1983', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND al.Title = "Eliminator";

INSERT INTO Song
	SELECT null, 
		   "Sharp Dressed Man", 
		   SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '3/23/1983', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND al.Title = "Eliminator";

INSERT INTO Song
	SELECT null, 
		   "Legs", 
		   SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '3/23/1983', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND al.Title = "Eliminator";

INSERT INTO Song
	SELECT null, 
		   "I Need You Tonight", 
		   SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '3/23/1983', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND al.Title = "Eliminator";

INSERT INTO Song
	SELECT null, 
		   "TV Dinners", 
		   SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '3/23/1983', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND al.Title = "Eliminator";

INSERT INTO Song
	SELECT null, 
		   "Thug", 
		   SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '3/23/1983', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "ZZTop" AND g.Label = "Rock" AND al.Title = "Eliminator";


INSERT INTO Song
	SELECT null, 
		   "Taxman", 
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '8/5/1966', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Beatles" AND g.Label = "Pop" AND al.Title = "Revolver";

INSERT INTO Song
	SELECT null, 
		   "Eleanor Rigby", 
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '8/5/1966', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Beatles" AND g.Label = "Pop" AND al.Title = "Revolver";

INSERT INTO Song
	SELECT null, 
		   "Good Day Sunshine", 
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '8/5/1966', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Beatles" AND g.Label = "Pop" AND al.Title = "Revolver";

INSERT INTO Song
	SELECT null, 
		   "Got To Get You Into My Life", 
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '8/5/1966', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Beatles" AND g.Label = "Pop" AND al.Title = "Revolver";

	
INSERT INTO Song
	SELECT null, 
		   "Interlude", 
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '12/03/1982',
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Jay Z" AND g.Label = "Rap" AND al.Title = "The Black Album";

INSERT INTO Song
	SELECT null, 
		   "What More Can I Say", 
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '12/03/1982', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Jay Z" AND g.Label = "Rap" AND al.Title = "The Black Album";

INSERT INTO Song
	SELECT null, 
		   "Encore", 
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '12/03/1982', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Jay Z" AND g.Label = "Rap" AND al.Title = "The Black Album";

INSERT INTO Song
	SELECT null, 
		   "Dirt Off Your Shoulder", 
       SUBSTR(ABS(RANDOM())||'', 0, 4),
		   '12/03/1982', 
		   g.GenreId,
		   a.ArtistId,
		   al.AlbumId
	FROM Artist a, Genre g, Album al
	WHERE a.ArtistName = "Jay Z" AND g.Label = "Rap" AND al.Title = "The Black Album";



SELECT s.Title 'Song', s.SongLength 'Duration',
	   al.Title 'Album', 
       a.ArtistName 'Artist', 
	   g.Label 'Genre'
FROM Song s
JOIN Album al ON s.AlbumId = al.AlbumId
JOIN Artist a ON al.ArtistId = a.ArtistId
JOIN Genre g ON s.GenreId = g.GenreId;


/* List all songs with album information */
SELECT a.Title 'Album', s.Title 'Song'
FROM Song s
LEFT JOIN Album a on s.AlbumId = a.AlbumId


/* Find Albums with no songs */
SELECT a.Title 'Album', s.Title 'Song'
FROM Album a
LEFT JOIN Song s on s.AlbumId = a.AlbumId
WHERE s.Title is NULL

/* EX */	
SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

/* Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
	Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the 
	album and artist you added. */
SELECT s.Title 'Song',
	al.Title 'Album', 
	a.ArtistName 'Artist', 
	g.Label 'Genre'
FROM Song s
JOIN Album al ON s.AlbumId = al.AlbumId
JOIN Artist a ON al.ArtistId = a.ArtistId
JOIN Genre g ON s.GenreId = g.GenreId
WHERE s.Title is 'Legs' OR s.Title is 'Walcott' OR s.Title is 'No Values';


/* Write a SELECT statement to display how many songs exist for each album. 
	You'll need to use the COUNT() function and the GROUP BY keyword sequence. */
SELECT al.Title 'Album', COUNT(s.SongId) 'Song Count'
FROM Song s
JOIN Album al ON s.AlbumId = al.AlbumId
WHERE s.AlbumId = al.AlbumId
GROUP BY al.AlbumId

/* Write a SELECT statement to display how many songs exist for each artist. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence. */
SELECT a.ArtistName 'Artist', COUNT(s.SongId) '# of songs in db'
FROM Song s
JOIN Artist a ON s.ArtistId = a.ArtistId
WHERE s.ArtistId = a.ArtistId
GROUP BY a.ArtistId

/* Write a SELECT statement to display how many songs exist for each genre. 
 You'll need to use the COUNT() function and the GROUP BY keyword sequence. */
SELECT g.Label 'Genre', COUNT(s.SongId) '# of songs in genre'
FROM Song s
JOIN Genre g ON s.GenreId = g.GenreId
WHERE s.GenreId = g.GenreId
GROUP BY g.GenreId

/* Using MAX() function, write a select statement to find the album with the longest duration. 
The result should display the album title and the duration. */
SELECT al.Title 'Longest Album', MAX(al.AlbumLength) 'Album Duration'
FROM Album al

/* Using MAX() function, write a select statement to find the song with the longest duration.
 The result should display the song title and the duration.  */
SELECT s.Title 'Longest Song', MAX(s.SongLength) 'Song Duration'
FROM Song s

/* Modify the previous query to also display the title of the album.  */
SELECT s.Title 'Longest Song', al.Title 'Album', MAX(s.SongLength) 'Song Duration'
FROM Song s
JOIN Album al ON s.AlbumId = al.AlbumId



	
SELECT * FROM Artist;
SELECT * FROM Album;
SELECT * FROM Genre;
SELECT * FROM Song;