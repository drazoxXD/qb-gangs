# 🔪 **qb-gangs (Drazox)**

Ez a script már rég nem volt fejlesztve de egy srác mégis folytatta és én pedig magyarosítom mindenkinek! Kellemes használatot!


Bandák qbcore-ra a job-ok helyett a bandatámogatással, támogatja a végtelenül skálázó bandákat. Szuper 0,01 ms alapjárati optimalizált, ha bandában vagy akkor 0,04 ms-el tetőzik cp-kel vagy egy területi zónán belül, 0,00 ms alapjáraton civilként.

# Jellemzők:

Minden bandának van egy rejtekhelye és egy listája azokról a járművekről, amelyeket kiszállhatnak a garázsból. A konfiguráció teljesen testreszabható az egyes bandák számára. Bandák hozhatók létre a játékban a konfigurátorral, a főnökök és a területek pedig manuálisan konfigurálhatók.

# Banda létrehozása
- A banda létrehozásának megkezdéséhez használja a „/creategang [név] [leírás]” parancsot a folyamat elindításához, használja a „/placestash” paranccsal a banda rejtekhelyét és a „/placegarage” paranccsal a banda garázsát a játékon belüli konfigurátor segítségével. a banda színei és a járműlista, ha mindkettőt elhelyezte, használhatja a `/finishgang'-t a befejezéshez, vagy a `/cancelgang'-t bármikor megszakíthatja a folyamatot.


</details>


# Repo figyelmeztető
A címkézett kiadások az erőforrás „stabil” verziójának számítanak, a fő ág és mások kísérleti vagy befejezetlen kódot tartalmazhatnak, amellyel problémákba ütközhet.
Ez a repo 1 éves, az eredeti QBCore-hoz készült, és nem tervezem, hogy kompatibilis legyen az új verziókkal, mivel a karbantartók úgy döntöttek, hogy nem teszik visszafelé kompatibilissé.

# Drazox figyelmeztetése
Ha valamit megjavítottál vagy készítettél ehez a scripthez küld be ide mint egy Pull Request!
Sokat számít mindenkinek!


# Telepítés
Ezt tagd be a  qb-core/shared/gangs.lua like így:
```lua
QBShared.Gangs = json.decode(LoadResourceFile("qb-gangs", "gangs.json"))

```
Ragd be ezt a qb-core/server/events.lua
```lua
RegisterServerEvent("QBCore:Server:UpdateGangs")
AddEventHandler("QBCore:Server:UpdateGangs", function(gangs)
	QBShared.Gangs = gangs
	QBCore.Shared.Gangs = gangs
end)
```
Ragd be ezt a  qb-core/client/events.lua (Tetejére!)
```lua
RegisterNetEvent("QBCore:Server:UpdateGangs")
AddEventHandler("QBCore:Server:UpdateGangs", function(gangs)
	QBShared.Gangs = gangs
	QBCore.Shared.Gangs = gangs
end)
```

A zárható ajtók engedélyezéséhez a bandák számára módosítania kell qb-doorlocks/client/main.lua  217 sorban.
Valahogy így:
```lua
function IsAuthorized(doorID)
	local PlayerData = QBCore.Functions.GetPlayerData()

	for _,job in pairs(doorID.authorizedJobs) do
		if job == PlayerData.job.name then
			return true
		end
	end

	for _,gang in pairs(doorID.authorizedJobs) do
		if gang == PlayerData.gang.name then
			return true
		end
	end
	
	return false
end
```
Adja hozzá az egyes bandákhoz tartozó Citizenideket a bandavezetők számára a server/config.lua fájlhoz, így:
```lua
Config = {
	["GangLeaders"] = {
		["ballas"] = {
			"ORJ52463",
			"ABC12345"
		},
		["marabunta"] = {

		},
		["vagos"] = {

		},
		["families"] = {
			
		},
		["lost"] = {

		}
	}
}
```

# Használt ineriorok:

- Ballas Interior - https://github.com/TRANEdAK1nG/Ballas-Interior
- TheFamily Interior - https://github.com/TRANEdAK1nG/Famillies-Interior
- Vagos Interior - https://github.com/TRANEdAK1nG/Vagos-Interior
- Marabunta Interior - https://github.com/TRANEdAK1nG/Marabunta-Interior

# License
Mojito Fivem & Dhruvpamnani Are the devs i am just adding fixes and making it hungarian friendly
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License</a>.
