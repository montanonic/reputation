Reputation is a map with application names as keys and reputations as values.
This gives each app full control over how to use this information. The only
thing an application should ***not ever*** do is update its own reputation value
(if it has one) *in response to changes in any other app's reputation*, as this
could cause a feedback loop of reputation adjustments between two sites if they
both increment their app-specific reputation in response to another app's
reputation. Hopefully there are ways of preventing this from happening without
undermining the service itself by placing too many constraints, but I can't
think of any.
