From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 16461] New: Socket option SO_MARK undocumented.
Date: Sun, 25 Jul 2010 15:06:23 GMT
Message-ID: <bug-16461-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16461

           Summary: Socket option SO_MARK undocumented.
           Product: Documentation
           Version: unspecified
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: enhancement
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: textshell-tSIEzQ-y2m5y9CR1fEVXu3bBpv2yHL8HoS0Hn3T@public.gmane.org
        Regression: No


hi,

commit 4a19ec5800fc3bb64e2d87c4d9fdd9e636086fe0 in Jan 2008 added the new
SO_MARK socket option.

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=4a19ec5800fc3bb64e2d87c4d9fdd9e636086fe0

A possible text for this option could maybe be (from the above commit message)

SO_MARK
   Set the mark for each packets this socket sends (similar to the netfilter
MARK target but socket based). Changing the mark can be used for mark based
routing without netfilter or for packet filtering. Setting this option is only
allowed for processes with the CAP_NET_ADMIN capability.
--

I'm not sure if the sentence about CAP_NET_ADMIN is right for the manpage.
Similar options seem to mention effective uid=0 also. The code only checks for
the CAP_NET_ADMIN, but some other layer might set that when gaining uid 0.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
