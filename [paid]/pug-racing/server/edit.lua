print'Pug-Racing 1.0.0'
local QBCore = exports['qb-core']:GetCoreObject()
print "rewards getting"
-- racing rewards table
RegisterNetEvent("Pug:server:GetRacingRewards", function(src, TotalLaps, AmountOfRacers, PlayersFinished, RaceId)
   
    local Player = QBCore.Functions.GetPlayer(src)
   -- local Crypto = Player.PlayerData.metadata.crypto

    if Player ~= nil then
        if TotalLaps == 2 then
            if AmountOfRacers < 4 then
                if PlayersFinished == 1 then
                    exports['qb-phone']:AddCrypto(src, "shung", 6)
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                    
                elseif PlayersFinished == 2 then
                    exports['qb-phone']:AddCrypto(src, "shung", 4, "second place")
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                print "rewards given 2-3 racers"
            end
        elseif AmountOfRacers >= 4 and AmountOfRacers < 6 then
                if PlayersFinished == 1 then
                    exports['qb-phone']:AddCrypto(src, "gne", math.random(1, 3))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(13, 18))
                                       TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung & GNE)')
                elseif PlayersFinished == 2 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(11, 16))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 3 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(9, 14))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                else
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(5, 10))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                    print "rewards given 4-6 racers"
                end
                
            elseif AmountOfRacers >= 6 and AmountOfRacers < 8 then
                if PlayersFinished == 1 then
                    exports['qb-phone']:AddCrypto(src, "gne", math.random(7, 10))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(17, 22))
                                       TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung & GNE)')
                elseif PlayersFinished == 2 then
                   exports['qb-phone']:AddCrypto(src, "gne", math.random(4, 7))
                   exports['qb-phone']:AddCrypto(src, "shung", math.random(15, 20))
                                      TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung & GNE)')
                elseif PlayersFinished == 3 then
                    exports['qb-phone']:AddCrypto(src, "gne", math.random(1, 3))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(13, 18))
                                       TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung & GNE)')
                elseif PlayersFinished == 4 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(11, 16))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                    TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
			  
                elseif PlayersFinished == 5 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(9, 14))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 6 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(7, 12))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                else
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(5, 10))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                    print "rewards given 6-8 racers"
                end
            elseif AmountOfRacers >= 8 and AmountOfRacers < 10 then
               if PlayersFinished == 1 then
                    exports['qb-phone']:AddCrypto(src, "gne", math.random(9, 13))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(21, 26))
                                       TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung & GNE)')
                elseif PlayersFinished == 2 then
                   exports['qb-phone']:AddCrypto(src, "gne", math.random(6, 9))
                   exports['qb-phone']:AddCrypto(src, "shung", math.random(19, 24))
                                      TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung & GNE)')
                elseif PlayersFinished == 3 then
                    exports['qb-phone']:AddCrypto(src, "gne", math.random(3, 6))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(17, 22))
                                       TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung & GNE)')
                elseif PlayersFinished == 4 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(15, 20))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 5 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(13, 18))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 6 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(11, 16))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                else
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(9, 14))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                    print "rewards given 8-10 racers"
                end
            elseif AmountOfRacers >= 10 then
                if PlayersFinished == 1 then
                    exports['qb-phone']:AddCrypto(src, "gne", math.random(11, 16))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(25, 30))
                                       TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung & GNE)')
                elseif PlayersFinished == 2 then
                   exports['qb-phone']:AddCrypto(src, "gne", math.random(8, 11))
                   exports['qb-phone']:AddCrypto(src, "shung", math.random(23, 28))
                                      TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung & GNE)')
                elseif PlayersFinished == 3 then
                    exports['qb-phone']:AddCrypto(src, "gne", math.random(6, 8))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(21, 26))
                                       TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung & GNE)')
                elseif PlayersFinished == 4 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(19, 24))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 5 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(17, 22))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 6 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(15, 20))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                else
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(13, 18))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                
                end
                print "rewards given 10+ racers"
            end

        elseif TotalLaps >= 5 then
            Player.Functions.SetMetaData("criminalrep", NewRep) -- this is for my server to recieve criminal rep
            TriggerClientEvent('QBCore:Notify', src, '+'..crimrep..' Criminal Rep', 'success')
            if AmountOfRacers >= 4 and AmountOfRacers < 6 then
                if PlayersFinished == 1 then
                    --exports['qb-phone']:AddCrypto(src, "gne", math.random(7, 10))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(17, 22))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 2 then
                   --exports['qb-phone']:AddCrypto(src, "gne", math.random(4, 7))
                   exports['qb-phone']:AddCrypto(src, "shung", math.random(15, 20))
                                       TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 3 then
                    --exports['qb-phone']:AddCrypto(src, "gne", math.random(1, 3))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(13, 18))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 4 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(11, 16))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 5 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(9, 14))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 6 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(7, 12))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                else
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(5, 10))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                end
            elseif AmountOfRacers >= 6 and AmountOfRacers < 8 then
                if PlayersFinished == 1 then
                    --exports['qb-phone']:AddCrypto(src, "gne", math.random(9, 13))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(21, 26))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 2 then
                   --exports['qb-phone']:AddCrypto(src, "gne", math.random(6, 9))
                   exports['qb-phone']:AddCrypto(src, "shung", math.random(19, 24))
                                       TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 3 then
                   -- exports['qb-phone']:AddCrypto(src, "gne", math.random(3, 6))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(17, 22))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 4 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(15, 20))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 5 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(13, 18))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 6 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(11, 16))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                else
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(9, 14))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                end
            elseif AmountOfRacers >= 8 and AmountOfRacers < 10 then
                if PlayersFinished == 1 then
                  --  exports['qb-phone']:AddCrypto(src, "gne", math.random(11, 16))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(25, 30))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 2 then
                 --  exports['qb-phone']:AddCrypto(src, "gne", math.random(8, 11))
                   exports['qb-phone']:AddCrypto(src, "shung", math.random(23, 28))
                                       TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 3 then
                 --   exports['qb-phone']:AddCrypto(src, "gne", math.random(6, 8))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(21, 26))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 4 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(19, 24))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 5 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(17, 22))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 6 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(15, 20))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                else
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(13, 18))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                
                end
            elseif AmountOfRacers >= 10 then
                if PlayersFinished == 1 then
                  --  exports['qb-phone']:AddCrypto(src, "gne", math.random(11, 16))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(29, 34))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 2 then
                 --  exports['qb-phone']:AddCrypto(src, "gne", math.random(8, 11))
                   exports['qb-phone']:AddCrypto(src, "shung", math.random(27, 32))
                                       TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 3 then
                  --  exports['qb-phone']:AddCrypto(src, "gne", math.random(8, 11))
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(25, 30))
                                           TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 4 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(23, 28))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 5 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(21, 26))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                elseif PlayersFinished == 6 then
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(19, 24))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                else
                    exports['qb-phone']:AddCrypto(src, "shung", math.random(17, 22))
                                        TriggerEvent("qb-log:server:CreateLog", "racing", "Racing", "black", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got Racing Rewards (Shung)')
                
                end
            end
        elseif RaceId == 'LR-3398' or RaceId == 'LR-4307' or RaceId == 'LR-7037' or RaceId == 'LR-6797' then -- sprint races go here [ids for them are found in the database]
            if AmountOfRacers >= 6 then
                if PlayersFinished == 1 then
                    Player.Functions.AddMoney(Config.RaceCurrency, math.random(20, 25), "1st-place")
                    TriggerEvent("qb-log:server:CreateLog", "racing", "RACING Crypto Added", "green", "**" .. src .. "** Added " .. Config.RaceCurrency .. "math.random(20, 25)")
                elseif PlayersFinished == 2 then
                    Player.Functions.AddMoney(Config.RaceCurrency, math.random(16, 19), "2nd-place")
                    TriggerEvent("qb-log:server:CreateLog", "racing", "RACING Crypto Added", "green", "**" .. src .. "** Added " .. Config.RaceCurrency .. "math.random(16, 19)")
                elseif PlayersFinished == 3 then
                    Player.Functions.AddMoney(Config.RaceCurrency, math.random(10, 15), "3rd-place")
                    TriggerEvent("qb-log:server:CreateLog", "racing", "RACING Crypto Added", "green", "**" .. src .. "** Added " .. Config.RaceCurrency .. "math.random(10, 15)")
                else
                    Player.Functions.AddMoney(Config.RaceCurrency, math.random(7, 10), "4th-place")
                    TriggerEvent("qb-log:server:CreateLog", "racing", "RACING Crypto Added", "green", "**" .. src .. "** Added " .. Config.RaceCurrency .. "math.random(7, 10)")
                end
            end
        end
    end
    print "rewards given"
end)

