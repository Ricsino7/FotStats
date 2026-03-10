Sql: létre hozni egy statisztika/eredmeny táblát ez még a jővő tervétől függ.(Kész van) //KÉSZ
Attól hogy hány liga lesz és hogy hogyan lesznek a meccsek. //KÉSZ
-ne legyen users tábla mert igazából felesleges nincs funciója(Kész van) //KÉSZ
össze kötni a statisztikakat/eredmenyeket a játkos és a csapat táblával kivéve akkor  //KÉSZ
ha nem lesz statisztika(Lett statisztika tábla igy ez már felesleges) //KÉSZ 
hanem eredmenyek lesz helyette akkor igazabol eleg ha csak a csapatok kötödnek oda. //KÉSZ

Sql 2.változtatás:
Goloknál csak gól vagy akár nem is kell de inkább maradjon(Kész van) //KÉSZ
golok legyen int helyett tinyint ne legyen hossz értéke csak default(Kész van) //KÉSZ
A csapat se kell mert id-ből megvan minden csapat //KÉSZ
A datum ne date legyen hanem datetime(Kész van) //KÉSZ
Az eredmények tábla nem fog kelleni hiszen a statisztikákból mindent megfogunk majd kapni törölni kell(Kész van) //KÉSZ
A news is majd csatlakozhat idővel a többi táblához és igy majd azokból tud létrehozni //KÉSZ
híreket és infokat gyűjteni. //KÉSZ
Egy select létrehozása //KÉSZ
a táblázatba be kell rakni hogy  //KÉSZ
kell egy select és azt egy modelbe kell rakni kell neki egy érték  //KÉSZ
és automatikusan a ciklust egy ifet kell létrehozni a phpba //KÉSZ

Jatekosok:barcelona jatekosok kész
          city jatekosok is kész
          arsenal is kész
          liverpool is kész ricsi intézte 

Home tabeláknál: //KÉSZ
Lőtt/Kapott golok szám kiírása + golarány + GY D V Meccsek kiírása //KÉSZ
szponzorok megjelenítése a homeba //KÉSZ

languages megcsinálása otthon   //KÉSZ

meccseknál az idkat normalisan kiosztani pl 1es liga id csak az 1es idval jatszhat //KÉSZ

a tablat ahol a posztok vannak van egy kulcs egy id //KÉSZ
az osszes poszot fel kell venni //KÉSZ
aztan ossze kell kotni a nev szerint //KÉSZ
ide kell bele updatelni a dologokat  //KÉSZ

ki cserelni a jsonprettyprintet 
jsonunescapeducincode/Slashesre mint ketto kell 
kell bejelenkezes a wpfbe hogy adatokat lehessen feltolteni meg a hasonlok

ÖTLET(MUSZÁJ MEGVALOSITANI CRUD MIATT HOGY MEG LEGYEN):
    -Legyen bejelentkezése
    -Aki bejelentkezik tudjon meccsekre fogadni és a meccseket hozzáadni 
    -a listához amiket megrakott vagy éppen látni szeretne
    -a regisztraciohoz ha ranyomunka a gombra legyen alert ami 
    -kiírja hogy elmultal e 18 es lehet valasztasni az igen nem gombal

Adatbázis átírása/helyre rakása:
    -Statisztika kötése a meccsekhez ott legyen a gol ki lotte meg a pontszamok es ezen kivul az osszes tobbi is
    -Legyen kulon tabla a pontszamokra es a tobbire
    -A helyezes se legyen a csapatoknal
    -A meccseknel kell egy alt tabla ahol az eredmenyeket taroljuk ami a statisztikahoz tartozik egy tabla kell az eredmenyekre
        és abbol a tablabol fogjuk azokat az adatokat lekerdezni amik voltak a csapatoknal
    -A tábla: meccs_id, csapat_id, jatekos_id, melyik percbe rugta a golt és ebből a lekerdezésbol megtudjuk az eredmenyt
    tudjuk a ket csapatot a gol rugokat a golszamot és ebbol letudjuk az eredmenyt kerdezni
    datum se kell eleg csak hogy mikor voltak a golok.
    -A meccsekhez kell egy tervezet datum meg egy olyan hogy lejatszotak e vagy elmaradt vagy barmi.
    -statisztika tabla nem is kell
    -meccs_statisztika tabla legyen helyette

