From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ffix: keyrings.7: indentation for key list example
Date: Sat, 2 Sep 2017 03:35:40 +0200
Message-ID: <20170902013540.GA23964@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man7/keyrings.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/keyrings.7 b/man7/keyrings.7
index 0cb1190..f817251 100644
--- a/man7/keyrings.7
+++ b/man7/keyrings.7
@@ -540,7 +540,7 @@ An example of the data that one might see in this file
 (with the columns numbered for easy reference below)
 is the following:
 .IP
-.in 0n
+.in +0n
 .EX
   (1)     (2)     (3)(4)    (5)     (6)   (7)   (8)        (9)
 009a2028 I--Q---   1 perm 3f010000  1000  1000 user     krb_ccache:primary: 12
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
