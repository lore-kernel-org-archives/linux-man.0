From: Nikola =?ISO-8859-1?Q?Forr=F3?= <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] recv.2, cmsg.3: Fix type of cmsg_len member of cmsghdr
 structure
Date: Fri, 11 Mar 2016 11:02:37 +0100
Message-ID: <1457690557.5377.2.camel@redhat.com>
Reply-To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The type shown for cmsg_len member of cmsghdr structure is socklen_t,
but the actual type used by glibc and the kernel is size_t.

The information was obtained from glibc source code:
http://bit.ly/21m1RMp

Signed-off-by: Nikola Forr=C3=B3 <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/recv.2 | 6 +++---
 man3/cmsg.3 | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/man2/recv.2 b/man2/recv.2
index 33265b8..0491880 100644
--- a/man2/recv.2
+++ b/man2/recv.2
@@ -393,9 +393,9 @@ The messages are of the form:
 .nf
=20
 struct cmsghdr {
-    socklen_t     cmsg_len;     /* data byte count, including hdr */
-    int           cmsg_level;   /* originating protocol */
-    int           cmsg_type;    /* protocol-specific type */
+    size_t cmsg_len;    /* data byte count, including hdr */
+    int    cmsg_level;  /* originating protocol */
+    int    cmsg_type;   /* protocol-specific type */
 /* followed by
     unsigned char cmsg_data[]; */
 };
diff --git a/man3/cmsg.3 b/man3/cmsg.3
index f1c4459..f97333f 100644
--- a/man3/cmsg.3
+++ b/man3/cmsg.3
@@ -28,9 +28,9 @@ CMSG_ALIGN, CMSG_SPACE, CMSG_NXTHDR, CMSG_FIRSTHDR \-=
 access ancillary data
 .sp
 .nf
 struct cmsghdr {
-    socklen_t cmsg_len;    /* data byte count, including header */
-    int       cmsg_level;  /* originating protocol */
-    int       cmsg_type;   /* protocol-specific type */
+    size_t cmsg_len;    /* data byte count, including header */
+    int    cmsg_level;  /* originating protocol */
+    int    cmsg_type;   /* protocol-specific type */
     /* followed by unsigned char cmsg_data[]; */
 };
 .fi
--=20
2.4.3


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
