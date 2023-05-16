local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/1107842855852048425/HCNtO6w_UKILB0zQJQuNyirEFyu2cihuQtcjlskWjzB1WD2m228OuyDtm3MEhH_l94yN',
    ['testwebhook'] = '',
    ['playermoney'] = 'https://discord.com/api/webhooks/1107843276511399968/m5gX8mNM7ZIgvOfH5RCO3NSYt-r6FqvJiOszDtm87MA4WHWyJCkiWjfCr8fDWM6-n8e2',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1107844714381705307/OCGBooCkiwpMGsa-yGUDs7Lbz0TZKqjR_gLuM11N_p_bHlzvfDei27mqHouRlVaUdaoZ',
    ['robbing'] = 'https://discord.com/api/webhooks/1107844273061240932/MP6Bg1RZzbTzJoPCVbfs_Kz3oDiKxsX2s308swNV6kAuVqaN01ZlAHMvzMMc9t9Dk2pU',
    ['cuffing'] = 'https://discord.com/api/webhooks/1064392002919223296/bBhAWXLf478hV1drW9gDNYZvmuZrYAKjZw4xiAbSjVuJJvdQstPUTIUeTmDe-Lzv39_P',
    ['drop'] = 'https://discord.com/api/webhooks/1107844673898287114/hKptnc7P_JAWXmXm9Hf4XyFwdISQvEeJRkljivQcFP1iu7f5gCZQmFzc-CzXWdYZrrUy',
    ['trunk'] = 'https://discord.com/api/webhooks/1107844637860823191/g9ZQnXgjoHbUA9Lg-D511nEluJDoxpVLa2U7ztO9ABMKQqqw6soGb65cOFDVGvxKGWbX',
    ['stash'] = 'https://discord.com/api/webhooks/1064391744399093790/hwsVVlrq3tbGllWiTRIK0neUcxtgpk1Wg23cI4PC55LUAXolisVIsaxPeYW6prf-oBGD ',
    ['glovebox'] = 'https://discord.com/api/webhooks/1107844598975442976/pZQlNT37iJbw7e6RV4RaB7lL23pwCAcJCFuUj1QjPACR5tirhWSfwhFUKzCXiYrJ1FBp',
    ['banking'] = 'https://discord.com/api/webhooks/1107843316474712246/1TX8nIG80sKIWpfn2qFIvmjtaQ51opAow7Py5pw_dKo8GC1KvZWDTj1GSQB-pkfLuoS2',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1107844433254289408/4v2m0t3gfPl0FOVbWVewWLaLsVfcm-WqchPcbK20Cz3rxgW5qHdmfjiAqtKyeUhXubt3',
    ['ads'] = 'https://discord.com/api/webhooks/1064410218789875722/62N7tqYsWzp-4DsPJy38Bp3oomvj8eT4A3b3T1HusxJTNocc9jpFF70AMumPj7Vbzq_S',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/1107844465386864740/_iwXelx5lYldYw4hX0c4o0PiAPyvSoj2XlVDEG_Rhz1Mult0F1rCutJlxSzZKgiajv8a',
    ['shops'] = 'https://discord.com/api/webhooks/1028113680937799850/503IjpJQZoj-dMnv0QNN-LWhpiw_VQ53RnKOz0VrNQyskNAJze6e9IfXAMqtmFycfiuA',
    ['dealers'] = 'https://discord.com/api/webhooks/1028113004753076254/o2ebhI1AHsDMtFfAMoO28RWu8vzlOQ8F2v-cQL0Sgq-EEgMZFyv5nTXd2pCY-4VuCYQu',
    ['storerobbery'] = 'https://discord.com/api/webhooks/1107843981481615381/ziSyWcmqZxPeks7VHmLnv_k5bLe1-J29hCFPCdiaHHJdLTjwtGp8ynvq6xXLVFUhDR-V',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/1107844051899777095/bWr5THU3KwaWSPHY5EInf1rq-G4ncIVvbqlrrF2K-c6gEVpFHCsBCbZwS_9d_4UnFM5Z',
    ['powerplants'] = 'https://discord.com/api/webhooks/1107844097407995994/n95gpfbE4RQviel2eApYMlvLD5AnURl7L8LEv5gHFzZon3n3-JwTBwetbZspxEx2qYmj',
    ['death'] = 'https://discord.com/api/webhooks/1107843406945849374/sAGHxkY_oB0MNpUxI6I0YTOCfjcUlMSiaJ2nj2VyMI4Ku76W9eOGhKyyy4bOP2zI3xPP',
    ['joinleave'] = 'https://discord.com/api/webhooks/1107843360519110658/qrmKvDwDmryFZWeISjcjcE4ZWsU1wSML61aEI5n0w4k-BLz1kjq55DLzxH4dKLTEXFun',
    ['ooc'] = 'https://discord.com/api/webhooks/1107842827314016306/K-3bhzvZGmPkthbhdpqVqbuohjzEHvLx_wMCMRFeu2jbZEjLmr7v7kgQhTCGyNEi0nU2',
    ['report'] = 'https://discord.com/api/webhooks/1107842827314016306/K-3bhzvZGmPkthbhdpqVqbuohjzEHvLx_wMCMRFeu2jbZEjLmr7v7kgQhTCGyNEi0nU2',
    ['me'] = 'https://discord.com/api/webhooks/1107843089470607400/qNnuwgnvHjGrGY89Mp5-4DDg0FVmLTh-UQ-y4tRa7G3keawr8s6nX1gY2pnVjTSxJc1j',
    ['pmelding'] = 'https://discord.com/api/webhooks/1008942204531781642/gw4JPBJwond-7kc1vMQ8DpuvLsUEwQQBPn6A3qMESrOenZen3zFCyi6EcitdInCOiLqy',
    ['112'] = 'https://discord.com/api/webhooks/1107843169661485156/TzLZZnlCGNAquqeNwwHLn7i8uRgXlL9NijGj_hTtHH2vnXuRukbXA7tKjodjJFNPPj0Z',
    ['bans'] = 'https://discord.com/api/webhooks/1107845174664646736/InnoPuSpnwQW9oaNEFb6j26vnOhAgprzMQ8UZ2-DCxJl7C_K73cr6ZadGbDUr8V_gwTd',
    ['anticheat'] = 'https://discord.com/api/webhooks/1064391120831914024/LjUjc_xtE_Zqh1I5i2L0L5DUGhUDw-Ogf_6THGSeKwfXosrJQ4O6d4hxJqqtt-LDjSOV',
    ['weather'] = 'https://discord.com/api/webhooks/1064391401422475294/0O_o8_e6r_2pEEyHdpDIZbqVNXORfNgtUzosxnMFhQsz6HuurKzXPKeqJKQsZR9eZXHe',
    ['moneysafes'] = 'https://discord.com/api/webhooks/1064411139020169246/XwFahdmUKDi2KmK4zFm3l4C2N0hXIjFMKreWwZWswbS876msX6l3os0RFgRxrElHzlRJ',
    ['bennys'] = 'https://discord.com/api/webhooks/1107844514900623400/hl0oZ5BwWQ_YQS_7EkgOq4YAMvArHA1nFbcZcdxt7QIKzF8KaFX2dkAOqPOxkaxL-ONN',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1064391340579880992/4pDDlk6LImdsEVIZbfTzzWf9qvANI8uz9QNhBJC14Ju8tZhbcsvT2Gd5ae2x1CDEEqcH',
    ['robbery'] = 'https://discord.com/api/webhooks/1028114635997585458/dBWTOb-XO4oq_tsc_puC1uaoVJCW75jNAugSkFj1uYXo3nM9MPvrb6wVBTDsYUNFFwf1',
    ['casino'] = 'https://discord.com/api/webhooks/1064391290407628862/ggA2AiZU4f8YBaPpDV70qkgu7UXY5WA1jeQvjbvp5dvZD5pKWWM0EjoCVbEb-39wy2Fu',
    ['traphouse'] = 'https://discord.com/api/webhooks/1064391442019131482/WmqwTuJHTqxKHP0h2i9Qbu5zHVc3GeOqsbjvbCRMcTfdKUUO9hVosmTNbth2XJ2mUCLg',
    ['911'] = 'https://discord.com/api/webhooks/1107842994486386818/CtYPHICKcpBvxgLhsqEyY6JWyz7d-MDagWDNVEG195Iq_W_QLUXxuKQ7Ii63nU_wXQkJ',
    ['palert'] = 'https://discord.com/api/webhooks/1028114863693762610/h6MPf1JDSNRNbon57GRDZKVrts_BFG7j2OBY3S4l14YCDas4J2gVY9ruYJzDUhNk0R1f',
    ['house'] = 'https://discord.com/api/webhooks/1028114922762162237/_gdwOk2ylTfYWXHmxsOzxiB80oFKhPffD6ZaFmLfq2fm4Al3vn3Ef1NqNI4UIIBfrnHL',
    ['houserobbery']  = 'https://discord.com/api/webhooks/1107844224461848628/6IzF7Cj0bl-2m8lsNzjXicX6MgIESpFHAVf2ip379Su-MJ9HE4Gu_-guxzz4gTFmtYGP',
    ['banktrucks'] = "https://discord.com/api/webhooks/1107844143373373471/ld2Tx-MMI_r7iV2HdTWIPMfhDrkKqgGLpgbDsnvI644HVfxi6Xhg-10F6OxT5TNyAumd",
    ['atmrobbery'] = 'https://discord.com/api/webhooks/1064392353835651204/ZFRBLjdZIOiJn5OvLiAkxnOfrOMrsjVCM7JMzwOqUkVum5s76cLKgAwQ02lOuFSgfJnC',
    ['pawnshop'] = 'https://discord.com/api/webhooks/1107844940551168081/LhFAHrJD61Qgpxr9qQer6fwCf8tbLSnmnYAUAj76BonqLOZdwcNLHOYi8SZ6HJfexpYR',
    ['drugsale'] = 'https://discord.com/api/webhooks/1107844182921445466/yieuLXry79av5C8FrlRKoTAidkn6wfn2HfRqUbP2NdOmdbI3sOjYCV0NgLSDR4ogMVRi',
    ['mba'] = 'https://discord.com/api/webhooks/1049169650769989684/4o17ytYeveeTvhfaOltifOH90aSQbS4yqOb7GI56qznLeO2TpJ3S_-0b0KxZhZzMOzOa',
    ["weed"] = 'https://discord.com/api/webhooks/1064392524665454602/d1ZKkK3yhbbCgmcu-10bTvr6ZBte_egZSBxh6W7eaWlNo5Etc3-X0QXDihHBbL6o2Ywz',
    ['meth'] = 'https://discord.com/api/webhooks/1064392481891942411/HnpmMMX1_vphJUDFLn8gct7cVyo1LmS-D86Vp8sGDyPgP2fDpjK9nZJgWEVIGV7x_swQ',
    ['coke'] = 'https://discord.com/api/webhooks/1064392436807368794/uum97VVbYc4sE6YOEom6aea0M9Bd2F_aSS3ttDsTaGMH-TIKdWNV4j8FljJJV-Q2-vRi',
    ['methtruck'] = 'https://discord.com/api/webhooks/1064392396328157274/fbpNJjZtSlmc8z7fsOre0CSOiel88DEsb1Wjfa72qDglcOkwNnMMFHE7mmbwt57jauCx',
    ["shopbuy"] = 'https://discord.com/api/webhooks/1107843525942456380/b-vHwuX_Dea-MgPxbg04BtHfPRAX2Aartl-hZTpklQF7b70eEjI39CtlHctZ0A9GCwix',
    ["bankgiven"] = 'https://discord.com/api/webhooks/1064392799044255744/FQvfHiqEkO87up57iA38L2EsRBdQAbNOLlnhql700p4qNogP2yKEStF1qwubrWdzwQQW',
    ["cashgiven"] = 'https://discord.com/api/webhooks/1064392841620627496/xOx3SD3KiPKRas10qyPfV-7aLKAL6ywhPWNbSc-GHyMosw4Efju5s41RtsTJVNmU4cLg',
    ["jobmoneyremoved"] = 'https://discord.com/api/webhooks/1064392629434986516/Bar8aAM_aXlasC9IYiklHb5PtSQpUU9jjw3ckeafolTfvuszJQiJ2dLEYpEFkB6RDooq',
    ["jobitemadded"] = 'https://discord.com/api/webhooks/1064392672711806988/7lYV-Emhd59ThY_oGCylD-Fvba31hJddQHJj2lWqRkAy3R1TFPNuDanwOanLd_aGCTpJ',
    ["jobitemremoved"] = 'https://discord.com/api/webhooks/1064392585826799666/OJStgotq716UmVD-00NWoHk1ageAG8sU1jbHRUDoE5Cw-3NPSv0kyMlsCCsJLdfgwW6u',
    ["jobmoneygiven"] = 'https://discord.com/api/webhooks/1064392709961424956/4WZr6ujxQgnNpaQSdSGbglFVmlNXb-lgZ04TPa3HaqmyzJSxEepzdSsXmEs8gxPuCTud',
    ["racing"] = 'https://discord.com/api/webhooks/1107844361087107163/Vxa2gBoaRr3KHF0qFkV7cEKKiEl58DEOOa4MzzgPJq5zHFWjmc9sgWCaDKYG2xB0hD6H',
    ["commands"] = 'https://discord.com/api/webhooks/1107843219187843122/eM2n6i6AfRUo5TZFlz2DcyyfRY9lQjgbMh1e0CdJx-9QoWBlCVX_0OApLPf0m0ujTkas',
    ["useable"] = 'https://discord.com/api/webhooks/1064386953467940995/JOQ51JKAFwUV7wCTWmhbzt3ZAonb24BnHmQJABM6aChNeG0UVYiKblCqGHMlL9Qz0BOF',
    ["societies"] = 'https://discord.com/api/webhooks/1064388392583962724/6XQLGtcJUmmnI-eUHQbikVSBhigoc2CkZbj3eAdoX2b7Ol9qIYnavvC1xFOw333P9JLm',
    ["importmoney"] = 'https://discord.com/api/webhooks/1107843568225243136/ZSsrnHXsPdV0y-kFgEFj0v9_tqus21KzMWdahU1Fs6CvxgZpC89ipkHMD0WSxXHkeXfM',
    ["importstock"] = 'https://discord.com/api/webhooks/1064388953144307785/VQmCdzRgTuSkWpTHJDD7OSPiQgxF4Nd_qApetWTH1yUmkmT5lzpmg0AY0eamiTCXBALh',
    ['dumpster'] = 'https://discord.com/api/webhooks/1107844803225452614/YTy_ohw12VX4qfjtTssgp9fVVd_5yhSneLRGCg2EIxvTEl-MrX9dlux9b0btAAq6m_V0',
    ['dumpsterspecial'] = 'https://discord.com/api/webhooks/1107844840223416373/NgGbkuoF99vSFmGYfkofpAtYPQc9aexAxiRAxGokgClhOfoltIlNFDxgAn7hQPzETi66',
    ['jobspam'] = 'https://discord.com/api/webhooks/1064391936691142666/1bMuXRymMg-rpD9bK42hHiym8x_fV1SFOtRws-YWxYlGFFmpQJj5PgjulRBHOuvLV4vN',
    ['containers'] = 'https://discord.com/api/webhooks/1064393729143746570/IYZ1O4ZZeQFNCaqWajrokTH0omi6TZWUIQFrdobIRC8vNLjBO1HKGnAaJlhQ8ZJ8azZ8',
    ['catcafeitems'] = 'https://discord.com/api/webhooks/1064396494653890611/NoUchTmFt6fawDH8v3ZHzVJvuRaSsgwk3_XAamaLnX6gLU2ct-nU7erft0-BhrSBXSxL',
    ['jobgarage'] = 'https://discord.com/api/webhooks/1064396536668246106/2mA5HnwKekEjargR6fPX6hxkVxSUoEO0yE7gJ6xdXheM997xZEuOXUdwhPUgI9gFQvej',
    ['mechanicitems'] = 'https://discord.com/api/webhooks/1064398029504925716/_MdpOLLzK1Nj2ievaIBrFQplZQttNy_fWdLR00390k2M7WSd6QDINbIZGTCue_ORDvhk',
    ['mechaniccash'] = 'https://discord.com/api/webhooks/1064399041389150218/wp4X-kpTb4STrFI3VvJoR1Iu8HXJvSWQq_1mbeVDqHyI8PSXl5YNqG_2O12xcnATIN5_',
    ['register'] = 'https://discord.com/api/webhooks/1064403330929012787/czE1alR4CFBmGxgdX0Bi7IgCsJAePqVBm6QcwTdwfIwdYc8o6ccAULwJrSZedpYlmP2t',
    ['bossmenumoney'] = 'https://discord.com/api/webhooks/1064403600715034684/lCTqJbi-uy7NadDUsVDbIlWAYkRxQg7ZGkMKqm5TPRQvO3V2cv8II2o55bWrCL7ADNeZ',
    ['policeticket'] = 'https://discord.com/api/webhooks/1064406155146829925/VOdbmsWNeE-YY4QsMfvavBskdKvI1WmrNxfO29GAdzJi8bCt2D3er9JoSBTARPPq7i-2',
    ['moneyremove'] = 'https://discord.com/api/webhooks/1064406584094117898/tVeuswGWGCQQO4L4cU5dJDdvItGGGEQ4B1blvu47S50ZWKMu15rFXz7NOac78dS8BuA8',
    ['paycheck'] = 'https://discord.com/api/webhooks/1064417829195087932/qDoRnwiSfl3fT4ZtyDxcCOE1GhU7gWAC3A9EXNs9Ilx4on0vhy2hcy8b9VVLmWPaq98K',
    ['adminmoney'] = 'https://discord.com/api/webhooks/1064413157495418950/zBnloWBfZ16hiqx2bk2zAMiBkr5zbx-YM_iQNKQcxbi_3vbtMwPlQDDyRU84A1fBZO1Y',
    ['admincar'] = 'https://discord.com/api/webhooks/1064414758637408327/RRAevPS6n1vu8FjKtoiLJSgZHxlqvacxZ7-UsFDrJzK2at4VkfAd8o-qm3M2yjWNrYal',
    ['adminperms'] = 'https://discord.com/api/webhooks/1064417687209517097/EFMTP2OyrAhLETWyoRDjM5YqAnNWlEMqOTD-q_aS6sC27j-IJO_r-LOIBXdhpN0kpGog',
    ['adminitem'] = 'https://discord.com/api/webhooks/1064417631983112226/waF_9dzyJ2RtLhmdzf2sTFl3n3EE0ZgOvdLQkQfPboekh2tMLcG8MBRG2kWGYTrOUPN7',
    ['combatlog'] = 'https://discord.com/api/webhooks/1066425698614521886/yPiXWRlbFlr4NCALUkTPMDhhQ0C7ZTYqp-lrFurqwFqTOBO5B1c_DK7WUV8KSoFbwpxA',
    ['leave'] = '',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'Polar Logs',
                ['icon_url'] = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670',
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'QB Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'QB Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
