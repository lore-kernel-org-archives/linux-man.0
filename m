From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] quotactl.2: tfix
Date: Thu, 10 Nov 2016 21:37:08 +0300
Message-ID: <20161110183708.GA21334@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/quotactl.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/quotactl.2 b/man2/quotactl.2
index d1e2d20..f9a99ab 100644
--- a/man2/quotactl.2
+++ b/man2/quotactl.2
@@ -658,7 +658,7 @@ The
 .I id
 argument is ignored.
 .TP
-.BR Q_XQUOTASYNC " (since Linux 2.6.15; no-up since Linux 3.4)"
+.BR Q_XQUOTASYNC " (since Linux 2.6.15; no-op since Linux 3.4)"
 .\" Added in commit ee34807a65aa0c5911dc27682863afca780a003e
 This command was an XFS quota equivalent to
 .IR Q_SYNC ,
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
