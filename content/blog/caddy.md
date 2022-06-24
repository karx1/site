+++
title = "Why I switched to Caddy"
date = "2022-06-24" 
+++

A while back, I switched over from `nginx` to `caddy` to serve HTTP(S) websites.

## What does caddy do differently?

One of the major pains for anyone hosting a website is HTTPS. You have to generate and maintain valid certificates for each and every subdomain of your site, and this can be a bit tedious to do manually. 

Caddy eases that pain. With just three lines of configuration, caddy automatically requests valid certificates from its certificate authority and sets up a job to renew them when they expire. Gone are the days of `certbot` and messing with filesystem permissions. It Just Works™.

Another benefit is the ease of configuration. With nginx, my configuration was around *400* lines of code, and most of this was whitespace or boilerplate.

With caddy, though, I took my configuration down to only *37* lines of code! That's almost a 90% reduction.

For example, a simple reverse-proxy + HTTPS setup with nginx looks like this:

```
server {
        server_name etc.karx.xyz;

        location / {
                proxy_pass http://192.168.1.184;
                proxy_set_header HOST $host;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection upgrade;
                proxy_set_header Accept-Encoding gzip;
        }
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/karx.xyz/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/karx.xyz/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}
```

With caddy, I took this monolith configuration down to *just three lines*:

```caddyfile
etc.karx.xyz {
    reverse_proxy 192.168.1.184:80
}
```

All told, caddy is a game changing software that will surely be useful to anyone who wants to host a website quickly and pain-free.
