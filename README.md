# README

Tell the Landlord is a service that lets tenants report repairs and anti social behaviour to their landlord, usually a housing association.

This is the backend for both an Admin UI and the tenant's mobile (Ionic / Angular) UI

Each Housing Association will have a duplicate set of tables.  The subdomain of each request is
used to direct the CRUD action to the correct database.

## System dependencies

Version 5.1.x of Rails is used.

## Installation

Clone the repository and then run 

bundle install

## Database creation

The database needs to be Portgres, because the multi tenancy uses seperate schemas (ie sets of tables) for each tenant.

rake db:setup

##Create example data

rake seed:create 

## How to run the test suite

Run rspec

In this version the tests are broken - need to update the factory data to use subdomains for nultiple housing associations.

