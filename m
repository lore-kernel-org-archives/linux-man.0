From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 14303] New: futex(2) manpage missing FUTEX_WAKE_OP, *_PRIVATE,
 *_BITSET and *_PI options
Date: Fri, 2 Oct 2009 01:48:40 GMT
Message-ID: <bug-14303-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=14303

           Summary: futex(2) manpage missing FUTEX_WAKE_OP, *_PRIVATE,
                    *_BITSET and *_PI options
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
        ReportedBy: anton-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org
        Regression: No


There are a number of futex features that aren't documented:

FUTEX_WAKE_OP:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=4732efbeb997189d9f9b04708dc26bf8613ed721

*_PRIVATE:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=34f01cc1f512fa783302982776895c73714ebbc2

*_BITSET:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=cd689985cf49f6ff5c8eddc48d98b9d581d9475d

*_PI:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=c87e2837be82df479a6bae9f155c43516d2feebc

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
