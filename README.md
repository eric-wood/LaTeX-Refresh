LaTeX-Refresh
=============

Monitor modifications to a LaTeX file and re-render - real-time view of your changes!

### Usage
Just put ```refresh_latex.rb``` somewhere in your path and pass it the LaTeX file you'd like to use. That's it!

### Notes
Right now it's wired up to support (Skim.app)[http://skim-app.sourceforge.net/] - in order for you to get it to work you'll need to modify the ```pdf_viewer``` variable defined at the top of the file.

It's easy to make it work with other PDF viewers, and if you want to use Preview.app take note of the code I commented out...there's a special little hack that you need to use which I've thrown in. Most viewers have the ability to automatically reload the PDF, though.

This script only supports OS X right now, but that's okay, since it'd be very very simple to port it to any other platform! The ```open``` command is OS X-specific, and to my knowledge its Linux counterparts are desktop environment dependent.


### Dependencies
Since OS X doesn't have inotify, I used the handy (listen gem)[http://rubygems.org/gems/listen]

### License
Do as you please, but don't be a dick about it! I'd love to hear everyone's thoughts and will gladly accept pull requests :)

Happy hacking!
