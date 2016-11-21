From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/5] request_key.2: additional error information
Date: Tue, 22 Nov 2016 00:00:08 +0300
Message-ID: <20161121210008.GA16907@obsidian>
References: <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <528b203d-ac72-e4a6-8517-e8c5c11055a4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/request_key.2 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/man2/request_key.2 b/man2/request_key.2
index 1a3af3f..936989a 100644
--- a/man2/request_key.2
+++ b/man2/request_key.2
@@ -331,6 +331,11 @@ The keyring wasn't available for modification by the user.
 The key quota for this user would be exceeded by creating this key or linking
 it to the keyring.
 .TP
+.B EFAULT
+(Part of)
+.IR type ", " description " or " callout_info
+points outside process' accessible address space.
+.TP
 .B EINTR
 The request was interrupted by a signal; see
 .BR signal (7).
@@ -361,6 +366,11 @@ No matching key was found.
 .TP
 .B ENOMEM
 Insufficient memory to create a key.
+.TP
+.B EPERM
+The
+.I type
+started from dot.
 .SH VERSIONS
 This system call first appeared in Linux 2.6.10.
 .\" 3e30148c3d524a9c1c63ca28261bc24c457eb07a
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
