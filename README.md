# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:


* System dependencies

Version 5.1.x of Rails is used.

* Installation

Clone the repository and then run 

bundle install

* Database creation

The database needs to be Portgres, because the multi tenancy uses seperate schemas (ie sets of tables) for each tenant.

rake db:setup

* Create example data

rake seed:create 

* How to run the test suite

Run rspec

