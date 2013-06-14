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
ProgrammingLanguage.where(name: "Objective-C").first_or_create
ProgrammingLanguage.where(name: "Visual Basic").first_or_create
ProgrammingLanguage.where(name: "Visual Basic .NET").first_or_create
ProgrammingLanguage.where(name: "Transact-SQL").first_or_create
ProgrammingLanguage.where(name: "Pascal").first_or_create
ProgrammingLanguage.where(name: "Bash").first_or_create
ProgrammingLanguage.where(name: "Delphi / Object Pascal").first_or_create
ProgrammingLanguage.where(name: "PL / SQL").first_or_create
ProgrammingLanguage.where(name: "Assembly").first_or_create
ProgrammingLanguage.where(name: "Lua").first_or_create
ProgrammingLanguage.where(name: "MATLAB").first_or_create
ProgrammingLanguage.where(name: "SAS").first_or_create
ProgrammingLanguage.where(name: "Ada").first_or_create
ProgrammingLanguage.where(name: "R").first_or_create
ProgrammingLanguage.where(name: "ABAP").first_or_create
ProgrammingLanguage.where(name: "COBOL").first_or_create
ProgrammingLanguage.where(name: "Fortran").first_or_create
ProgrammingLanguage.where(name: "Scheme").first_or_create
ProgrammingLanguage.where(name: "Prolog").first_or_create
ProgrammingLanguage.where(name: "Common Lisp").first_or_create
ProgrammingLanguage.where(name: "Scratch").first_or_create
ProgrammingLanguage.where(name: "D").first_or_create
ProgrammingLanguage.where(name: "Basic").first_or_create
ProgrammingLanguage.where(name: "Logo").first_or_create
ProgrammingLanguage.where(name: "NXT-G").first_or_create
ProgrammingLanguage.where(name: "F#").first_or_create
ProgrammingLanguage.where(name: "Smalltalk").first_or_create
ProgrammingLanguage.where(name: "APL").first_or_create
ProgrammingLanguage.where(name: "Forth").first_or_create
ProgrammingLanguage.where(name: "ActionScript").first_or_create
ProgrammingLanguage.where(name: "ML").first_or_create
ProgrammingLanguage.where(name: "RPG (OS/400)").first_or_create
ProgrammingLanguage.where(name: "Awk").first_or_create
ProgrammingLanguage.where(name: "Tcl").first_or_create
ProgrammingLanguage.where(name: "PL/I").first_or_create
ProgrammingLanguage.where(name: "LabVIEW").first_or_create
ProgrammingLanguage.where(name: "Ladder Logic").first_or_create
ProgrammingLanguage.where(name: "JScript.NET").first_or_create

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

User.destroy_all
User.create(last_name: "test", first_name: "test", password: "test", email: "test@imimaps.com")
user1 = User.first

Semester.where(semester: "SS 13", id:1).first_or_create
Semester.where(semester: "WS 12/13", id:2).first_or_create
Semester.where(semester: "SS 12", id:3).first_or_create
Semester.where(semester: "WS 11/12", id:4).first_or_create

hash = {"Vietnam" => "Hanoi","Egypt" => "Kairo","Mexico" => "Tijuana","Ireland" => "Dublin","Switzerland" => "Bern","China" => "Peking","United States" => "Washington", "Japan" => "Tokyo", "Australia" => "Sydney", "United Kingdom" => "London", "Brazil" => "Sao Paolo", "Germany" => "Berlin", "South Africa" => "Cape Town", "Canada" => "Toronto"}
countries = hash.keys


Company.destroy_all
Internship.destroy_all
n=1
500.times do 
	r = rand(countries.size)
	company = Company.create(name: "Company#{n}", number_employees: 100, industry: "Web", website: "www.google.com",city: hash[countries[r]], country: countries[r], main_language: "Englisch")
	i = Internship.new(salary_id: rand(11)+1, working_hours: rand(20)+20, living_costs: rand(400)+300, rating: rand(5)+1, company_id: company.id, user_id: user1.id, title: "Awesome Developer #{n}", recommend: true, orientation_id: rand(7)+1, email_public: true, description: "test", semester_id: rand(4)+1)
	s = rand(5)+1
	ary = []
	s.times do
		ary << rand(10)+1
	end
	i.programming_languages = ProgrammingLanguage.where(:id => ary.uniq)
	i.save
	n+=1
end
