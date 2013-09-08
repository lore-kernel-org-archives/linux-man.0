From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] linux man-pages ioctl_list(2) FAT_IOCTL_GET_ATTRIBUTES
Date: Sun, 8 Sep 2013 07:59:52 +0200
Message-ID: <CAKgNAkgi_ELZ1Cy=Lu9A27Wj0BGemUXi+mieiuB5X8cN-U5cSg@mail.gmail.com>
References: <j2n25d4951c1004030936ia8b558e9w8951691fb29a6693@mail.gmail.com> <CAHku1CHPnGMze526X0KUVUxtixRr8qxPg+-Q75ZqjB03HWKkKw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHku1CHPnGMze526X0KUVUxtixRr8qxPg+-Q75ZqjB03HWKkKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Zsb=E1n_Ambrus?= <ambrus-4iFmikrsyIeT9ig0jae3mg@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Ambrus,

On Sun, Sep 8, 2013 at 1:23 AM, Zsb=E1n Ambrus <ambrus-4iFmikrsyIeT9ig0jae3mg@public.gmane.org> wro=
te:
> Dear Linux man-pages.
>
> I'd like to ask about the status of this patch I'd sent years ago,
> which doesn't seem to be applied as of man-pages 3.53.  Should I
> modify the patch somehow or supply more information?
>
> Thanks in advance,

> ---------- Forwarded message ----------
> From: Zsb=E1n Ambrus <ambrus-4iFmikrsyIeT9ig0jae3mg@public.gmane.org>
> Date: Sat, 3 Apr 2010 18:36:32 +0200
> Subject: [PATCH] linux man-pages ioctl_list(2) FAT_IOCTL_GET_ATTRIBUT=
ES
> To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>
> Dear linux man-pages,
>
> The attached patch adds four ioctls from linux/msdos_fs.h to the
> ioctl_list(2) manpage.
>
> The ioctl FAT_IOCTL_GET_ATTRIBUTES reads FAT attributes of a file a
> mounted vfat file system.  I tested this on Linux 2.6.33, an example
> script can be found at "http://www.perlmonks.com/?node_id=3D832623".
>
> The constants are a bit difficult to access, you may need to include
> the following headers to get them defined correctly (and the order
> matters; and even then they are defined the have the wrong type,
> unsigned long instead of int): <sys/types.h> <sys/ioctl.h>
> <linux/types.h> <linux/dirent.h> <linux/msdos_fs.h>.  Do you suppose
> this should be mentioned in the manpage?
>
> Ambrus

I've applied the patch now.

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
