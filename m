From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: readdir.3: don't just use pathconf in arithmetic!
Date: Sat, 7 Jul 2012 07:44:54 +0200
Message-ID: <CAKgNAkhxWWPaj329ysLSXzryWWTJ9yTJ37uMe6-ennpcdLU6Og@mail.gmail.com>
References: <alpine.LNX.2.01.1207030322480.31708@frira.zrqbmnf.qr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LNX.2.01.1207030322480.31708-T6FZdRNfRAYJBwGkWA2XUA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Engelhardt <jengelh-9+2X+4sQBs8@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Jan,

(Please CC linux-man with notes such as this.)

On Tue, Jul 3, 2012 at 3:27 AM, Jan Engelhardt <jengelh-9+2X+4sQBs8@public.gmane.org> wrote:
>
> In man-pages-3.35's readdir_r(3), this example code is provided:
>
> """
>  Since POSIX.1 does not specify the size of the d_name field, and  ot=
her
>  nonstandard  fields may precede that field within the dirent structu=
re,
>  portable applications that use readdir_r() should allocate  the  buf=
fer
>  whose address is passed in entry as follows:
>
>      len =3D offsetof(struct dirent, d_name) +
>                pathconf(dirpath, _PC_NAME_MAX) + 1
>      entryp =3D malloc(len);
> """
>
> I have come to regard this as bad(ly implemented) advice. A project
> na=EFvely copied this snippet and then ran into memory corruption.
> I propose:
>
>     long ret =3D pathconf(dirpath, _PC_NAME_MAX);
>     if (ret < 0)
>         abort();
>     entryp =3D malloc(offsetof(struct dirent, d_name) +
>                  ret + 1);
>
> Because it so happened that the particular project (bindfs) used
> a non-existing path and got -1 (with errno=3D=3DENOENT), thus
> allocating way too few space.

Yes, the page could be better. I applied a somewhat different patch:

[[
--- a/man3/readdir.3
+++ b/man3/readdir.3
@@ -226,8 +226,10 @@ as follows:
 .in +4n
 .nf

-len =3D offsetof(struct dirent, d_name) +
-          pathconf(dirpath, _PC_NAME_MAX) + 1
+name_max =3D pathconf(dirpath, _PC_NAME_MAX);
+if (name_max =3D=3D \-1)        /* Limit not defined, or error */
+    name_max =3D 255;         /* Take a guess */
+len =3D offsetof(struct dirent, d_name) + name_max + 1;
 entryp =3D malloc(len);

 .fi
]]

Okay?

> NB: pathconf(3) could document some possible errors.

That's true. Want to send in a patch?

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
