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

Salary.destroy_all
Salary.create(amount: "0-299", order_id: 0, min_amount: 0, max_amount: 299)
Salary.create(amount: "300-599", order_id: 1, min_amount: 300, max_amount: 599)
Salary.create(amount: "600-899", order_id: 2, min_amount: 600, max_amount: 899)
Salary.create(amount: "900-1199", order_id: 3, min_amount: 900, max_amount: 1199)
Salary.create(amount: "1200-1499", order_id: 4, min_amount: 1200, max_amount: 1499)
Salary.create(amount: "1500-1799", order_id: 5, min_amount: 1500, max_amount: 1799)
Salary.create(amount: "1800-2099", order_id: 6, min_amount: 1800, max_amount: 2099)
Salary.create(amount: "2100-2399", order_id: 7, min_amount: 2100, max_amount: 2399)
Salary.create(amount: "2400-2699", order_id: 8, min_amount: 2400, max_amount: 2699)
Salary.create(amount: "2700-2999", order_id: 9, min_amount: 2700, max_amount: 2999)
Salary.create(amount: ">= 3000", order_id: 10, min_amount: 3000, max_amount: nil)

Company.destroy_all
#Company.create(name: "Samsung Electronics", industry: "electronic devices", website: "www.samsung.com", street: "1320-10, Seocho 2-dong", zip: "137-857", city: "Seoul", number_employees: 369000, main_language: "english")
Company.create(name: "HTW Berlin", industry: "university", website: "www.htw-berlin.de", street: "Wilhelminenhofstraße 75A", zip: "12459", city: "Berlin", number_employees: 500, main_language: "deutsch")
Company.create(name: "Yacto", industry: "e-commerce", website: "www.yacto.com", street: "1111 O'Farrell St", zip: "94019", city: "San Francisco", number_employees: 5, main_language: "english")
Company.create(name: "Github", industry: "coding", website: "www.github.com", street: "548 4th St", zip: "94107", city: "San Francisco", number_employees: 169, main_language: "english")