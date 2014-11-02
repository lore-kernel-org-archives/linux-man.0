From: David Wragg <david-vIJKVkNGfPnYtjvyW6yDsg@public.gmane.org>
Subject: [PATCH] cmsg.3: ensure buf is suitably aligned in sending example
Date: Sun, 02 Nov 2014 23:08:35 +0000
Message-ID: <sa7fve1i4jw.fsf@wragg.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Inspection of the definition of CMSG_FIRSTHDR (both in glibc and the
suggested definition in RFC3542) shows that it yields the msg_control
field.  So when sending, the pointer placed in msg_control should be
suitably aligned as a struct cmsghdr. In the sending example, buf was
declared as a bare char array, and so is not necessarily suitably
aligned.

The solution here involves placing buf inside a union, and is based on
the sockets/scm_rights_send.c sample from The Linux Programming
Interface "dist" source code collection.

Signed-off-by: David Wragg <david-vIJKVkNGfPnYtjvyW6yDsg@public.gmane.org>
---
 man3/cmsg.3 | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/man3/cmsg.3 b/man3/cmsg.3
index f355e6b..03f542e 100644
--- a/man3/cmsg.3
+++ b/man3/cmsg.3
@@ -198,11 +198,16 @@ UNIX domain socket using
 struct msghdr msg = {0};
 struct cmsghdr *cmsg;
 int myfds[NUM_FD]; /* Contains the file descriptors to pass. */
-char buf[CMSG_SPACE(sizeof myfds)];  /* ancillary data buffer */
+union {
+    /* ancillary data buffer, wrapped in a union in order to ensure it is
+       suitably aligned */
+    char buf[CMSG_SPACE(sizeof myfds)];
+    struct cmsghdr align;
+} u;
 int *fdptr;
 
-msg.msg_control = buf;
-msg.msg_controllen = sizeof buf;
+msg.msg_control = u.buf;
+msg.msg_controllen = sizeof u.buf;
 cmsg = CMSG_FIRSTHDR(&msg);
 cmsg\->cmsg_level = SOL_SOCKET;
 cmsg\->cmsg_type = SCM_RIGHTS;
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
