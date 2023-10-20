Config = {}

Config.Timeout = {
    Enable = true, -- Set to false to disable the cooldown system of which after X time the active report would get deleted.
    Time = 60, -- Time in minutes for the cooldown (If Enable)
}

Config.Discord = {
    Enable = true, -- Set to false to disable the use of discord logs
    Image = "https://cdn.discordapp.com/attachments/1163593169586360340/1164753384889389086/FASTRO-01.png?ex=65445c1f&is=6531e71f&hm=3a99b2c178572170777803a114fb85ab8a2673fd8fca6bff08ac16eaba3533b6&", -- The image used in the discord logs
    Webhook = "https://discord.com/api/webhooks/1107842729372823704/vpE_2A5JQRvKaTdMMH9VQoecG1B7trmo2a0-YJhX1rPnjd2OtGzfA3Xn4nvn9AsnJ3qk", -- The discord webhook where the logs will be sent to
}
