## Principle

Encourage a more connected and open Internet by making it easier to build and
grow community-driven applications. We <3 wikis and QA forums.

## Initial Goals / Features

Allow applications to easily retrieve reputation-like data for users on other
websites, and to receive channel updates anytime the values it's watching
change.

Provide a convenient interface for uploading an app's own reputation data
to join the reputation network and promote synergies with other websites.

Through the preceding features, we can encourage cross-application
interaction/delegation. An example: Say an app, for whatever reason, only wants
a particular permission granted to users who meet a reputation threshold with
their StackOverflow rep. This app can make that easy.

## Longer-term Goal

Create tools/libraries for creating custom permission systems, empowering
applications to provide user permissions that require trust (and hence time)
without burdening their whole userbase to climb the reputation ladder, since
apps can rely upon other trusted apps' reputation data to determine if a user
can be trusted with certain features.

### Story

Jill registers an account for your new programming language documentation
website. You allow for wiki-style editing, but bar untrusted users from making
many contributions before earning more website reputation. Jill, however, has
been contributing to Stack Overflow for the past five years, and is clearly not
a threat to your website (and in fact, is likely a large boon to it). Jill
should be able to have many basic privileges when joining your website, because
Jill's reputations on another, trusted website, are enough to assure you that
Jill can be trusted with certain features.

# Details
Any website that has a user reputation system, and allows for retrieving its
user's reputation, may have an adapter built for it to include it in the app. If
any app has a straightforward, web-based way to regularly retrieve updated
reputation information for a particular user, then it can be part of the
reputation network.

Your application should be able to add plugins for any other application which
shares its user's reputation with the network. In doing so, you'll have simple
query access to that user's reputation on each application you connect to in the
network. If you'd like, you can also set a conversion-rate between that app's
reputation and your app's reputation (along with an upper-bound), and this will
give you automatic reputation adjustments for your users if you chose to store
your user's reputation information with our application (we'll charge you for
the storage, for maintenance reasons, and with the data we hold from you we'll
be able to do research to better refine our system. We will not collect any
personal information from user's, we will however benefit from knowing details
about them related to how they use any given app, in relation to their
reputation.)

#### For smaller apps

Using our API, you'll set some configuration information for your application's
account with us, which will tell our application where to send HTTP requests to
fetch your user reputation data, along with any other procedures we may need. We
may choose to store reputation data within our own databases for performance
purposes.

#### For larger apps

(Such as StackOverflow / StackExchange) We will hardcode how to retrieve their
user's data in this application.

## Problems

If a user is penalized on a website, we need to ensure that their reputation is
properly deducted from their whole reputation network, adjusted for each
application's particular conversion-rate.

In contrast, we don't want it to be common for applications to, by adjusting
their conversion rate, retroactively decrease a user's reputation on their
website just because, for example, they decide that Stack Overflow reputation
should count for half as much reputation on their site as it currently does.

We shouldn't bar applications from decreasing a user's reputation as they see
fit, but we should make it easy for apps to explicitly indicate how much of any
user's reputation is coming from a particular source, so that if a user's
reputation ever goes down for site-wide reasons like decreasing the
reputation-power of another website, the user's can at least see where they lost
any of that reputation from, and assure them that their reputation didn't go
down because of any infractions.

### Circular feedback

A hot new application, XApp, has become the next best thing. It's grown very
quickly, thanks in part to users with existing StackOverflow accounts gaining
immediate reputation on XApp. StackOverflow decides to get in on the action and
attract users from XApp, and starts giving out StackOverflow reputation in
response to a user's XApp reputation.

We now have a feedback problem to solve: If StackOverflow gives 60 reputation
for every point of XApp reputation, and XApp gives out 1 reputation for every 20
points of SO reputation (site-reputation is not currency, so each site can
choose to give a different exchange than the other), now what happens when a
user with 10 reputation on XApp links their XApp account to StackOverflow?
They'll gain 600 reputation on StackOverflow (assuming there was no upper-cap),
and subsequently, XApp will notice that the user has 600 more StackOverflow
reputation, and give them 30 XApp reputation, and so on.

#### Breaking the cycle

The solution is to make it so that each app's reputation is never actually
treated as a single value, but is instead a map with keys consisting of the
names of each app it draws reputation from, and the reputation of the user on
that app. In this way, if a website choses to increment a user's data using its
own reputation system, it will only increment that field of the map. If XApp
boosts a user's reputation by 20 thanks to their StackOverflow reputation, the
actual reputation for XApp will not increase, but the reputation associated with
the StackOverflow field in XApp's reputation map *will* increase. This means
that StackOverflow will not sense any change in XApp's reputation for anything
other than XApp incrementing its own reputation.

##### Implementing the solution

The actual data structures should be as follows: Every application's user across
all of these networks will themselves be the entity owning the data for their
reputation on each site.

Each app will be the sole entity with the right to alter their reputation for
each user. They will not be able to change that app user's reputation with any
other app.

In SQL storage, this will be represented by a Many-To-Many table joining app
users with the apps themselves. Application <-> User

The apps must still ensure that when an app user's reputation increases on
another site, that the application does not actually update their own reputation
in response to that.
