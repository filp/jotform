[![Build Status](https://travis-ci.org/filp/jotform.png)](https://travis-ci.org/filp/jotform)
# jotform

Ruby wrapper for the JotForm developer API

http://api.jotform.com

## Installation:

1. Add the gem to your `Gemfile`

```ruby
source "https://rubygems.org"

gem "jotform"
```

2. Install it

```shell
$ bundle install
```

3. You're good to go!

## Example:

(I'll update this once there's some more to show)

```ruby
require "jotform"

jotform = JotForm::API.new(api_key)
jotform.user.username #=> "filp"
jotform.user.valid?   #=> true
```

## Contributing:

- If you find a bug, and don't want to or can't fix it, please open a new issue.
- If you write a new feature or fix a bug, please write tests for it, if applicable.
- If you add new request tests and want to record them with VCR, you will need a valid API key to record VCR tests. The key will not be saved in the cassettes, don't worry.

Thank you!