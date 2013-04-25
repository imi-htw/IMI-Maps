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
