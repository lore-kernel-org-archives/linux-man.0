From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] readlink.2: Document using st_size to allocate the buffer
Date: Tue, 20 Sep 2011 08:51:41 +0200
Message-ID: <CAKgNAkj0FjVtJrJgaifSQ-xy+4GQm3GNmjoOndxMfGeXa+titQ@mail.gmail.com>
References: <20110421031957.GA12346@gaara.hadrons.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110421031957.GA12346-v62vTE6/wQGgM1MOaoewpti2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Guillem,

On Thu, Apr 21, 2011 at 5:19 AM, Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org> wr=
ote:
> Signed-off-by: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
> ---
> =A0man2/readlink.2 | =A0 69 +++++++++++++++++++++++++++++++++++++++++=
+++++++++++++-
> =A01 files changed, 68 insertions(+), 1 deletions(-)
>
> diff --git a/man2/readlink.2 b/man2/readlink.2
> index 1327e08..2601e22 100644
> --- a/man2/readlink.2
> +++ b/man2/readlink.2
> @@ -35,7 +35,7 @@
> =A0.\" Modified Tue Jul =A09 23:55:17 1996 by aeb
> =A0.\" Modified Fri Jan 24 00:26:00 1997 by aeb
> =A0.\"
> -.TH READLINK 2 2010-09-20 "Linux" "Linux Programmer's Manual"
> +.TH READLINK 2 2011-04-20 "Linux" "Linux Programmer's Manual"
> =A0.SH NAME
> =A0readlink \- read value of a symbolic link
> =A0.SH SYNOPSIS
> @@ -69,6 +69,21 @@ does not append a null byte to
> =A0It will truncate the contents (to a length of
> =A0.I bufsiz
> =A0characters), in case the buffer is too small to hold all of the co=
ntents.
> +
> +Using a statically sized buffer might not give enough room for the
> +symbolic link contents, which might end up getting truncated. The
> +needed size for the buffer can be obtained from the symbolic link's
> +.I stat
> +structure
> +.I st_size
> +field with
> +.BR lstat (),
> +but the number of written characters should be checked to make sure =
the
> +symbolic link did not change between both calls, and no truncation
> +happened. This also fixes a common portability problem when using
> +.I PATH_MAX
> +for the buffer size, as this is not guaranteed to be defined per POS=
IX
> +if the system does not have such limit.
> =A0.SH "RETURN VALUE"
> =A0On success,
> =A0.BR readlink ()
> @@ -130,6 +145,58 @@ was declared as
> =A0Nowadays, the return type is declared as
> =A0.IR ssize_t ,
> =A0as (newly) required in POSIX.1-2001.
> +.SH EXAMPLE
> +The following program allocates the space needed by
> +.BR readlink ()
> +dynamically from the information provided by
> +.BR lstat (),
> +making sure there's no race condition between both calls.
> +.nf
> +
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +
> +int
> +main(int argc, char *argv[])
> +{
> + =A0 =A0struct stat sb;
> + =A0 =A0char *linkname;
> + =A0 =A0ssize_t r;
> +
> + =A0 =A0if (argc !=3D 2) {
> + =A0 =A0 =A0 =A0fprintf(stderr, "Usage: %s <pathname>\\n", argv[0]);
> + =A0 =A0 =A0 =A0exit(EXIT_FAILURE);
> + =A0 =A0}
> +
> + =A0 =A0if (lstat(argv[1], &sb) =3D=3D \-1) {
> + =A0 =A0 =A0 =A0perror("lstat");
> + =A0 =A0 =A0 =A0exit(EXIT_FAILURE);
> + =A0 =A0}
> +
> + =A0 =A0linkname =3D malloc(sb.st_size + 1);
> + =A0 =A0if (linkname =3D=3D NULL) {
> + =A0 =A0 =A0 =A0fprintf(stderr, "insufficient memory\\n");
> + =A0 =A0 =A0 =A0exit(EXIT_FAILURE);
> + =A0 =A0}
> +
> + =A0 =A0r =3D readlink(argv[1], linkname, sb.st_size + 1);
> + =A0 =A0if (r < 0) {
> + =A0 =A0 =A0 =A0perror("lstat");
> + =A0 =A0 =A0 =A0exit(EXIT_FAILURE);
> + =A0 =A0} else if (r !=3D sb.st_size) {
> + =A0 =A0 =A0 =A0fprintf(stderr, "symlink changed between lstat and r=
eadlink\\n");
> + =A0 =A0 =A0 =A0exit(EXIT_FAILURE);
> + =A0 =A0}
> + =A0 =A0linkname[sb.st_size] =3D '\\0';
> +
> + =A0 =A0printf("'%s' points to '%s'\\n", argv[1], linkname);
> +
> + =A0 =A0exit(EXIT_SUCCESS);
> +}
> +.fi
> =A0.SH "SEE ALSO"
> =A0.BR lstat (2),
> =A0.BR readlinkat (2),
> --
> 1.7.4.4

That's a nice addition! Thanks!

I made some edits to your patch, and placed the added explanatory text
in NOTES, rather than DESCRIPTION. Modified patch below.

The change will be in 3.34.

Cheers,

Michael

diff --git a/man2/readlink.2 b/man2/readlink.2
index c9f6d92..051a870 100644
--- a/man2/readlink.2
+++ b/man2/readlink.2
@@ -1,4 +1,5 @@
 .\" Copyright (c) 1983, 1991 The Regents of the University of Californ=
ia.
+.\" Adn Copyright (C) 2011 Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
 .\" All rights reserved.
 .\"
 .\" Redistribution and use in source and binary forms, with or without
@@ -34,8 +35,10 @@
 .\" Modified Sat Jul 24 00:10:21 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified Tue Jul  9 23:55:17 1996 by aeb
 .\" Modified Fri Jan 24 00:26:00 1997 by aeb
+.\" 2011-09-20, Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>:
+.\"     Added text on dynamically allocating buffer + example program
 .\"
-.TH READLINK 2 2010-09-20 "Linux" "Linux Programmer's Manual"
+.TH READLINK 2 2011-09-20 "Linux" "Linux Programmer's Manual"
 .SH NAME
 readlink \- read value of a symbolic link
 .SH SYNOPSIS
@@ -130,6 +133,82 @@ was declared as
 Nowadays, the return type is declared as
 .IR ssize_t ,
 as (newly) required in POSIX.1-2001.
+
+Using a statically sized buffer might not provide enough room for the
+symbolic link contents.
+The required size for the buffer can be obtained from the
+.I stat.st_size
+value returned by a call to
+.BR lstat (2)
+on the link.
+However, the number of bytes written by
+.BR readlink ()
+should be checked to make sure that the size of the
+symbolic link did not increase between the calls.
+Dynamically allocating the buffer for
+.BR readlink ()
+also addresses a common portability problem when using
+.I PATH_MAX
+for the buffer size,
+as this constant is not guaranteed to be defined per POSIX
+if the system does not have such limit.
+.SH EXAMPLE
+The following program allocates the buffer needed by
+.BR readlink ()
+dynamically from the information provided by
+.BR lstat (),
+making sure there's no race condition between the calls.
+.nf
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+int
+main(int argc, char *argv[])
+{
+    struct stat sb;
+    char *linkname;
+    ssize_t r;
+
+    if (argc !=3D 2) {
+        fprintf(stderr, "Usage: %s <pathname>\\n", argv[0]);
+        exit(EXIT_FAILURE);
+    }
+
+    if (lstat(argv[1], &sb) =3D=3D \-1) {
+        perror("lstat");
+        exit(EXIT_FAILURE);
+    }
+
+    linkname =3D malloc(sb.st_size + 1);
+    if (linkname =3D=3D NULL) {
+        fprintf(stderr, "insufficient memory\\n");
+        exit(EXIT_FAILURE);
+    }
+
+    r =3D readlink(argv[1], linkname, sb.st_size + 1);
+
+    if (r < 0) {
+        perror("lstat");
+        exit(EXIT_FAILURE);
+    }
+
+    if (r !=3D sb.st_size) {
+        fprintf(stderr, "symlink increased in size "
+                        "between lstat() and readlink()\\n");
+        exit(EXIT_FAILURE);
+    }
+
+    linkname[sb.st_size] =3D '\\0';
+
+    printf("'%s' points to '%s'\\n", argv[1], linkname);
+
+    exit(EXIT_SUCCESS);
+}
+.fi
 .SH "SEE ALSO"
 .BR readlink (1),
 .BR lstat (2),


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
