From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] localedef.1: tfix
Date: Tue, 09 Jun 2015 17:19:01 +0300
Message-ID: <5576F5D5.3080501@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

the subject says it all.

---
 man1/localedef.1 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man1/localedef.1 b/man1/localedef.1
index 2996f91..765d770 100644
--- a/man1/localedef.1
+++ b/man1/localedef.1
@@ -82,7 +82,7 @@ If
 contains a slash character ('/'), it is interpreted as the name of the
 directory where the output definitions are to be stored.
 In this case, there is a separate output file for each locale category
-.RI ( LC_CTIME ,
+.RI ( LC_TIME ,
 .IR LC_NUMERIC ,
 and so on).
 .IP *

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
