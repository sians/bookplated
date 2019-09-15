# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# U S E R S
User.create(email: "sian.m.stone@gmail.com")

# A U T H O R S
Author.create(first_name: "Zadie", last_name: "Smith", full_name: "Zadie Smith", birth_year: 1975, nationality: "British", death_year: nil, gender: "female")
Author.create(first_name: "Michael", last_name: "Ondaantje", full_name: "Michael Ondaantje", birth_year: 1943, nationality: "Sri Lankan", death_year: nil, gender: "male")
Author.create(first_name: "Peggy", last_name: "Frew", full_name: "Peggy Frew", birth_year: 1976, nationality: "Australian", death_year: nil, gender: "female")
Author.create(first_name: "Ursula", last_name: "Le Guin", full_name: "Ursula Le Guin", birth_year: 1929, nationality: "American", death_year: 2018, gender: "female")
Author.create(first_name: "David", last_name: "Foster Wallace", full_name: "David Foster Wallace", birth_year: 1962, nationality: "American", death_year: 2008, gender: "male")
Author.create(first_name: "Ali", last_name: "Smith", full_name: "Ali Smith", birth_year: 1962, nationality: "Scottish", death_year: nil, gender: "female")
Author.create(first_name: "Donna", last_name: "Tartt", full_name: "Donna Tartt", birth_year: 1963, nationality: "American", death_year: nil, gender: "female")
Author.create(first_name: "Alexandre", last_name: "Dumas", full_name: "Alexandre Dumas", birth_year: 1802, nationality: "French", death_year: 1870, gender: "male")
Author.create(first_name: "Hilary", last_name: "Mantel", full_name: "Hilary Mantel", birth_year: 1952, nationality: "British", death_year: nil, gender: "female")
Author.create(first_name: "Peter", last_name: "Carey", full_name: "Peter Carey", birth_year: 1943, nationality: "Australian", death_year: nil, gender: "male")

# B O O K S
Book.create(title: "Swing Time", year_published: 2016, pages: 453, isbn: "978-1594203985")
Book.create(title: "Warlight", year_published: 2018, pages: 304, isbn: "978-0-525-52119-8")
Book.create(title: "Hope Farm", year_published: 2015, pages: 343, isbn: "978-1510021853")
Book.create(title: "A Wizard Of Earthsea", year_published: 1968, pages: 191, isbn: "9780553383041")
Book.create(title: "Infinite Jest", year_published: 1996, pages: 1080, isbn: "978-0-316-92004-9")
Book.create(title: "Winter", year_published: 2017, pages: 322, isbn: "9780241207024")
Book.create(title: "The Goldfinch", year_published: 2013, pages: 771, isbn: "9780316055437")
Book.create(title: "The Count Of Monte Christo", year_published: 1844, pages: 1276, isbn: "9780140449266")
Book.create(title: "Wolf Hall", year_published: 2009, pages: 653, isbn: "9780007230204")
Book.create(title: "Illywacker", year_published: 1985, pages: 569, isbn: "9780571225903")


# A U T H O R S     B O O K S
swing = AuthorsBook.new
swing.book = Book.find_by(title: "Swing Time")
swing.author = Author.find_by(first_name: "Zadie")
swing.save

warlight = AuthorsBook.new
warlight.book = Book.find_by(title: "Warlight")
warlight.author = Author.find_by(first_name: "Michael")
warlight.save

hope = AuthorsBook.new
hope.book = Book.find_by(title: "Hope Farm")
hope.author = Author.find_by(first_name: "Peggy")
hope.save

wizard = AuthorsBook.new
wizard.book = Book.find_by(title: "A Wizard Of Earthsea")
wizard.author = Author.find_by(first_name: "Ursula")
wizard.save

jest = AuthorsBook.new
jest.book = Book.find_by(title: "Infinite Jest")
jest.author = Author.find_by(first_name: "David")
jest.save

winter = AuthorsBook.new
winter.book = Book.find_by(title: "Winter")
winter.author = Author.find_by(first_name: "Ali")
winter.save

goldfinch = AuthorsBook.new
goldfinch.book = Book.find_by(title: "The Goldfinch")
goldfinch.author = Author.find_by(first_name: "Donna")
goldfinch.save

count = AuthorsBook.new
count.book = Book.find_by(title: "The Count Of Monte Christo")
count.author = Author.find_by(first_name: "Alexandre")
count.save

wolf = AuthorsBook.new
wolf.book = Book.find_by(title: "Wolf Hall")
wolf.author = Author.find_by(first_name: "Hilary")
wolf.save

illy = AuthorsBook.new
illy.book = Book.find_by(title: "Illywacker")
illy.author = Author.find_by(first_name: "Peter")
illy.save
