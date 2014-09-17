From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 84701] New: execve(2) manual page ".sh" usage exposes
 implementation detail
Date: Wed, 17 Sep 2014 00:15:55 +0000
Message-ID: <bug-84701-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=84701

            Bug ID: 84701
           Summary: execve(2) manual page ".sh" usage exposes
                    implementation detail
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: erlkonig-kJfcqb9dmRFg9hUCZPvPmw@public.gmane.org
        Regression: No

This content:

       We can also use these programs to  demonstrate  the  use  of  a  script
       interpreter.   To do this we create a script whose "interpreter" is our
       myecho program:

           $ cat > script.sh
           #! ./myecho script-arg
           ^D
           $ chmod +x script.sh

       We can then use our program to exec the script:

           $ ./execve ./script.sh
           argv[0]: ./myecho
           argv[1]: script-arg
           argv[2]: ./script.sh
           argv[3]: hello
           argv[4]: world

Should probably instead read:

       We can also use these programs to  demonstrate  the  use  of  a  script
       interpreter.   To do this we create a script whose "interpreter" is our
       myecho program:

           $ cat > script
           #!./myecho script-arg
           ^D
           $ chmod +x script

       We can then use our program to exec the script:

           $ ./execve ./script
           argv[0]: ./myecho
           argv[1]: script-arg
           argv[2]: ./script
           argv[3]: hello
           argv[4]: world

Rationale:

1) Command name extensions considered harmful: Adding ".sh", or any other
unneeded extension, unnecessarily duplicates meta information already present
in the interpreter directive, exposing an implementation detail that then ends
up explicitly part of other programs running this one.  Later, when such a
script is replaced with a new version in Python, C, etc., the useless ".sh" has
to be retained to avoid breaking those other programs' calls to this one, and
now has a stark antifunction of lying about the script's content and
occasionally causing admins to run undefined experiments as root (like "bash 
-x ./reallyperlscript.sh"). Such extensions, while fine in DOS which ignores
extensions explicitly, is a serious flaw in Unix-targeted script writing. 
Canonical documentation from the Linux manual should not support such a flawed
idiom - recommending against it would be preferred.

A more extensive rant against them can be found at:
http://www.talisman.org/~erlkonig/documents/commandname-extensions-considered-harmful

2) The space after "#!" in the interpreter directive is minor - and the
kernel's fs/binfmt_script.c specifically allows for it -  but versions of unix
have length limits from ~30 characters to linux's 127 or so (if that number's
correct) so the space does have a cost.  Most scripts I've seen lack that
space, and there's no real reason to encourage it.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
