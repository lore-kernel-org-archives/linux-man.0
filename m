From: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] inotify_init.2: tfix
Date: Tue, 8 May 2012 09:18:02 +0200
Message-ID: <CAMqf4EGTNsUGGWS6QGApr=P7_GG0BUAMXTXK3CrALB2act0UOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello,

Here is a trivial patch.

 man2/inotify_init.2 |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/inotify_init.2 b/man2/inotify_init.2
index 3772543..41fccb7 100644
--- a/man2/inotify_init.2
+++ b/man2/inotify_init.2
@@ -91,10 +91,10 @@ Insufficient kernel memory is available.
 .SH VERSIONS
 .BR inotify_init ()
 first appeared in Linux 2.6.1;
-lbrary support was added to glibc in version 2.4.
+library support was added to glibc in version 2.4.
 .BR inotify_init1 ()
 was added in Linux 2.6.27;
-lbrary support was added to glibc in version 2.9.
+library support was added to glibc in version 2.9.
 .SH "CONFORMING TO"
 These system calls are Linux-specific.
 .SH "SEE ALSO"
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
