From: Alexander Alemayhu <alexander-lyk0faqGNUlWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] bpf.2: tfix
Date: Mon, 24 Apr 2017 11:20:55 +0200
Message-ID: <20170424092055.26140-1-alexander@alemayhu.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Alemayhu <alexander-lyk0faqGNUlWk0Htik3J/w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

o s/log_bug/log_buf

Signed-off-by: Alexander Alemayhu <alexander-lyk0faqGNUlWk0Htik3J/w@public.gmane.org>
---
 man2/bpf.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/bpf.2 b/man2/bpf.2
index 5339495769d0..544a3993ef2f 100644
--- a/man2/bpf.2
+++ b/man2/bpf.2
@@ -778,7 +778,7 @@ The format of the output can change at any time as the verifier evolves.
 .IP *
 .I log_size
 size of the buffer pointed to by
-.IR log_bug .
+.IR log_buf .
 If the size of the buffer is not large enough to store all
 verifier messages, \-1 is returned and
 .I errno
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
