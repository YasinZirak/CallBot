
drop table if exists Interpreters;


CREATE TABLE Interpreters (
    ID INTEGER PRIMARY KEY,
    Name TEXT,
    Language TEXT,
    Experience INTEGER,
    Email TEXT,
    Phone TEXT,
    Video_delivery_method TEXT,
    Phone_delivery_method TEXT,
    Onsite_delivery_method TEXT
);

INSERT INTO Interpreters (Phone, Email, Video_delivery_method, Phone_delivery_method, Onsite_delivery_method, Experience, Language, Name, ID)
VALUES
    ('555-123-4567', 'johndoe@email.com', 'Yes', 'No', 'Yes', 5, 'English-Spanish', 'JohnDoe', 1),
    ('555-234-5678', 'janesmith@email.com', 'Yes', 'Yes', 'No', 3, 'French', 'JaneSmith', 2),
    ('555-345-6789', 'maria@email.com', 'Yes', 'No', 'No', 7, 'Spanish', 'MariaRodriguez', 3),
    ('555-456-7890', 'robertkim@email.com', 'Yes', 'Yes', 'No', 4, 'Korean-English', 'RobertKim', 4),
    ('555-567-8901', 'ahmed@email.com', 'No', 'No', 'No', 2, 'Arabic', 'AhmedAhmed', 5),
    ('555-678-9012', 'elena@email.com', 'Yes', 'Yes', 'Yes', 6, 'Russian', 'ElenaPetrov', 6),
    ('555-789-0123', 'sakura@email.com', 'No', 'No', 'No', 3, 'Japanese', 'SakuraTanaka', 7),
    ('555-890-1234', 'carlos@email.com', 'Yes', 'Yes', 'No', 8, 'English-Spanish', 'CarlosSanchez', 8),
    ('555-901-2345', 'ling@email.com', 'Yes', 'No', 'No', 4, 'Chinese', 'LingLi', 9),
    ('555-012-3456', 'ahmed@email.com', 'Yes', 'Yes', 'Yes', 5, 'Arabic', 'AhmedHassan', 10);
