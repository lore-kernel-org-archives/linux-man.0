From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 52341] New: erroneous example in "rename" man page
Date: Fri,  4 Jan 2013 22:33:37 +0000 (UTC)
Message-ID: <bug-52341-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=52341

           Summary: erroneous example in "rename" man page
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
        ReportedBy: slave2bob-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        Regression: No


util-linux-2.22.2/misc-utils/rename.1 includes the text:

.SH EXAMPLES
Given the files
.IR foo1 ", ..., " foo9 ", " foo10 ", ..., " foo278 ,
the commands
.RS
.PP
.nf
rename foo foo0 foo?
rename foo foo0 foo??
.fi
.PP
.RE
will turn them into
.IR foo001 ", ..., " foo009 ", " foo010 ", ..., " foo278 .

     This is not what those two commands will actually do.  To produce
the described result, the first command, instead of:

rename foo foo0 foo?

should be:

rename foo foo00 foo?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
