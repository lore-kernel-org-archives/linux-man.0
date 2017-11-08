From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] stdio.3: wsfix
Date: Wed, 8 Nov 2017 16:09:29 +0900
Message-ID: <4e9b3267-31d3-624e-1974-d4056d4733f2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

 man3/stdio.3 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man3/stdio.3 b/man3/stdio.3
index 114ba5586..970a85613 100644
--- a/man3/stdio.3
+++ b/man3/stdio.3
@@ -110,7 +110,8 @@ opened explicitly:
 .I standard error
 (for writing diagnostic output).
 These streams are abbreviated
-.IR stdin , stdout
+.IR stdin ,
+.IR stdout ,
 and
 .IR stderr .
 When opened, the standard error stream is not fully buffered; the standard
-- 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
