USE music_shop;
CREATE TABLE users
(
    UserId INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    UserName NVARCHAR(30)  NOT NULL,
    `User` BOOLEAN NULL COMMENT 'Simple user - only view',
    `Manager` BOOLEAN NULL COMMENT 'Advanced user - view and modify',
    `Admin` BOOLEAN NULL COMMENT 'Super user - view, modify, delete',
    EmployeeId INTEGER NULL,
    FOREIGN KEY (EmployeeId) REFERENCES employees (EmployeeId)
                ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX IFK_UserEmployeeId ON employees (EmployeeId);