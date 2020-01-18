# Integral CRM

This is the Integral CRM. A Sinatra built CRM using the MVC Framework. This project is a proof of concept built for the Flatiron School Software Engineering cohort. The project will be ongoing, showcasing development of skills with APIs and front ends technologies, like w3.CSS and Bootstrap. If you are looking to download this project, you would need to use a Gmail account upon siging in to the application. The project only lightly uses google calendar API and is not in production, so there will be limitations in what is accessible without an OAuth2.0 client_secrets.Json file and a Gmail account.

If you would like a test Gmail account for this app, please let me know and I can provide one. This app will not store any data from Google Calendar or Drive at this time, but there are plans to implement these services in future. Also, this project was developed in Linux (Ubuntu 18.04 LTS) so gems like Shotgun will not be usuable on a Windows machine. Win10 has the ability to utilise a Linux subsystem, allowing Windows to run commands found on Linux; including commands linked to Ruby gems. If this is something you are interested in setting up also, please feel free to reach out. Otherwise, I hope you find this project interesting. Feel free to contribute any changes you feel are required. 

## Installation

Clone repo to your machine and change directory to the integralcrm sub folder. This app is a development version, so will require a client_secrets.Json file in the working tree.

### do not put client_secrets.Json files in the working tree of this project

Once the project is cloned and checked out

Execute:

    $ bundle install

Then use the command:

    $ shotgun

To open a browser window with the project loaded on a localhost server.

## Usage

The localhost server is shutdown using the command CTRL + C. If this isn't done then the server will stay active on one of the network ports. By default, shotgun uses port 9393.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Captainmango/IntegralCRM. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HolidayScraper project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/holiday_scraper/blob/master/CODE_OF_CONDUCT.md).
