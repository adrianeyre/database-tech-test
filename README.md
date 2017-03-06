# Database Tech Test
#### Technologies: Ruby, Rspec, Capybara
### [Makers Academy] (http://www.makersacademy.com) - Week 10 Solo Tech Test

## Index
* [User Stories] (#Stories)
* [Gems Used] (#GEMS)
* [Installation] (#Install)
* [Rspec Tests] (#Rspec)
* [Usage] (#Usage)

## Challenege
You receive a message from a prospective employer:

"Before your interview, write a program that runs a server that is accessible on http://localhost:4000/. When your server receives a request on http://localhost:4000/set?somekey=somevalue it should store the passed key and value in memory. When it receives a request on http://localhost:4000/get?key=somekey it should return the value stored at somekey. Store the data in memory, not in a database, but bear in mind that you will later need to add a database to this code."

Create a new git repository and write code to fulfill the brief to the best of your ability. We will be looking for clean, well tested code in your choice of technology. In addition, the last sentence of the brief implies that you should consider how the code could easily be extended to add an as-yet-unknown data store.

## <a name="Stories">User Stories</a>
```
As a user
So that I can store a variable
I want to be able post my variable

As a user
So that I can retrieve a variable
I want to be able get my variable

As a user
So that I can retrieve a variable
I want a json object to be returned

As a user
So that I can reset the data
I want to reset all variables

As a user
So that I can view all variable
I want to display all variables
```

## <a name="GEMS">Gems Used</a>
```ruby
gem 'sinatra'
gem 'sinatra-json'
gem 'json', '~> 2.0', '>= 2.0.3'

group :test do
  gem 'rspec'
  gem 'rspec-sinatra'
  gem 'capybara'
  gem 'selenium-webdriver'
end
```


## <a name="Install">Installation</a>
* To clone the repo
```shell
$ git clone https://github.com/adrianeyre/database-tech-test
$ cd database-tech-test
$ bundle
```
* To run the server
```shell
$ ruby app/app.rb
```

## <a name="Rspec">Rspec Tests</a>
```shell
$ cd database-tech-test
$ rspec
```

## <a name="Usage">Usage</a>
### To post your variable
type `http://localhost:4000/set?somekey=somevalue` into your web browser, to set the variable `somekey`

### To get your variable
type `http://localhost:4000/get?key=somekey` into your web browser, to retrieve JSON object of the variable `somekey`

### To reset all saved variables
type `http://localhost:4000/reset` into your web browser, to reset all variables

### To view all saved variables
type `http://localhost:4000/view` into your web browser, to view all variables

