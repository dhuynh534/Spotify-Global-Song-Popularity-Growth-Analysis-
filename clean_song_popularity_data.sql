-- Remove Duplicates
DELETE FROM goxx
WHERE spotify_id IN (
    SELECT spotify_id
    FROM (
        SELECT spotify_id, snapshot_date, country, 
               ROW_NUMBER() OVER (PARTITION BY spotify_id, snapshot_date, country ORDER BY daily_rank) AS row_num
        FROM goxx
    ) AS duplicates
    WHERE row_num > 1
);

-- Handle Missing Data
DELETE FROM goxx 
WHERE name IS NULL;

UPDATE goxx 
SET country = 'unknown' 
WHERE country IS NULL;

-- Standardize Column Data Types
ALTER TABLE goxx 
MODIFY COLUMN spotify_id VARCHAR(250),
MODIFY COLUMN name VARCHAR(500),
MODIFY COLUMN artists VARCHAR(500),
MODIFY COLUMN daily_rank INT,
MODIFY COLUMN daily_movement INT,
MODIFY COLUMN weekly_movement INT,
MODIFY COLUMN country VARCHAR(100),
MODIFY COLUMN snapshot_date DATE,
MODIFY COLUMN popularity FLOAT;

-- Standardize Data Formatting
UPDATE goxx 
SET country = LOWER(country);

UPDATE goxx 
SET name = TRIM(name), 
    artists = TRIM(artists);

-- Flag Outliers in Popularity Column (Values outside 0-100 range)
-- Add column for outlier flags if not already present
ALTER TABLE goxx ADD COLUMN popularity_outlier BOOLEAN DEFAULT 0;

-- Flag outliers based on the range of 0 to 100 for popularity
UPDATE goxx 
SET popularity_outlier = CASE
    WHEN popularity < 0 OR popularity > 100 THEN 1
    ELSE 0
END;

-- Calculate Popularity Growth (7-day difference)
CREATE TEMPORARY TABLE temp_goxx AS 
SELECT spotify_id, country, snapshot_date, popularity 
FROM goxx;

UPDATE goxx g1
JOIN temp_goxx g2 
ON g1.spotify_id = g2.spotify_id 
AND g1.country = g2.country 
AND g1.snapshot_date = g2.snapshot_date + INTERVAL 7 DAY
SET g1.pop_growth = g1.popularity - g2.popularity;

-- Create Index for Performance
CREATE INDEX idx_spotify_country_date ON goxx(spotify_id, country, snapshot_date);

-- Final Data Check
SELECT *
FROM goxx;