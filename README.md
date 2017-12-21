# Seattle Attraction Finder

#### This program contains a list of popular activities around Seattle and lets the user find the attractions that interest them

#### By Kevin Babcock & Malgorzata Haniszewska

## Description

This program contains many of the popular activities around Seattle, and lets the user search for activities based on type(tag), season, price, or any combination of these properties. The application will then list out all of the relevant attractions, which the user can click to see more details. There is also an option for the user to add new tags and attractions, as well as update existing attractions.

## Setup/Installation Requirements

* Go to GitHub.com/kevinmbabcock
* Clone the ruby_team_project folder to desktop
* Navigate to the project directory in the Terminal
* Run $ "bundle"
* Run $ "rake db:create"
* Run $ "rake db:migrate"
* Run $ "ruby app.rb"
* Navigate to "localhost:4567" in browser

## Known Bugs

* Uniqueness validation for names of tags and attractions is not fully functional
* Price is not displayed to two decimal places in search results page
* User cannot input 0 as minimum value in search. Must be left blank if this is desired input.

## Support and contact details

Kevin Babcock: kevinmbabcock@icloud.com
Malgorzata Haniszewska: gosia.haniszewska@gmail.com

## Technologies Used

Ruby, Sinatra, ActiveRecord, HTML, CSS

### License

MIT

Copyright (c) 2017 **Epicodus**
