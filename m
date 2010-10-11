From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 20102] New: malloc(3) should document MALLOC_PERTURB_ env
 option
Date: Mon, 11 Oct 2010 19:00:15 GMT
Message-ID: <bug-20102-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=20102

           Summary: malloc(3) should document MALLOC_PERTURB_ env option
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
        ReportedBy: vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org
        Regression: No


setting MALLOC_PERTURB_ in the env will take that number and initialize all
malloc's with that value (and the inverse when freeing).  this should be
documented in malloc(3) (and noted in free(3)).

e.g. if you set MALLOC_PERTURB_=123, glibc will do memset((123 ^ 0xff) & 0xff)
when doing malloc(), and then glibc will do memset(123 & 0xff) when doing
free()

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
