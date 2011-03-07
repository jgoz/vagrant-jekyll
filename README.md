vagrant-jekyll
==============

This is my Vagrant configuration for jekyll (and sass) projects. It contains the following chef cookbooks:

* vagrant_main (modified): install necessary gems for jekyll, etc.
* apt
* build-essential
* git (modified): add config.rb.template for setting up global git configuration
* tmux (modified): download & compile latest tmux sources, installing into /usr/local
