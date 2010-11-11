From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: [patch] unix.7
Date: Thu, 11 Nov 2010 20:56:40 +0300
Message-ID: <20101111205640.5ad22f64@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

--- man-pages-git/man7/unix.7   2010-11-02 13:41:53.000000000 +0300
+++ /tmp/unix.7 2010-11-11 20:48:52.000000000 +0300
@@ -332,7 +332,8 @@
 .TP
 .B EINVAL
 Invalid argument passed.
-A common cause is the missing setting of AF_UNIX
+A common cause is the missing setting of
+.B AF_UNIX
 in the
 .I sun_type
 field of passed addresses or the socket being in an

-- 
Best Regards,
Yuri Kozlov

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
