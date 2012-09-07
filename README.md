LaTeX-Refresh
=============

Monitor modifications to a LaTeX file and re-render - real-time view of your changes!

A hasty little hack that makes my life easier, maybe you'll find it useful...

### Install
Download the script and put it somewhere on your path. I keep mine in ~/bin via a symlink to this git repo.

Now install the [listen gem](http://rubygems.org/gems/listen) by running `gem install listen`.

If you haven't already installed a LaTeX package, you should probably do so...for OS X users the best way of doing this is the [MacTex installer](http://www.tug.org/mactex/).

### Usage
Just put `refresh_latex.rb` somewhere in your path and pass it the LaTeX file you'd like to use. That's it!

Any additional arguments are passed directly to the `pdflatex` command, so you can do any fancy shenanigans you want.

Look at this cool screenshot of it in action! So cool!

![screenshot](https://raw.github.com/eric-wood/LaTeX-Refresh/master/screenshot.png)

### Notes
Right now it's wired up to support [Skim.app](http://skim-app.sourceforge.net/) - in order for you to get it to work you'll need to modify the `pdf_viewer` variable defined at the top of the file.

It's easy to make it work with other PDF viewers, and if you want to use Preview.app take note of the code I commented out...there's a special little hack that you need to use which I've thrown in. Most viewers have the ability to automatically reload the PDF, though.

This script only supports OS X right now, but that's okay, since it'd be very very simple to port it to any other platform! The `open` command is OS X-specific, and to my knowledge its Linux counterparts are desktop environment dependent.


### Dependencies
Since OS X doesn't have inotify, I used the handy [listen gem](http://rubygems.org/gems/listen)

Be sure you're running at least Ruby 1.9 since 1.8 doesn't support some of the nifty things I used.

LaTeX is required, of course.

### License

<b>"THE BEER-WARE LICENSE" (Revision 42):</b>

[Eric Wood](http://ericwood.org) wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer in return.

#### Happy hacking!
