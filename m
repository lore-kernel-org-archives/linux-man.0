From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] resolv.conf.5: Describe single-request option
Date: Fri, 15 May 2009 19:17:13 +0200
Message-ID: <20090515171713.GG14609@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The single-request option was introduced with glibc-2.10.

Also, a note is added to resolver(3) that many of the options
are actually described in resolv.conf(5).

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

---

Ping, what about the other patches? ;-)

diff --git a/man3/resolver.3 b/man3/resolver.3
index eabc1a4..181468a 100644
--- a/man3/resolver.3
+++ b/man3/resolver.3
@@ -232,6 +232,9 @@ domain and in parent domains.
 This option is used by
 .BR gethostbyname (3).
 [Enabled by default].
+.PP
+This list is not complete. You can find some other flags described in
+.BR resolv.conf (5).
 .SH "RETURN VALUE"
 The
 .BR res_init ()
diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
index 4d67c75..2a2c694 100644
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
+version 2.9 (though many distribution packages of glibc are known
+to disable that behavior in this version). Some appliance DNS servers
+cannot handle these queries properly and make the requests time out.
+This option disables the behavior and makes glibc perform the IPv6
+and IPv4 requests sequentially (at the cost of some slowdown of the
+resolving process).
 .RE
 .LP
 The \fIdomain\fP and \fIsearch\fP keywords are mutually exclusive.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
