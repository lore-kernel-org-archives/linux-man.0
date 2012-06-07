From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], mdoc(7): Fixing a warning and a table
Date: Thu, 7 Jun 2012 23:58:15 +1200
Message-ID: <CAKgNAkjiK4=cDo712__HrS5M4U8AFiyXFYc1vk2c5e7vc=YNmA@mail.gmail.com>
References: <20120511195430.GA28822@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120511195430.GA28822-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Bjarni,

On Sat, May 12, 2012 at 7:54 AM, Bjarni Ingi Gislason
<bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
> Package: man-pages
> Version: 3.40
> Severity: minor
> Tags: patch
>
> =A0From "groff -ww ..." (or "man --warnings=3Dw ..."):
>
> <groff: mdoc.7>:294: warning: tab character in unquoted macro argumen=
t
>
> =A0In one table the distance between columns is too small in the
> "ps" output. =A0(Bug in the groff "doc.tmac" macro?)

Thanks. Applied for 3.42.

Cheers,

Michael


> =A0Patch:
>
> --- mdoc.7 =A0 =A0 =A02012-04-26 22:58:40.000000000 +0000
> +++ mdoc.7.new =A02012-05-11 13:57:40.000000000 +0000
> @@ -201,7 +201,10 @@
> =A0Options:
> =A0.Bl -tag -width flag -compact
> =A0.It Ar List-types
> -.Bl -column xbullet -compact
> +.\" The width "xbullet" is too small in the "ps" output.
> +.\" Spaces to increase the width result in too little space in
> +.\" the "ps" output (bug in the groff <=3D 1.21 "doc.tmac" macro?)
> +.Bl -column xbulletM -compact
> =A0.It Fl bullet Ta "Bullet Item List"
> =A0.It Fl item Ta "Unlabeled List"
> =A0.It Fl enum Ta "Enumerated List"
> @@ -291,7 +294,7 @@
> =A0.ne 1i
> =A0.Ss Manual Domain Macros
> =A0.Bl -column "Name" "Parsed" Callable" -compact
> -.It Em Name =A0 =A0Parsed =A0Callable =A0 =A0 =A0 =A0Description
> +.It Em "Name =A0 Parsed =A0Callable =A0 =A0 =A0 =A0Description"
> =A0.It Li \&Ad Ta Yes Ta Yes Ta "Address. (This macro may be deprecat=
ed.)"
> =A0.It Li \&An Ta Yes Ta Yes Ta "Author name."
> =A0.It Li \&Ar Ta Yes Ta Yes Ta "Command-line argument."
>
> --
> Bjarni I. Gislason



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
