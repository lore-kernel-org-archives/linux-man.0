From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] open.2: Fix reference fix
Date: Fri, 16 Aug 2013 12:46:50 +0900
Message-ID: <CALhU9tkXWaG_ti-TTjioo5mm4kx+resyYRDWOhG-FCebWzkr6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

>From a58267b142cdc16ed43f7b3dff06155abd5f6f9a Mon Sep 17 00:00:00 2001
From: Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Fri, 16 Aug 2013 12:34:54 +0900
Subject: [PATCH] open.2: Fix reference fix

The flag O_NOPATH does not exist. It should be O_PATH.
---
 man2/open.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/open.2 b/man2/open.2
index 9ebc0a0..ab8157b 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -422,7 +422,7 @@ This is a FreeBSD extension, which was added to
Linux in version 2.1.126.
 Symbolic links in earlier components of the pathname will still be
 followed.
 See also
-.BR O_NOPATH
+.BR O_PATH
 below.
 .\" The headers from glibc 2.0.100 and later include a
 .\" definition of this flag; \fIkernels before 2.1.126 will ignore it if
-- 
1.7.9.5


-- 
Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
