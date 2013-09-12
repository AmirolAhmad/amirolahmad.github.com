---
layout: post
title: "How to Install Linux, Apache, MySQL, PHP (LAMP) stack on CentOS?"
category: posts
---

LAMP stack is a group of open source software used to get web servers up and running. The acronym stands for Linux, Apache, MySQL, and PHP. Here is how to install the rest on CentOS:

### Install Apache Web Server:
Apache is an open source web server that is widely used on linux based machines.

`# yum install httpd`

Upon successful installation, prompt the following command to start the Apache web server.

`# service httpd start`

Check if the web server is running by opening a web browser and entering one of the below addresses depending on the environment installed in.

`http://localhost`
`http://127.0.0.1`
`http://ip_address`

After entering the correct address, you should see a web page that reads ¨It works!¨. If you see this text, then you have got the web server installed correctly and running properly.

### Install MySQL Database Server:
To install MySQL server, enter the following command.

`# yum install mysql-server`

After installing, start the MySQL server by keying the following command.

`# service mysqld start`

### MySQL Initial Setup:
Issue the following command to run the initial configuration for MySQL Database server.

`# /usr/bin/mysql_secure_installation`

A password for the root will be prompted. By default, there is no password set to the MySQL root account. It is best advised to set a password. Then, hit enter to continue. All of it in this set up is self-explanatory and I am not going over the deeper details.

Once the initial configuration is done, it is a green light to use the database server.

### Install PHP:
PHP is an open source scripting language used for designing dynamic web pages. Install PHP and all modules by entering the below command.

`# yum install php php-*`

### Starting Services at Boot:
A manual start is required for the web and database server each time after rebooting the server. To automatically start these services on startup, issue the commands below in the terminal.

`# chkconfig httpd on`
`# chkconfig mysqld on`

### Finally, Check Everything:
To check if the new installation of the web server and PHP are working together & correctly as they are supposed to.

Create a file named info.php under /var/www/html/. This is the web root where the webpages are stored.

`vi /var/www/html/info.php`

Enter the content below into the info.php file that has been just created.

`<?php
phpinfo();
?>`

Save and close the file. Restart the web server.

`# service httpd restart`

Open a web browser and go to the address required for the type of environment installed in.

`http://localhost/info.php`
`http://127.0.0.1/info.php`
`http://ip_address/info.php`

All the details about the PHP installed on the web server will be shown.
That is it! You have succesfully install LAMP stack on CentOS.