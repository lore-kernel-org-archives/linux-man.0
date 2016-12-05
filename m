From: Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 4/6] atof.3: SEE ALSO: add strfromd(3)
Date: Mon,  5 Dec 2016 16:30:36 -0200
Message-ID: <413a71a7e62ba707593b207005dbf9f6148b1a9f.1480961953.git.wainersm@linux.vnet.ibm.com>
References: <c5d0be31-9c1d-000a-89ac-a18909ef4ac5@gmail.com>
 <cover.1480961953.git.wainersm@linux.vnet.ibm.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1480961953.git.wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.1480961953.git.wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
References: <cover.1480961953.git.wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gftg-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Wainer dos Santos Moschetta <wainersm-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
---
 man3/atof.3 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man3/atof.3 b/man3/atof.3
index 7cb18bd..7f3e892 100644
--- a/man3/atof.3
+++ b/man3/atof.3
@@ -71,6 +71,7 @@ POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.
 .SH SEE ALSO
 .BR atoi (3),
 .BR atol (3),
+.BR strfromd (3),
 .BR strtod (3),
 .BR strtol (3),
 .BR strtoul (3)
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
