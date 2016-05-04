From: Nikola =?ISO-8859-1?Q?Forr=F3?= <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clone.2, fork.2: Document ERESTARTNOINTR error code
Date: Wed, 04 May 2016 10:55:56 +0200
Message-ID: <1462352156.3183.1.camel@redhat.com>
Reply-To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Since Linux 2.6.17, clone and fork syscalls return ERESTARTNOINTR
when interrupted by a signal before newly created process is added
to its process group.
This error code can only be seen by ptrace at syscall exit tracing.

The information was obtained from kernel source code:
http://bit.ly/24xdofn

Signed-off-by: Nikola Forr=C3=B3 <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/clone.2 | 4 ++++
 man2/fork.2  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/man2/clone.2 b/man2/clone.2
index 8373700..ab1e58d 100644
--- a/man2/clone.2
+++ b/man2/clone.2
@@ -1013,6 +1013,10 @@ and the call would cause the limit on the number=
 of
 nested user namespaces to be exceeded.
 See
 .BR user_namespaces (7).
+.TP
+.BR ERESTARTNOINTR " (since Linux 2.6.17)"
+System call was interrupted by a signal and will be restarted.
+(This can be seen only during a trace.)
 .SH VERSIONS
 There is no entry for
 .BR clone ()
diff --git a/man2/fork.2 b/man2/fork.2
index 559a47f..3accc8c 100644
--- a/man2/fork.2
+++ b/man2/fork.2
@@ -242,6 +242,10 @@ failed to allocate the necessary kernel structures=
 because memory is tight.
 is not supported on this platform (for example,
 .\" e.g., arm (optionally), blackfin, c6x, frv, h8300, microblaze, xte=
nsa
 hardware without a Memory-Management Unit).
+.TP
+.BR ERESTARTNOINTR " (since Linux 2.6.17)"
+System call was interrupted by a signal and will be restarted.
+(This can be seen only during a trace.)
 .SH CONFORMING TO
 POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.
 .SH NOTES
--=20
2.4.11


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
