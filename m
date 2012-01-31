From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 42705] New: ioctl prototype is incorrect
Date: Tue, 31 Jan 2012 18:17:19 GMT
Message-ID: <bug-42705-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42705

           Summary: ioctl prototype is incorrect
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
        ReportedBy: kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org
        Regression: No


Now, the ioctl man page (*) says ioctl declaration is

    int ioctl(int d, int request, ...);

(*) http://www.kernel.org/doc/man-pages/online/pages/man2/ioctl.2.html


But, actual glibc implementtion has a different type.

/usr/include/sys/ioctl.h:
  extern int ioctl (int __fd, unsigned long int __request, ...) __THROW;


Look, __request parameter actually has unsigned long type. it's not int.
It would be better if the man respect an implemtation.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
