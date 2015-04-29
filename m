From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] gethostbyname.3: NSS plugins searched first.
Date: Wed, 29 Apr 2015 13:24:51 -0400
Message-ID: <554113E3.4040105@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The gethostbyname man page should first and foremost list that
the source of the data comes from the NSS plugins. I accept
that the man page is intentionally trying to be vague because
these things are not guaranteed anywhere, the truth is far
more mundane and "default" here IMO applies to a normal glibc
installation on Linux, and the fallback is always a localhost
nameserver.

I suggest the following changes, but feel free to reword as
you see fit.

Patch against master.

Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

diff --git a/man3/gethostbyname.3 b/man3/gethostbyname.3
index 7875f88..59c7bb1 100644
--- a/man3/gethostbyname.3
+++ b/man3/gethostbyname.3
@@ -224,18 +224,20 @@ The domain name queries carried out by
 .BR gethostbyname ()
 and
 .BR gethostbyaddr ()
-use a combination of any or all of the name server
+use a combination of any or all of Name Service Switch
+.BR nsswitch.conf(5)
+configured sources, name servers in \fI/etc/resolv.conf\fP
+.BR resolv.conf(5),
+a local name server
 .BR named (8),
 a broken out line from \fI/etc/hosts\fP, and the Network
 Information Service (NIS or YP), depending upon the contents of the
 \fIorder\fP line in
 .IR /etc/host.conf .
-.\" (See
-.\" .BR resolv+ (8)).
-The default action is to query
-.BR named (8),
-followed by
-.IR /etc/hosts .
+The default action is to query the Name Service Switch
+.BR nsswitch.conf(5)
+configured sources, followed by a local name server
+.BR named (8).
 .PP
 The \fIhostent\fP structure is defined in \fI<netdb.h>\fP as follows:
 .sp
---

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
