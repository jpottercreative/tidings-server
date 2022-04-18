# tidings v1.0 SERVER

## Welcome to Tidings


### Tidings v1 is a simple photo gallery builder app!

This Rails server runs ActiveStorage for file handling, serving files to/from an AWS S3 bucket, and uses JSON Web Tokens (JWT) and Devise for authentication. ActiveModel serializer (and some fun custom end-points) is used for data serialization.

The client is built in React and uses React Router for front end navigation.


---

## Installation
Fork and clone the repo. `bundle install` 
***Secrets!***
Setup your JWT secret key: `rake secret` and use that secret key in your rails `credentials.yml` file as such:
```
devise:
  jwt_secret_key: <rake secret key>
```
If you want to use AWS you'll also need to add your aws user credentials in the same file.  Save and exit out of vim or nano, then run `rails db:create db:migrate` and then `rails s` should get the server running.

Be sure to go grab the CLIENT here:



---
### What's working:
>**Login / Sign-up:** it's working, auth is by JWT and Devise - so we auth on all calls for protected routes.  However! We don't have any validation in place.

>**User > Galleries > Blocks > Images:** By some miracle all the end-points needed for the user galleries are working. However, due to the relationship construction some of the associations are convoluted 

>**ActiveStorage::S3:** This works, and it's pretty slick.  Just uploads straight to the specified bucket. No sizing variants yet.

>**Devise Auth:** This works, but not all the elements are implemented. Issues JWT each time user logs in, and adds it to the JWTDenyList after a timeout.

### What's still to come?
>**Devise password reset:** I'd love to get this working.

>**Error handling/Validation:** This is a way stripped out app (error handling wise) - as noted in the Client there is almost no error handling - Need to add ActiveRecord flags and errors specifically.

>**Custom Public End Points:** Need to namepsace the gallery public URLS, and create user retrievable URLS (table for this?) Ideas?

>**Deployment to Heroku**

>See notes above too# tidings-server
