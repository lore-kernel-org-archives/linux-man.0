From: shawn <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] prctl.2, proc.5: document arm alignment trap via
 /proc/apu/alignment
Date: Sat, 04 Aug 2012 14:41:03 -0700
Message-ID: <1344116463.24952.235.camel@shawn-ssd>
References: <1344113204-4294-1-git-send-email-shawnlandden@gmail.com>
	 <1344113204-4294-3-git-send-email-shawnlandden@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-qVlkx0zcMk77+F6loO+r"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344113204-4294-3-git-send-email-shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--=-qVlkx0zcMk77+F6loO+r
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



--=-qVlkx0zcMk77+F6loO+r
Content-Disposition: attachment; filename="0001-prctl.2-note-about-filter-stacking.patch"
Content-Type: text/x-patch; name="0001-prctl.2-note-about-filter-stacking.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

>From 21c133d764dd8047ad48f79a5adc9d23abdb98db Mon Sep 17 00:00:00 2001
From: Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Sat, 4 Aug 2012 14:39:02 -0700
Subject: [PATCH] prctl.2: note about filter stacking

---
 man2/prctl.2 |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index b68bea2..6761a11 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -301,7 +301,9 @@ without the
 capability, you must
 first set
 .BR PR_SET_NO_NEW_PRIVS
-to 1.
+to 1. If
+.BR prctl (2)
+is allowed by the attached filter, additional filters may be attached.
 .RE
 .TP
 .BR PR_GET_SECCOMP " (since Linux 2.6.23)"
-- 
1.7.9.5


--=-qVlkx0zcMk77+F6loO+r--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
