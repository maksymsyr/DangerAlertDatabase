DROP TABLE admins_communities_bridge;
DROP TABLE places_dangers_bridge;
DROP TABLE users_communities_bridge;
DROP TABLE comments;
DROP TABLE messages;
DROP TABLE admins;
DROP TABLE dangers;
DROP TABLE danger_information;
DROP TABLE shelters;
DROP TABLE posts;
DROP TABLE communities;
DROP TABLE users;
DROP TABLE places;

CREATE TABLE places (
  place_id VARCHAR2(7) PRIMARY KEY,
  placename VARCHAR(25) NOT NULL
);

INSERT ALL 
INTO places values ('CAN0001', 'Makham')
INTO places values ('CAN0002', 'North York')
INTO places values ('CAN0003', 'Toronto Downtown')
INTO places values ('CAN0004', 'Brampton')
INTO places values ('CAN0005', 'Scarborough')
INTO places values ('IND0001', 'Jalandhar')
into places values ('IND0002','Hoshipur')
INTO places Values('IND0003','Pathankot')
INTO places values('IND0004','Mumbai')
INTO places VALUES('IND0005','Delhi')
INTO places VALUES ('ZIM0001','Harare')
INTO places VALUES ('ZIM0002','Mutare')
INTO places VALUES ('ZIM0003','Bulawayo')
INTO places VALUES ('ZIM0004','Mbare')
INTO places VALUES ('UKR0001','Borschahivka')
INTO places VALUES ('UKR0002','Podil')
INTO places VALUES ('UKR0003','Troeschina')
INTO places VALUES ('UKR0004','Obolon')
INTO places VALUES ('UKR0005','Dnipro')
INTO places VALUES ('UKR0006', 'Rivne')
SELECT * FROM dual;

CREATE TABLE shelters (
    shelter_id VARCHAR(10) PRIMARY KEY,
    shelter_name VARCHAR2(50) NOT NULL,
    shelter_address VARCHAR2(50) NOT NULL,
    capacity NUMBER NOT NULL,
    phone VARCHAR2(20) NOT NULL,
    place_id VARCHAR2(7) NOT NULL,
    CONSTRAINT FK_sheltersPlaces FOREIGN KEY
    (place_id) REFERENCES places(place_id) 
);

INSERT ALL
INTO shelters values 
('UKRBOR01', 'National Svytashino Shelter', 'Zodchych Street, 72', 1000, '+380 045 358 3458', 'UKR0001')
INTO shelters values 
('UKRBOR02', 'Academcity Subway', 'Dorokhov Academic, 38', 2000, '+380 088 584 4857', 'UKR0001')
INTO shelters values 
('UKRBOR03', 'Politech University', 'Victory Avenue, 37', 5000, '+380 44 204 9494', 'UKR0001')
INTO shelters values 
('UKRPOD01', 'Poshtova Ploshcha Subway', 'Poshtova Street, 20', 2000, '+380 088 584 4858', 'UKR0002')
INTO shelters values 
('UKRPOD02', 'Kyiv Mohyla University', 'Sikorsky Street, 2', 500, '+380 44 425 5887', 'UKR0002')
INTO shelters values 
('CANTOR01', 'Queen Station', '8 Queen Street', 1500, '1 416 874 5900', 'CAN0003')
INTO shelters values 
('CANTOR02', 'Eves Place', '360 Lesmill Rd', 1000, '1 877 338 3398', 'CAN0001')
INTO shelters values 
('UKRDNI01', 'Artemivsk Factory', 'Shevchenka Street, 25', 5000, '+380 67 204 4494', 'UKR0005')
INTO shelters values 
('UKRRIV01', 'Center railroad station', 'Levchyn Street, 48', 350, '+380 096 584 3458', 'UKR0006')
INTO shelters values 
('ZIMHAR01', 'Central Harare Shelter', '85 Leander Avenue', 1000, '+077 455 2638', 'ZIM0001')
INTO shelters values
('ZIMMUT01', 'National Mutare Shelter', '43 Freedom Street', 325, '+077 478 0988', 'ZIM0002')
INTO shelters values
('ZIMMUT02', 'Central Mutare Shelter', '9 Central Ave', 581, '+077 899 8274', 'ZIM0002')
INTO shelters values 
('INDMUM01', 'Mumbai Peoples Shelter', 'Chhatrapati shivaji, 15', 1000, '+91 345 8948', 'IND0004')
INTO shelters values 
('INDDEL01', 'New Dehli Centre Shelter', 'Shahjahan road, 89', 3400, '+91 485 1345', 'IND0005')
INTO shelters values 
('INDDEL02', 'Gandhi Traditional Shelter', 'Gandhi Avenue, 485', 800, '+91 898 3405', 'IND0005')
INTO shelters values 
('INDDEL03', 'Gupta House Shelter', 'Batliwala Bldg, 24', 800, '+91 434 8976', 'IND0005')
INTO shelters values 
('INDDEL04', 'Community Delhi Shetler', 'Porbandar road, 84', 4000, '+91 798 3589', 'IND0005')
INTO shelters values 
('CANTOR03', 'Community City Hall Shelter', 'Richmond Street 154', 2500, '1 647 485 3485', 'CAN0003')
INTO shelters values 
('UKRDNI02', 'Dnipro Common Help Shelter', 'Prozaichna Street, 34', 1250, '+380 58 345 4300', 'UKR0005')
INTO shelters values 
('UKRRIV02', 'Creative Shelter Rivne', 'Vesny Avenue, 85', 125, '+380 45 689 3789', 'UKR0006')
SELECT * FROM dual;

