From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] [3/4] Clarify includes/libraries in move_pages page
Date: Fri, 11 Jun 2010 10:31:21 +0200
Message-ID: <AANLkTil8-_pD65RcslSC-tkE51Zu9TZi2n-R-gzgGohK@mail.gmail.com>
References: <20100320429.026463287@firstfloor.org> <20100320152930.15367B19E8@basil.firstfloor.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100320152930.15367B19E8-Oisruko67ZwogZNkvFMw5WD2FQJk+8+b@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Mar 20, 2010 at 5:29 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote=
:
>
> Signed-off-by: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>
> Index: man-pages-3.24/man2/move_pages.2

Thanks. Applied for man-pages-3.25.

Cheers,

Michael


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- man-pages-3.24.orig/man2/move_pages.2
> +++ man-pages-3.24/man2/move_pages.2
> @@ -25,6 +25,8 @@ move_pages \- move individual pages of a
> =A0.BI "long move_pages(int " pid ", unsigned long count, void **" pa=
ges ,
> =A0.BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const int *" nodes ", int *" =
status ", int " flags );
> =A0.fi
> +.sp
> +Link with \fI\-lnuma\fP.
> =A0.SH DESCRIPTION
> =A0.BR move_pages ()
> =A0moves the specified
> @@ -214,6 +216,12 @@ and/or the specified process [See
> =A0That is, memory policy does not constrain the destination
> =A0nodes used by
> =A0.BR move_pages ().
> +
> +The
> +.I numaif.h
> +header is not included with glibc, but requires installing
> +.I libnuma-devel
> +or a similar package.
> =A0.SH "SEE ALSO"
> =A0.BR get_mempolicy (2),
> =A0.BR mbind (2),
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
