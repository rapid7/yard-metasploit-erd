# YARD::Metasploit::ERD [![Build Status](https://travis-ci.org/rapid7/yard-metasploit-erd.svg?branch=feature/gem-skeleton)](https://travis-ci.org/rapid7/yard-metasploit-erd)[![Code Climate](https://codeclimate.com/github/rapid7/yard-metasploit-erd.png)](https://codeclimate.com/github/rapid7/yard-metasploit-erd)[![Coverage Status](https://coveralls.io/repos/rapid7/yard-metasploit-erd/badge.png)](https://coveralls.io/r/rapid7/yard-metasploit-erd)[![Dependency Status](https://gemnasium.com/rapid7/yard-metasploit-erd.png)](https://gemnasium.com/rapid7/yard-metasploit-erd)[![Gem Version](https://badge.fury.io/rb/yard-metasploit-erd.png)](http://badge.fury.io/rb/yard-metasploit-erd)

`yard-metasploit-erd` is a [YARD](yardoc.org) plugin that automatically inserts an "Entity-Relationship Diagram"
subsection containing a PNG Entity-Relationship Diagram for each Module that contains `ActiveRecord::Base` subclasses
and for each `ActiveRecord::Base` subclass.

For namespace Modules, the diagrams are restricted to the `ActiveRecord::Base` subclasses in that namespace and the
transitive closure of those classes `belongs_to` relationships.

![Mdm::Module::Author ERD](doc/example/images/mdm/module/author.erd.png)

For `ActiveRecord::Base` subclasses the diagram is restricted to the transitive closure of its `belongs_to`
relationships.

![Mdm::Module namespace ERD](doc/example/images/mdm/module.erd.png)

Using the `belongs_to` transitive closure means that all foreign keys are mapped to primary keys, so any diagram's
namespace or class could be extracted to another gem without leaving dangling foreign keys.

## Versioning

`YARD::Metasploit::ERD` is versioned using [semantic versioning 2.0](http://semver.org/spec/v2.0.0.html).  Each branch
should set `YARD::Metasploit::ERD::Version::PRERELEASE` to the branch name, while master should have no `PRERELEASE`
and the `PRERELEASE` section of `YARD::Metasploit::ERD::VERSION` does not exist.

## Installation

Add this line to your application's `Gemfile`:

    gem 'yard-metasploit-erd'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yard-metasploit-erd

## Usage

Add this line to your application's `.yardopts`

    --plugin yard-metasploit-erd

Ensure your `ActiveRecord::Base` subclasses are loaded when YARD runs by making the `environment` task a prerequisite of
the `yard:doc` task:

    # lib/tasks/yard.rake
    task 'yard:doc' => :environment

## Contributing

1. Fork it ( http://github.com/<my-github-username>/yard-metasploit-erd/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
