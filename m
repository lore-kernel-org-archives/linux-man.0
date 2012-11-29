From: YOSHIFUJI Hideaki <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>
Subject: [PATCH TAKE 2] if_nametoindex.3: New page documenting if_nametoindex(3) and
 if_indextoname(3)
Date: Thu, 29 Nov 2012 20:00:28 +0900
Message-ID: <201211291100.qATB0SVc010905@94.43.138.210.xn.2iij.net>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is take 2 of if_nametoindex.3.

Diff is as follows.

|diff --git a/man3/if_nametoindex.3 b/man3/if_nametoindex.3
|index de458b1..16d42e0 100644
|--- a/man3/if_nametoindex.3
|+++ b/man3/if_nametoindex.3
|@@ -1,5 +1,5 @@
| .\" Copyright (c) 2012 YOSHIFUJI Hideaki <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>
|-.\" 
|+.\"
| .\" Permission is granted to make and distribute verbatim copies of this
| .\" manual provided the copyright notice and this permission notice are
| .\" preserved on all copies.
|@@ -33,17 +33,20 @@ if_nametoindex, if_indextoname \- mappings between network interface names and i
| .SH DESCRIPTION
| The
| .BR if_nametoindex ()
|-function returns the interface index corresponding to the name
|+function returns the index of the network interface
|+corresponding to the name
| .IR ifname .
| 
| The
| .BR if_indextoname ()
|-function returns a pointer to the network interface name
|+function returns the name of the network interface
| corresponding to the interface index
| .IR ifindex .
|-The buffer
|-.I ifname
|-must be of at least IFNAMSIZ bytes.
|+The name is placed in the buffer pointed to by
|+.IR ifname .
|+The buffer must be of at least
|+.B IF_NAMESIZE
|+bytes.
| 
| .SH RETURN VALUE
| On success,
|@@ -57,37 +60,29 @@ On success,
| .BR if_indextoname ()
| returns
| .IR ifname ;
|-On error, NULL pointer is retuned and
|+On error, NULL pointer is returned and
| .I errno
|-is set approptiately.
|+is set appropriately.
| .SH ERRORS
|-.BR if_nameindex ()
|-and
|-.BR if_nameindex ()
|+.BR if_indextoname ()
| may fail and set
| .I errno
| if:
| .TP
| .B ENXIO
|-Interface not found.
|+No interface found for the index.
| .PP
| .BR if_nametoindex ()
|+and
|+.BR if_indextoname ()
| may also fail for any of the errors specified for
| .BR socket (2),
| .BR ioctl (2).
|-.PP
|-.BR if_indextoname ()
|-may also fail for any of the error specified for
|-.BR if_nameindex (3).
| .SH CONFORMING TO
| RFC\ 3493, POSIX.1-2001.
|-.SH HISTORY
|+
| This function first appeared in BSDi.
| .SH SEE ALSO
|-.BR getsockopt (2),
|-.BR setsockopt (2),
| .BR getifaddrs (3),
|-.BR if_indextoname (3),
| .BR if_nameindex (3),
|-.BR if_nametoindex (3),
| .BR ifconfig (8)

Signed-off-by: YOSHIFUJI Hideaki <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>

---
 man3/if_nametoindex.3 |   88 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 man3/if_nametoindex.3

diff --git a/man3/if_nametoindex.3 b/man3/if_nametoindex.3
new file mode 100644
index 0000000..16d42e0
--- /dev/null
+++ b/man3/if_nametoindex.3
@@ -0,0 +1,88 @@
+.\" Copyright (c) 2012 YOSHIFUJI Hideaki <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>
+.\"
+.\" Permission is granted to make and distribute verbatim copies of this
+.\" manual provided the copyright notice and this permission notice are
+.\" preserved on all copies.
+.\"
+.\" Permission is granted to copy and distribute modified versions of
+.\" this manual under the conditions for verbatim copying, provided that
+.\" the entire resulting derived work is distributed under the terms of
+.\" a permission notice identical to this one.
+.\"
+.\" Since the Linux kernel and libraries are constantly changing, this
+.\" manual page may be incorrect or out-of-date.  The author(s) assume.
+.\" no responsibility for errors or omissions, or for damages resulting.
+.\" from the use of the information contained herein.  The author(s) may.
+.\" not have taken the same level of care in the production of this.
+.\" manual, which is licensed free of charge, as they might when working.
+.\" professionally.
+.\"
+.\" Formatted or processed versions of this manual, if unaccompanied by
+.\" the source, must acknowledge the copyright and authors of this work.
+.\"
+.TH IF_NAMETOINDEX 3 2012-11-16 "GNU" "Linux Programmer's Manual"
+.SH NAME
+if_nametoindex, if_indextoname \- mappings between network interface names and indexes
+.SH SYNOPSIS
+.nf
+.B #include <net/if.h>
+.sp
+.BI "unsigned int if_nametoindex(const char *" "ifname" );
+.BI "char *if_indextoname(unsigned int ifindex, char *" "ifname);
+.fi
+.SH DESCRIPTION
+The
+.BR if_nametoindex ()
+function returns the index of the network interface
+corresponding to the name
+.IR ifname .
+
+The
+.BR if_indextoname ()
+function returns the name of the network interface
+corresponding to the interface index
+.IR ifindex .
+The name is placed in the buffer pointed to by
+.IR ifname .
+The buffer must be of at least
+.B IF_NAMESIZE
+bytes.
+
+.SH RETURN VALUE
+On success,
+.BR if_nametoindex ()
+returns the index number of the network interface;
+On error, 0 is returned and
+.I errno
+is set appropriately.
+
+On success,
+.BR if_indextoname ()
+returns
+.IR ifname ;
+On error, NULL pointer is returned and
+.I errno
+is set appropriately.
+.SH ERRORS
+.BR if_indextoname ()
+may fail and set
+.I errno
+if:
+.TP
+.B ENXIO
+No interface found for the index.
+.PP
+.BR if_nametoindex ()
+and
+.BR if_indextoname ()
+may also fail for any of the errors specified for
+.BR socket (2),
+.BR ioctl (2).
+.SH CONFORMING TO
+RFC\ 3493, POSIX.1-2001.
+
+This function first appeared in BSDi.
+.SH SEE ALSO
+.BR getifaddrs (3),
+.BR if_nameindex (3),
+.BR ifconfig (8)
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
