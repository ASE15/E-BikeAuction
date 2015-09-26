# E-BikeAuction

##Dependencys
- Carrierwave
- Devise

##Twitter Environment Variables
To added environment variable for the twitter support do as follows:
    
    bundle install
    figaro install

This creates a new file called config/application.yml.

Then make sure that you set the environment variables in
config/application.yml by adding the following:

    TWITTER_KEY: key_from_email
    TWITTER_SECRET: secret_from_email

