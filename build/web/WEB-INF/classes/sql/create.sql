/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  Giga P34
 * Created: 20/07/2023
 */

CREATE TABLE books(
    book_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(255) NOT NULL,
    book_author VARCHAR(255),
    book_year DATE
);

CREATE TABLE users(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    email varchar(255)
);

CREATE USER assign1@'%' IDENTIFIED BY '123456';
GRANT DELETE,UPDATE,SELECT,INSERT ON thiccbooks.books TO assign1@'%';
GRANT DELETE,UPDATE,SELECT,INSERT ON thiccbooks.users TO assign1@'%';