##Code 1
With t1 as(SELECT   Count(G.GenreId) AS Purchases,
                    C.Country AS Country,
                    G.Name As GenreName,
                    G.GenreId AS ID
FROM Customer C
JOIN Invoice I
ON I.CustomerId=C.CustomerId
JOIN InvoiceLine IL
ON IL.InvoiceId=I.InvoiceId
JOIN TRACK T
ON T.TrackId=IL.TrackId
JOIN Genre G
ON G.GenreId=T.GenreId
GROUP BY 2,3),

t2 as (Select   Max(t1.Purchases) Maximo,
                Country as Nation ,
                GenreName Genero
From t1
Group by t1.Country)

Select  Maximo,
        Nation,
        GenreName,
        ID
from t2
Join t1
where Maximo = t1.purchases and Nation = t1.Country


##Code 2
SELECT  Ar.ArtistId,
        Ar.Name,
        count(T.TrackId) as songs

from Artist as Ar
JOIN Album as A
on Ar.ArtistId=A.ArtistId
JOIN Track as T
on A.AlbumId=T.AlbumId
join Genre as G
on T.GenreId=G.GenreId
Where G.Name="Rock"
group by 1
order by 3 desc
limit 10;

##Code 3
SELECT  c.CustomerId,
        c.Email,
        c.country,
        c.city,
        sum(i.total) as invoices

from Invoice as i
join Customer as c
on c.CustomerId=i.CustomerId
group by 1
order by invoices DESC;

##Code 4
Select  c.CustomerId,
        c.FirstName,
        c.LastName,
        sum(i.total) as Invoice

from Customer as c
join Invoice as i
on i.CustomerId=c.CustomerId
where c.city ="Prague"
group by 1
order by 4 DESC;
