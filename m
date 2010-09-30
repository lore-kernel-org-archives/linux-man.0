From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 19382] New: oom_adj and oom_score are undocumented
Date: Thu, 30 Sep 2010 18:34:21 GMT
Message-ID: <bug-19382-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19382

           Summary: oom_adj and oom_score are undocumented
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
        ReportedBy: landijk-user-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        Regression: No


There does not appear to be any kernel documentation on oom_adj and oom_score,
which may be set for individual processes to tune the OOM killer.  I am not a
kernel developer, but below is my suggestion for possible content.  It is based
on (but not copied from) Red Hat's documentation at
http://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5/html/Deployment_Guide/s2-proc-pid.html.

--

Each process in the /proc tree has two nodes called "oom_adj" and "oom_score." 
These are related to the operation of the "OOM killer," which is the kernel's
tool for resolving situations in which memory has been overcommitted.  For more
information about memory overcommitment, see the kernel documentation files
vm/overcommit-accounting and sysctl/vm.txt.

The oom_score node contains a read-only value indicating the priority
associated with the process should an overcommitted situation arise.  Lower
priority means the process is less likely to be killed, and the lowest possible
score is 0.

The oom_adj node is read-write, and its value is used in the computation of the
oom_score.  Specifically, it is a value in the range -17 to +15, and it is
interpreted as a bit shift in the last step of computing the oom_score. 
Negative values reduce the score, and positive values increase the score.  The
value -17 is treated specially; it always reduces the oom_score to 0.

--

I am not sure where the documentation should go.  Perhaps the OOM killer should
have its own page to treat the above topics, as well as the badness() function.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
