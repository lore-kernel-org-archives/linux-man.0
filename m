From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
	<jeremie.galarneau-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] posix_fallocate.3: fallocate may be interrupted
Date: Tue, 13 Oct 2015 18:00:50 -0400
Message-ID: <1444773650-3009-1-git-send-email-jeremie.galarneau@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?= <jeremie.galarneau-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The glibc implementation of posix_fallocate, which calls
fallocate(), may be interrupted. The fallocate() emulation
also makes use of pread()/pwrite(), which may also be
interrupted.

Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios.=
com>
---
 man3/posix_fallocate.3 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man3/posix_fallocate.3 b/man3/posix_fallocate.3
index 6d8d593..d30f681 100644
--- a/man3/posix_fallocate.3
+++ b/man3/posix_fallocate.3
@@ -98,6 +98,9 @@ referred to by
 .B ESPIPE
 .I fd
 refers to a pipe.
+.TP
+.B EINTR
+A signal was caught during execution.
 .SH VERSIONS
 .BR posix_fallocate ()
 is available since glibc 2.1.94.
--=20
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
