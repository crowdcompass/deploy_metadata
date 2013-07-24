# DeployMetadata

Records and caches the start time, deploy time (with standard capistrano deploy), and git revision of your running app.

## Installation

Add this line to your application's Gemfile:

    gem 'deploy_metadata'

And then execute:

    $ bundle

## Usage

E.g., 

helper:

	def deploy_metadata
		return '' if Rails.env.production?

		capture_haml do
			DeployMetadata.current.each_pair do |key, val|
				haml_tag(:p) do
					haml_concat "#{key}: #{val}"
				end
			end
		end
	end

view:

	= deploy_metadata


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
