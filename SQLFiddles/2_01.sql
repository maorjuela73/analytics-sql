CREATE TABLE movies (
  title CHAR(100),
  year INT,
  length INT,
  genre CHAR(10),
  studioName CHAR(30),
  producerC INT
);

INSERT INTO movies (title, year, length, genre, studioName, producerC) 
VALUES ("John Wick", 2014, 101, "Action", "Thunder Road Pictures", 10131231);