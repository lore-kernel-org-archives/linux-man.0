From: "Maxin B. John" <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Typo in stdio manpage
Date: Wed,  2 Jan 2013 15:51:41 +0100
Message-ID: <1357138301-22108-1-git-send-email-maxin.john@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daan.f.spitz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Maxin B. John" <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: "Maxin B. John" <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

stdio: resolve typo in stdio.3 manpage

Reported-by: Daan Spitz <daan.f.spitz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Maxin B. John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man3/stdio.3 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/stdio.3 b/man3/stdio.3
index 0c773e9..9a478df 100644
--- a/man3/stdio.3
+++ b/man3/stdio.3
@@ -113,7 +113,7 @@ and
 .IR stderr .
 When opened, the standard error stream is not fully buffered; the standard
 input and output streams are fully buffered if and only if the streams do
-not to refer to an interactive device.
+not refer to an interactive device.
 .PP
 Output streams that refer to terminal devices are always line buffered by
 default; pending output to such streams is written automatically whenever
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