QBCore.Functions.CreateUseableItem("vpn", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("Pug:client:CreateRacerAlias", source)
    TriggerEvent("qb-log:server:CreateLog", "useable", "USED VPN", "green", "**" .. Player .. "**")
end)

QBCore.Commands.Add("racername", "View your racing name!", {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local alias = Player.PlayerData.metadata['alias']
    TriggerClientEvent('QBCore:Notify', src, 'Your racing name is '..alias)
    TriggerEvent("qb-log:server:CreateLog", "commands", "RACER NAME", "blue", "**" .. Player .. "** Checked " .. alias .. "")
end)

RegisterServerEvent("Pug:server:GetRacingSimulator")
AddEventHandler("Pug:server:GetRacingSimulator", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local moneytype = Player.PlayerData.money['crypto']
    local cash = Player.PlayerData.money['cash']
    if Player.PlayerData.metadata['alias'] == 'NO ALIAS' then
        TriggerClientEvent('QBCore:Notify', src, 'You need to make an alias first ')
    else
        if cash >= 5000 then
            if Player.Functions.RemoveMoney('crypto', 150, "buy-item") then
                Player.Functions.RemoveMoney('cash', 5000, "buy-item")
                Player.Functions.AddItem('racingusb2', 1, info)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['racingusb2'], "add")
            else
                TriggerClientEvent('QBCore:Notify', src, 'You are missing Ɍ'.. 150 - moneytype..' RhodanE', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'You are missing $'.. 5000 - cash, 'error')
        end
    end
end)