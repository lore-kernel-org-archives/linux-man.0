From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 90261] New: The BUGS section of the getopt(3) man page
 describes something that's no longer a bug
Date: Wed, 24 Dec 2014 02:10:49 +0000
Message-ID: <bug-90261-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=90261

            Bug ID: 90261
           Summary: The BUGS section of the getopt(3) man page describes
                    something that's no longer a bug
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: guy-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org
        Regression: No

The BUGS section of the getopt(3) man page says:

       The POSIX.2 specification of getopt() has a technical error described
       in POSIX.2 Interpretation 150.  The GNU implementation (and probably
       all other implementations) implements the correct behavior rather
       than that specified.

The interpretation in question is at

   
https://collaboration.opengroup.org/external/pasc.org/interpretations/unofficial/db/p1003.2/pasc-1003.2-150.html

The request for the interpretation said

    To match historic and expected practice, the "not less than argc" on
POSIX.2, P733, L504-505 would need to be changed to "greater than argc".

and the resolution of that interpretation is

    In particular the interpretations committee do not believe that this
change from historical practice was intended.
    The interpretations committee beleive that on page 733, line 504,
the words 'not less than' should be changed to 'greater than'.   

and the Single UNIX Specification, Version 4, entry for getopt(), at

    http://pubs.opengroup.org/onlinepubs/9699919799/functions/getopt.html

says

    If the option was the last character in the string pointed to by an element
of argv, then optarg shall contain the next element of argv, and optind shall
be incremented by 2. If the resulting value of optind is greater than argc,
this indicates a missing option-argument, and getopt() shall return an error
indication.

so it appears that the *current* version of POSIX - i.e., the Single UNIX
Specification - has been changed in the fashion requested.

The BUGS section should probably note this, so that nobody thinks that GNU
libc's getopt() behaves in a non-standard fashion in that respect.  (The bug
was 100% in the POSIX.2 edition, not in the code.)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
