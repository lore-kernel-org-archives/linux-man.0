From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] Another typo in getrlimit.2
Date: Mon, 15 Nov 2010 22:56:31 +0100
Message-ID: <AANLkTi==MHZoOnGupH5RxXXCG5oFzL04p9y3P=JY2MLq@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

Here it is.

Denis

diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
index 805d232..1d2d47a 100644
--- a/man2/getrlimit.2
+++ b/man2/getrlimit.2
@@ -454,7 +454,7 @@ was greater than
 An unprivileged process tried to raise the hard limit; the
 .B CAP_SYS_RESOURCE
 capability is required to do this.
-Or, the the caller tried to increase the hard
+Or, the caller tried to increase the hard
 .B RLIMIT_NOFILE
 limit above the current kernel maximum
 .RB ( NR_OPEN ).
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
