#!/bin/sh -e
echo "Attempting startup..."
${EMACS:=emacs} -nw --debug-init \
		--load "./init.el"
echo "Startup successful"
