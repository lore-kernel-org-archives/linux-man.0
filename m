From: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] symlinkat.2: tfix
Date: Tue, 8 May 2012 10:09:41 +0200
Message-ID: <CAMqf4EEmGDZF-NKxKvBmujjFXD7xPQCZ1rmSV3MsMOCRM+gSzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello,

 man2/symlinkat.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/symlinkat.2 b/man2/symlinkat.2
index ac5981b..5eed360 100644
--- a/man2/symlinkat.2
+++ b/man2/symlinkat.2
@@ -114,7 +114,7 @@ is a file descriptor referring to a file other
than a directory.
 .SH VERSIONS
 .BR symlinkat ()
 was added to Linux in kernel 2.6.16;
-library support was added to glibc in version 2.4..
+library support was added to glibc in version 2.4.
 .SH "CONFORMING TO"
 POSIX.1-2008.
 .SH NOTES
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
