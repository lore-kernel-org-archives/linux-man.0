From: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Subject: [PATCH] man7/multiarch.7: new manpage
Date: Mon,  6 Apr 2015 18:07:11 -0700
Message-ID: <1428368831-104295-1-git-send-email-shawn@churchofgit.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/multiarch.7 | 105 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 man7/multiarch.7

diff --git a/man7/multiarch.7 b/man7/multiarch.7
new file mode 100644
index 0000000..dc80859
--- /dev/null
+++ b/man7/multiarch.7
@@ -0,0 +1,105 @@
+.\" Copyright (c) 2015 by Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+.\"
+.\" %%%LICENSE_START(VERBATIM)
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of this
+.\" manual under the conditions for verbatim copying, provided that the
+.\" entire resulting derived work is distributed under the terms of a
+.\" permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume no
+.\" responsibility for errors or omissions, or for damages resulting from
+.\" the use of the information contained herein.  The author(s) may not
+.\" have taken the same level of care in the production of this manual,
+.\" which is licensed free of charge, as they might when working
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+.\" %%%LICENSE_END
+.\"
+.\"
+.TH MULTIARCH 7 2015-04-06 "Linux" "Linux Programmer's Manual"
+.SH NAME
+multiarch \- Multiarch support
+.SH DESCRIPTION
+Multiarch
+is a way of installing multiple binary targets (such as
+.BR i386-linux-gnu
+and
+.BR amd64-linux-gnu )
+on one
+.BR hier (7)
+filesystem, which originated in (but is not limited to)
+Debian and Ubuntu.
+.sp
+This manpage covers the filesystem aspects of multi-arch.
+For packaging details refer either to the spec linked to at the bottom of this
+document or the documentation for
+.BR dpkg (1).
+For a list of variables set during cross-compilation see
+.BR dpkg-architecture (1).
+.\"
+.SS Overview and scope
+Multiarch allows binaries of many ABI targets to co-exist on the same system.
+Through the use of
+.BR qemu-user-static (1)
+and
+.BR binfmt.d (5)
+it is even possible to run targets that are not natively runnable. It also can
+be used for cross-compilation.
+.sp
+The current spec does not address having multiple binaries of the same name, and
+does not effect
+.BR path_resolution (7)
+.
+.\"
+.SS Library paths
+.IR /lib/${TUPLE}
+then
+.br
+.IR /usr/lib/${TUPLE}
+then
+.br
+.IR /lib/
+then
+.br
+.IR /usr/lib/
+.\"
+.SS Include paths
+.IR /lib/include/${TUPLE}
+then
+.br
+.IR /lib/include/
+then
+.br
+.IR /usr/lib/include/${TUPLE}
+then
+.br
+.IR /usr/lib/include/
+.\"
+.SS Multiarch tuples
+A multiarch tuple is a normalized GNU tuple. In most cases this is the
+same as the GNU tuple. The most notable exception is that
+.BR i386-linux-gnu
+includes
+.BR i486-linux-gnu ,
+.BR i586-linux-gnu ,
+and
+.BR i686-linux-gnu .
+.\"
+.SS 
+.\"
+.SH CONFORMING TO
+.BR https://wiki.ubuntu.com/MultiarchSpec
+.sp
+.BR https://wiki.ubuntu.com/MultiarchCross
+.sp
+.BR https://wiki.debian.org/Multiarch/Tuples
+.\"
+.SH SEE ALSO
+.BR dpkg-architecture (1)
-- 
2.2.1.209.g41e5f3a

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
