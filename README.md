Simple Clock API Using Grape
===============

This is a simple API with two end points. The GET with return a named clock with the current time. The PUT will return the previously or newly named clock with the time that has been input.

The aim of this project was to use GrapeAPI with persistence and to integrate Swagger Docs for easier navigation and understanding of the API. 

The final part of the project was to implement logging.

## System dependencies
  - Grape v0.11.0
  - Grape-entity v0.4.5
  - Grape-swagger v0.10.1
  - Log4r v1.1.10
  - MongoDB v1.3.1
  - Mongoid v4.0.2


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


##Improvements?

I would fully implement the logging functionality using TDD because the current implementation was not done his way.

