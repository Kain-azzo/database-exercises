use albums_db;
select database();
show tables;
describe albums;
SELECT * FROM albums;
SELECT name as 'low_selling_albums',sales FROM albums WHERE sales < 20 order by sales desc;
SELECT name FROM albums WHERE artist = 'Pink Floyd';
SELECT genre FROM albums WHERE name = 'Nevermind';
SELECT release_date FROM albums WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';
SELECT name FROM albums WHERE release_date < 2000 and release_date >= 1990;

-- What is the primary key for the albums table? ID is the primary key

-- What does the column named 'name' represent? Names of the albums

-- What do you think the sales column represents? Album sales in the millions

-- Find the name of all albums by Pink Floyd. Dark side of the moon and The Wall

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released? 1967

-- What is the genre for the album Nevermind? Grunge, Alternative rock

-- Which albums were released in the 1990s?
-- 'The Bodyguard'
-- 'Jagged Little Pill'
-- 'Come On Over'
-- 'Falling into You'
-- 'Let\'s Talk About Love'
-- '1'
-- 'Dangerous'
-- 'The Immaculate Collection'
-- 'Titanic: Music from the Motion Picture'
-- 'Metallica'
-- 'Nevermind'
-- 'Supernatural'

-- Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
-- 'The Bodyguard'
-- 'Jagged Little Pill'
-- 'Come On Over'
-- 'Falling into You'
-- 'Let\'s Talk About Love'
-- '1'
-- 'Dangerous'
-- 'The Immaculate Collection'
-- 'Titanic: Music from the Motion Picture'
-- 'Metallica'
-- 'Nevermind'
-- 'Supernatural'
