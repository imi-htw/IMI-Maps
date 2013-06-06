# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ProgrammingLanguage.where(name: "Java").first_or_create
ProgrammingLanguage.where(name: "C++").first_or_create
ProgrammingLanguage.where(name: "C").first_or_create
ProgrammingLanguage.where(name: "C#").first_or_create
ProgrammingLanguage.where(name: "Ruby").first_or_create
ProgrammingLanguage.where(name: "PHP").first_or_create
ProgrammingLanguage.where(name: "Javascript").first_or_create
ProgrammingLanguage.where(name: "ASP.NET").first_or_create
ProgrammingLanguage.where(name: "HTML/CSS").first_or_create
ProgrammingLanguage.where(name: "Python").first_or_create
ProgrammingLanguage.where(name: "Perl").first_or_create
ProgrammingLanguage.where(name: "Haskell").first_or_create
ProgrammingLanguage.where(name: "Lisp").first_or_create
ProgrammingLanguage.where(name: "Erlang").first_or_create
ProgrammingLanguage.where(name: "Scala").first_or_create
ProgrammingLanguage.where(name: "Other").first_or_create

Salary.where(amount: "0-299", order_id: 0, min_amount: 0, max_amount: 299, id:1).first_or_create
Salary.where(amount: "300-599", order_id: 1, min_amount: 300, max_amount: 599, id:2).first_or_create
Salary.where(amount: "600-899", order_id: 2, min_amount: 600, max_amount: 899, id:3).first_or_create
Salary.where(amount: "900-1199", order_id: 3, min_amount: 900, max_amount: 1199, id:4).first_or_create
Salary.where(amount: "1200-1499", order_id: 4, min_amount: 1200, max_amount: 1499, id:5).first_or_create
Salary.where(amount: "1500-1799", order_id: 5, min_amount: 1500, max_amount: 1799, id:6).first_or_create
Salary.where(amount: "1800-2099", order_id: 6, min_amount: 1800, max_amount: 2099, id:7).first_or_create
Salary.where(amount: "2100-2399", order_id: 7, min_amount: 2100, max_amount: 2399, id:8).first_or_create
Salary.where(amount: "2400-2699", order_id: 8, min_amount: 2400, max_amount: 2699, id:9).first_or_create
Salary.where(amount: "2700-2999", order_id: 9, min_amount: 2700, max_amount: 2999, id:10).first_or_create
Salary.where(amount: ">= 3000", order_id: 10, min_amount: 3000, max_amount: nil, id:11).first_or_create

Orientation.where(name: "Game", id:1).first_or_create
Orientation.where(name: "Web", id:2).first_or_create
Orientation.where(name: "Mobile", id:3).first_or_create
Orientation.where(name: "Software", id:4).first_or_create
Orientation.where(name: "Marketing", id:5).first_or_create
Orientation.where(name: "Design", id:6).first_or_create
Orientation.where(name: "Product Management", id:7).first_or_create

Company.where(name: "Google", number_employees: 100, industry: "Web", website: "www.google.com", street: "Amphitheatre Pkwy", zip: "94043", city: "Mountain View", country: "United States", main_language: "Englisch", id:1).first_or_create
Company.where(name: "Apple", number_employees: 100, industry: "Software", website: "http://www.apple.com/de/", street: "Infinite Loop", zip: "95014", city: "Cupertino", country: "United States", main_language: "Englisch", id:2).first_or_create
Company.where(name: "Suzuki", number_employees: 100, industry: "Automobile", website: "http://www.globalsuzuki.com/", street: "Takatsuka ", zip: "432 8611", city: "Hamamatsu", country: "Japan", main_language: "Japanese", id:3).first_or_create
Company.where(name: "Woolworth", number_employees: 100, industry: "Verkauf", website: "http://www.woolworthslimited.com.au/", street: "Woolworths Way", zip: "2153", city: "Bella Vista", country: "Australia", main_language: "Japanese", id:4).first_or_create
Company.where(name: "Adecco", number_employees: 100, industry: "Personendienstleistungen", website: "http://www.adecco.com/en-us/Pages/default.aspx", street: "Bouverie St", zip: "EC4Y 8AX", city: "London", country: "United Kingdom", main_language: "Englisch", id:5).first_or_create
Company.where(name: "AmBev", number_employees: 100, industry: "Essen und Trinken", website: "http://www.ambev.com.br/pt-br", street: "Rua Sao Cristovao", zip: "1221", city: "Rio de Janeiro", country: "Brazil", main_language: "Portugiesisch", id:6).first_or_create

User.destroy_all
user1 = User.create(last_name: "Grasnick", first_name: "Bastien", password: "test", email: "basti@imimaps.com", id:1)
user2 = User.create(last_name: "Schmidt", first_name: "Stefan", password: "test", email: "stefan@imimaps.com", id:2)
user3 = User.create(last_name: "Bell", first_name: "Lisa", password: "test", email: "lisa@imimaps.com", id:3)
user4 = User.create(last_name: "Vogel", first_name: "Steffi", password: "test", email: "steffi@imimaps.com", id:4)


Semester.where(semester: "SS 13", id:1).first_or_create
Semester.where(semester: "WS 12/13", id:2).first_or_create
Semester.where(semester: "SS 12", id:3).first_or_create
Semester.where(semester: "WS 11/12", id:4).first_or_create

Internship.destroy_all
i = Internship.new(salary_id: 1, working_hours: 40.0, living_costs: 500.0, rating: 3, company_id: 1, user_id: user1.id, title: "Awesome Developer #1", recommend: true, orientation_id: 1, email_public: true, description: "test", semester_id: 1, id:1)
i.programming_languages = ProgrammingLanguage.where(:id => [1,2,5])
i.save
i = Internship.new(salary_id: 3, working_hours: 40.0, living_costs: 500.0, rating: 4, company_id: 4, user_id: user2.id, title: "Awesome Developer #2", recommend: true, orientation_id: 2, email_public: true, description: "test", semester_id: 2, id:2)
i.programming_languages = ProgrammingLanguage.where(:id => [3,2,7])
i.save
i = Internship.new(salary_id: 4, working_hours: 40.0, living_costs: 500.0, rating: 5, company_id: 3, user_id: user3.id, title: "Awesome Developer #3", recommend: true, orientation_id: 3, email_public: true, description: "test", semester_id: 3, id:3)
i.programming_languages = ProgrammingLanguage.where(:id => [5,6,4])
i.save
i = Internship.new(salary_id: 2, working_hours: 40.0, living_costs: 500.0, rating: 3, company_id: 2, user_id: user4.id, title: "Awesome Developer #4", recommend: true, orientation_id: 2, email_public: true, description: "test", semester_id: 4, id:4)
i.programming_languages = ProgrammingLanguage.where(:id => [2,4,6])
i.save
i = Internship.new(salary_id: 5, working_hours: 40.0, living_costs: 500.0, rating: 6, company_id: 6, user_id: user1.id, title: "Awesome Developer #5", recommend: false, orientation_id: 3, email_public: true, description: "test", semester_id: 2, id:4)
i.programming_languages = ProgrammingLanguage.where(:id => [1,4,7])
i.save
i = Internship.new(salary_id: 2, working_hours: 40.0, living_costs: 500.0, rating: 6, company_id: 5, user_id: user2.id, title: "Awesome Developer #6", recommend: false, orientation_id: 4, email_public: true, description: "test", semester_id: 3, id:4)
i.programming_languages = ProgrammingLanguage.where(:id => [3,6,7])
i.save