From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 13510] New: resolv.conf.5 implies that only IPv4 addresses are
 allowed
Date: Thu, 11 Jun 2009 19:45:26 GMT
Message-ID: <bug-13510-11311@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=13510

           Summary: resolv.conf.5 implies that only IPv4 addresses are
                    allowed
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
        ReportedBy: danw-rDKQcyrBJuzYtjvyW6yDsg@public.gmane.org
        Regression: No


resolv.conf.5 says:

   nameserver Name server IP address
      Internet address (in dot notation) of a name server that the resolver
      should query.

Only IPv4 addresses have a "dot notation", so this suggests that IPv6 addresses
aren't allowed. But they are.

Given that the "sortlist" field is IPv4-only, it's probably best to actually be
explicit that nameserver supports either. So:

   nameserver Name server IP address
      IP address (IPv4 or IPv6) of a name server that the resolver
      should query.

-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
