[![Build Status](https://travis-ci.org/zinan/docker-dev-farm.svg)](https://travis-ci.org/zinan/docker-dev-farm)
[![License: LGPL v3](https://img.shields.io/badge/License-LGPL%20v3-blue.svg)](https://www.gnu.org/licenses/lgpl-3.0)

# Docker Developer Farm

All in one development stack for PHP developers

### Requirements
* Docker
* Docker Compose

### Setup
Just clone or download repo and run **install.sh**

If you need more tuning, please change default values in **.env** file

### Adding new project
After defining your base path for the projects folder and running install.sh, run **vhsetup.sh**, follow the instructions and fill in the blanks ;) 

### Supported Images
- PHP 5.6
- PHP 7.1
- PHP 7.2
- PHP 7.3
- Nginx
- Apache
- Nodejs
- Redis
- Mongodb
- Mysql
- Redis Commander
- PhpMyAdmin
- PostgreSql

### Roadmap
- Dbeaver CE image
- ~~PHP 7.3~~
- ELK
- Nginx virtual host manager script

### Contributing
This project is under constant development. Feedback and suggestions are
welcome.

While creating your pull request, please write a description which gives the context and/or explains why you are creating it.

### License
Licensed under the terms of the LGPL-3.0 license, see the [LICENSE](LICENSE) file.