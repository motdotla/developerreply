# developerreply

Rubygem for adding hosts & urls to SendGrid's Parse Incoming Email settings (/developer/reply).

## Usage

```ruby
Developerreply.username = "your_sendgrid_username"
Developerreply.password = "your_sendgrid_password"
Developerreply.init!
Developerreply.create({hostname: "domain.com", url: "http://webhook.com/wherever"})
```

## Development

```
bundle install --binstubs=bin
bin/rspec
```
