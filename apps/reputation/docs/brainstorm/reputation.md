Reputation is a map with application names as keys and reputations as values.
This gives each app full control over how to use this information. The only
thing an application should ***not ever*** do is update its own reputation value
(if it has one) *in response to changes in any other app's reputation*, as this
could cause a feedback loop of reputation adjustments between two sites if they
both increment their app-specific reputation in response to another app's
reputation. Hopefully there are ways of preventing this from happening without
undermining the service itself by placing too many constraints, but I can't
think of any.

# What reputation is and isn't

Reputation is not currency. This is not to say that it doesn't function very
similarly to currency, but rather, to emphasize that the point of a reputation
system can be largely different than currency.

For one, a reputation system can be used to establish trust: the more a user
contributes or has a positive impact within your application, the more
reputation they earn, the more privileges they have access to.

In this way, reputation forms the basis of structuring a collaborative
environment.

It would not make sense for users to pay money to gain reputation in
environments like these: the whole point is to establish trust, not wealth.

Reputation can be exchanged, as we see with Bounties on StackOverflow, but this
can be done at the cost of losing access to privileges. The reputation is your
right of access. If you chose to award some out or give it away, you lose that
access.

Reputation makes sense to be internal to an application: it decides users
permissions on that application in particular. If you make reputation a more
universal thing, then you have to expend a lot of effort to ensure that it can't
be gamed. Instead, it's better to let applications decide what their reputation
means, and once they've defined that for themselves, let them choose how much
weight to give to user's reputation on other website. It's entirely their
choice.
