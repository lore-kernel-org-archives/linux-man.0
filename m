From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 43061] resolver.3 man page: RES_DEBUG option has effect only if
 libresolv compiled with DEBUG defined
Date: Tue,  5 Mar 2013 06:46:48 +0000 (UTC)
Message-ID: <20130305064648.2411911FB7E@bugzilla.kernel.org>
References: <bug-43061-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-43061-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=43061


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|                            |CODE_FIX




--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2013-03-05 06:46:47 ---
Thanks Nathan. I've applied the patch below.

Cheers,

Michael

diff --git a/man3/resolver.3 b/man3/resolver.3
index 991b263..f659325 100644
--- a/man3/resolver.3
+++ b/man3/resolver.3
@@ -27,7 +27,7 @@
 .\" Modified 1993-07-25 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified 2004-10-31 by aeb
 .\"
-.TH RESOLVER 3 2012-04-23 "GNU" "Linux Programmer's Manual"
+.TH RESOLVER 3 2013-03-05 "GNU" "Linux Programmer's Manual"
 .SH NAME
 res_init, res_query, res_search, res_querydomain, res_mkquery, res_send,
 dn_comp, dn_expand \- resolver routines
@@ -185,6 +185,10 @@ has been called.
 .TP
 .B RES_DEBUG
 Print debugging messages.
+This option is only available if glibc was built with debugging enabled,
+.\" See resolv/README.
+.\" Support for RES_DEBUG was made conditional in glibc 2.2.
+which is not the default.
 .TP
 .B RES_AAONLY
 Accept authoritative answers only.
diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
index 9a3ca54..1358b73 100644
--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -18,7 +18,7 @@
 .\"
 .\" Added ndots remark by Bernhard R. Link - debian bug #182886
 .\"
-.TH RESOLV.CONF 5 2012-11-11 "" "Linux Programmer's Manual"
+.TH RESOLV.CONF 5 2013-03-05 "" "Linux Programmer's Manual"
 .UC 4
 .SH NAME
 resolv.conf \- resolver configuration file
@@ -133,7 +133,9 @@ where \fIoption\fP is one of the following:
 sets
 .BR RES_DEBUG
 in
-.IR _res.options .
+.IR _res.options
+(only effective if glibc was built with debug support; see
+.BR resolver (3)).
 .TP
 .BI ndots: n
 .\" Since glibc 2.2

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