CREATE TABLE users (
    user_id NUMBER(5) PRIMARY KEY,
    firstname VARCHAR2(25) NOT NULL,
    lastname VARCHAR2(25) NOT NULL,
    email VARCHAR2(35) NOT NULL,
    place_id VARCHAR2(7) NOT NULL,
    CONSTRAINT FK_UsersPlace FOREIGN KEY
    (place_id) REFERENCES places(place_id) 
);

INSERT ALL
INTO users VALUES (1, 'Maksym', 'Syromolot', 'msyromolot@myseneca.ca', 'UKR0001')
INTO users VALUES (2, 'Sakshi', 'Jaswal', 'sjaswal@myseneca.ca', 'IND0001')
INTO users VALUES (3, 'Dylan', 'Musiiwa', 'dmusiiwa@myseneca.ca', 'ZIM0001')
INTO USERS values(4,'Christy','Tendy','ctendy@gmail.com','IND0002')
INTO USERS values(5,'John','Smith','john.smith@gmail.com','IND0001')
INTO USERS values(6,'Emma','Johnson','emma.johnson@gmail.com','IND0004')
INTO USERS values(7,'Michael','Williams','michael.williams@examp.com','ZIM0003')
INTO USERS values(8,'Sophia','Jones','sophia.jones@gmail.com','ZIM0004')
INTO USERS values(9,'James','Brown','james.brown@gmail.com','ZIM0001')
INTO USERS values(10,'Taras','Shevchyk','taras.shevchyk@gmail.com','UKR0001')
INTO USERS values(11,'Oleksandr','Melnyk','oleksandr.melnyk@gmail.com','UKR0002')
INTO USERS values(12,'Mia','Wilson','mia.wilson@gmail.com','CAN0003')
INTO USERS values(13,'William','Moore','william.moore@gmail.com','IND0001')
INTO USERS values(14,'Mariia','Lebid','mariia.lebid@gmail.com','UKR0004')
INTO USERS values(15,'Benjamin','Anderson','benjamin.anderson@gmail.com','ZIM0002')
INTO USERS values(16,'Charlotte','Thomas','charlotte.thomas@gmail.com','IND0001')
INTO USERS values(17,'Bohdan','Savchenko','bohdan.savchenko@gmail.com','UKR0001')
INTO USERS values(18,'Ava','White','ava.white@gmail.com','CAN0003')
INTO USERS values(19,'Anton','Moskalenko','anton.moskalenko@gmail.com','UKR0004')
INTO USERS values(20,'Isabella','Martin','isabella.martin@gmail.com','ZIM0002')
SELECT * FROM dual;

CREATE TABLE danger_information (
    danger_info_id NUMBER(10) PRIMARY KEY,
    type VARCHAR2(25) NOT NULL,
    description VARCHAR2(1000) NOT NULL
);


