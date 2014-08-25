# developerreply

![](https://raw.githubusercontent.com/scottmotte/developerreply/master/developerreply.jpg)

Rubygem for adding hosts & urls to SendGrid's Parse Incoming Email settings (/developer/reply).

## Usage

```ruby
Developerreply.username = "your_sendgrid_username"
Developerreply.password = "your_sendgrid_password"
Developerreply.create({hostname: "domain.com", url: "http://webhook.com/wherever"})
```

## Development

```
bundle install --binstubs=bin
export SENDGRID_USERNAME=yourusername
export SENDGRID_PASSWORD=yourpassword
bin/rspec
```

## Publish to RubyGems.org

You first need to request access from [scottmotte](http://github.com/scottmotte).

```
gem build developerreply.gemspec
gem push developerreply-0.0.1.gem
```
