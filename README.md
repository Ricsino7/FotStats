Tagok: Bokor Richard, Kulcsár Tamás
Keretrendszer: AngularJS, Bootstrap
Backend:PHP
Az oldal elinditásáná:
1. Szerverkörnyezet előkészítése

Az alkalmazás futtatásához elengedhetetlen a XAMPP használata, amely biztosítja a szükséges szerveroldali szolgáltatásokat.
A XAMPP vezérlőpultot el kell indítani.
Az alábbi modulokat kötelező elindítani:
Apache – a webkiszolgáló működéséhez
MySQL – az adatbázis kezeléséhez
Az alkalmazás csak akkor működik megfelelően, ha mindkét szolgáltatás aktív állapotban van.

2. Adatbázis telepítése
A projekt adatkezelése MySQL adatbázison alapul.
A mellékelt adatbázisfájlt (pl. .sql) a phpMyAdmin felületén keresztül kell importálni.
Az adatbázist a XAMPP MySQL szolgáltatásában kell létrehozni.
Az adatbázis struktúrájának és adatainak helyes betöltése nélkül az alkalmazás nem képes megfelelően működni.

3. Projektfájlok elhelyezése
A projekt teljes mappáját a XAMPP telepítési könyvtárán belül a htdocs mappába kell másolni.
Ez biztosítja, hogy az alkalmazás a helyi webszerveren keresztül legyen elérhető.

4. Az alkalmazás elindítása böngészőből
Az alkalmazás index fájljának elérési útját ki kell másolni.
Az útvonalat be kell illeszteni a böngésző címsorába.
A címsorban az elérési út elejét a htdocs mappáig bezárólag törölni kell.
A törölt rész helyére a következő kifejezést kell beírni: localhost

5. Az oldal betöltése
A módosított URL megnyitása után az alkalmazás betöltődik, és a főoldal megjelenik.
Sikeres indítás esetén az oldal minden funkciója elérhetővé válik.

6. Összegzés
Amennyiben az összes fent felsorolt lépés megfelelő sorrendben és pontosan kerül végrehajtásra:
az alkalmazás hibamentesen elindul,
az adatbázis-kapcsolat megfelelően működik,
az oldal funkcionalitása teljes körűen elérhető.

A fenti lépések betartása után az alkalmazás használata során technikai probléma nem várható.
Github: https://github.com/Ricsino7/FotStats
Trello: https://trello.com/b/FnMqFbDa/fotstats