From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 84901] New: drand48() unduely declared obsolete
Date: Sun, 21 Sep 2014 11:12:45 +0000
Message-ID: <bug-84901-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=84901

            Bug ID: 84901
           Summary: drand48() unduely declared obsolete
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org
        Regression: No

The drand48() manual page ends with a note:

"These functions are declared obsolete by SVID 3, which states that rand(3)
should be used instead."

The unsuspecting reader will see this, and think that these are obsolete
functions he shouldn't use. But he most likely not know that "SVID 3" referred
here is actually a document written 25 years ago, in 1989 (!), for SVr4. He
will not know that Posix that came more than 10 years later did not call this
function obsolete, and that till this day, it is not considered obsolete by
Posix (see
http://pubs.opengroup.org/onlinepubs/9699919799/functions/drand48.html).

So I think this statement about SVID 3 should be dropped. Or, if for some
reason you want to keep it, at least add a clarification that this was in 1989
and standards that followed it do not consider these functions obsolete.

Thanks!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
