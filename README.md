# noloop-refuge

My day-to-day refuge...([void-linux](https://voidlinux.org/), [emacs](https://www.gnu.org/software/emacs/), [next browser](https://github.com/atlas-engineer/next) configuration + other things).

![noloop emacs configuration screen](./images/noloop-emacs-configuration.png)

I use this with [rxvt-unicode](https://github.com/exg/rxvt-unicode).

## Dependencies

* EMACS >= 26
* sbcl
* hunspell
* nodejs and vmd package (for vmd-mode)
* dart-sdk
* flutter
* the_silver_searcher (for ag)
* next (Browser)
* xclip

## Installation 

Clone this repository for the directory "~/.emacs.d/" and create the file 
"init.el" with the lines below:

``` lisp
(add-to-list 'load-path "~/noloop-refuge/emacs.d/")
(require 'noloop)
```
and change the content of the Next configuration file in "~/.config/next/init.lisp":

``` lisp
(in-package :next)

(load "~/noloop-refuge/next.d/init.lisp")
```

Configure in the `.bashrc` file:

```bash
alias next='export $(dbus-launch); firejail --ignore=nodbus next'
# export dbus-launch in emacs for next development
alias emacs='export $(dbus-launch); emacs' 
```
Configuring ASDF to find your systems:

Create the file 
`~/.config/common-lisp/source-registry.conf.d/50-noloop-lisp-dev.conf` 
for the ASDF also find in the **/home/noloop/lisp-dev/** directory containing the line below:

``` lisp
(:tree "/home/noloop/lisp-dev/")
```

