# jekyll-theme-composer

*Composer* is a theme for (mainly classical) music composers. It's based on Minima, Jekyll's default theme, as is this documentation.  The Composer theme was designed by Eric Galluzzo, who couldn't find a theme suitable for building a composer's website -- so he made one himself.  As of version 0.1, it has the following capabilities:

  - Show a list of works, sorted by date
  - Display an individual work, with support for embedded media
  - Show a list of video game credits, sorted by date
  - Display an individual game, with support for embedded media

It has also preserved all of Minima's default capabilities, so the support for posts and such is still intact.

Please be warned that this theme is still in flux and has not yet reached version 1.0, so things may break between minor versions.

To see a preview of the Composer theme, please visit [Eric Galluzzo's site](https://www.ericgalluzzo.com/).

## Installation

Add this line to your Jekyll site's Gemfile:

```ruby
gem "jekyll-theme-composer"
```

And add this line to your Jekyll site's `_config.yml` file:

```yaml
theme: composer
collections:
  works:
    output: true
  games:
    output: true
```

(If you are switching from the Minima theme, you will want to change your existing `minima` top-level configuration to `composer`.)

And then execute:

    $ bundle


## Contents At-A-Glance

Composer has been scaffolded by the `jekyll new-theme` command and therefore has all the necessary files and directories to have a new Jekyll site up and running with no further configuration.

### Layouts

Refers to files within the `_layouts` directory, that define the markup for your theme.

  - `default.html` &mdash; The base layout that lays the foundation for subsequent layouts. The derived layouts inject their contents into this file at the line that says ` {{ content }} ` and are linked to this file via [FrontMatter](https://jekyllrb.com/docs/frontmatter/) declaration `layout: default`.
  - `home.html` &mdash; The layout for your landing-page / home-page / index-page. [[More Info.](#home-layout)]
  - `page.html` &mdash; The layout for your documents that contain FrontMatter, but are not posts.
  - `post.html` &mdash; The layout for your posts.
  - `works.html` &mdash; The layout for your list of completed concert works. [[More Info.](#works-layout)]
  - `work.html` &mdash; The layout for an individual completed concert work. [[More Info.](#work-layout)]
  - `games.html` &mdash; The layout for your list of video game credits. [[More Info.](#games-layout)]
  - `game.html` &mdash; The layout for an individual video game credit. [[More Info.](#game-layout)]

### Includes

Refers to snippets of code within the `_includes` directory that can be inserted in multiple layouts (and another include-file as well) within the same theme-gem.

  - `disqus_comments.html` &mdash; Code to markup disqus comment box.
  - `footer.html` &mdash; Defines the site's footer section.
  - `google-analytics.html` &mdash; Inserts Google Analytics module (active only in production environment).
  - `head.html` &mdash; Code-block that defines the `<head></head>` in *default* layout.
  - `header.html` &mdash; Defines the site's main header section. By default, pages with a defined `title` attribute will have links displayed here.
  - `media.html` &mdash; Shows embedded media in an `<iframe>` surrounded by a `<figure>`.

### Sass

Refers to `.scss` files within the `_sass` directory that define the theme's styles.

  - `composer.scss` &mdash; The core file imported by preprocessed `main.scss`, it defines the variable defaults for the theme and also further imports sass partials to supplement itself.
  - `composer/_base.scss` &mdash; Resets and defines base styles for various HTML elements, mostly based on Minima.
  - `composer/_layout.scss` &mdash; Defines the visual style for various layouts, a superset of Minima.
  - `composer/_syntax-highlighting.scss` &mdash; Defines the styles for syntax-highlighting, copied straight from Minima.

### Assets

Refers to various asset files within the `assets` directory.
Contains the `main.scss` that imports sass files from within the `_sass` directory. This `main.scss` is what gets processed into the theme's main stylesheet `main.css` called by `_layouts/default.html` via `_includes/head.html`.

This directory can include sub-directories to manage assets of similar type, and will be copied over as is, to the final transformed site directory.  For example, you may find it useful to have subdirectories for watermarked scores and game screenshots.

### Plugins

Composer comes with [`jekyll-seo-tag`](https://github.com/jekyll/jekyll-seo-tag) plugin preinstalled to make sure your website gets the most useful meta tags. See [usage](https://github.com/jekyll/jekyll-seo-tag#usage) to know how to set it up.

## Usage

### Home Layout

`home.html` is a flexible HTML layout for the site's landing-page / home-page / index-page. <br/>

#### Main Heading and Content-injection

The *home* layout will inject all content from your `index.md` / `index.html` **before** the **`Posts`** heading. This will allow you to include non-posts related content to be published on the landing page under a dedicated heading. *We recommended that you title this section with a Heading2 (`##`)*.

Usually the `site.title` itself would suffice as the implicit 'main-title' for a landing-page. But, if your landing-page would like a heading to be explicitly displayed, then simply define a `title` variable in the document's front matter and it will be rendered with an `<h1>` tag.

#### Post Listing

This section will be automatically included only when your site contains one or more valid posts or drafts (if the site is configured to `show_drafts`).

The title for this section is `Posts` by default and rendered with an `<h2>` tag. You can customize this heading by defining a `list_title` variable in the document's front matter.

### Works Layout

`works.html` shows a list of concert works, from newest to oldest as determined by the `date` on each work's front matter.  The summary lists the title, the year of composition, the instrumentation summary and the duration for each work.  These should be specified via the `title`, `date`, `instrumentation_summary` and `duration` variables in the front matter for the work. (see [work layout](#work-layout) below).

To customize the page itself, you can specify the title via the `title` variable in the front matter.  Any content on the page will be inserted before the list of works.

### Work Layout

`work.html` is the layout for an individual concert work.  Each work should be a separate file in the `_works` directory.  The following variables are available in the front matter:

```yaml
title: My Work                     # the work's title; this is required
instrumentation_summary: for choir and orchestra
instrumentation: choir (SSAATTBB) and orchestra (3-3-3-3 4-3-3-1 timp + 3 perc, hp, strings)
date: 2014-08-12                   # date of composition
duration: 6 minutes
score_url: /assets/pdf/MyWork.pdf  # this should be pre-watermarked if you want your score watermarked
commissioned_by: Someone
written_for: Someone               # usually "commissioned_by" and "written_for" are mutually exclusive
premiered_by: Boston Symphony Orchestra
premiered_at: Symphony Hall
premiered_on: 2015-10-23
```

In addition, all the [embeddable media variables](#media-variables) are available.

The only variable that is required is `title` (although `date` is highly recommended).  If you don't know the exact date that you finished the work, just pick a date sometime during that year.  By default, only the year will be displayed.

Any content will be displayed as a program note after the other information.

### Games Layout

`games.html` is the layout for a collection of games, in reverse order of release as determined by the `date` in the game's front matter.  Each game will be displayed as a thumbnail image, the title of the game, and the year of its release.  To customize the title of the page, set the `title` variable in the page's front matter.

### Game Layout

`game.html` is the layout for a single video game.  Each game should be a separate file in the `_games` directory.  The following variables are available in the front matter:

```yaml
title: My Game                              # the name of the game; this is required
date: 2021-06-09                            # release date
game_url: https://example.com/mygame/       # the URL of the game's website
thumbnail_url: /assets/games/Thumbnail.jpg  # path to an asset containing a thumbnail of the game
image_url: /assets/games/MyGame.jpg         # path to an asset containing a screenshot of the game
```

In addition, all the [embeddable media variables](#media-variables) are available.

Only `title` is required (although `date` is highly recommended).  Thumbnail images should have the same aspect ratio (usually 16:9), and should generally have a width of 560px.  If no thumbnail image is specified, the image URL will be used as a thumbnail instead.  Otherwise the game will have no thumbnail image on the collection page.

### Media Variables

Every concert work and game may embed an audio/video player by setting one of the following variables:

```yaml
youtube_id: 11I27DKUYA8
soundcloud_url: https://soundcloud.com/egalluzzo/sets/the-corruption-within
bandcamp_id: 1940188238
spotify_url: https://open.spotify.com/album/1t0vRPt56WTBa65VvfuAN4
```

Here's how to find each of the above items.

  - `youtube_id` &mdash; Go to a YouTube video in your browser; the YouTube ID is the bit after `watch?v=` in the normal YouTube URL.
  - `soundcloud_url` &mdash; This is the normal URL to a track or playlist on SoundCloud, which you can find in the address bar of your browser when navigating to a SoundCloud track or playlist.
  - `bandcamp_id` &mdash; This one is a bit tricky.  To find it:
    1. Go to the track or album for which you want to find the ID.
    1. Hit "Share/Embed".
    1. Hit "Embed this track".
    1. Choose any of the sizes shown.
    1. In the "Embed code", you'll see something like `<iframe style="border: 0; width: 100%; height: 120px;" src="https://bandcamp.com/EmbeddedPlayer/album=1940188238/size=large/...`.
    1. The bit you want is the number after the `album=`.
  - `spotify_url` is the normal URL to the Spotify album or track, which you can find in the address bar of your browser when navigating to a Spotify album or track.

--

### Customization

To override the default structure and style of Composer, simply create the relevant directory at the root of your site, copy the file you wish to customize to that directory, and then edit the file.
For example, to override the [`_includes/head.html `](_includes/head.html) file to specify a custom style path, create an `_includes` directory, copy `_includes/head.html` from the `jekyll-theme-composer` gem folder to `<yoursite>/_includes` and start editing that file.

The site's default CSS is in a subdirectory within the gem itself, [`assets/main.scss`](assets/main.scss). To **override the default CSS**, the file has to exist at your site source. Do either of the following:
- Create a new instance of `main.scss` at site source.
  - Create a new file `main.scss` at `<your-site>/assets/`
  - Add the frontmatter dashes, and
  - Add `@import "composer";`, to `<your-site>/assets/main.scss`
  - Add your custom CSS.
- Download the file from this repo
  - Create  a new file `main.scss` at `<your-site>/assets/`
  - Copy the contents at [assets/main.scss](assets/main.scss) onto the `main.scss` you just created, and edit away!
- Copy directly from the `jekyll-theme-composer` gem
  - Go to your local `jekyll-theme-composer` gem installation directory (run `bundle show jekyll-theme-composer` to get the path to it).
  - Copy the `assets/` folder from there into the root of `<your-site>`
  - Change whatever values you want, inside `<your-site>/assets/main.scss`

--

### Customize navigation links

This allows you to set which pages you want to appear in the navigation area and configure order of the links.

For instance, to only link to the `about` and the `portfolio` page, add the following to you `_config.yml`:

```yaml
header_pages:
  - about.md
  - portfolio.md
```

--

### Change default date format

You can change several default date formats by specifying `site.composer.date_format`
in `_config.yml`.

```yaml
# Composer date format
# refer to http://shopify.github.io/liquid/filters/date/ if you want to customize this
composer:
  date_format: "%b %-d, %Y"              # for posts
  work_date_format: "%Y"                 # for concert works, both on the list and the individual work
  game_date_format: "%Y"                 # dates that show up on the list of games
  game_release_date_format: "%B %-d, %Y" # game release dates on individual game pages
```

--

### Enabling comments (via Disqus)

Optionally, if you have a Disqus account, you can tell Jekyll to use it to show a comments section below each post.

To enable it, add the following lines to your Jekyll site:

```yaml
  disqus:
    shortname: my_disqus_shortname
```

You can find out more about Disqus' shortnames [here](https://help.disqus.com/customer/portal/articles/466208).

Comments are enabled by default and will only appear in production, i.e., `JEKYLL_ENV=production`

If you don't want to display comments for a particular post you can disable them by adding `comments: false` to that post's YAML Front Matter.

--

### Social networks

You can add links to the accounts you have on other sites, with respective icon, by adding one or more of the following options in your config:

```yaml
twitter_username: jekyllrb
github_username:  jekyll
dribbble_username: jekyll
facebook_username: jekyll
flickr_username: jekyll
instagram_username: jekyll
linkedin_username: jekyll
pinterest_username: jekyll
youtube_username: jekyll
googleplus_username: +jekyll
rss: rss

mastodon:
 - username: jekyll
   instance: example.com
 - username: jekyll2
   instance: example.com
```

--

### Enabling Google Analytics

To enable Google Analytics, add the following lines to your Jekyll site:

```yaml
  google_analytics: UA-NNNNNNNN-N
```

Google Analytics will only appear in production, i.e., `JEKYLL_ENV=production`

--

### Enabling Excerpts on the Home Page

To display post-excerpts on the Home Page, simply add the following to your `_config.yml`:

```yaml
show_excerpts: true
```

## Future Directions

In future versions, Composer may add support for films, TV shows and discography, to accommodate a wider range of composers.  In addition, it may add the ability to categorize each type of medium (concert works, films, etc.) by genre or instrumentation.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jekyll/minima. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Development

To set up your environment to develop this theme, run `script/bootstrap`.

To test your theme, run `script/server` (or `bundle exec jekyll serve`) and open your browser at `http://localhost:4000`. This starts a Jekyll server using your theme and the contents. As you make modifications, your site will regenerate and you should see the changes in the browser after a refresh.

## License

The theme is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
