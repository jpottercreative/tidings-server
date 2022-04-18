# bromide-drag v1.0 SERVER

## Welcome to Bromide Drag

***Bromide Drag:*** Characterized by uneven areas of development due to high concentrations of Bromide around sproket holes of film due to lack of agitation. 

---
Let's get agitated.

---

### Bromide Drag v1 is a simple photo gallery builder app!

This Rails server runs ActiveStorage for file handling, serving files to/from an AWS S3 bucket, and uses JSON Web Tokens (JWT) and Devise for authentication. ActiveModel serializer (and some fun custom end-points) is used for data serialization.

The client is built in React and uses React Router for front end navigation.


---

## Installation
Fork and clone the repo, `bundle install`, `rails db:create db:migrate` and `rails s` will get the server going.

Be sure to go grab the CLIENT here: https://github.com/hariseldon27/bromide-drag-client



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
