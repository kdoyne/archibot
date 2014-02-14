# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Architect.delete_all
Building.delete_all

frank = Architect.create(name: "Frank Lloyd Wright", year_born: 1867 ,year_died: 1959,style: "Arts and Crafts")
will = Architect.create(name: "William Van Alen", year_born: 1883, year_died: 1954, style: "Art Deco")
mies = Architect.create(name: "Ludwig Mies van der Rohe", year_born: 1886, year_died: 1969, style: "Modern")

Building.create(name: "Solomon R. Guggenheim Museum", address: "1071 5th Ave, New York, NY 10128", year_built: 1937, photo_url: "http://www.bc.edu/bc_org/avp/cas/fnart/fa267/flw/guggenheim03.jpg",architect: frank)
Building.create(name: "Chrysler Building", address: "405 Lexington Avenue, Manhattan, New York 10174", year_built: 1928, photo_url: "http://wirednewyork.com/images/skyscrapers/chrysler-building/chrysler_top_close.jpg", architect: will)
Building.create(name: "Seagram Building", address: "375 Park Ave, New York, 10152", year_built: 1958, photo_url: "http://ad009cdnb.archdaily.net/wp-content/uploads/2010/05/1273455816-nightshot.jpg", architect: mies)



