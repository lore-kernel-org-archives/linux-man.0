From: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] resolv.conf.5: add missing no-tld-query option
Date: Thu, 16 Oct 2014 12:49:13 +0200
Message-ID: <20141016104913.20972.85002.stgit@unused-4-157.brq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Based on commit [1], no-tld-query options exists for resolv.conf configuration file.
Description of this option is documented in [2]. This patch just copies this option
into resolv.conf.5 man page. Plus changes 'a' member into 'an' before 'unqualified name as if it ...'
on the third line of [2]. Based on [3], this option was added in glibc 2.14 as solving [4] bug.

[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=f87dfb1f11c01f2ccdc40d81e134cd06b32e28e8
[2] http://www.daemon-systems.org/man/resolv.conf.5.html man page.
[3] https://sourceware.org/git/?p=glibc.git;a=blob;f=NEWS;h=952f32af17e7fb49c4c1a305de673a13075bfaf5;hb=f87dfb1f11c01f2ccdc40d81e134cd06b32e28e8
[4] https://sourceware.org/bugzilla/show_bug.cgi?id=12734

Signed-off-by: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man5/resolv.conf.5 |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/man5/resolv.conf.5 b/man5/resolv.conf.5
index 3680a82..99ec91d 100644
--- a/man5/resolv.conf.5
+++ b/man5/resolv.conf.5
@@ -261,6 +261,17 @@ When that happens the client system will sit and wait for the second reply.
 Turning this option on changes this behavior
 so that if two requests from the same port are not handled correctly it will
 close the socket and open a new one before sending the second request.
+.TP
+.BR no-tld-query " (since glibc 2.14)"
+sets RES_NOTLDQUERY in
+.IR _res.options .
+This option causes
+.BR res_nsearch()
+to not attempt to resolve an unqualified name
+as if it were a top level domain (TLD).
+This option can cause problems if the site has ``localhost'' as a TLD
+rather than having localhost on one or more elements of the search list.
+This option has no effect if neither RES_DEFNAMES or RES_DNSRCH is set.
 .RE
 .LP
 The \fIdomain\fP and \fIsearch\fP keywords are mutually exclusive.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
