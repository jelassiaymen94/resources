local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/1064408609594806355/uZISNtEMpXxrvKHnU1z6nMfSOVk5tHtQf_XOpMmo4WRcEgzKo_xvjBRSxmsPLKsP1fpE',
    ['testwebhook'] = '',
    ['playermoney'] = 'https://discord.com/api/webhooks/1064393138757713960/qu0pYuYxHHJ6q2HVX3gPfQY3MRON8dU0s2pS5u2X1GutUPAnjP7rpRUbCWawC2YYQlma',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1064391497832734882/LKUb9nnzaW6AADYIgGrmEZytSNWh7-KgfpA8eZPWzFpid0VwXiy1GaZluvRE8zsQYu6f',
    ['robbing'] = 'https://discord.com/api/webhooks/1064392039988461609/vdEK_RtCZAya66yH19riiTJm2CuEDK7BCj_XodCw1TFNacHuFAfJCiP1tk699fuwTMD9',
    ['cuffing'] = 'https://discord.com/api/webhooks/1064392002919223296/bBhAWXLf478hV1drW9gDNYZvmuZrYAKjZw4xiAbSjVuJJvdQstPUTIUeTmDe-Lzv39_P',
    ['drop'] = 'https://discord.com/api/webhooks/1064391544137859162/7qIG80fhsa6Z369ff752MHB5sNY9j8Kb9eqVgCR6jpRJ1bN9aOEE0N443urEiG8DOMp8',
    ['trunk'] = 'https://discord.com/api/webhooks/1064391581794320434/1yadokP47WImv9KRQvWf0e6V0YONDXT4DldiaeRW__99LViC3Z3FB63m-n6FOBhDE5L-',
    ['stash'] = 'https://discord.com/api/webhooks/1064391744399093790/hwsVVlrq3tbGllWiTRIK0neUcxtgpk1Wg23cI4PC55LUAXolisVIsaxPeYW6prf-oBGD ',
    ['glovebox'] = 'https://discord.com/api/webhooks/1064391698513403994/M3Abxs0iQfjrUTrNEbpy7iAMZDL3L7dwP-gsiWo4kqrH5AVQDigYX-VFyJt9Cs_CPSqt',
    ['banking'] = 'https://discord.com/api/webhooks/1064393100140744794/Vf7r7vUZ2gr_vMZapv1TOxh9ume7VIY13Fb8xhJq6iqMulewLVWD-D6f8p0silDKr7IM',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1064391935609028628/Kzi9yvMBoj3vWPsgNgQVC5OqH60snHs89is-LeF4vxoBoAIoYMaMVARaMKwsYknLKu3R',
    ['ads'] = 'https://discord.com/api/webhooks/1064410218789875722/62N7tqYsWzp-4DsPJy38Bp3oomvj8eT4A3b3T1HusxJTNocc9jpFF70AMumPj7Vbzq_S',
    ['vehicleupgrades'] = 'https://discord.com/api/webhooks/1064391895670870026/gTQIdWVNceUaWw52uEQUhiVJG4bwJ_FcvEgf37caxk33t4Sqi8jtgGzbIQ8q-nd6l656',
    ['shops'] = 'https://discord.com/api/webhooks/1028113680937799850/503IjpJQZoj-dMnv0QNN-LWhpiw_VQ53RnKOz0VrNQyskNAJze6e9IfXAMqtmFycfiuA',
    ['dealers'] = 'https://discord.com/api/webhooks/1028113004753076254/o2ebhI1AHsDMtFfAMoO28RWu8vzlOQ8F2v-cQL0Sgq-EEgMZFyv5nTXd2pCY-4VuCYQu',
    ['storerobbery'] = 'https://discord.com/api/webhooks/1064392308822384731/Z12lhL2WkGSbQXo-aR-zAEFIEEDmCBdDEHGMtLNndeWlty0g7yYat1FzknF9IH6xX5ji',
    ['bankrobbery'] = 'https://discord.com/api/webhooks/1064392270276739142/v7TfnuBu9j4uDc1UYrdoS5TMBRXE5DMZL3ktto3aSeRX4izm_O5HepsFjEc6yywLLVqM',
    ['powerplants'] = 'https://discord.com/api/webhooks/1064392216778375188/87OA2nVGvgAGtBgMpteBhKG9mSUE6oGgBsfU8pybdA3rXZvu8ynUlBNLut5FjrF3wmi6',
    ['death'] = 'https://discord.com/api/webhooks/1064392943093428244/A9LQga6qiZq3QhgYYCE0BVa0_zqGogiA0is31XYc3D2Wnv7O8zVr0azZXHeZMCnH5Rv8',
    ['joinleave'] = 'https://discord.com/api/webhooks/1064393017588457546/f1PJPRhFKT_d9u-UKx4mvCmW-FgRju1joZ5P2-98nOLfOc1yWAW_idVq_5mfIeC__Q8A',
    ['ooc'] = 'https://discord.com/api/webhooks/1064393273512308776/1VnnVOQPzOS8j5V85b5myQHPS_0uSjEfpLltW8eSmnjjzgrTeF6tPgxJsj5PzXRrFE5f',
    ['report'] = 'https://discord.com/api/webhooks/1064393399739891804/s1HJizS4tbu3LCkr5XNdgHrrBkN3__Pw7n8q-Ygqx6pm7t1UVLT-EmigSvsOQB1Dwqqh',
    ['me'] = 'https://discord.com/api/webhooks/1064393311995052163/NdHw-LgnvybzlceRCfIg-Qs5rzsuKF8Tttx8Kr9UMqpnwJgUYjIrpItKssp11XJLvRZZ',
    ['pmelding'] = 'https://discord.com/api/webhooks/1008942204531781642/gw4JPBJwond-7kc1vMQ8DpuvLsUEwQQBPn6A3qMESrOenZen3zFCyi6EcitdInCOiLqy',
    ['112'] = 'https://discord.com/api/webhooks/1064393232605261884/hBwgP4Hj6btaUumQ9GDj0Xh7n6z4EmYi_V3d_r2zL5zZfJW2TFjVRwNpXSqIauj9ot2-',
    ['bans'] = 'https://discord.com/api/webhooks/1064391197222785074/HpyIxUy1XS9VB_JnU2UJLpgDH1hnaHo7uQYhn-FwIoPRLRoN4-exUJvU9Q44AlO6MlRb',
    ['anticheat'] = 'https://discord.com/api/webhooks/1064391120831914024/LjUjc_xtE_Zqh1I5i2L0L5DUGhUDw-Ogf_6THGSeKwfXosrJQ4O6d4hxJqqtt-LDjSOV',
    ['weather'] = 'https://discord.com/api/webhooks/1064391401422475294/0O_o8_e6r_2pEEyHdpDIZbqVNXORfNgtUzosxnMFhQsz6HuurKzXPKeqJKQsZR9eZXHe',
    ['moneysafes'] = 'https://discord.com/api/webhooks/1064411139020169246/XwFahdmUKDi2KmK4zFm3l4C2N0hXIjFMKreWwZWswbS876msX6l3os0RFgRxrElHzlRJ',
    ['bennys'] = 'https://discord.com/api/webhooks/1064391817077985310/wpnV2gC_SzPie3MDvJQiOk1n2P3KuCjfOlZBlCPg3NTy-Uzw9aHinAkm01uRmINHEpJW',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1064391340579880992/4pDDlk6LImdsEVIZbfTzzWf9qvANI8uz9QNhBJC14Ju8tZhbcsvT2Gd5ae2x1CDEEqcH',
    ['robbery'] = 'https://discord.com/api/webhooks/1028114635997585458/dBWTOb-XO4oq_tsc_puC1uaoVJCW75jNAugSkFj1uYXo3nM9MPvrb6wVBTDsYUNFFwf1',
    ['casino'] = 'https://discord.com/api/webhooks/1064391290407628862/ggA2AiZU4f8YBaPpDV70qkgu7UXY5WA1jeQvjbvp5dvZD5pKWWM0EjoCVbEb-39wy2Fu',
    ['traphouse'] = 'https://discord.com/api/webhooks/1064391442019131482/WmqwTuJHTqxKHP0h2i9Qbu5zHVc3GeOqsbjvbCRMcTfdKUUO9hVosmTNbth2XJ2mUCLg',
    ['911'] = 'https://discord.com/api/webhooks/1064393356295286874/xBaFOAwkKCyPMCV3vOeqUApi8WtmrnkD73tbSLvOhXrTsdkvz_DQsSzQTrClrBchIBGF',
    ['palert'] = 'https://discord.com/api/webhooks/1028114863693762610/h6MPf1JDSNRNbon57GRDZKVrts_BFG7j2OBY3S4l14YCDas4J2gVY9ruYJzDUhNk0R1f',
    ['house'] = 'https://discord.com/api/webhooks/1028114922762162237/_gdwOk2ylTfYWXHmxsOzxiB80oFKhPffD6ZaFmLfq2fm4Al3vn3Ef1NqNI4UIIBfrnHL',
    ['houserobbery']  = 'https://discord.com/api/webhooks/1064392081885368360/rlkvWVSxDd6sjW_O5TB_84xY_JqIlHll2kvACRH51s-cPTnDQa-4wqce1z6fG9hkKiGb',
    ['banktrucks'] = "https://discord.com/api/webhooks/1064392167688261694/VMmFvJatFYv96Z2C6Wxxc2-sPkAp-yjv_pPHpG7W-cV43N_KSx01SHXWGmo2mp5-fBL2",
    ['atmrobbery'] = 'https://discord.com/api/webhooks/1064392353835651204/ZFRBLjdZIOiJn5OvLiAkxnOfrOMrsjVCM7JMzwOqUkVum5s76cLKgAwQ02lOuFSgfJnC',
    ['pawnshop'] = 'https://discord.com/api/webhooks/1064391442019131482/WmqwTuJHTqxKHP0h2i9Qbu5zHVc3GeOqsbjvbCRMcTfdKUUO9hVosmTNbth2XJ2mUCLg',
    ['drugsale'] = 'https://discord.com/api/webhooks/1064392126818959370/Q_KkkQZLRV-NTScBymquF2QYJslAT1PfB7xjDZQPpMwTEW3Sgla6MUlirRTgG0F4vLjm',
    ['mba'] = 'https://discord.com/api/webhooks/1049169650769989684/4o17ytYeveeTvhfaOltifOH90aSQbS4yqOb7GI56qznLeO2TpJ3S_-0b0KxZhZzMOzOa',
    ["weed"] = 'https://discord.com/api/webhooks/1064392524665454602/d1ZKkK3yhbbCgmcu-10bTvr6ZBte_egZSBxh6W7eaWlNo5Etc3-X0QXDihHBbL6o2Ywz',
    ['meth'] = 'https://discord.com/api/webhooks/1064392481891942411/HnpmMMX1_vphJUDFLn8gct7cVyo1LmS-D86Vp8sGDyPgP2fDpjK9nZJgWEVIGV7x_swQ',
    ['coke'] = 'https://discord.com/api/webhooks/1064392436807368794/uum97VVbYc4sE6YOEom6aea0M9Bd2F_aSS3ttDsTaGMH-TIKdWNV4j8FljJJV-Q2-vRi',
    ['methtruck'] = 'https://discord.com/api/webhooks/1064392396328157274/fbpNJjZtSlmc8z7fsOre0CSOiel88DEsb1Wjfa72qDglcOkwNnMMFHE7mmbwt57jauCx',
    ["shopbuy"] = 'https://discord.com/api/webhooks/1064392760678948946/MxtYK1xzVIB-7XFClO6P0xs09OVdQNiSusflF89VfHG5YI9KndpTVI3ljYaWhxDZpWSG',
    ["bankgiven"] = 'https://discord.com/api/webhooks/1064392799044255744/FQvfHiqEkO87up57iA38L2EsRBdQAbNOLlnhql700p4qNogP2yKEStF1qwubrWdzwQQW',
    ["cashgiven"] = 'https://discord.com/api/webhooks/1064392841620627496/xOx3SD3KiPKRas10qyPfV-7aLKAL6ywhPWNbSc-GHyMosw4Efju5s41RtsTJVNmU4cLg',
    ["jobmoneyremoved"] = 'https://discord.com/api/webhooks/1064392629434986516/Bar8aAM_aXlasC9IYiklHb5PtSQpUU9jjw3ckeafolTfvuszJQiJ2dLEYpEFkB6RDooq',
    ["jobitemadded"] = 'https://discord.com/api/webhooks/1064392672711806988/7lYV-Emhd59ThY_oGCylD-Fvba31hJddQHJj2lWqRkAy3R1TFPNuDanwOanLd_aGCTpJ',
    ["jobitemremoved"] = 'https://discord.com/api/webhooks/1064392585826799666/OJStgotq716UmVD-00NWoHk1ageAG8sU1jbHRUDoE5Cw-3NPSv0kyMlsCCsJLdfgwW6u',
    ["jobmoneygiven"] = 'https://discord.com/api/webhooks/1064392709961424956/4WZr6ujxQgnNpaQSdSGbglFVmlNXb-lgZ04TPa3HaqmyzJSxEepzdSsXmEs8gxPuCTud',
    ["racing"] = 'https://discord.com/api/webhooks/1064384480338518128/D0hRekU8VrvIA7aNYPtXcFcSGOQYqy0WlaM62AqbWbdwGvfHVGwIbBAZX_i1MpneXpV0',
    ["commands"] = 'https://discord.com/api/webhooks/1064383954414739457/yyXSFy3S5n_aJyhO5iObfxw2sC3AbDOWSGvnxxPopBfyGLSRVgxoat1IAvGHoaZWF5BV',
    ["useable"] = 'https://discord.com/api/webhooks/1064386953467940995/JOQ51JKAFwUV7wCTWmhbzt3ZAonb24BnHmQJABM6aChNeG0UVYiKblCqGHMlL9Qz0BOF',
    ["societies"] = 'https://discord.com/api/webhooks/1064388392583962724/6XQLGtcJUmmnI-eUHQbikVSBhigoc2CkZbj3eAdoX2b7Ol9qIYnavvC1xFOw333P9JLm',
    ["importmoney"] = 'https://discord.com/api/webhooks/1064388758495055953/fWGNxpMij9tPreGfVnRC8l03Ucfs0Q3gL6F6DU-mbbdDtAcVv8yD8_qeywUPSU8z0reW',
    ["importstock"] = 'https://discord.com/api/webhooks/1064388953144307785/VQmCdzRgTuSkWpTHJDD7OSPiQgxF4Nd_qApetWTH1yUmkmT5lzpmg0AY0eamiTCXBALh',
    ['dumpster'] = 'https://discord.com/api/webhooks/1064390426288738395/Ce6a1RBATM8OtexAQiOSg0zz20f2twqHe0Evw0F7pBo6M_5JUoQt5XsMfS3-lXJgcz2B',
    ['dumpsterspecial'] = 'https://discord.com/api/webhooks/1064391094038704270/ts9MorSPhesCXb2iMMgaiPmGl71VDnjzJHTQV4ogfdjOtBysBSWUK9l8UrdA5rtFumGz',
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
