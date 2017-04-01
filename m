From: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] stat.2: tweak description of AT_EMPTY_PATH
Date: Sat, 1 Apr 2017 21:23:42 +0200
Message-ID: <CA+GA0_vdZxOQaUji0c+Sbv=qTYX3uRRGVnEov91_OM=DrNfg1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Currently it says when dirfd is AT_FDCWD it can be something
other than directory, which doesn't make much sense. Just swap
the order of sentences.

Signed-off-by: Marcin =C5=9Alusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man2/stat.2 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man2/stat.2 b/man2/stat.2
index 1d838a9..7ec2593 100644
--- a/man2/stat.2
+++ b/man2/stat.2
@@ -506,14 +506,14 @@ is an empty string, operate on the file referred to b=
y
 .BR open (2)
 .B O_PATH
 flag).
+In this case,
+.I dirfd
+can refer to any type of file, not just a directory.
 If
 .I dirfd
 is
 .BR AT_FDCWD ,
 the call operates on the current working directory.
-In this case,
-.I dirfd
-can refer to any type of file, not just a directory.
 This flag is Linux-specific; define
 .B _GNU_SOURCE
 .\" Before glibc 2.16, defining _ATFILE_SOURCE sufficed
--=20
2.9.3
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
