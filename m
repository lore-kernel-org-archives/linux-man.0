From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 52931] New: sigaction(2) feature test macros don't apply to
 siginfo_t
Date: Tue, 22 Jan 2013 22:16:28 +0000 (UTC)
Message-ID: <bug-52931-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=52931

           Summary: sigaction(2) feature test macros don't apply to
                    siginfo_t
           Product: Documentation
           Version: unspecified
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: ambrus-4iFmikrsyIeT9ig0jae3mg@public.gmane.org
        Regression: No


The sigaction(2) manpage correctly tells that defining the feature test macro
_POSIX_SOURCE is enough to have the headers declare the function sigaction. 
However, defining that feature test does not allow you to use all capabilities
of sigaction, namely it does not make the headers declare the type siginfo_t. 

The type siginfo_t is used only to declare a three-argument signal handler
function that you install with sigaction using the SA_SIGINFO flag.  This
feature is documented in the sigaction(2) manpage, just like it should be. 
However, to actually use this feature of sigaction, it's not enough to define
_POSIX_SOURCE.  To export this type, I believe it is sufficient to define
_POSIX_C_SOURCE to 201112L.  As of current standing, people will try to use
siginfo_t and get a compilation error because the glibc headers don't export it
with the feature test macro the manpage asks for.  This bug is difficult to
understand, so the feature test requirements should be mentioned on the
manpage.

I don't provide a patch because I don't know either the exact feature test
macro requirements, nor exactly what symbols other than siginfo_t are affected.

I am using man-pages version 3.45 vanilla, and glibc 2.11.3 debian.

Thank you, man-pages maintainers, for all the hard work you put in keeping the
pages up to date.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
