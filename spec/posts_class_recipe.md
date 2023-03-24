Two Tables Design Recipe Template FOR CONCERTS AND VENUES tables:

########
# databases/challenges/06_designing_schema_two_tables.md
Ch 7 -> Designing a schema with two tables

# ONE TO MANY RELATIONSHIP
* A musical artist can have many different albums. => Artist -> one to many -> Albums
* While an Album can have only one Artist =>  Album -> many to one -> Artist

FOR FOREIGN KEY, think:
Q. Can one artist have many abums? Yes => So, we need Foreign key on Albums
Q. Can one album have many artists? No 

# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

1. Extract nouns from the user stories or specification
As a social network user,
So I can have my information registered,
I'd like to have a user account with my email address.

As a social network user,
So I can have my information registered,
I'd like to have a user account with my username.

As a social network user,
So I can write on my timeline,
I'd like to create posts associated with my user account.

As a social network user,
So I can write on my timeline,
I'd like each of my posts to have a title and a content.

As a social network user,
So I can know who reads my posts,
I'd like each of my posts to have a number of views.
Nouns:
scheduled concerts, artist name, concert date, venue, venue name, venue capacity

2. Infer the Table Name and Columns
Put the different nouns in this table. Replace the example with your own nouns.

Record	    Properties
users	    username, email_address
posts	    title, content, views, user_id

Name of the first table (always plural): users

Column names: username, email_address

Name of the second table (always plural): posts

Column names: title, content, views, user_id

3. Decide the column types.
# EXAMPLE:

Table: users
id: SERIAL
username: text
email_address: text

Table: posts
id: SERIAL
title: text
content: text
views: int
user_id: int

4. Decide on The Tables Relationship
# EXAMPLE

1. Can one user have many posts? YES
2. Can one post have many users? NO

-> Therefore,
A users is ONE to MANY posts
Users -> many to one -> posts

SO, FOREIGN KEY HAS TO BE ON posts - 'user_id'

-> Therefore, the foreign key is on the albums table.

4. Write the SQL.
-- EXAMPLE
-- file:seeds_users_posts.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
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


<!-- TablePlus -> copy the two create sql's to create tables -> o/p Query 2 OK: CREATE TABLE -->

5. Create the tables.
psql -h 127.0.0.1 social_network < spec/seeds_users_posts.sql 


##### THIS IS JUST AS AN EG. 
TablePlus -> New -> concerts -> Copy both the create table sql's and run together. This creates the 2 tables in the db, concerts.
