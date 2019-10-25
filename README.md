# Webcomic Site

Basic docs explaining how the site is built, what dependencies it uses, and how to host/test it locally.

## Hours

Logging the hours I spend on this here. Will update daily. The "commits" column seems confusing, but you can just copy the text and ctrl+f on the [commits page](../../commits/master) to find them.

| Day | Time | Duration | Description | Commits |
|-----|------|----------|-------------|---------| 
| 11/26 | ~19:00-20:30ish | 1h30 | I only tracked the time I was actually working, not the entire time spent discussing the project. | 61532dd - 4982008 |
| 11/26 | 21:30-23:30 | 2h  | | 5d26b71 - bbcac5f |
| 11/27 | 10:30-11:00 | 30m | | 8255d16 |
| 11/27 | 14:30-15:30 | 1h  | | f67da27 - df3b108 |
| 11/27 | 23:30-00:30 | 1h  | | 6046679 |
| 11/28 | 15:45-16:00 | 15m | | 983aa5c - 6ae2b29 |
| 11/28 | 17:00-18:00 | 1h  | | 03ff068 - 358ed19 |
| 11/29 | 11:30-12:00 | 30m | | 2064b0f - 107b8bf |
| 11/29 | 14:40-15:10 | 30m | | b739deb - bf48260 |
| 11/29 | 20:00-21:00 | 1h  | | a5b8334 - caedf3a |
| 12/1  | 11:30-00:30 | 1h  | | ebadfb7 - 7ad5795 |
| 12/12 | 7:50-8:20 | 30m | Starbucks meeting | |
| 12/20 | 15:30-16:00 | 30m | | |
| 12/21 | 13:15-14:30 | 1h15 | | fb89176 - eaeb420 |
| 12/28 | 16:30-17:00 | 30m | | 1d80175 |
| 12/29 | 16:00-16:20 | 20m | | d37cd7b - d42e391 |
| 12/29 | 17:40-17:50 | 10m | | d613c2f - 02ad65f |
| 12/29 | 21:20-21:35 | 15m | | 1932944 - 9470756 |
| 1/5   | 19:45-20:10 | 25m | | 62b7587 |
| 1/8   | 21:00-22:00 | 1h | Starbucks meeting | |
| 1/11  | 11:00-11:30 | 30m | | 89eb9c8 - 987f1e0 |
| 1/12  | 11:30-11:45 | 15m | | f683c64 |
| 1/15  | 11:50-00:30 | 40m | | 23d7678 |
| 1/17  | 10:00-10:40 | 40m | | 4ad9ce3 - 4e3808a |
| 1/17  | 20:00-22:00 | 1h  | Starbucks meeting | |
| 1/28  | 22:45-23:15 | 30m  | | 6a765e9 - bb0c162 |
| 2/13  | 17:00-18:00 | 1h  | | 78ef2bc - b45433e |
| 5/9   | 20:30-21:30 | 1h  | | 82e1e22 - c952964 |

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
