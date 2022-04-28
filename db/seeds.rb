# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




## WE DESTROY  Dependent -> Independent

# Dependent Models
WooblySnack.destroy_all


# Independent Models
Snack.destroy_all
Woobly.destroy_all








## WE CREATE   Independent -> Dependent

puts "Seeding Wooblies...."
woobly = Woobly.create(
            name: "Woobly",
            hometown: "The Bronx"
        ) 
joobly = Woobly.create(
            name: "Joobly",
            hometown: "Manhattan"
        )
wawawa = Woobly.create(
            name: "WaWaWa",
            hometown: "Republica Dominicana"
        )
mooply = Woobly.create(
            name: "Mooply",
            hometown: "The Abyss"
        ) 




puts "Seeding Snacks...."

ice_cream = Snack.create(
    name: "Ice Cream",
    ingredients: "Ice, Cream, Happiness"
)
chips = Snack.create(
    name: "Chips",
    ingredients: "Potatoes, Salt"
)
grapes = Snack.create( 
    name: "Grapes",
    ingredients: "...Grapes?"
)




puts "Seeding WooblySnacks...."

ws1 = WooblySnack.create( 

    price: 3.33,
    special_additional_ingredients: "Joy ~",
    marked_as_healthy: true,

    # apprach - models/relationships
    woobly: woobly,
    snack: ice_cream

)


ws2 = WooblySnack.create( 

    price: 3.33,
    special_additional_ingredients: "Joy ~",
    marked_as_healthy: true,

    # appraoch - ids/relationships
    woobly_id: joobly.id,
    snack_id: chips.id

)

