**Travis CI**  
[![Build Status](https://travis-ci.org/schlubbi/IMI-Maps.png?branch=master)](https://travis-ci.org/schlubbi/IMI-Maps)

**Code Climate**  
[![Code Climate](https://codeclimate.com/github/schlubbi/IMI-Maps.png)](https://codeclimate.com/github/schlubbi/IMI-Maps)

**Was bisher geschah ...**  

- neue Rails App erstellt:  
    `rails new imi_maps --skip-test-unit`  

- wir nutzen [Rspec](https://github.com/rspec/rspec) als testing framework, nicht Test::Unit  
- um die App von Github zu clonen, nutzt ihr bitte folgenden Befehl:   
    `git clone https://github.com/schlubbi/IMI-Maps.git`  
- um die App auf heroku zu deployen, musste ich die `database.yml` anpassen  
- wir nutzen SQLite3 fuer development und test environments  
- Heroku verlangt PostgreSQL als Datenbank  
- einfach mal in die oben genannte Datei schauen  
- die App wurde mit Hilfe von `.travis.yml` auf [TravisCI](https://travis-ci.org/schlubbi/IMI-Maps) vorbereitet  
- Travis laesst nach einem `git push` zu Github alle vorhandenen Tests laufen, und zeigt den Status dieser an   
- `.gitignore` wurde um nicht benoetigte Files erweitert  
- User & Factory models wurden erstellt  
- `rails g scaffold Company name:string address:string department:string number_employees:integer industry:string website:string`  
- `rails g scaffold User last_name:string first_name:string major:string email:string role:string`  
- um die App auf Heroku zu deployen sind zwei Schritte noetig (ich gehe davon aus, das ihr den [Heroku Toolbelt](https://toolbelt.heroku.com/) installiert habt)  
- auf der console: `heroku git:remote -app imi-maps` 
- `git pull heroku master` und dann `git push heroku master`  
- als letzes habe ich unsere App mit [Code Climate](https://codeclimate.com/github/schlubbi/IMI-Maps/) verlinkt. Das ist eine Plattform, die den geschriebenen Code auf Qualitaet analysiert und bewertet  

**Links:**  
- [Rspec installation](http://www.rubyinside.com/how-to-rails-3-and-rspec-2-4336.html)  
- [Heroku & Git](https://devcenter.heroku.com/articles/git)  
- [Heroku & Rails](https://devcenter.heroku.com/articles/rails3)  




