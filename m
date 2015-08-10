From: Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] getaddrinfo.3: require POSIX.1-2001
Date: Mon, 10 Aug 2015 12:33:12 +0200
Message-ID: <mvmio8nmo0n.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Since glibc 2.22 getaddrinfo etc. are only declared for POSIX.1-2001 or later.

Signed-off-by: Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>
---
 man3/getaddrinfo.3 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
index 7bf815a..a746bf4 100644
--- a/man3/getaddrinfo.3
+++ b/man3/getaddrinfo.3
@@ -70,7 +70,8 @@ Feature Test Macro Requirements for glibc (see
 .BR freeaddrinfo (),
 .BR gai_strerror ():
 .RS 4
-_POSIX_C_SOURCE\ >=\ 1 || _XOPEN_SOURCE || _POSIX_SOURCE
+_XOPEN_SOURCE\ >=\ 600 || _POSIX_C_SOURCE\ >=\ 200112L
+.\" since glibc 2.22
 .RE
 .ad b
 .SH DESCRIPTION
-- 
2.5.0


-- 
Andreas Schwab, SUSE Labs, schwab-l3A5Bk7waGM@public.gmane.org
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
