From: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] prctl.2: ffix
Date: Mon, 4 Feb 2013 22:06:47 +0100
Message-ID: <CAMqf4EEhOoOOd+G++xpB1h-eALmtOEmfrO_gWZQCwA-h3Ms-zQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man2/prctl.2 |    1 -
 1 file changed, 1 deletion(-)

diff --git a/man2/prctl.2 b/man2/prctl.2
index 36fdc14..f139c5f 100644
--- a/man2/prctl.2
+++ b/man2/prctl.2
@@ -833,7 +833,6 @@ is not 0,
 .BR PR_SET_PTRACER_ANY ,
 or the PID of an existing process.
 .TP
-TP
 .B EPERM
 .I option
 is
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
