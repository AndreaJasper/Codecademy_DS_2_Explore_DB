-- Which tracks appear in the most playlists? How many playlists did they appear in?
SELECT name AS 'Track', COUNT(PlaylistId) AS 'number_in_playlist'
FROM playlist_track AS pt
JOIN tracks AS t
	ON pt.TrackId = t.TrackId
GROUP BY pt.TrackId
ORDER BY 2 DESC
LIMIT 10;

-- Which track generated the most revenue?
SELECT tracks.TrackId, tracks.name, SUM(Total) AS 'Revenue'
FROM tracks
JOIN invoice_items
	ON tracks.TrackId = invoice_items.TrackId
JOIN invoices
	ON invoice_items.InvoiceId = invoices.InvoiceId
GROUP BY 1
ORDER BY 3 DESC
LIMIT 10;

-- Which album?
SELECT albums.Title, ROUND(SUM(Total)) AS 'Total Revenue'
FROM albums
JOIN tracks
	ON albums.AlbumId = tracks.AlbumId
JOIN invoice_items
	ON tracks.TrackId = invoice_items.TrackId
JOIN invoices
	ON invoice_items.InvoiceId = invoices.InvoiceId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Which genre?
SELECT genres.name, ROUND(SUM(Total)) AS 'Total Revenue'
FROM genres
LEFT JOIN tracks
	ON genres.GenreId = tracks.GenreId
JOIN invoice_items
	ON tracks.TrackId = invoice_items.TrackId 
JOIN invoices
	ON invoice_items.InvoiceId = invoices.InvoiceId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
