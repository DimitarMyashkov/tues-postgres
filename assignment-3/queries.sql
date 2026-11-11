-- Question 1: the songs in a given playlist, in order.
-- Returns: position, title, artist, duration (mm:ss) for every song in the
-- playlist 'Road Trip' (change the name in WHERE to see another playlist),
-- ordered by the position inside that playlist.
SELECT ps.position,
       s.title,
       a.name AS artist,
       (s.duration_seconds / 60) || ':' || lpad((s.duration_seconds % 60)::text, 2, '0') AS duration
FROM playlists p
JOIN playlist_songs ps ON ps.playlist_id = p.id
JOIN songs s           ON s.id = ps.song_id
JOIN artists a         ON a.id = s.artist_id
WHERE p.name = 'Road Trip'
ORDER BY ps.position;

-- Question 2: total duration and number of songs of every playlist.
-- Returns: one row per playlist with its name, the number of songs and the
-- total duration (in seconds and as mm:ss). LEFT JOIN keeps empty playlists
-- (0 songs, duration 0) instead of dropping them.
SELECT p.name AS playlist,
       COUNT(s.id) AS songs,
       COALESCE(SUM(s.duration_seconds), 0) AS total_seconds,
       (COALESCE(SUM(s.duration_seconds), 0) / 60) || ':' || lpad((COALESCE(SUM(s.duration_seconds), 0) % 60)::text, 2, '0') AS total_duration
FROM playlists p
LEFT JOIN playlist_songs ps ON ps.playlist_id = p.id
LEFT JOIN songs s           ON s.id = ps.song_id
GROUP BY p.id, p.name
ORDER BY p.name;
