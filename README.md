# Webcomic Site

Basic docs explaining how the site is built, what dependencies it uses, and how to host/test it locally.

## Hours

Logging the hours I spend on this here. Will update daily. The "commits" column seems confusing, but you can just copy the text and ctrl+f on the [commits page](../../commits/master) to find them.

| Day | Time | Duration | Description | Commits |
|-----|------|----------|-------------|---------| 
| 11/26 | ~19:00-20:30ish | 1h30 | I only tracked the time I was actually working, not the entire time spent discussing the project. | 61532dd - 4982008 |
| 11/26 | 21:30-23:30 | 2h  | | 5d26b71 - bbcac5f |

Total: 20h45

## TODO

- [x] comments w Disqus
- [ ] create more newspaper-like layouts
- [ ] design polish, animations, transitions, etc
- [ ] ensure compatibility with other browsers
- [x] content management system - forestry.io

## Building

The site is built in Jekyll. You'll want to setup Ruby on your machine, then cd into the cloned repositories folder and run `gem install`. After that, `jekyll serve` should build this site properly, store the output in `./_site`, and host it to `127.0.0.1:4000`.

## Docs

### Page Structure

The index file, "/", always redirects to the latest "page", or set of comics. Pages have a url equivalent to their `:slug` parameter, which should start at 1 and increment each time a new page is added.

Comics are handled similarly; each new comic increments an integer, except they are located in the `/comics/` subdirectory. If the page at `/1` contains 40 comics, then the url for the first comic of page 2 should be `/comics/41`.

### Layouts

Each "page" of comics has a "grid" attribute which tells it which predefined set of positions it should place the comics in. The page layout (`_layouts/page.html`) then determines how many comics it needs and adds them to the grid using the comic include (`_includes/comic.html`).

Each page has a `start` variable which defines the number of the first comic to be used in the layout; the rest are obtained in sequential order.

### Identifiers

Pages and comics both have two variables that are used to identify them; the `slug` and the `hash`. The `slug` is used only to determine the URL of the comic, while the `hash` is used for sorting the comics internally (this is what the sequential layouts - described above - and pagination use). These variables _should_ both have the same numerical value in each comic, but the `hash` should have some amount of zeros prepended so that it is a uniform length. Currently, this length is 6 characters. Unless you plan to host more than 999999 comics, I think that this will be enough.

Example: for comic #1, the `slug` would be "1", and the `hash` would be "000001".

These identifiers are used in many places throughout the site, but their main purpose is to satiate the paginator element, located at `_includes/paginator.html`.

### CSS

This site has a lot of CSS. However, it is split into separate files (using SCSS) with a strict naming convention ([Block Element Modifier](http://getbem.com/naming/)) to make it easier to manage. 
