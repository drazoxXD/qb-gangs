Citizen.CreateThread(
    function()
        local vRaw = LoadResourceFile(GetCurrentResourceName(), "version.json")
        if vRaw then
            local v = json.decode(vRaw)
            PerformHttpRequest(
                "https://raw.githubusercontent.com/drazoxXD/qb-gangs-create-gang-in-game/main/version.json",
                function(code, res, headers)
                    if code == 200 then
                        local rv = json.decode(res)
                        if rv.version ~= v.version then
                            print(
                                ([[^1
-----------------------------------------------
	qb-gangs
	Frissítés: %s ELRÉHETŐ
	Változtatások: %s
-----------------------------------------------
									^0]]):format(
                                    rv.version,
                                    rv.changelog
                                )
                            )
                        end
                    else
                        print("^1[qb-gangs]:^0 Nem lehet ellenőrizni a verziót. Az adattárat áthelyezték, átstrukturálták vagy törölték. Kérjük, ellenőrizze a github állapotát, ha probléma van.")
                    end
                end,
                "GET"
            )
        end
    end
)
