From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 25322] New: [PATCH] tcp syn cookies will not eat your server
 anymore
Date: Mon, 20 Dec 2010 18:01:10 GMT
Message-ID: <bug-25322-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=25322

           Summary: [PATCH] tcp syn cookies will not eat your server
                    anymore
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
        ReportedBy: nico-JSaSgPfTjtHYtjvyW6yDsg@public.gmane.org
        Regression: No


Hello


Based on a discussion on net-dev
(http://article.gmane.org/gmane.linux.network.general/14344),
TCP syncookies seem to not be disastrous for performance anymore. Theses
improvements happened in 2.6.36, 2.6.33 and 2.6.26.

More info in theses commits:

  - 4dfc28170 Add support for TCP options via timestamps.
  - c6aefafb7 Add IPv6 support to TCP SYN cookies
  - 172d69e63 syncookies: add support for ECN

What would you think about the following patch about the tcp_syn_cookie entry?

diff --git a/man7/tcp.7 b/man7/tcp.7
index 3903c9d..e42bdef 100644
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -677,11 +677,10 @@ The kernel must be compiled with
 Send out syncookies when the syn backlog queue of a socket overflows.
 The syncookies feature attempts to protect a
 socket from a SYN flood attack.
-This should be used as a last resort, if at all.
-This is a violation of the TCP protocol,
-and conflicts with other areas of TCP such as TCP extensions.
-It can cause problems for clients and relays.
-It is not recommended as a tuning mechanism for heavily
+Until 2.6.36, it was violating TCP and has to be used as a last
+resort, if at all. Since 2.6.36, TCP extensions are preserved and the
+impact on performance is minimal.
+It is still not recommended as a tuning mechanism for heavily
 loaded servers to help with overloaded or misconfigured conditions.
 For recommended alternatives see
 .IR tcp_max_syn_backlog ,



By the way, there is no information about tcp_cookie_size, the TCP Cookie
Transaction sysctl (this new TCP extension was introduced in 2.6.33), do you
want a patch?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
