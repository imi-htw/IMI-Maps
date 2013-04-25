# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ProgrammingLanguage.first_or_create(name: "Java")
ProgrammingLanguage.first_or_create(name: "C++")
ProgrammingLanguage.first_or_create(name: "C")
ProgrammingLanguage.first_or_create(name: "C#")
ProgrammingLanguage.first_or_create(name: "Ruby")
ProgrammingLanguage.first_or_create(name: "PHP")
ProgrammingLanguage.first_or_create(name: "Javascript")
ProgrammingLanguage.first_or_create(name: "ASP.NET")
ProgrammingLanguage.first_or_create(name: "HTML/CSS")
ProgrammingLanguage.first_or_create(name: "Python")
ProgrammingLanguage.first_or_create(name: "Perl")
ProgrammingLanguage.first_or_create(name: "Haskell")
ProgrammingLanguage.first_or_create(name: "Lisp")
ProgrammingLanguage.first_or_create(name: "Erlang")
ProgrammingLanguage.first_or_create(name: "Scala")

Salary.destroy_all
Salary.create(amount: "0-299", order_id: 0)
Salary.create(amount: "300-599", order_id: 1)
Salary.create(amount: "600-899", order_id: 2)
Salary.create(amount: "900-1199", order_id: 3)
Salary.create(amount: "1200-1499", order_id: 4)
Salary.create(amount: "1500-1799", order_id: 5)
Salary.create(amount: "1800-2099", order_id: 6)
Salary.create(amount: "2100-2399", order_id: 7)
Salary.create(amount: "2400-2699", order_id: 8)
Salary.create(amount: "2700-2999", order_id: 9)
Salary.create(amount: ">= 3000", order_id: 10)
