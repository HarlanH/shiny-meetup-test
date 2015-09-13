shiny-meetup-test
=================

This demonstrates how to use R Shiny apps to authenticate with Meetup's API
and pull data.

Setup for Local Use
-------------------

The following should work for apps run locally. I'll update with instructions
for how to run off shinyapps.io later.

1. Register an OAuth consumer for Meetup's API by filling out
[their form](https://secure.meetup.com/meetup_api/oauth_consumers/create/). Set the
redirect URI to [http://127.0.0.1/]().

2. Copy `Rprofile-sample.R` to `.Rprofile`. Fill in the values with what Meetup
provides.

3. Run the Shiny app.

Setup for Shinyapps.io Use
--------------------------

1. Register an OAuth consumer for Meetup's API by filling out
[their form](https://secure.meetup.com/meetup_api/oauth_consumers/create/). Set the
redirect URI to [https://youraccountnamehere.shinyapps.io]().

2. Copy `Rprofile-sample.R` to `.Rprofile`. Fill in the key values with what Meetup
provides. Set the `redirect_uri` 
to `https://youraccountnamehere.shinyapps.io/shiny-meetup-test`.

3. Deploy the app:

```
library(rsconnect)
deployApp(appFiles=c("ui.R", "server.R", ".Rprofile", "auth.R", "www/custom.css"))
```


