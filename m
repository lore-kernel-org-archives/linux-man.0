From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] ttyname.3: document ENODEV error code
Date: Mon, 20 Mar 2017 23:51:04 +0300
Message-ID: <20170320205104.GA27434@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Christian Brauner <christian.brauner-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man3/ttyname.3 | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/man3/ttyname.3 b/man3/ttyname.3
index 14c24e7..0be50c6 100644
--- a/man3/ttyname.3
+++ b/man3/ttyname.3
@@ -71,6 +71,11 @@ File descriptor does not refer to a terminal device.
 .RB ( ttyname_r ())
 .I buflen
 was too small to allow storing the pathname.
+.TP
+.\" glibc commit 15e9a4f378c8607c2ae1aa465436af4321db0e23
+.B ENODEV
+File descriptor refers to a slave pseudoterminal device
+but the corresponding pathname could not be found.
 .SH ATTRIBUTES
 For an explanation of the terms used in this section, see
 .BR attributes (7).
@@ -92,4 +97,5 @@ POSIX.1-2001, POSIX.1-2008, 4.2BSD.
 .BR tty (1),
 .BR fstat (2),
 .BR ctermid (3),
-.BR isatty (3)
+.BR isatty (3),
+.BR pts (4)

-- 
ldv
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
