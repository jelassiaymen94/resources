fx_version 'cerulean'
game 'gta5'

client_scripts {
	'client.lua',
}

server_scripts {
	
	'config.lua',
	"server.lua", 
	
}

server_exports { 
	"GetDiscordRoles",
	"GetRoleIdFromRoleName",
	"GetDiscordAvatar",
	"GetDiscordName",
	"GetDiscordEmail",
	"IsDiscordEmailVerified",
	"GetDiscordNickname",
	"GetGuildIcon",
	"GetGuildSplash",
	"GetGuildName",
	"GetGuildDescription",
	"GetGuildMemberCount",
	"GetGuildOnlineMemberCount",
	"GetGuildRoleList",
	"ResetCaches",
	"CheckEqual",
	"SetNickname",
	"SetRoles",
	"AddRole",
	"RemoveRole",
	"ChangeDiscordVoice",
	"ClearCache",
	"FetchRoleID"
} 
