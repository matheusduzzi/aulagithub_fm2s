USE world; -- Definição do banco a ser usado

SELECT * FROM city LIMIT 5; -- Breve visualização dos dados do banco - tabela city

SELECT Name, Population FROM city WHERE Population >= 1000000; -- Cidades com mais de 1 milhão de habitantes

SELECT
co.Name as nome_do_pais,
Count(ci.ID) as quantidade_cidade
FROM city as ci
LEFT JOIN country as co ON co.Code = ci.CountryCode
WHERE co.Name = 'Brazil' AND ci.Population >= 1000000
group by ci.CountryCode; -- Quantidade de cidades no "Brazil" com mais de 1M de habitantes

SELECT
co.Name as nome_do_pais,
co.Continent as nome_continente,
Count(ci.ID) as quantidade_cidade
FROM city as ci
LEFT JOIN country as co ON co.Code = ci.CountryCode
WHERE ci.Population >= 1000000
group by ci.CountryCode, co.Continent
ORDER BY quantidade_cidade DESC; -- Quantidade de cidades por pais e continente com mais de 1000000

SELECT
co.Name as nome_do_pais,
co.Continent as nome_continente,
Count(ci.ID) as quantidade_cidade,
AVG(co.SurfaceArea) as quantidade_media_de_area
FROM city as ci
LEFT JOIN country as co ON co.Code = ci.CountryCode
WHERE ci.Population >= 1000000
group by ci.CountryCode, co.Continent
HAVING quantidade_media_de_area >= 5000000
ORDER BY quantidade_cidade DESC; -- Quantidade de cidades por pais e continente com mais de 1000000, com agregação da média de área por cidade, filtrando surface area acima de 5000000

