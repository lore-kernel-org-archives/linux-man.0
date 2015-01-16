From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch]
Date: Thu, 15 Jan 2015 22:42:07 -0500
Message-ID: <54B8888F.4050403@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Grammatical nit.

diff --git a/man3/getpwent_r.3 b/man3/getpwent_r.3
index ac84e3b..b7f6edc 100644
--- a/man3/getpwent_r.3
+++ b/man3/getpwent_r.3
@@ -119,7 +119,7 @@ Try again with larger buffer.
 These functions are GNU extensions, done in a style resembling
 the POSIX version of functions like
 .BR getpwnam_r (3).
-Other systems use prototype
+Other systems use the prototype
 .sp
 .nf
 .in +4n
---

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
