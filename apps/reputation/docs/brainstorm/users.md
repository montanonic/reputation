There are two significations for "user" in this application.

First, are the applications that user our service. They are the users of our
service.

Second, are the users of the applications; they are not the *primary* users of
our service, but they may be given some controls in the future.

Generally, when referring to "users" within this project, we are referring to
the applications that connect to our network and user our service's API.

The second type of user will be referred to as an "app(lication)'s user", or an
"app(lication) user".


## Authentication (The real problem to solve)

Say your app, YApp, wants to link its users to their StackOverflow reputations
if they consent to do so (and have a SO account). How can we link those
reputations to the same user entity?

Let's also assume that StackOverflow is not participating at all beyond their
API.

Using StackOverflow's OAauth system would be one way, and likely the best way,
but if we want our app to be useful to smaller applications, we need to provide
a secure way of linking that does not involve OAuth, so that one small app can
link to another small app.

Well, if YApp used email verification to register users, or any OAuth system
(so long as they got the user's email), then



We can create another callback procedure, and apps can use our HTTP API to
enact it, and the way it would work is: in your app, tell a user that they can
gain more reputation by linking their _blah_ account. Then, the user would



We need require that each application provide an HTTP action that implements a
linking procedure, validating that a user in another app is the same user in
this app. To accomplish this...


We could have apps provide us authorization-specific information about their
users, perhaps a JSON Web token with ...