CREATE TABLE dangers (
    danger_id NUMBER(10) PRIMARY KEY,
    danger_severity NUMBER(2) NOT NULL,
    danger_info_id NUMBER(10) NOT NULL,
    CONSTRAINT FK_dangersDInfo FOREIGN KEY
    (danger_info_id) REFERENCES danger_information(danger_info_id) 
);

CREATE TABLE communities (
    community_id NUMBER(5) PRIMARY KEY,
    type VARCHAR2(25) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    place_id VARCHAR2(7) NOT NULL,
    CONSTRAINT FK_communitiesPlace FOREIGN KEY
    (place_id) REFERENCES places(place_id)
);

INSERT ALL 
INTO communities VALUES (1, 'authority', 'Podil Official Channel', 'UKR0003')
INTO communities VALUES (2, 'centre', 'Helper Centre Podil', 'UKR0003')
INTO communities VALUES (3, 'generic', 'Borshahika Peoples Community', 'UKR0001')
INTO communities VALUES (4, 'authority', 'Dnipro Official Channel', 'UKR0005')
INTO communities VALUES (5, 'authority', 'Rivne Official Channel', 'UKR0006')
INTO communities VALUES (6, 'authority', 'Harare Official Channel', 'ZIM0001')
INTO communities VALUES (7, 'centre', 'Helper Centre Harare', 'ZIM0001')
INTO communities VALUES (8, 'generic', 'Delhi Peoples Community', 'IND0005')
INTO communities VALUES (9, 'authority', 'Mumbai Official Channel', 'IND0004')
INTO communities VALUES (10, 'authority', 'Mutare Official Channel', 'ZIM0002')
INTO communities VALUES (11, 'generic', 'Kyiv-Mohyla University Channel', 'UKR0003')
INTO communities VALUES (12, 'centre', 'Helper Centre Mutare', 'ZIM0002')
INTO communities VALUES (13, 'generic', 'Mumbai Will Help', 'IND0004')
INTO communities VALUES (14, 'generic', 'Dnipro On the Way', 'UKR0005')
INTO communities VALUES (15, 'generic', 'Harare Strikes!', 'ZIM0001')
INTO communities VALUES (16, 'generic', 'Rivne is Singing', 'UKR0006')
INTO communities VALUES (17, 'centre', 'Central Mumbai Help Centre', 'IND0004')
INTO communities VALUES (18, 'generic', 'Mumbai is Not Sleeping', 'IND0004')
INTO communities VALUES (19, 'centre', 'Mutare helping Centre', 'ZIM0002')
INTO communities VALUES (20, 'generic', 'Borshagivka My Home', 'UKR0001')
INTO communities VALUES (21, 'generic', 'Toronto in your Heart', 'CAN0003')
SELECT * FROM dual;

CREATE TABLE admins (
    admin_id NUMBER(5) PRIMARY KEY,
    user_id NUMBER(5) NOT NULL,
    CONSTRAINT FK_AdminUser FOREIGN KEY
    (user_id) REFERENCES users(user_id)
);

INSERT ALL 
INTO admins values(1, 1)
INTO admins values(2, 2)
INTO admins values(3, 3)
INTO admins values(4, 6)
INTO admins values(5, 8)
INTO admins values(6, 15)
INTO admins values(7, 18)
INTO admins values(8, 9)
INTO admins values(9, 12)
INTO admins values(10, 19)
SELECT * FROM dual;

CREATE TABLE admins_communities_bridge (
    admin_com_id NUMBER(10) PRIMARY KEY,
    admin_id NUMBER(5) NOT NULL,
    community_id NUMBER(5) NOT NULL,
    CONSTRAINT FK_AdminsCommunitiesBr FOREIGN KEY
    (admin_id) REFERENCES admins (admin_id),
    CONSTRAINT FK_CommunitiesAdminsBr FOREIGN KEY
    (community_id) REFERENCES communities(community_id)
);


