USE music_shop;
SELECT * FROM media_types;
ALTER TABLE media_types
ADD createdAt datetime NOT NULL DEFAULT current_timestamp;

ALTER TABLE media_types
ADD createdBy integer NOT NULL DEFAULT 1;

ALTER TABLE media_types
ADD CONSTRAINT IFK_MediaTypesCreateUserId
FOREIGN KEY (createdBy) REFERENCES users(UserId);

ALTER TABLE media_types
MODIFY createdBy integer NOT NULL;

SELECT * FROM media_types;