drop table posts;
drop table users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  email_address text
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  views int,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

insert into users
(username, email_address) values
('Bob', 'Bob@googlemail.com'),
('Steve', 'Steve@yahoo.com')
;

insert into posts
(title, content, user_id, views) values
('title1', 'content1', 1, 0),
('title2', 'content2', 1, 4),
('title3', 'content3', 1, 9),
('title4', 'content4', 2, 11),
('title5', 'content5', 2, 7)
;