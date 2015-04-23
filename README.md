Simple Clock API Using Grape
===============


* Grape version
Grape 0.11.0

## System dependencies
  - Grape
  - Grape-entity
  - Grape-swagger
  - Log4r
  - MongoDB
  - Mongoid


##To Run the App Locally

You will need to have Ruby installed along with Gem and Bundle (I use Ruby Version Manager and you can get started [here](http://rvm.io/)).

#####From the commandline:

1. To run the app on your local machine clone the repository: <tt>git clone https://github.com/ruthearle/clock.git</tt>

2. Navigate to the newly created repository: <tt>cd clock</tt>

3. Install dependencies: <tt> bundle </tt>

4. Start the app: <tt>bundle exec rackup</tt>

5. Then go to your favourite browser and type: <tt>http://localhost:9292/api/swagger/index.html</tt>

6. And play!

##How to run the test suite
Clock is fully tested with Rspec/Rack Test.

#####From the commandline:

1. Navigate to the directory (see step 2. above) and type: <tt>rspec</tt>

