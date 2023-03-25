local Translations = {
    error = {
        -- Drying
        process_max = 'You cannot process more than %{value} at a time',
        too_close_to_another_plant = 'Too close to another plant!',
        not_suitable_to_grow_here = 'Not suiteable to grow here!',
        plant_destroyed = 'Plant destroyed',
        could_not_destroy_plant = 'Could not destroy plant',
        could_not_add_male_seed = 'Could not add male seed',
        could_not_add_water = 'Could not add water',
        could_not_add_fertilizer = 'Could not add fertilizer',
        -- Processing
        weed_bagging_process_max = 'You cannot process more than %{value} at a time',
        joint_making_process_max = 'You cannot process more than %{value} at a time',
        -- General
        not_enough_weed = 'Not Enough Weed...',
        missing_joint_item = 'What are you gonna roll a joint with?',
        missing_weedbag_item = 'What are you gonna put weed inside?',

        missing_item = "You do not have any ",
        not_ready = "Plant has not grown large enough to harvest!"
    },
    target = {
        -- Secret
        check_plant  = 'Check',
        weed_drying = '????',
        weed_processing = '????',
    },
    menu = {
        -- Drying
        header_weed_drying = 'Weed Drying',
        header_weed_drying_description = 'Dry your weed here!',
        weed_dry = 'Dry Weed',
        weed_drying_description = 'Start drying your weed!',
        weed_drying_process_header = 'Weed Processing',
        weed_bagging_process_header = 'Weed Processing',
        weed_drying_process_max = 'Maximum: %{value} At a time!',
        weed_bagging_process_max = 'Maximum: %{value} At a time!',
        joint_making_process_max = 'Maximum: %{value} At a time!',
        submit_dryweed = 'Submit',
        submit_bagweed = 'Submit',
        submit_joint_making = 'Submit',
        -- Secret
        growth_header = 'Growth: %{value}%',
        gender = 'Gender: ',
        gender_male = 'Male<br/>Water: %{value}%',
        gender_female = 'Female<br/>Water: %{value}%',
        fertilizer = '<br/>Fertilizer: %{value}%',
        harvest_plant_title = 'Harvest Plant',
        harvest_weed_plant = 'Harvest Weed Plant',
        header_add_water = 'Add Water',
        water_percentage = 'Water: %{value}%',
        header_add_male_seed = 'Add Male Seed',
        add_male_seed_description = 'Make the plant preggies',
        header_add_fertilizer = 'Add Fertilizer',
        fertilizer_description = 'Fertilize the Soil to make me grow faster!',
        destroy_plant = 'Destroy Plant',
        growth_dead = 'Growth: Dead',
        remove_dead_plant = 'Remove Dead Plant',
        remove_dead_plant_description = 'Harvest Dead Weed Plant',
        -- Processing
        header_joint_making = 'Joint Making',
        roll_some_joints_description = 'Roll some Joints!',
        header_joints = 'Joints',
        header_weed_bags = 'Weed Bags',
        weed_bags_description = 'Make some 2.5oz bags of weed!',
        header_weed_processing_table = 'Weed Processing Table',
    },
    progress_bars = {
        --Drying
        drying_weed = 'Drying Weed',
        --Secret
        planting_seed = 'Planting Seed',
        destroying_plant = 'Destroying Plant',
        adding_male_seed = 'Adding Male Seed',
        adding_water = 'Adding Water',
        adding_fertilizer = 'Adding Fertilizer',
        picking_weed = 'Picking Weed',
        --Processing
        making_joints = 'Making Joints',
        bagging_weed = 'Bagging Weed',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})