INSERT ALL 
INTO admins_communities_bridge values(1, 1, 3)
INTO admins_communities_bridge values(2, 1, 20)
INTO admins_communities_bridge values(3, 10, 20)
INTO admins_communities_bridge values(4, 10, 11)
INTO admins_communities_bridge values(5, 2, 15)
INTO admins_communities_bridge values(6, 3, 13)
INTO admins_communities_bridge values(7, 3, 18)
INTO admins_communities_bridge values(8, 4, 18)
INTO admins_communities_bridge values(9, 4, 9)
INTO admins_communities_bridge values(10, 5, 8)
INTO admins_communities_bridge values(11, 6, 6)
INTO admins_communities_bridge values(12, 6, 7)
INTO admins_communities_bridge values(13, 7, 21)
INTO admins_communities_bridge values(14, 8, 15)
INTO admins_communities_bridge values(15, 9, 21)
INTO admins_communities_bridge values(16, 10, 14)
INTO admins_communities_bridge values(17, 10, 16)
INTO admins_communities_bridge values(18, 1, 16)
INTO admins_communities_bridge values(19, 6, 8)
INTO admins_communities_bridge values(20, 2, 6 )
SELECT * FROM dual;

CREATE TABLE posts (
    post_id NUMBER(10) PRIMARY KEY,
    post_type VARCHAR2(25) NOT NULL,
    post_content VARCHAR2(1000) NOT NULL,
    time Date NOT NULL,
    user_id NUMBER(5) NOT NULL,
    community_id number(5) NOT NULL,
    CONSTRAINT FK_postUser FOREIGN KEY
    (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_postCommunity FOREIGN KEY
    (community_id) REFERENCES communities (community_id) 
);

INSERT ALL
INTO posts VALUES(1, 'alert', 'Bombings from 6am to 9am, hide in the nearest shelters.', 
TO_DATE('2024-04-09 5:50:00','YYYY-MM-DD HH24:MI:SS'), 1, 3)
INTO posts VALUES(2, 'informative', 'Guys don''t swim in the river today please, there will be bombings.', 
TO_DATE('2024-04-09 5:51:00','YYYY-MM-DD HH24:MI:SS'), 1, 20)
INTO posts VALUES (3, 'warning', 'Strong winds are going to intensify. Be careful.', 
TO_DATE('2024-04-09 6:00:00','YYYY-MM-DD HH24:MI:SS'), 3, 13)
into posts VALUES (4, 'informative', 'We need more help.', 
TO_DATE('2024-04-09 6:05:00','YYYY-MM-DD HH24:MI:SS'), 5, 8)
INTO posts VALUES (5, 'warning', 'Stay indoors and away from windows.', 
TO_DATE('2024-04-09 6:10:00','YYYY-MM-DD HH24:MI:SS'), 4, 18)
into posts VALUES (6, 'warning', 'Emergency services are on high alert.', 
TO_DATE('2024-04-09 6:20:00','YYYY-MM-DD HH24:MI:SS'), 5, 8)
into posts VALUES (7, 'informative', 'Avoid unnecessary travel.', 
TO_DATE('2024-04-09 6:30:00','YYYY-MM-DD HH24:MI:SS'), 6, 6)
into posts VALUES (8, 'alert', 'Seek shelter immediately if outdoors.', 
TO_DATE('2024-04-09 6:40:00','YYYY-MM-DD HH24:MI:SS'), 7, 21)
into posts VALUES (9, 'informative', 'Stay connected with loved ones.', 
TO_DATE('2024-04-09 6:50:00','YYYY-MM-DD HH24:MI:SS'), 8, 15)
into posts VALUES (10, 'informative', 'Check emergency supplies.', 
TO_DATE('2024-04-09 7:00:00','YYYY-MM-DD HH24:MI:SS'), 9, 21)
into posts VALUES (11, 'informative', 'Stay updated with local news.', 
TO_DATE('2024-04-09 7:10:00','YYYY-MM-DD HH24:MI:SS'), 10, 14)
into posts VALUES (12, 'informative', 'Keep emergency contacts handy.', 
TO_DATE('2024-04-09 7:20:00','YYYY-MM-DD HH24:MI:SS'), 10, 16)
into posts VALUES (13, 'informative', 'Help those in need if safe to do so.', 
TO_DATE('2024-04-09 7:30:00','YYYY-MM-DD HH24:MI:SS'), 6, 8)
into posts VALUES(14, 'warning', 'Report suspicious activities.', 
TO_DATE('2024-04-09 7:40:00','YYYY-MM-DD HH24:MI:SS'), 3, 18)
into posts VALUES (15, 'informative', 'Stay calm and follow instructions.', 
TO_DATE('2024-04-09 7:50:00','YYYY-MM-DD HH24:MI:SS'), 7, 15)
into posts VALUES (16, 'informative', 'Emergency services hotline: 123-456-7890.', 
TO_DATE('2024-04-09 8:00:00','YYYY-MM-DD HH24:MI:SS'), 10, 16)
into posts VALUES (17, 'informative', 'Stay informed, stay safe.', 
TO_DATE('2024-04-09 8:10:00','YYYY-MM-DD HH24:MI:SS'), 4, 3)
into posts VALUES(18, 'informative', 'Look out for vulnerable individuals.', 
TO_DATE('2024-04-09 8:20:00','YYYY-MM-DD HH24:MI:SS'), 5, 3)
into posts VALUES (19, 'warning', 'Stay indoors until further notice.', 
TO_DATE('2024-04-09 8:30:00','YYYY-MM-DD HH24:MI:SS'), 1, 3)
into posts VALUES (20, 'informative', 'Let authorities know of any unattended packages.', 
TO_DATE('2024-04-09 8:40:00','YYYY-MM-DD HH24:MI:SS'), 2, 3)
SELECT * from dual;

CREATE TABLE users_communities_bridge (
    usr_com_id NUMBER(5) PRIMARY KEY,
    user_id NUMBER(5) NOT NULL,
    community_id NUMBER(5) NOT NULL,
    CONSTRAINT FK_UsersCommunitiesBr FOREIGN KEY
    (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_CommunitiesUsersBr FOREIGN KEY
    (community_id) REFERENCES communities(community_id)
);

INSERT ALL
into users_communities_bridge values (1, 1, 3)
into users_communities_bridge values (2, 1, 20)
into users_communities_bridge values (3, 1, 1)
into users_communities_bridge values (4, 1, 11)
into users_communities_bridge values (5, 2, 15)
into users_communities_bridge values (6, 2, 6)
into users_communities_bridge values (7, 3, 13)
into users_communities_bridge values (8, 3, 18)
into users_communities_bridge values (9, 4, 3)
into users_communities_bridge values (10, 6, 9)
into users_communities_bridge values (11, 6, 18)
into users_communities_bridge values (12, 6, 13)
into users_communities_bridge values (13, 9, 6)
into users_communities_bridge values (14, 9, 7)
into users_communities_bridge values (15, 9, 15)
into users_communities_bridge values (16, 10, 3)
into users_communities_bridge values (17, 10, 20)
into users_communities_bridge values (18, 12, 21)
into users_communities_bridge values (19, 15, 19)
into users_communities_bridge values (20, 15, 12)
into users_communities_bridge values (21, 15, 10)
into users_communities_bridge values (22, 17, 3)
into users_communities_bridge values (23, 17, 20)
into users_communities_bridge values (24, 18, 21)
into users_communities_bridge values (25, 15, 12)
into users_communities_bridge values (26, 20, 10)
into users_communities_bridge values (27, 20, 12)
into users_communities_bridge values (28, 20, 19)
into users_communities_bridge values (29, 10, 11)
into users_communities_bridge values (30, 20, 10)
into users_communities_bridge values (31, 20, 12)
into users_communities_bridge values (32, 4, 18)
into users_communities_bridge values (33, 4, 9)
into users_communities_bridge values (34, 10, 11)
into users_communities_bridge values (35, 5, 8)
into users_communities_bridge values (36, 6, 6)
into users_communities_bridge values (37, 6, 7)
into users_communities_bridge values (38, 7, 21)
into users_communities_bridge values (39, 8, 15)
into users_communities_bridge values (40, 9, 21)
into users_communities_bridge values (41, 10, 14)
into users_communities_bridge values (42, 10, 16)
into users_communities_bridge values (43, 1, 16)
into users_communities_bridge values (44, 6, 8)
select * from dual;


CREATE TABLE messages (
    message_id NUMBER(10) PRIMARY KEY,
    time Date NOT NULL,
    content VARCHAR2(1000) NOT NULL,
    sender_id NUMBER(5) NOT NULL,
    receiver_id NUMBER(5) NOT NULL,
    CONSTRAINT FK_messagesUserSend FOREIGN KEY
    (sender_id) REFERENCES users(user_id),
    CONSTRAINT FK_messagesUserReceive FOREIGN KEY
    (receiver_id) REFERENCES users(user_id)
);

INSERT ALL
INTO messages (message_id, time, content, sender_id, receiver_id)
VALUES (1, TO_DATE('2024-04-09 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'Emergency alert: Bombings reported in the area.', 1, 3)
INTO messages (message_id, time, content, sender_id, receiver_id)
VALUES (2, TO_DATE('2024-04-09 08:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'Stay indoors and take shelter immediately.', 3, 2)
INTO messages (message_id, time, content, sender_id, receiver_id)
VALUES (3, TO_DATE('2024-04-09 08:25:00', 'YYYY-MM-DD HH24:MI:SS'), 'Are you safe? Please respond.', 2, 1)
INTO messages (message_id, time, content, sender_id, receiver_id)
VALUES (4, TO_DATE('2024-04-09 08:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Yes, I''m in the shelter. Thanks for checking!', 1, 2)
INTO messages (message_id, time, content, sender_id, receiver_id)
VALUES (5, TO_DATE('2024-04-09 08:35:00', 'YYYY-MM-DD HH24:MI:SS'), 'Glad to hear you''re safe. Stay vigilant.', 2, 1)
INTO messages (message_id, time, content, sender_id, receiver_id)
VALUES (6, TO_DATE('2024-04-09 08:40:00', 'YYYY-MM-DD HH24:MI:SS'), 'Heavy rains expected. Secure your belongings.', 4, 5)
INTO messages (message_id, time, content, sender_id, receiver_id)
VALUES (7, TO_DATE('2024-04-09 08:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'I''m on my way to the shelter. Are you okay?', 5, 4)
INTO messages (message_id, time, content, sender_id, receiver_id)
VALUES (8, TO_DATE('2024-04-09 08:50:00', 'YYYY-MM-DD HH24:MI:SS'), 'Yes, I''m safe. Take care.', 4, 5)
INTO messages (message_id, time, content, sender_id, receiver_id)
VALUES (9, TO_DATE('2024-04-09 08:55:00', 'YYYY-MM-DD HH24:MI:SS'), 'Stay safe and stay connected.', 5, 4)
INTO messages (message_id, time, content, sender_id, receiver_id)
VALUES (10, TO_DATE('2024-04-09 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Let me know if you need any help.', 3, 1)
SELECT * FROM dual;

CREATE TABLE comments (
    comment_id NUMBER(10) PRIMARY KEY,
    content VARCHAR2(1000) NOT NULL,
    upvotes_num NUMBER(5) NOT NULL,
    user_id NUMBER(5) NOT NULL,
    post_id NUMBER(10) NOT NULL,
    CONSTRAINT FK_commentsUsers FOREIGN KEY
    (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_commentsPosts FOREIGN KEY
    (post_id) REFERENCES posts(post_id)
);

INSERT ALL
INTO comments VALUES (1, 'Stay safe everyone!', 10, 1, 1)
INTO comments VALUES (2, 'Thank you for the information.', 15, 2, 2)
INTO comments VALUES (3, 'We need to prepare for this.', 5, 3, 3)
INTO comments VALUES (4, 'Stay strong!', 8, 4, 4)
INTO comments VALUES (5, 'Please take care.', 12, 5, 5)
INTO comments VALUES (6, 'Praying for everyone.', 7, 6, 6)
INTO comments VALUES (7, 'Be vigilant.', 20, 7, 7)
INTO comments VALUES (8, 'Seek shelter immediately.', 25, 8, 8)
INTO comments VALUES (9, 'Let''s stay connected.', 18, 9, 9)
INTO comments VALUES (10, 'Important advice.', 11, 10, 10)
SELECT * FROM dual;

CREATE TABLE places_dangers_bridge (
    plc_dngr_id NUMBER(10) PRIMARY KEY,
    place_id VARCHAR2(7) NOT NULL,
    danger_id NUMBER(10) NOT NULL,
    CONSTRAINT FK_PlacesDangersBr FOREIGN KEY
    (place_id) REFERENCES places(place_id),
    CONSTRAINT FK_DangersPlacesBr FOREIGN KEY
    (danger_id) REFERENCES dangers(danger_id)
);