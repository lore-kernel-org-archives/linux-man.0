From: Nikola =?ISO-8859-1?Q?Forr=F3?= <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] nsswitch.conf.5: Add list of files being read when "files"
 service is used
Date: Fri, 13 Nov 2015 14:14:32 +0100
Message-ID: <1447420472.3144.3.camel@redhat.com>
Reply-To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is not mentioned anywhere. Users can assume that the file being re=
ad
is something like /etc/$DATABASE, but that's not always the case. It's =
better
to explicitly specify which file is read for each respective database.
The list of files was acquired from glibc source code.

Signed-off-by: Nikola Forr=C3=B3 <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man5/nsswitch.conf.5 | 46 ++++++++++++++++++++++++++++++++++++++++++++=
++
 1 file changed, 46 insertions(+)

diff --git a/man5/nsswitch.conf.5 b/man5/nsswitch.conf.5
index 33b1c64..c990733 100644
--- a/man5/nsswitch.conf.5
+++ b/man5/nsswitch.conf.5
@@ -330,6 +330,52 @@ implements "nis" source.
 implements "nisplus" source.
 .PD
 .RE
+.LP
+The following files are read when "files" source is specified
+for respective databases:
+.RS 4
+.TP 12
+.PD 0
+.B aliases
+.I /etc/aliases
+.TP
+.B ethers
+.I /etc/ethers
+.TP
+.B group
+.I /etc/group
+.TP
+.B hosts
+.I /etc/hosts
+.TP
+.B initgroups
+.I /etc/group
+.TP
+.B netgroup
+.I /etc/netgroup
+.TP
+.B networks
+.I /etc/networks
+.TP
+.B passwd
+.I /etc/passwd
+.TP
+.B protocols
+.I /etc/protocols
+.TP
+.B publickey
+.I /etc/publickey
+.TP
+.B rpc
+.I /etc/rpc
+.TP
+.B services
+.I /etc/services
+.TP
+.B shadow
+.I /etc/shadow
+.PD
+.RE
 .SH NOTES
 Within each process that uses
 .BR nsswitch.conf ,
--=20
2.4.3


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
