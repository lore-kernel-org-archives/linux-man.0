From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 60744] New: waitid man page does not document the 5th argument
 "struct rusage*"
Date: Wed, 14 Aug 2013 16:15:51 +0000
Message-ID: <bug-60744-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60744

            Bug ID: 60744
           Summary: waitid man page does not document the 5th argument
                    "struct rusage*"
           Product: Documentation
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
          Assignee: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
          Reporter: hannes-AXwPPc4i43WoxJ3sLSulrA@public.gmane.org
        Regression: No

I just spent 5 hours debugging my program and trying to figure out why the
kernel overwrote my stack. I had to read the source code to realize that the
real syscall took an additional 5th argument.

Wrong signature:
int waitid(idtype_t idtype, id_t id, siginfo_t *infop, int options);

Correct signature:
int waitid(idtype_t idtype, id_t id, siginfo_t *infop, int options, struct
rusage* rusage);

The kernel man pages should not assume that the user is using glibc, or at
least give enough information for developers to write their own, correct
wrappers.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
