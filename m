From: Nikola =?ISO-8859-1?Q?Forr=F3?= <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] namespaces.7: tfix
Date: Fri, 23 Sep 2016 13:31:47 +0200
Message-ID: <1474630307.2788.1.camel@redhat.com>
Reply-To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

lsns manual page is in section 8, not 1

Signed-off-by: Nikola Forró <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man7/namespaces.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/namespaces.7 b/man7/namespaces.7
index 45256c8..b0d9bcf 100644
--- a/man7/namespaces.7
+++ b/man7/namespaces.7
@@ -327,7 +327,7 @@ Namespaces are a Linux-specific feature.
 See
 .BR user_namespaces (7).
 .SH SEE ALSO
-.BR lsns (1),
+.BR lsns (8),
 .BR nsenter (1),
 .BR readlink (1),
 .BR unshare (1),
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
