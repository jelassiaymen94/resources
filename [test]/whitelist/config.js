var enableWhitelist = true; // Enable the Whitelist/Allowlist
var guildId = "1001649267506679808"; // Guild ID for a Discord Server, see https://faxes.zone/i/zjKnd.png
var botToken = "MTAyNzQyMDA1NDY3NTAwMTQwNA.GfB5A1.It3qyilGnJPG4JHNckbLBKGbRUq3ulLMdzNxdc"; // This must be a Discord bot token, create a bot @ https://discord.com/developers/applications
var licenseKey = "MsXK1veEE_DHRURz4gdCY1nkVyR4jKD-trcNyzhRjBeaf"; // License key found at https://license.weblutions.com

var whitelistRoles = [ // Roles by ID that are whitelisted.
    ""
];
var blacklistRoles = [ // Roles by Id that are blacklisted.
    "Citizen"
];

var notWhitelistedMessage = "You're Not Whitelisted. Please wait <<CACHE>> before trying again.";
var noGuildMessage = "Guild Not Detected. It seems you're not in the guild for this community.";
var blacklistMessage = "You're blacklisted from this server.";
var debugMode = false; // If you're experiencing issues. Contact Weblutions.
var cacheMaxTime = "2m"; // This is the time it takes for refreshes (cache) to have to reload when fetching Discord roles.