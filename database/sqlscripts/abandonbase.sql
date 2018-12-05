create table game
    (title varchar(250),
     releaseDate varchar(250),
     license varchar(250),
     openSource bit,
     primary key (title, releaseDate)
    );

create table publisher
    (publisherName varchar(250),
     contact varchar(250),
     active boolean,
     primary key (publisherName)
    );

create table platform
    (platformName varchar(250),
     title varchar(250),
     releaseDate varchar(250),
     foreign key (title) references game (title)
        on delete set null
    );

create table genre
    (genreName varchar(250),
     title varchar(250),
     releaseDate varchar(250),
     foreign key (title) references game (title)
        on delete set null
    );
