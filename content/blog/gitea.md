+++
title = "I switched from cgit to Gitea: here's how you can, too"
date = "2021-12-13"
+++

Over the past few days, I've been moving all the repos from my old git server to the [Gitea](https://gitea.io) git server software.

The reason for this was frankly because I am going to start looking for jobs soon and in my opinion, gitea is easier to navigate (and read source code on) than cgit for hiring teams and other non-technical people, especially if they have interacted with GitHub in the past.

The process was extremely easy and quick. The only thing you need is a SQL (pronounced sequel) server, such as MariaDB/MySQL, PostgreSQL, and SQLite.

I used PostgreSQL because I already had a server running; information about other database backends can be found at [the ArchWiki](https://wiki.archlinux.org/title/Gitea).

The first thing you need to do is to back up all your repositories, because there's no other way to move all your repos from your cgit to gitea. (If I find out later there is, I'll change this.)

Now, install Gitea either by using [a binary](https://docs.gitea.io/en-us/install-from-binary/) or using [your Linux distribution's package manager](https://docs.gitea.io/en-us/install-from-package/).

## Configuration

The user configuration file is located at `/etc/gitea/app.ini`. When you're done editing it, make sure to set its owner to the correct group and user, otherwise it will not start properly.

```bash
sudo chown gitea:gitea /etc/gitea/app.ini
```

## PostgreSQL configuration

First, log into whichever user is running PostgreSQL. On most systems, this will be the `postgres` system user.

```bash
sudo -iu postgres
```

Then, create the `gitea` database user and the `gitea` database. Gitea will take care of making tables and stuff.

```bash
createuser -P gitea # you will be promped for a password
createdb -O gitea gitea
```

Now, verify that it works (this can be done from any system user)

```bash
psql --host=ip_address --dbname=gitea --username=gitea --password
```

Replace `ip_address` with the IP address of the server running postgres.

Now, configure Gitea to use Postgres:

```ini
DB_TYPE = postgres
; Replace hostaddress with the IP address of the server running postgres
HOST = hostaddress:5432
NAME = gitea
USER = gitea
; Use PASSWD = `your password` if the database password contains special characters
PASSWD = password
```

## Usage

Start the gitea service. On most Linux systems you can use the `systemctl` command to do so.

```bash
sudo systemctl enable --now gitea
```

Now, navigate to `http://ip_address:3000`. Replace `ip_address` with the IP address of the server running Gitea.

When running Gitea for the first time, you should be redirected to an installation screen, where you can configure your brand new Gitea server.

## Epilogue

That's it! The first user to register should automatically become an admin user (unless you created an admin user during installation).

You should now be happily running a Gitea instance. If you have any questions, feel free to [shoot me an email](mailto:yashkarandikar158@gmail.com)!

