From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] man3/opendir.3: Specify feature traits for fdopendir(3)
Date: Mon, 24 May 2010 07:11:41 +0200
Message-ID: <AANLkTilczvzAUkAkHMQhOd03_z9xlOluPlUuAv2AVj0g@mail.gmail.com>
References: <20100515013419.GO16800@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100515013419.GO16800-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, May 15, 2010 at 3:34 AM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> Currently, there is no note on the fact that fdopendir() is
> POSIX.2008-only.
>
> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

Thanks Petr. Applied for 3.25.

Cheers,

Michael


> ---
>
> diff --git a/man3/opendir.3 b/man3/opendir.3
> index a5c64a3..8e224ee 100644
> --- a/man3/opendir.3
> +++ b/man3/opendir.3
> @@ -39,6 +39,18 @@ opendir, fdopendir \- open a directory
> =A0.BI "DIR *opendir(const char *" name );
> =A0.BI "DIR *fdopendir(int " fd );
> =A0.fi
> +.sp
> +.in -4n
> +Feature Test Macro Requirements for glibc (see
> +.BR feature_test_macros (7)):
> +.in
> +.sp
> +.BR fdopendir ():
> +.br
> +Since glibc 2.10: _XOPEN_SOURCE >=3D 700 || _POSIX_C_SOURCE >=3D 200=
809L
> +.br
> +Before glibc 2.10:
> +_GNU_SOURCE
> =A0.SH DESCRIPTION
> =A0The
> =A0.BR opendir ()
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
