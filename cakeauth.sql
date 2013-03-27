
<<<<<<< HEAD
=======
--

-- --------------------------------------------------------

--
-- Tabellstruktur `comments`
--
>>>>>>> 9a68e4b438b5fa86b48466ae879b206e2030f595

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `added` datetime NOT NULL,
  PRIMARY KEY (`id`)
<<<<<<< HEAD
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=93 ;
=======
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=82 ;
>>>>>>> 9a68e4b438b5fa86b48466ae879b206e2030f595

--


<<<<<<< HEAD
=======
-- --------------------------------------------------------

--
-- Tabellstruktur `forumcats`
--
>>>>>>> 9a68e4b438b5fa86b48466ae879b206e2030f595

CREATE TABLE IF NOT EXISTS `forumcats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(10) NOT NULL,
  `lft` int(10) NOT NULL,
  `rght` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

-- --------------------------------------------------------

--
-- Tabellstruktur `messages`
--

--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `recipient` varchar(45) NOT NULL,
  `subject` varchar(46) NOT NULL,
  `body` text NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
<<<<<<< HEAD
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;
=======
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
>>>>>>> 9a68e4b438b5fa86b48466ae879b206e2030f595

-- Tabellstruktur `postcat`
--

CREATE TABLE IF NOT EXISTS `postcat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `lft` int(10) NOT NULL,
  `rght` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;


--
-- Tabellstruktur `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `cat` int(11) NOT NULL,
  `views` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;



--
-- Tabellstruktur `threadanswers`
--

CREATE TABLE IF NOT EXISTS `threadanswers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `added` datetime NOT NULL,
  PRIMARY KEY (`id`)
<<<<<<< HEAD
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=182 ;

--
-- Dumpning av Data i tabell `threadanswers`
--

=======
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=148 ;
>>>>>>> 9a68e4b438b5fa86b48466ae879b206e2030f595

--


CREATE TABLE IF NOT EXISTS `threads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `cat` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `views` int(20) NOT NULL,
  `update` datetime NOT NULL,
  `Replies` int(11) NOT NULL,
  `Sticky` tinyint(1) NOT NULL DEFAULT '0',
  `Locked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
<<<<<<< HEAD
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

=======
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;
>>>>>>> 9a68e4b438b5fa86b48466ae879b206e2030f595



-- --------------------------------------------------------

--
-- Tabellstruktur `users`
--
-- Tabellstruktur `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `password` varchar(40) NOT NULL,
  `roles` enum('admin','checked','user','banned') NOT NULL DEFAULT 'user',
  `email` varchar(45) NOT NULL,
  `image_url` varchar(45) DEFAULT '05.png',
  `Registred` datetime NOT NULL,
  `online` tinyint(1) NOT NULL DEFAULT '0',
<<<<<<< HEAD
  `Presentation` text NOT NULL,
=======
>>>>>>> 9a68e4b438b5fa86b48466ae879b206e2030f595
  `Messages` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Dumpning av Data i tabell `users`
--


--
-- Dumpning av Data i tabell `users`
--

