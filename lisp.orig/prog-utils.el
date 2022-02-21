;;;
;;; Programming convienience functions
;;;
;;;

( defconst c++-revision-cntrl-flag t
  "*t to indicate c++-build-file-header should put
revision control information into the file header.")

( defconst perl-revision-cntrl-flag t
  "*t to indicate perl-build-file-header should put
revision control information into the file header")

( defconst prog-utils-revision-cntrl-comment-string
  "$Id$"
  "*String to be embedded in file header comment")

( defconst prog-utils-revision-cntrl-log-comment-string
  "$Log$"
  "*String to be embedded in file header comment")

( defconst c++-revision-cntrl-string
  "static char rcsid[]=\"$Id$\";"
  "*String to be embed a static char array for what(1) command")

( defun c++-build-file-header ()
  "Creates header for C++ files."
  ( interactive )
  ( save-excursion
    ( if ( not ( or ( string-equal mode-name "C"  )
		    ( string-equal mode-name "C++" )))
	( error "Build file header - incorrect mode")
      ( string-match ".*/" buffer-file-name )
      ( let* (( base-file-name ( substring buffer-file-name (match-end 0)))
	      ( base-file-ext 
		(substring 
		 base-file-name ( + 1 ( string-match "\\.[^.]+"
						   base-file-name))))
	      ( base-file-root 
		(substring  base-file-name 0
			    (string-match "\\.[^.]*$" base-file-name )))
	      ( include-file-symbol
		( upcase ( concat base-file-root "_" base-file-ext ))))
	( goto-line 1 )
;	( if ( string-equal mode-name "C++")
;	    (c++-insert-header))
	( goto-line 2 )
	( if ( not c++-revision-cntrl-flag )
	    ( insert
	      ( format 
		"/*\n\tFile: %s\n\tCreated %s by %s\n\tDescription:\n*/\n\n"
		base-file-name
		(current-time-string)
		(user-full-name)))
	  ( insert
	    ( format
	      "\n/*\n\t%s\n\tCreated %s by %s\n\tDescription:\n\n\t%s\n*/\n\n"
	      prog-utils-revision-cntrl-comment-string
	      (current-time-string)
	      (user-full-name)
	      prog-utils-revision-cntrl-log-comment-string))
	  ( if ( or ( string-equal base-file-ext "cc")
		    ( string-equal base-file-ext "c")
		    ( string-equal base-file-ext "c")
		    ( string-equal base-file-ext "cxx"))
	      (insert ( format "%s\n\n" c++-revision-cntrl-string)))
	  ( if ( or ( string-equal base-file-ext "h")
		    ( string-equal base-file-ext "hh")
		    ( string-equal base-file-ext "hxx"))
	      (insert ( format
			"#ifndef\t%s\n#define\t%s\n\n#endif\t/* %s */\n"
			include-file-symbol
			include-file-symbol
			include-file-symbol))))))))

( defun perl-build-file-header ()
  "Creates header for perl files."
  ( interactive )
  ( save-excursion
    ( string-match ".*/" buffer-file-name )
    ( let* (( base-file-name ( substring buffer-file-name (match-end 0))))
      ( if ( not ( or (string-equal mode-name "CPerl") (string-equal mode-name "Perl")))
	  ( CPerl-mode ))
      ( goto-line 1 )
      ( if ( not perl-revision-cntrl-flag )
	  ( insert
	    ( format 
	      "#! /usr/local/bin/perl\n#  File: %s\n#  Created %s by %s\n#  Description:\n#\n#\n"
	      base-file-name
	      (current-time-string)
	      (user-full-name)))
	( insert
	  ( format 
	    "#! /usr/local/bin/perl\n#  %s\n#  Created %s by %s\n#  Description:\n#\n\n"
	    prog-utils-revision-cntrl-comment-string
	    (current-time-string)
	    (user-full-name)))))))
