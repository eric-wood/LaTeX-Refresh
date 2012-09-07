#!/usr/bin/env ruby

#==========================================================================
# refresh_latex.rb
#   Hastily thrown together by Eric Wood (http://ericwood.org)
#==========================================================================
# Automagically re-render LaTeX files and open the result in a PDF reader.
# Using Skim we can do all of this without losing focus to the editor,
# although I provide code to somewhat accomplish this with Preview.app
#
# As of right now it only works in OS X since it uses the "open" command.
# Feel free to port it to any platform you want to
#
# NOTE: requires the "listen" ruby gem
# Install it with the following command:
# gem install listen
#
# See README.md for more information on installation
#==========================================================================

require 'listen'

if ARGV.size == 0
  puts "You didn't tell me the LaTeX document you wanted to render!"
  exit 0
end

# Path to the PDF viewer you want to use!
pdf_viewer = File.join(Dir.home, 'Applications/Skim.app')

# Input argument is the path to the tex file
filename = File.absolute_path(ARGV[0])

# Name without extension
name = File.basename(filename).chomp(File.extname(filename))

output_dir = File.dirname(filename)
output_file = File.join(output_dir, "#{name}.pdf")

# These temp thingies are for if there was that option to throw
# the auxillary files there or whatever. Meh.
temp_dir = '/tmp/latex_refresh'

# Create temp directory if it doesn't already exist
Dir.mkdir(temp_dir) unless File.exists?(temp_dir)

# Set output directory and place aux files in /tmp
options = [
  #"-aux-directory=#{temp_dir}", # This doesn't work for some reason :(
  "-output-directory=#{output_dir}"
]

# The rest of the arguments are options that can be passed into pdflatex
options += ARGV[1..-1] if ARGV.size > 1

def render(filename, options)
  #`pdflatex '#{filename}' #{options.join(' ')} 2>&1 /dev/null`
  `pdflatex '#{filename}' #{options.join(' ')}`
end

def open(output_file, pdf_viewer)
  # If you want to open it with Skim.app us this line
  # Redirect output to /dev/null since Skim.app complains a lot even if it's working
  `open -g -a '#{pdf_viewer}' '#{output_file}' 2>&1 /dev/null`

  # Preview.app only refreshes the PDF when we give it focus,
  # so we'll use this hack to give it focus and return focus back
  # to the application that was open before.
  # If you want to use a different viewer you can get rid of all this...
  #
  ## Get the currently focused application
  #app = `osascript -e 'POSIX path of (path to application (name of (info for (path to frontmost application))))'`.strip
  #
  ## Open the PDF
  #`open '#{output_file}'`
  #
  ## Restore focus to the original app
  #`osascript -e 'tell application "#{app}" to activate'`
end

# Render and open the pdf for the first time
render(filename, options)
open(output_file, pdf_viewer)

# Listen for changes to the tex file
Listen.to(File.dirname(filename), :filter => /\.tex$/) do |modified, added, removed|
  # According to Matt this has to happen at least 2 times. Whatever.
  render(filename, options)
end

