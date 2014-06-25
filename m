From: Cyril Hrubis <metan-+ZI9xUNit7I@public.gmane.org>
Subject: [PATCH] vmsplice.2: vmsplice() does not fail on nr_segs=0
Date: Wed, 25 Jun 2014 16:12:35 +0200
Message-ID: <20140625141235.GA10090@rei.Home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This case is no-op and no error is returned.

See fs/splice.c vmsplice syscall which contains:

        if (unlikely(nr_segs > UIO_MAXIOV))
                return -EINVAL;
        else if (unlikely(!nr_segs))
                return 0;

and looking at the git log suggests that this snipped was always there.

Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
---
 man2/vmsplice.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/vmsplice.2 b/man2/vmsplice.2
index 35ab07f..a9ad786 100644
--- a/man2/vmsplice.2
+++ b/man2/vmsplice.2
@@ -133,7 +133,7 @@ either not valid, or doesn't refer to a pipe.
 .TP
 .B EINVAL
 .I nr_segs
-is 0 or greater than
+is greater than
 .BR IOV_MAX ;
 or memory not aligned if
 .B SPLICE_F_GIFT
-- 
1.8.5.5


-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
