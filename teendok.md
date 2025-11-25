Sql: létre hozni egy statisztika/eredmeny táblát ez még a jővő tervétől függ.(Kész van)
Attól hogy hány liga lesz és hogy hogyan lesznek a meccsek.
-ne legyen users tábla mert igazából felesleges nincs funciója(Kész van)
össze kötni a statisztikakat/eredmenyeket a játkos és a csapat táblával kivéve akkor 
ha nem lesz statisztika(Lett statisztika tábla igy ez már felesleges)
hanem eredmenyek lesz helyette akkor igazabol eleg ha csak a csapatok kötödnek oda.

Sql 2.változtatás:
Goloknál csak gól vagy akár nem is kell de inkább maradjon
golok legyen int helyett tinyint ne legyen hossz értéke csak default
A csapat se kell mert id-ből megvan minden csapat
A datum ne date legyen hanem datetime
Az eredmények tábla nem fog kelleni hiszen a statisztikákból mindent megfogunk majd kapni
A news is majd csatlakozhat idővel a többi táblához és igy majd azokból tud létrehozni
híreket és infokat gyűjteni.
