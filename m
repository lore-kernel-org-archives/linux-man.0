From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 53671] New: [PATCH] Mention initgroups db in the
 nsswitch.conf(5) man page
Date: Mon, 11 Feb 2013 18:12:46 +0000 (UTC)
Message-ID: <bug-53671-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=53671

           Summary: [PATCH] Mention initgroups db in the nsswitch.conf(5)
                    man page
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
        ReportedBy: pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
        Regression: No


Created an attachment (id=93141)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=93141)
man-pages-nsswitch-conf.patch

Attached patch mentions initgroups db, which was added to the glibc in commit
[1] and describes unexpected behaviour for group database with notfound status
and return action, based on comment on line 135 in initgroups.c file [2]. More
detailed explanation of this behaviour can be found in email [4] of email
thread [3].


[1]
http://sourceware.org/git/?p=glibc.git;a=commit;h=9f2da732e7b03825027462dd1c46f8b4d18fc1f5
[2]
http://sourceware.org/git/?p=glibc.git;a=blob;f=grp/initgroups.c;h=62fd1fc6de5f9ea08f31134c5ab9a36ae2d5af9e;hb=HEAD
[3] http://thread.gmane.org/gmane.linux.man/2609
[4] http://article.gmane.org/gmane.linux.man/2620

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
