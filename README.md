# CodaisseurUp

Rails app made during week 2-3 of the 9-week Codaisseur Academy.

## Steps

While working on this app I followed these steps:

1. Setting up project with Rails and PostgreSQL.
2. Adding Bootstrap, jQuery, Devise, RSpec, FactoryBot.
3. Creating models and associations.
4. Setting up the controllers.
5. Adding views.
6. Add Cloudinary, carrierwave.

## Database Structure

1. Categories

  * title:string

2. Events

  * title:string
  * description:text
  * location:string
  * price:decimal
  * capacity:integer
  * includes_food:boolean
  * includes_drinks:boolean
  * active:boolean
  * starts_at:datetime
  * ends_at:datetime

3. Photos

  * event_id:bigint
  * image:string

4. Profiles

  * first_name:string
  * last_name:string
  * bio:text

5. Registations

  * user_id:bigint
  * event_id:bigint
  * status:boolean
  * guest_count:integer

## Running Locally

Make sure you have [Ruby](https://www.ruby-lang.org/en/) and [Bundler](http://bundler.io/) installed.

```bash
git clone git@github.com:Abohte/codaisseurup.git
cd Codaisseurup
bundle install
rails db:create db:migrate db:seed
rails server
```

## Related documentation

For more information about using CarrierWave and Cloudinary, see these links:

* [CarrierWave](https://github.com/carrierwaveuploader/carrierwave)
* [Cloudinary](http://cloudinary.com/documentation/rails_integration#getting_started_guide)
