Translations = {
    ui = {
        server_name = "Avalanche",
        welcome_message = "Welcome To Avalanche",
        select_char = "Select your character",
        govname = "Not a goverment",
        create_title = "Please fill all the information below before you go to the city",
        firstname = "First Name",
        lastname = "Last Name",
        male = "Male",
        female = "Female",
        dob = "Date Of Birth",
    },
    notification = {
        firstname_fail = "Please fill your firstname",
        lastname_fail = "Please fill your lastname",
        gender_fail = "Please choose your gender",
        white_space = "Your First Name and Last Name can't have a blank space",
        nationality_fail = "Please fill your nationality",
        dob_fail = "Please fill your date of birth",
        dob_fail2 = "Your date of birth can't be below 1970-01-01 or higher than 2017-12-01",
        firstname_char = "First name needs to be at least 2 characters",
        lastname_char = "Last name needs to be at least 3 characters"

    },
    placeholders = {
        firstname_placeholders = "Plazmo",
        lastname_placeholders = "Lazmo",
        nationality_praceholders = " "
    },
    info = {
        character_deleted = "Character Deleted"
    },
    commands = {
        logout = "Log you out",
        refresh = "Refresh The Multicharacter If The UI Stuck"
    },
    logs = {
        player_loaded = "^2[qb-core]^7 %{player} has succesfully loaded!",
        loaded_log = "** %{player} ** ( %{discord}) | || %{ip} || | %{license} | %{citizenid} | %{source} ) loaded.."
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
