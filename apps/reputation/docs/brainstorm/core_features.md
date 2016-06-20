## Principles
Encouraging a more connected and open internet. Encourage
cross-application collaboration, as well as in-application collaboration by
making it easy to create permission systems and understand which users are
reputable.

## Initial Goal
Allow a user gain reputation on a website based upon the reputation they
hold on other websites.

## Stretch Goal
Make it super easy for an application to connect to our API and set
up a permissions system, integrating reputation with a whole network of other
applications, at their discretion.

### Story
Joe registers an account for your new programming language documentation
website. You allow for wiki-style editing, but bar untrusted users from making
many contributions before earning more website reputation. Joe, however, has
been contributing to Stack Overflow for the past five years, and is clearly not
a threat to your website (and in fact, is likely a large boon to it). Joe should
be able to have many basic privileges when joining your website, because his
reputations on another, trusted website, assure you that he's to be trusted.

# Details
[Adaptors](../adaptor_based.md)
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
