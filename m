From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mbrtowc.3: Reformat thread-safety information
Date: Fri, 17 Oct 2014 14:39:58 +0800
Message-ID: <1413527998-7966-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mbrtowc.3 | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/man3/mbrtowc.3 b/man3/mbrtowc.3
index 1a5a9f9..603b311 100644
--- a/man3/mbrtowc.3
+++ b/man3/mbrtowc.3
@@ -171,11 +171,17 @@ character, meaning that
 .I n
 should be increased.
 .SH ATTRIBUTES
-.SS Multithreading (see pthreads(7))
-The
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lb
+l l l.
+Interface	Attribute	Value
+T{
 .BR mbrtowc ()
-function is thread-safe with exceptions.
-It is not thread-safe if called with a NULL \fIps\fP parameter.
+T}	Thread safety	MT-Unsafe race:mbrtowc/!ps
+.TE
 .SH CONFORMING TO
 C99.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
