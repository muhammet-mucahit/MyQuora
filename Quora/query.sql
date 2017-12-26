select * from User;
select * from Following;
select * from Question;
select * from Answer;
select * from Topic;
select * from TopicOfQuestion;
select * from TopicOfUser;

delete from Answer where answerID in (32, 33, 34, 35, 37, 38);
update User set photo = "resources/images/o.jpg" where answerID = 14;
update Answer set answer = "I have often felt this way about the music of Robert Schumann (1810-1856) in particular. There are many composers across all time periods and from various cultures whose music I heartily admire, and I would never be likely to name Schumann my favorite. (Favorite and greatest and best all make me a little queasy, anyway.) But there is something about Schumanns musical language the vocabulary, the gestural tendencies, the rhetoric which feels like the work of a peculiarly kindred spirit to my own. I came to realize this gradually as I heard and studied more of his music over the years; it was like getting to know someone whose sense of humor, manner of speech, and thought processes are so similar to yours that you are led to wonder in what former existence the two of you were lifelong friends." where answerID = 36;

update User set gender = 1  where id = 18;

create table Topic (
	topicID bigint auto_increment,
    topicName varchar(30),
    primary key(topicID)
);

insert into Topic(topicName) values('Animals');
insert into Topic(topicName) values('Art');
insert into Topic(topicName) values('Beauty');
insert into Topic(topicName) values('Books');
insert into Topic(topicName) values('Cars');
insert into Topic(topicName) values('Computers');
insert into Topic(topicName) values('Cooking');
insert into Topic(topicName) values('Education');
insert into Topic(topicName) values('Games');
insert into Topic(topicName) values('Jobs');
insert into Topic(topicName) values('Health');
insert into Topic(topicName) values('Movies');
insert into Topic(topicName) values('Religions');
insert into Topic(topicName) values('Smoking');
insert into Topic(topicName) values('Software');
insert into Topic(topicName) values('Sports');
insert into Topic(topicName) values('Technology');
insert into Topic(topicName) values('Travel');

create table TopicOfUser (
	id bigint auto_increment,
    userID bigint not null,
    topicID bigint not null,
    primary key(id),
    foreign key(userID) references User(id),
    foreign key(topicID) references Topic(topicID)
);

create table TopicOfQuestion (
	id bigint auto_increment,
    questionID bigint not null,
    topicID bigint not null,
    primary key(id),
    foreign key(questionID) references Question(questionID),
    foreign key(topicID) references Topic(topicID)
);

drop table User;
drop table Following;
drop table Question;
drop table Answer;
drop table Topic;
drop table TopicOfQuestion;
drop table Answer;

delete from Question where questionID in (1,2,3,4,5,6); 

select * from Question where userID in (select followedID from following where followerID = 1) and questionID in(select questionID from TopicOfQuestion where topicID in (select topicID from TopicOfUser where userID = 1));

select questionID from TopicOfQuestion where topicID in (select topicID from TopicOfUser where userID = 1);

select topicID from TopicOfUser where userID = 1;
select * from TopicOfQuestion;
select * from TopicOfUser;
select * from Topic;
select * from question where userID != 1;