# tidings v1.0 SERVER

![PostgreSQL 1 Badge](https://img.shields.io/badge/PostgreSQL-1-32658e?style=flat-square&logo=postgresql)
![Ruby on Rails 7 Badge](https://img.shields.io/badge/Ruby_On_Rails-7-BD0000?style=flat-square&logo=rubyonrails)
![JSON Web Tokens Badge](https://img.shields.io/badge/JSON_Web_tokens-1.8-d63afe?style=flat-square&logo=jsonwebtokens)
![Amazon s3 Badge](https://img.shields.io/badge/Amazon_S3--orange?style=flat-square&logo=amazonaws)

## Welcome to Tidings
### Tidings v1 is a simple photo gallery sharing app!

This Rails server is built on a PostgreSQL database runs ActiveStorage for file handling, serving files to/from an AWS S3 bucket, and uses JSON Web Tokens (JWT) and Devise for authentication. ActiveModel serializer (and some fun custom end-points) is used for data serialization.

Technology Key Words: ActiveRecord, ActiveStorage, Amazon AWS S3, JSON Web Tokens, Devise, Authentication, Postgres, SQL, Ruby on Rails

The client is built in React and uses React Router for front end navigation.

<sub>n.b. this project was initially named Bromide Drag and there are still remnants of the original name all over the place (esp here in the back end) - jp 4/18/22</sub>

---

## Installation
Fork and clone the repo. `bundle install` 

***Secrets!*** *shhhh...*

Setup your JWT secret key: `rake secret` and use that secret key in your rails `credentials.yml` file as such:
```
devise:
  jwt_secret_key: <rake secret key>
```
If you want to use AWS you'll also need to add your aws user credentials in the same file.  Save and exit out of vim or nano, then run `rails db:create db:migrate` and then `rails s` should get the server running.

---

Be sure to go grab the CLIENT here: https://github.com/jpottercreative/tidings-client

---
### What's working:
>**Login / Sign-up:** it's working, auth is by JWT and Devise - so we auth on all calls for protected routes.  This means we get a call any time a user wants their galleries, info, or any of that - but the share route is not authenticated, allowing visitors to fetch a gallery by the share URL.

>**Image - Blocks > Gallery > User:** The table structure works fine, the polymorphic tables provided by ActiveStorage do a lot of the heavy lifting in the associations, which is nice. 

>**ActiveStorage::S3:** This works, and it's pretty slick.  Just uploads straight to the specified bucket. No sizing variants yet. If you want to use this make sure you set your `rails credentials` file up with the AWS info.

>**Devise Auth:** This works, but not all the elements are implemented. Issues JWT each time user logs in, and adds it to the JWTDenyList after a timeout --confirm this timeout plz jp--.

>**Error Handling:** Not as robust as I'd like, would like but is functional.  Sends enough information to the front end as it can handle and deliver to the user.  Would like to fully implement handling and more custom returns so that the FE handler can be more dynamic.

### What's still to come?
>**Error Handling:** Yeah, always start where you leave off - get this set up to talk to the coming global user management system in the FE.

>**Devise password reset:** I'd love to get this working. Ran out of time and brain space to tackle the mailer.

>**Error handling/Validation:** This is a way stripped out app (error handling wise) - as noted in the Client there is almost no error handling - Need to add ActiveRecord flags and errors specifically.

>**Custom Public End Points:** Need to namepsace the gallery public URLS, and create user retrievable URLS (table for this?) Ideas?

>**Deployment to Heroku**


