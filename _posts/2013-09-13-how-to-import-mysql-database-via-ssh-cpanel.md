---
layout: post
title: "How to import MySQL Database via SSH (cPanel)"
category: posts
---

If your MySQL database backup is about >50MB, you are having a trouble when you try to restore the database backup file via cPanel or PHPMyAdmin. So the only way to restore the MySQL Database backup file is using SSH.

Here is the step on how to import MySQL Database via SSH

1. First, create MySQL database, MySQL user & MySQL Password in your cPanel.
2. Upload the MySQL Database backup file to the server (ex: backup101.sql.gz)
3. Gunzip the file

`$ gunzip backup101.sql.gz`

4. Use this command to import the file into user account:

`$ mysql database -u username -pdbpassword < backupfile.sql`

for example:

`$ mysql user_database -u user_username -ppasswordhere < backup101.sql` - should same in step 1.

> Make sure 'user_' is your account name in cPanel that you have create in step 1.

#### Replace passwordhere with the actual password and do not place a space after the -p before the password, it must be directly next to the -p with no space.

5. You are all set. Now check your PHPMyAdmin to make sure your MySQL Database backup file is exist.