SELECT * FROM playlists
JOIN playlist_track
ON playlist_track.PlaylistId=playlists.PlaylistId
JOIN tracks
ON playlist_track.TrackId=tracks.TrackId
WHERE playlists.Name="Classical"

---1 Find all the artists for a given genre---

SELECT artists.name , genres.Name AS Genre
FROM artists
JOIN albums ON artists.ArtistId = albums.ArtistId
JOIN tracks ON albums.AlbumId = tracks.AlbumId
JOIN genres ON tracks.GenreId = genres.GenreId
WHERE genres.Name = 'Rock'

---2 Find the playlist with the most/least (use group by and count)---

SELECT Name, COUNT(TrackId) AS Number_of_songs
FROM playlists
JOIN playlist_track ON playlists.PlaylistId = playlist_track.PlaylistId
GROUP BY playlists.PlaylistId

---3 Find the total for a given invoice (use sum agregate)----
---SELECT * FROM invoice_items---
SELECT InvoiceId, sum(UnitPrice) AS Total_for_Invoice
FROM invoice_items
GROUP BY InvoiceId
---4 Find all the playlists containing a given genre----
SELECT playlists.Name AS Playlist_Name
FROM playlists
JOIN playlist_track ON playlists.PlaylistId = playlist_track.PlaylistId
JOIN tracks ON playlist_track.TrackId = tracks.TrackId
JOIN genres ON tracks.GenreId = genres.GenreId
WHERE genres.Name = 'Rock'

---5 Find the biggest/smallest invoice amounts (use group by)---
SELECT InvoiceId, count(Quantity*UnitPrice) AS Invoice_Amounts
FROM invoice_items
GROUP BY InvoiceId
---6 Find the artist with the most/least songs(use group by)-----
SELECT artists.Name AS ArtistName, COUNT(tracks.TrackId) AS Number_Of_Tracks
FROM artists
JOIN albums ON artists.ArtistId = albums.ArtistId
JOIN tracks ON albums.AlbumId = tracks.AlbumId
GROUP BY artists.ArtistId
ORDER BY Number_of_Tracks DESC

--7 Find the artist with the most songs:----
SELECT artists.Name AS Artist_Name, COUNT(tracks.TrackId) AS Number_Of_Songs
FROM artists
JOIN albums ON artists.ArtistId = albums.ArtistId
JOIN tracks ON albums.AlbumId = tracks.AlbumId
GROUP BY artists.ArtistId
ORDER BY Number_Of_Songs ASC