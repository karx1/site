+++
title = "I migrated my site to Zola: this is how it went"
date = "2021-11-20"
+++

Last week I migrated this site to [Zola](https://www.getzola.org/). 

The migration was mostly painless, but converting the site from HTML to markdown was definitely very tedious.

## Before

Before the migration, I just wrote my site in HTML by hand. However, this eventually lead to some spaghetti code and whenever I needed to make a new page, I would have to copy the `<head>` tags every time.

Zola provided me with a template system that was very familiar to me, having done a lot of work in Flask and Django, and Markdown is also super easy and fun to write.

## During

During the migration, I made a lot of decisions that other people would not have necessarily agreed with. One of Zola's major selling points, for example, is their wide variety of easy-to-use [themes](https://www.getzola.org/themes/).

I, however, opted to roll my own CSS, simply because all the themes seemed too bland for me, and a lot of them were ones that I had seen in the wild (like the [juice](https://www.getzola.org/themes/juice/) theme that Trunk uses for their [website](https://trunkrs.dev/)). I wanted something that was unique and something that represented me (part of the reason I chose [TARDIS blue](https://encycolorpedia.com/003b6f) for the background gradient).

Another thing was that the old site had varying formats for projects. For example, SmeaRS used to have its own, seperate project page, while all the others were just sections in the main page. With Zola, though, I had to make a seperate page for each project.

## After

After the migration, I'm super proud of how the site looks. It used to look very bland and boring, and now it looks very professional.

However, there are still a couple of things I still want to add, such as:

1. Independent, reusable theme
2. Move the footer to a sidebar on mobile
3. Automatically list sections in the footer

For now, though, this site does everything I could ask for.

This site's source code is avaiable [on my gitea](https://git.karx.xyz/karx/site). If you are interested in contributing to this site, feel free to shoot me an email with an idea or a patch.

-- karx
