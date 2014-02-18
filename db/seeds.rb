# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Architect.delete_all
Building.delete_all
User.delete_all

frank = Architect.create(name: "Frank Lloyd Wright", year_born: 1867 ,year_died: 1959,style: "Arts and Crafts")
will = Architect.create(name: "William Van Alen", year_born: 1883, year_died: 1954, style: "Art Deco")
mies = Architect.create(name: "Ludwig Mies van der Rohe", year_born: 1886, year_died: 1969, style: "Modern")
sanaa = Architect.create(name: "SANAA", year_born: 1995, year_died: (), style: "Contemporary")
carrere = Architect.create(name: "Carrere & Hastings", style: "Beaux-Arts")
heatherwick = Architect.create(name: "Thomas Heatherwick", year_born: 1970, style: "Contemporary")
hood = Architect.create(name: "Raymond Hood", year_born: 1881, year_died: 1934, style: "Art Deco")
diller = Architect.create(name: "Diller Scofido + Renfro", year_born: 1979 ,year_died: (),style: "Contemporary")

Building.create(name: "Solomon R. Guggenheim Museum", address: "1071 5th Ave, New York, NY 10128", year_built: 1937, photo_url: "http://www.bc.edu/bc_org/avp/cas/fnart/fa267/flw/guggenheim03.jpg",architect: frank)
Building.create(name: "Chrysler Building", address: "405 Lexington Avenue, Manhattan, New York 10174", year_built: 1928, photo_url: "http://wirednewyork.com/images/skyscrapers/chrysler-building/chrysler_top_close.jpg", architect: will)
Building.create(name: "Seagram Building", address: "375 Park Ave, New York, 10152", year_built: 1958, photo_url: "http://ad009cdnb.archdaily.net/wp-content/uploads/2010/05/1273455816-nightshot.jpg", architect: mies)
Building.create(name: "High Line", address: "820 Washington Street · New York, NY 10014", year_built: 2009, photo_url: "http://upload.wikimedia.org/wikipedia/commons/1/1d/High_Line_20th_Street_looking_downtown.jpg", architect: diller)
Building.create(name: "Alice Tully Hall", address: "1941 Broadway, New York, NY 10023", year_built: 2009, photo_url: "http://upload.wikimedia.org/wikipedia/commons/d/da/Juilliard_School_-_Alice_Tully_Hall.jpg", architect: diller)
Building.create(name: "Longchamps Soho", address: "132 Spring St, New York, NY 10012", photo_url: "http://info.aia.org/aiarchitect/thisweek07/0105/0105d_west_3longchamp_b.jpg", architect: heatherwick)
Building.create(name: "New Museum of Contemporary Art", address: "235 Bowery, New York, NY 10002", year_built: 2007, photo_url: "http://static.artfagcity.com/wordpress_core/wp-content/uploads/2009/11/newmuseum460.jpg", architect: sanaa)
Building.create(name: "Crown Hall", address: "3360 S. State Street, Chicago, Cook County, Illinois", year_built: 1956, photo_url: "http://www.greatbuildings.com/gbc/images/cid_1160283473_Crown_Hall_06.jpg", architect: mies)

User.create(first_name: "Kirsten", last_name: "Doyne", password: "password", password_confirmation: "password", admin: true, email:"kdoyne930@gmail.com")
