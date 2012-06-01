From: Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fixes for inotify_init.2 and socket.2
Date: Sat, 2 Jun 2012 01:24:39 +0900
Message-ID: <CALhU9t=OHx2D_5wL1oH2xGdFZ17AYHXkqiAOOawB2Xz4y1aVuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

Here is a another patch against man-pages 3.41.

inotify_init.2
 Linux 2.6.1 does not have inotify_init().
 The previous version of inotify_init.2 said that inofity_init()
first appeared in Linux 2.6.13.
 It seems to be a editing mistake.

socket.2
 PF_INET is duplicated. i think the latter one should be AF_INET.

Regards,
Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

diff --git a/man2/inotify_init.2 b/man2/inotify_init.2
index 41fccb7..97c808d 100644
--- a/man2/inotify_init.2
+++ b/man2/inotify_init.2
@@ -90,7 +90,7 @@ The system limit on the total number of file
descriptors has been reached.
 Insufficient kernel memory is available.
 .SH VERSIONS
 .BR inotify_init ()
-first appeared in Linux 2.6.1;
+first appeared in Linux 2.6.13;
 library support was added to glibc in version 2.4.
 .BR inotify_init1 ()
 was added in Linux 2.6.27;
diff --git a/man2/socket.2 b/man2/socket.2
index 2ee6f61..1bc002a 100644
--- a/man2/socket.2
+++ b/man2/socket.2
@@ -374,7 +374,7 @@ are
 .BR PF_INET ,
 and so on, while
 .BR AF_UNIX ,
-.BR PF_INET ,
+.BR AF_INET ,
 and so on are used for address
 families.
 However, already the BSD man page promises: "The protocol
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
