From: bugme-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 10197] New: maybe one of the two flags has a mistyping description
Date: Fri,  7 Mar 2008 18:35:30 -0800 (PST)
Message-ID: <bug-10197-11311@http.bugzilla.kernel.org/>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=10197

           Summary: maybe one of the two flags has a mistyping description
           Product: Documentation
           Version: unspecified
     KernelVersion: 2.6.x
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: antonio_macchi-1Ph4/jfBtgs@public.gmane.org


Well, it's a very little thing

in the header file /usr/include/asm-i486/cpufeature.h

(...)
#define X86_FEATURE_MCE         (0*32+ 7) /* Machine Check Architecture */
(...)
#define X86_FEATURE_MCA         (0*32+14) /* Machine Check Architecture */
(...)


two flags for the same behavior?
maybe the first one is Machine Check *Exception*


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
