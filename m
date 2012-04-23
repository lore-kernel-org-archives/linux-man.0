From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 38542] single-request-reopen option needs to be documented in
 resolv.conf
Date: Mon, 23 Apr 2012 12:15:36 GMT
Message-ID: <201204231215.q3NCFaLF017338@bugzilla.kernel.org>
References: <bug-38542-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-38542-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=38542


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|                            |CODE_FIX




--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2012-04-23 12:15:36 ---
Patch from Petr Baudis applied for man-pages-3.40:

--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -231,6 +231,19 @@ sets
 in
 .IR _res.options .
 This enables support for the DNS extensions described in RFC\ 2671.
+.TP
+.BR single-request " (since glibc 2.10)"
+sets
+.BR RES_SNGLKUP
+in
+.IR _res.options .
+By default, glibc performs IPv4 and IPv6 lookups in parallel since
+version 2.9.
+Some appliance DNS servers
+cannot handle these queries properly and make the requests time out.
+This option disables the behavior and makes glibc perform the IPv6
+and IPv4 requests sequentially (at the cost of some slowdown of the
+resolving process).
 .RE
 .LP
 The \fIdomain\fP and \fIsearch\fP keywords are mutually exclusive.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
