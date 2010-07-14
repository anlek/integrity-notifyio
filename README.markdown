Integrity
=========

[Integrity][] is your friendly automated Continuous Integration server.

Integrity Notify.io Notifier
=========================

This lets Integrity post notifications to Notify.io after each build is made.

Setup Instructions
==================

Just install this gem via `sudo gem install integrity-notifyio` and then in your
Rackup (ie, `config.ru`) file:

    require "rubygems"
    require "integrity/notifier/notifyio"

Now you can set up your projects to post notifications to your
Notify.io after each build (just edit the project and the config options 
should be there)

License
=======

(The MIT License)

Copyright (c) 2010 [Andrew Kalek][andrewkalek]

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[Integrity]: http://integrityapp.com
[andrewkalek]: http://github.com/anlek
