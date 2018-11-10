create table game
    (title varchar(50) not null,
     releaseDate varchar(20),
     license varchar(20),
     openSource bit,
     primary key (title, releaseDate)
    );

create table publisher
    (publisherName varchar(50) not null,
     contact varchar(50),
     active bit,
     primary key (publisherName)
    );

create table platform
    (platformName varchar(50),
     title varchar(50),
     releaseDate varchar(20),
     primary key (platformName),
     foreign key (title) references game (title)
        on delete set null
    );

create table genre
    (genreName varchar(20),
     title varchar(50),
     releaseDate varchar(20),
     primary key (genreName),
     foreign key (title) references game (title)
        on delete set null
    );
