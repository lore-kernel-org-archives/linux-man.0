From: bugme-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 11011] New: utmpname(3) returns interger but man page says void
Date: Sun, 29 Jun 2008 23:55:53 -0700 (PDT)
Message-ID: <bug-11011-11311@http.bugzilla.kernel.org/>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=11011

           Summary: utmpname(3) returns interger but man page says void
           Product: Documentation
           Version: unspecified
     KernelVersion: 2.6.9-1.667
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: halesh.s-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


In the link 
http://www.gnu.org/software/libtool/manual/libc/Manipulating-the-Database.html

It has mentioned that 
"The utmpname function returns a value of 0 if the new name was successfully 
stored, and a value of -1 to indicate an error. Note that utmpname does not try 
to open the database, and that therefore the return value does not say anything 
about whether the database can be successfully opened."

But in man page it says it return void in its prototype.

  void utmpname(const char *file);

In source code I have verified it returns int.

int
__utmpname (const char *file)
{
....
....
}

This is conflicting one and man page of utmpnae(3) needs to be fixed.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
