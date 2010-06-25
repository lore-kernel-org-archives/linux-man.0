From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: filesystems.5 man page
Date: Fri, 25 Jun 2010 08:08:04 +0200
Message-ID: <AANLkTilkO0ghRdil7OKTT9Vlfw8LIJMygmucB9PthMvb@mail.gmail.com>
References: <4C21B9FD.60402@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4C21B9FD.60402-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivana Hutarova Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ivana,

On Wed, Jun 23, 2010 at 9:38 AM, Ivana Hutarova Varekova
<varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> filesystems.5 man page does not mention ext4 filesystem, so I'm sendi=
ng a
> patch which adds it.
> Ivana

Thanks. This was independently reported, and I already applied another
patch for 2.25.

Thanks,

Michael


> diff -up ./filesystems.5.pom ./filesystems.5
> --- ./filesystems.5.pom =A0 =A02010-02-26 05:46:53.000000000 +0100
> +++ ./filesystems.5 =A0 =A02010-06-23 09:16:42.000000000 +0200
> @@ -77,6 +77,11 @@ is a journaling version of the ext2 file
> =A0It is easy to
> =A0switch back and forth between ext2 and ext3.
> =A0.TP
> +.B ext4
> +is the next generation of the ext filesystem series. =A0In addition =
to
> +journaling, ext4 supports larger files and filesystems than ext3, an=
d
> provides
> +other modern features such as preallocation and an extent-based allo=
cator.
> +.TP
> =A0.B Reiserfs
> =A0is a journaling file system, designed by Hans Reiser,
> =A0that was integrated into Linux in kernel 2.4.1.
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
