use world;
select * from city;
select * from country;
select * from countrylanguage;

-- Query Test (40)

-- No 1.1
select * from city where CountryCode = 'USA' limit 10;

-- No. 1.2
select city.ID, city.Name as 'City', c.name as Country, city.Population from city city
join country c on city.id = c.Capital order by city.Population desc limit 10;

-- No. 1.3
select c.Code, c.Name, cl.Language, cl.isOfficial, cl.Percentage from country c
join countrylanguage cl on c.code = cl.CountryCode
where cl.Language = 'English' and cl.isOfficial = 'T'
order by cl.Percentage desc limit 10;

-- No. 1.4
select c.Name, c.Population, (c.GNP / c.Population) as GNPperCapita, city.id as Ibukota, city.Population as PendudukIbukota from country c
join city city on city.CountryCode = c.Code
where c.Region = 'Southeast Asia' group by c.Name order by GNPperCapita desc limit 10;

-- No. 1.5
select Name, Continent, LifeExpectancy, GNP from country 
where LifeExpectancy > (select avg(LifeExpectancy) from country where Continent = 'Europe')
and Continent = 'Asia' order by LifeExpectancy desc limit 10;

-- ------------------------ next
-- No. 1.2.1
select Name as country_name, region, IndepYear as indep_year from country
where IndepYear is not null and Continent = 'Asia' order by IndepYear asc limit 3;

-- No. 1.2.2
select Name as country_name, gnp as gnp_growth from country
where Continent = 'Europe' order by gnp desc limit 3;

-- No. 1.2.3
select c.Name as country_name, c.SurfaceArea as surface_area, cl.language, cl.isOfficial from country c
join countrylanguage cl on cl.CountryCode = c.code
where cl.language = 'English' and c.SurfaceArea > (select avg(SurfaceArea) from country where Continent = 'Europe')
order by surface_area desc limit 4;

