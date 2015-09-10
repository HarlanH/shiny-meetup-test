shiny-meetup-test
=================

This demonstrates how to use R Shiny apps to authenticate with Meetup's API
and pull data.

Setup
-----

The following should work for apps run locally. I'll update with instructions
for how to run off shinyapps.io later.

1. Register an OAuth consumer for Meetup's API by filling out
[their form](https://secure.meetup.com/meetup_api/oauth_consumers/create/). Set the
redirect URI to [http://127.0.0.1/]().

2. Copy `Rprofile-sample.R` to `.Rprofile`. Fill in the values with what Meetup
provides.

3. Run the Shiny app.

