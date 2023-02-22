Config = {}

-- ███████ ██████   █████  ███    ███ ███████ ██     ██  ██████  ██████  ██   ██ 
-- ██      ██   ██ ██   ██ ████  ████ ██      ██     ██ ██    ██ ██   ██ ██  ██  
-- █████   ██████  ███████ ██ ████ ██ █████   ██  █  ██ ██    ██ ██████  █████   
-- ██      ██   ██ ██   ██ ██  ██  ██ ██      ██ ███ ██ ██    ██ ██   ██ ██  ██  
-- ██      ██   ██ ██   ██ ██      ██ ███████  ███ ███   ██████  ██   ██ ██   ██

Config.Core = "QBCore"
Config.OldQBCore = false
Config.CoreFolderName = "qb-core" 

Config.Target = "qb-target" --only if you changed the target folder name
Config.QBInputFolderName = "qb-input"
Config.InputType = 'password' -- or 'number' (Do not set it as anything other than number or password, password means the number cant be seen, it will be dots, and number means it will show the numbers while typing code)

-- ██████  ██████   ██████  ██████  ███████      █████  ███    ██ ██████      ██ ████████ ███████ ███    ███ ███████ 
-- ██   ██ ██   ██ ██    ██ ██   ██ ██          ██   ██ ████   ██ ██   ██     ██    ██    ██      ████  ████ ██      
-- ██████  ██████  ██    ██ ██████  ███████     ███████ ██ ██  ██ ██   ██     ██    ██    █████   ██ ████ ██ ███████ 
-- ██      ██   ██ ██    ██ ██           ██     ██   ██ ██  ██ ██ ██   ██     ██    ██    ██      ██  ██  ██      ██ 
-- ██      ██   ██  ██████  ██      ███████     ██   ██ ██   ████ ██████      ██    ██    ███████ ██      ██ ███████

Config.Containers = {
    ["small"] = {
        Item = "small_container",
        Prop = "container_max_small",
        StashSize = 100000, -- can be changed (20000 is 20kg)
        StashSlots = 40 -- can be changed (number of slots)
    },
    ["medium"] = {
        Item = "medium_container",
        Prop = "container_max_medium",
        StashSize = 200000, -- can be changed (40000 is 40kg)
        StashSlots = 80 -- can be changed (number of slots)
    },
    ["large"] = {
        Item = "large_container",
        Prop = "container_max_large",
        StashSize = 500000, -- can be changed (60000 is 60kg)
        StashSlots = 120  -- can be changed (number of slots)
    },
}

Config.KeyPadItem = "keypad" --check assets folder
Config.StashHackItem = "hacking_device"
Config.RemoveItemOnHackFail = true -- removes th item on hack failure if set to true

Config.RepairItem = {
    [1] = {
        itemName = "metalscrap",
        amount = 10,
    },
    [2] = {
        itemName = "plastic",
        amount = 10,
    }
}


-- ██████  ██████   ███    ██ ████████  █████  ██ ███    ██ ███████ ██████  
-- ██      ██    ██ ████   ██    ██    ██   ██ ██ ████   ██ ██      ██   ██ 
-- ██      ██    ██ ██ ██  ██    ██    ███████ ██ ██ ██  ██ █████   ██████  
-- ██      ██    ██ ██  ██ ██    ██    ██   ██ ██ ██  ██ ██ ██      ██   ██ 
--  ██████  ██████  ██   ████    ██    ██   ██ ██ ██   ████ ███████ ██   ██

Config.CycleTime = 30 --in minutes (at what interval the quality of the containers should be reduced)

Config.ReduceBy = 0 --how much should the quality of the containers be reduced by every CycleTime

Config.AllowInsideHouses = true --should the containers be allowed to be placed inside houses (containers at no condition can be placed inside apartments, hence its disabled no matter you set this to true or false)

-- ██       ██████   ██████  █████  ██      ███████ 
-- ██      ██    ██ ██      ██   ██ ██      ██      
-- ██      ██    ██ ██      ███████ ██      █████   
-- ██      ██    ██ ██      ██   ██ ██      ██      
-- ███████  ██████   ██████ ██   ██ ███████ ███████


Config.Locale = {
    --notify and progressbar
    ["cancel"] = "Cancelled..",
    ["inside_house"] = "Cannot Place inside house or Apartments",
    ["inside_apartment"] = "Cannot Place inside Apartments",
    ["placing_info"] = "Press E to place or Backspace to cancel",
    ["placing"] = "Placing Container",
    ["destroying"] = "Destroying Container",
    ["adding_keypad"] = "Adding Keypad",
    ["container_has_keypad"] = "Container already has locks",
    ["too_far"] = "You are trying to place the table too far!",
    ["quality_of_container"] = "Quality of container is",
    ["wrong_code"] = "Wrong Code!",
    ["keypad_added"] = "Locks have been added to the container",
    ["container_has_no_keypad"] = "Container has no locks, what are you trying to hack?",
    ["hack_success"] = "Hacked Successfully",
    ["hack_failure"] = "You failed",
    ["no_repair_item"] = "You do not have all the repair items",
    ["repairing"] = "Repairing Container",

    -- qb-input
    ["add_code"] = "Add Code for the container",
    ["submit_code"] = "Submit Code",
    ["enter_code"] = 'Enter the Code',

    ["enter_code_to_open_stash"] = "Enter Code to Open Stash",


    --target
    ["icon_for_check_wear"] = "fas fa-circle",
    ["icon_for_open_stash"] = "fas fa-circle",
    ["icon_for_destroy"] = "fas fa-circle",
    ["icon_for_keypad"] = "fas fa-key",
    ["icon_for_force_open"]= "fas fa-circle" ,
    ["icon_for_hack"]=  "fas fa-circle",
    ["icon_for_repair"] = "fas fa-circle",
    ["label_for_check_wear"] = "Check Wear",
    ["label_for_open_stash"] = "Open Stash",
    ["label_for_destroy"] = "Destroy Container",
    ["label_for_keypad"] = "Add Keypad",
    ["label_for_force_open"]= "Force Open Stash" ,
    ["label_for_hack"]= "Hack Container",
    ["label_for_repair"] = "Repair Container",

}

--[[
    * Notify Config
    * Set only one to true 
    * Config.QBCoreNotify - Uses default QBCore notify system
    * Config.okokNotify - Uses OkOkNotify system
    * Config.pNotify - Uses pNotify system

    * Config.pNotifyLayout - set layout of where the notification will show. Check the layouts below. 
    * Layouts:
                top
                topLeft
                topCenter
                topRight
                center
                centerLeft
                centerRight
                bottom
                bottomLeft
                bottomCenter
                bottomRight
    
    * Config.OkOkNotifyTitle - Title to show on okokNotify
]]--
Config.Notify = {
    ['QBCore'] = true, --(Default)
    ['okokNotify'] = false,
    ['pNotify'] = false,
}

Config.pNotifyLayout = "centerRight" --more options can be found in pNotify Readme. Make sure you put the right layout name.
Config.OkOkNotifyTitle = "Container" --Title that displays on okoknotify
