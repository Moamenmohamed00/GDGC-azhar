create database Social_Media_Platform;
use Social_Media_Platform;
create table Users
(user_id int identity(1,1) primary key,
gender nvarchar(10)check(gender in('male','female')),
email varchar(35) unique,
user_name varchar(30)not null,
join_date datetime default getdate(),
date_birth date not null
);
create table Posts(
userID int not null ,
post_ID int identity primary key,
content varchar(max),
post_date datetime2 default getdate(),
visibilty varchar(20) check(visibilty in ('public','private'))not null default 'xxxx',
foreign key(userID) references Users(user_id)
);
create table Comments(
user_id int not null,
post_id int not null,
comment_id int identity primary key,
comment_date datetime default getdate(),
content varchar(25),
foreign key(user_id) references Users(user_id),
foreign key (post_id) references Posts(post_ID),
);
create table Interactions(
user_id int not null,
post_id int not null ,
interaction_id uniqueidentifier primary key default newid(),
type varchar(25)CHECK (type IN ('like', 'share', 'comment')),
interaction_date time default getdate(),
foreign key(user_id) references Users(user_id),
foreign key (post_id) references Posts(post_ID),
);
create table Interact(
user_id int foreign key(user_id) references Users(user_id),
post_id int foreign key (post_id) references Posts(post_ID),
);
INSERT INTO Users (gender, email, user_name, date_birth)
VALUES 
('male', 'john.doe@email.com', 'JohnDoe', '1990-05-15'),
('female', 'jane.smith@email.com', 'JaneSmith', '1995-09-22');

INSERT INTO Posts (userID, content, visibilty)
VALUES 
(1, 'Hello, this is my first post!', 'public'),
(2, 'Loving this platform so far.', 'private');

INSERT INTO Comments (user_id, post_id, content)
VALUES 
(2, 1, 'Nice post, John!'),
(1, 2, 'Glad you like it, Jane!');

INSERT INTO Interactions (user_id, post_id, type)
VALUES 
(1, 2, 'like'),
(2, 1, 'share');
iNSERT INTO Interact (user_id, post_id)
VALUES 
(1, 2), 
(2, 1);