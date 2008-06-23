From: bugme-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 10967] New: include/asm-i386 removed but not documented
Date: Mon, 23 Jun 2008 09:52:42 -0700 (PDT)
Message-ID: <bug-10967-11311@http.bugzilla.kernel.org/>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=10967

           Summary: include/asm-i386 removed but not documented
           Product: Documentation
           Version: unspecified
     KernelVersion: 2.6.24+
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: osgnuru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


Latest working kernel version:2.6.25.8
Earliest failing kernel version:2.6.24
Distribution:N/A
Hardware Environment:i386
Software Environment:N/A
Problem Description:Between kernel 2.6.23.17 and 2.6.24 the include/asm-i386
directory was removed and there is no mention of it in the change log or the
documentation. A new directory include/asm-x86 was added, one might assume this
to be the replacement but still this also is not documented. There are still
many source files that include headers from asm-i386 and also third party
software that will try to include /usr/include/asm-i386 will now be broken for
anyone trying to compile a kernel on a 32 bit CPU.

Documentation should include recommendations for changes needed to compile on a
Linux system that has this alteration.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
