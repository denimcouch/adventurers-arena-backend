# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "rest-client"

User.destroy_all
Monster.destroy_all

alex = User.create(username: "denimcouch", email: "alexmata92@ymail.com", password: "password")

monster_index = RestClient.get "https://www.dnd5eapi.co/api/monsters"
monster_index_array = JSON.parse(monster_index)

# monster_index_array is an address sheet.
# it is used to visit a specific monster"s endpoint
monster_index_array["results"].each do |monster_index|

    monster_data = RestClient.get "https://www.dnd5eapi.co#{monster_index["url"]}"
    monster = JSON.parse(monster_data)

    # manipulate speed, senses, and conditon_immunities data into arrays
    speed = monster["speed"].to_a.map{ | element | element.join(": ")}
    senses = monster["senses"].to_a.map{ | element | element.join(": ") }
    c_immunes = monster["condition_immunities"].collect{ | condition | condition["name"] }
    
    # create new instance of Monster
    new_monster = Monster.create!(
        name: monster["name"],code
        size: monster["size"],
        mon_type: monster["type"],
        alignment: monster["alignment"],
        hit_dice: monster["hit_dice"],
        languages: monster["languages"],
        damage_vulnerable: monster["damage_vulnerabilities"],
        damage_resist: monster["damage_resistances"],
        damage_immune: monster["damage_immunities"],
        condition_immune: c_immunes,
        speed: speed,
        senses: senses,
        armor_class: monster["armor_class"],
        hit_points: monster["hit_points"],
        strength: monster["strength"],
        dexterity: monster["dexterity"],
        constitution: monster["constitution"],
        intelligence: monster["intelligence"],
        wisdom: monster["wisdom"],
        charisma: monster["charisma"],
        challenge_rating: monster["challenge_rating"],
        exp: monster["xp"]
    )
# byebug
end

puts "Monsters are seeded!"