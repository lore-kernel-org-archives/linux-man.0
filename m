From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 15446] New: sysctl(2) can return EACCES without sufficient
 permissions
Date: Fri, 5 Mar 2010 07:37:38 GMT
Message-ID: <bug-15446-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=15446

               URL: http://sourceforge.net/mailarchive/forum.php?thread_na
                    me=364299f41003042320n7437e4a2j219b32a0a5f8dc50%40mail
                    .gmail.com&forum_name=ltp-list
           Summary: sysctl(2) can return EACCES without sufficient
                    permissions
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
        ReportedBy: yaneurabeya-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        Regression: No


After a semi-lengthy discussion, it turns out that EACCES can and would be set
in cases where a sysctl(2) isn't available [in the old model, pending a bug in
test_perm] or the file isn't accessible [in the new model].

This currently isn't documented as such in the manpage.

It would probably be prudent to add the following to the manpage:

    EACCES The requested access to the sysctl is not allowed.

More testing will need to be performed to ensure that other unexpected errors
don't pop up with sysctl(2), if possible time-wise.

Credit goes to Shi Weihua for finding the documentation bug, and Eric W.
Biederman for noting the bug in the original sysctl(2) implementation.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
