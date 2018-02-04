CREATE TABLE library.authors (
  `name` varchar(50) NOT NULL,
  `age` int(2) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `country` varchar(40) NOT NULL,
  `about` varchar(200) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO library.authors (`name`, `age`, `gender`, `country`, `about`, `id`) VALUES
('Michael Wolff', 64, 'Male', 'United Nations', 'Michael Wolff is an American author, essayist, and journalist, and a regular columnist and contributor to USA Today, The Hollywood Reporter, and the UK edition of GQ', 1),
('Michio Kaku ', 71, 'Male', 'United Nations', 'Michio Kaku is an American theoretical physicist, futurist, and popularizer of science. He is professor of theoretical physics at the City College of New York and CUNY Graduate Center.', 2),
('Rose McGowan', 44, 'Female', 'United Nations', 'Rose Arianna McGowan is an American actress, model, singer, and author. She is best known to television audiences for her role as Paige Matthews in The WB supernatural drama series Charmed', 3),
('A. J. Finn', 30, 'Male', 'United Nations', 'A. J. Finn has written for numerous publications, including the Los Angeles Times, the Washington Post and the Times Literary Supplement. Finn\'s debut novel, ', 4),
('J. K. Rowling', 52, 'Female', 'United Kingdom', 'Joanne Rowling, FRCPE, writing under the pen names J. K. Rowling and Robert Galbraith, is a British novelist, screenwriter, and producer who is best known for writing the Harry Potter fantasy series.', 5),
('Cormac McCarthy', 84, 'Male', 'United Nations', 'Cormac McCarthy is an American novelist, playwright, and screenwriter. He has written ten novels, spanning the Southern Gothic, Western, and post-apocalyptic genres', 6),
('Arundhati Roy', 56, 'Female', 'India', 'Suzanna Arundhati Roy is an Indian author best known for her novel The God of Small Things,an Booker Prize for Fiction in 1997 and became biggest-selling book by a non-expatriate author', 7);
CREATE TABLE library.books (
  `isbn` varchar(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `des` varchar(300) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO library.books (`isbn`, `name`, `author`, `des`, `id`) VALUES
('1234-8457-200-45', 'The Future of Humanity:', 'Michio Kaku ', 'World-renowned physicist and futurist Michio Kaku explores in rich, intimate detail the process by which humanity may gradually move away from the planet and develop a sustainable civilization in outer space. ', 1),
('4512-9874-410-21', 'BRAVE', 'Rose McGowan ', '"My life, as you will read, has taken me from one cult to another. BRAVE is the story of how I fought my way out of these cults and reclaimed my life. I want to help you do the same." -Rose McGowan', 2),
('8541-7412-210-87', 'The Woman in the Window', 'A. J. Finn ', 'The rocket fuel propelling The Woman in the Window, the first stratosphere-ready mystery of 2018, is expertise. Its author is…a longtime editor of mystery fiction. He is well versed in the tricks of the trade…[and] clearly knows a lot about the more diabolical elements in Hitchcock movies', 3),
('4102-5412-100-78', 'Blood Meridian', 'Cormac McCarthy ', 'Blood Meridian or the Evening Redness in the West is a 1985 epic Western novel by American author Cormac McCarthy. McCarthy\'s fifth book, it was published by Random House', 4),
('4102-9874-554-10', 'The Road', 'Cormac McCarthy ', 'Novel by American writer Cormac McCarthy. It is a post-apocalyptic tale of a journey of a father and his young son over a period of several months, across a landscape blasted by an unspecified cataclysm that has destroyed most of civilization and, in the intervening years, almost all life on Earth.', 5),
('7481-8541-210-87', 'The God of Small Things', 'Arundhati Roy', 'The God of Small Things is the debut novel of Indian writer Arundhati Roy. It is a story about the childhood experiences of fraternal twins whose lives are destroyed by the "Love Laws" that lay down "who should be loved, and how. And how much.', 6),
('1032-7410-841-10', 'The Ministry of Utmost Happiness', 'Arundhati Roy', 'The Ministry of Utmost Happiness is the second novel by Indian writer Arundhati Roy, published in 2017, twenty years after her debut, The God of Small Things', 7),
('2010-5412-120-41', 'The Algebra of Infinite Justice', 'Arundhati Roy', 'The Algebra of Infinite Justice is a collection of essays written by Booker Prize winner Arundhati Roy. The book discusses several perspectives of global and local concerns, among them one being the abuse of Nuclear bomb showoffs.', 8),
('7985-6523-521-44', 'The End of Imagination', 'Arundhati Roy', 'The End of Imagination brings together five of Arundhati Roy\'s acclaimed books of essays into one comprehensive volume for the first time and features a new introduction by the author.', 9),
('7841-8450-985-10', 'Listening to Grasshoppers', 'Arundhati Roy', 'Listening to Grasshoppers: Field Notes on Democracy is a collection of essays written by Booker Prize winner Arundhati Roy. Written between 2002 and 2008, the essays have been published in various left-leaning newspapers and magazines in India', 10);
ALTER TABLE library.authors
  ADD PRIMARY KEY (`id`);
ALTER TABLE library.books
  ADD PRIMARY KEY (`id`);
ALTER TABLE library.authors
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
ALTER TABLE library.books
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
