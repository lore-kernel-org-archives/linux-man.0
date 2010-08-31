From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 17541] New: man7/*.7: off-by-one errors in some encoding tables
Date: Tue, 31 Aug 2010 07:07:02 GMT
Message-ID: <bug-17541-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=17541

           Summary: man7/*.7: off-by-one errors in some encoding tables
           Product: Documentation
           Version: unspecified
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


Created an attachment (id=28591)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=28591)
Patch to fix decimal values in encoding tables

Octal and hexadecimal values are right, but there are some off-by one
errors in decimal values, e.g. several files contain lines
  oct  dec  hex  description
  377  254  ff   RIGHT SINGLE QUOTATION MARK
instead of
  377  255  ff   RIGHT SINGLE QUOTATION MARK

Correct values are printed by this command:

  perl -pi -e 'if (s/^([0-7]+)\t([0-9]+)\t([0-9a-fA-F]+)//)
    {printf "%03o\t%d\t%s", hex($3), hex($3), $3;};' man7/*.7

A patch is attached, this is the same file I already sent to the linux-man
mailing list 
  http://www.spinics.net/lists/linux-man/msg01197.html

It would also be better IMHO to recode all these pages into UTF-8.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
