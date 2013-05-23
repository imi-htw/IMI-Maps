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


Orientation.destroy_all
Orientation.create(name: "Game")
Orientation.create(name: "Web")
Orientation.create(name: "Mobile")
Orientation.create(name: "Software")
Orientation.create(name: "Marketing")
Orientation.create(name: "Design")
Orientation.create(name: "Product Management")