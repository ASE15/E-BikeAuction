# E-BikeAuction

##Dependencys
- Carrierwave
- Devise

##General

Display notices or alerts on the called page is done with

    redirect_to "/login", alert: "Alert message"
    redirect_to "/login", notice: "Notice message"

##Twitter 

### Environment Variables
To added environment variable for the twitter support do as follows:
    
    bundle install
    figaro install

This creates a new file called config/application.yml.

Then make sure that you set the environment variables in
config/application.yml by adding the following:

    TWITTER_KEY: key_from_email
    TWITTER_SECRET: secret_from_email

### Creating tweets

You can use the following snippet to create a button that logs the user into twitter
then sends the tweet given in the hidden field, logs the user out on twitter 
and returns to the page the button was placed and displays a success or alert message.

    <%= form_for :tweet, url: tweets_path, method: :post do |f| %>
      <%= hidden_field_tag :message, "Your tweet message!" %>
      <%= f.submit "Tweet", class: "btn btn-positive"  %>
    <% end %>

