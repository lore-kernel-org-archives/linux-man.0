From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 52741] getnameinfo man page has inappropriate text copied from
 getaddrinfo
Date: Tue, 15 Jan 2013 19:46:01 +0000 (UTC)
Message-ID: <20130115194601.9BFD311FB6C@bugzilla.kernel.org>
References: <bug-52741-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-52741-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=52741


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|                            |CODE_FIX




--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2013-01-15 19:46:01 ---
Thkanks for the report Peter.

So, it seems here were a confused references in both getnameinfo() and
getaddrinfo(). I applied the following patch.

--- a/man3/getaddrinfo.3
+++ b/man3/getaddrinfo.3
@@ -91,7 +91,7 @@ function combines the functionality provided by the
 .\" .BR getipnodebyaddr (3),
 .BR getservbyname (3)
 and
-.BR getservbyport (3)
+.BR getservbyname (3)
 functions into a single interface, but unlike the latter functions,
 .BR getaddrinfo ()
 is reentrant and allows programs to eliminate IPv4-versus-IPv6 dependencies.
diff --git a/man3/getnameinfo.3 b/man3/getnameinfo.3
index f1001cd..5bafd76 100644
--- a/man3/getnameinfo.3
+++ b/man3/getnameinfo.3
@@ -38,7 +38,7 @@ It combines the functionality of
 and
 .BR getservbyport (3),
 but unlike those functions,
-.BR getaddrinfo (3)
+.BR getnameinfo (3)
 is reentrant and allows programs to eliminate
 IPv4-versus-IPv6 dependencies.

@@ -111,7 +111,7 @@ cannot be determined.)
 If set, then the numeric form of the service address is returned.
 (When not set, this will still happen in case the service's name
 cannot be determined.)
-.SS "Extensions to getaddrinfo() for Internationalized Domain Names"
+.SS "Extensions to getnameinfo() for Internationalized Domain Names"
 .PP
 Starting with glibc 2.3.4,
 .BR getnameinfo ()

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
