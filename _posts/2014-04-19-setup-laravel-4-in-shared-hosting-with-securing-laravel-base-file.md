---
layout: post
title: "Setup Laravel 4 in Shared Hosting with securing Laravel base file"
category: posts
---

Assume that you have file structure something like this:-

```bash
/home/username/public_html
```

1. Create new folder outside public_html:-

```bash
/home/username/main-laravel
```

2. Move all the main file of Laravel (app, boostrap, vendor, composer.json, composer.lock, phpunit.xml etc) into that folder (step 1) **except Public folder

3. Open `/home/username/main-laravel/bootstrap/paths.php` and edit to look like this:-

- replace `'app' => __DIR__.'/../app',` to `'app' => __DIR__.'/../../main-laravel/app',`

- replace `'public' => __DIR__.'/../public',` to `'public' => __DIR__.'/../../public_html/laravel',`

- replace `'base' => __DIR__.'/..',` to `'base' => __DIR__.'/../../main-laravel',`

- replace `'storage' => __DIR__.'/../app/storage',` to `'storage' => __DIR__.'/../../main-laravel/app/storage',`

---- SAVE ---


4. Now create a new folder inside public_html

```bash
/home/username/public_html/laravel
```

5. Now, move all the content in public folder of Laravel into that folder (step 4)


6. Open `/home/username/public_html/laravel/index.php` and edit to look like this:-

- replace `require __DIR__.'/../bootstrap/autoload.php';` to `require __DIR__.'/../../main-laravel/bootstrap/autoload.php';`

- replace `$app = require_once __DIR__.'/../bootstrap/start.php';` to `$app = require_once __DIR__.'/../../main-laravel/bootstrap/start.php';`

---- SAVE ---

7. Now create `.htaccess` in `/home/username/public_html` and insert this code:-

```bash
RewriteEngine on
RewriteCond %{REQUEST_URI} !^laravel
RewriteRule ^(.*)$ laravel/$1 [L]
```

---- SAVE ----

Now, your laravel website can be access at http://username.com
