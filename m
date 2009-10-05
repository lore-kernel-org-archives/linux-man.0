From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 14328] New: Consistent the size type. New logic to use.
Date: Mon, 5 Oct 2009 21:23:36 GMT
Message-ID: <bug-14328-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14328

           Summary: Consistent the size type. New logic to use.
           Product: Documentation
           Version: unspecified
    Kernel Version: 2.6.30.9
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: vik-cfgfcfnPGrx6k2ZkT/Rh8A@public.gmane.org
        Regression: No


It is possible to do consistent the sizeof(). Just the size type be unsigned.
Next is sample:

unsigned long *p,*p2,length;
p=some_value;
p2=p;
length=sizeof(type_or_lvalue);
p+=length;
if(p<p2)
  catch_overrun...
*p=some_value2;

However the error codes is negative so it is hard to accept big size. Are the
race of system calls and kernel subroutines is different?

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
