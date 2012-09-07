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

<p align="center">
  <img src="https://raw.github.com/eric-wood/LaTeX-Refresh/master/screenshot.png">
</p>
<p align="center"><i>A typical workflow using LaTeX-Refresh</i></p>

### Notes
Right now it's wired up to support [Skim.app](http://skim-app.sourceforge.net/) - in order for you to get it to work you'll need to modify the `pdf_viewer` variable defined at the top of the file.

It's easy to make it work with other PDF viewers, and if you want to use Preview.app take note of the code I commented out...there's a special little hack that you need to use which I've thrown in. Most viewers have the ability to automatically reload the PDF, though.

This script only supports OS X right now, but that's okay, since it'd be very very simple to port it to any other platform! The `open` command is OS X-specific, and to my knowledge its Linux counterparts are desktop environment dependent.


### Dependencies
Since OS X doesn't have inotify, I used the handy [listen gem](http://rubygems.org/gems/listen)

Be sure you're running at least Ruby 1.9 since 1.8 doesn't support some of the nifty things I used.

LaTeX is required, of course.

### License

```
Copyright (c) 2012, Eric Wood
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the author nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL ERIC WOOD BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

#### Happy hacking!
