From: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] getopt.3: Fix feature test macro requirements for getopt()
Date: Thu, 26 Nov 2009 22:05:05 -0600
Message-ID: <20091127040505.GA21636@progeny.tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The synopsis previously stated that getopt requires
_POSIX_C_SOURCE >=3D 2 || _XOPEN_SOURCE || _POSIX_SOURCE, but that
would be impossible, since _POSIX_SOURCE is a synonym for
_POSIX_C_SOURCE >=3D 1.

getopt was introduced to POSIX in POSIX.2.  The glibc headers
correctly test for that version.

Signed-off-by: Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Hi,

I noticed this when trying to compile a program that uses getopt with
_POSIX_SOURCE.  Checking the headers, I see that unistd.h does not
include getopt.h unless __USE_POSIX2 is defined, and getopt.h does not
choose the standards-conforming implementation unless __USE_POSIX2 &&
!__USE_POSIX_IMPLICITLY && !__USE_GNU is defined.

The POSIX-1 2008 documentation [1] suggests that SVr2 had a getopt,
and the FreeBSD manpage [2] says BSD 4.3 had one, too.  So maybe
getopt should be exposed if either _BSD_SOURCE or _SVID_SOURCE is
defined.  But it isn=E2=80=99t currently.

Anyway, I hope the patch is of some use.

Thanks,
Jonathan

[1] http://www.opengroup.org/onlinepubs/9699919799/functions/getopt.htm=
l
[2] http://svn.freebsd.org/viewvc/base/head/lib/libc/stdlib/getopt.3?vi=
ew=3Dmarkup

 man3/getopt.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/getopt.3 b/man3/getopt.3
index 503f689..97ff60a 100644
--- a/man3/getopt.3
+++ b/man3/getopt.3
@@ -68,7 +68,7 @@ Feature Test Macro Requirements for glibc (see
 .in
 .sp
 .BR getopt ():
-_POSIX_C_SOURCE\ >=3D\ 2 || _XOPEN_SOURCE || _POSIX_SOURCE
+_POSIX_C_SOURCE\ >=3D\ 2 || _XOPEN_SOURCE
 .br
 .BR getopt_long (),
 .BR getopt_long_only ():
--=20
1.6.5.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
