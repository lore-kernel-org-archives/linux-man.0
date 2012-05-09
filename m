From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getcpu(2): document return/error values
Date: Wed, 9 May 2012 17:12:40 +1200
Message-ID: <CAKgNAkhuKP=cvhb_LY-uNxoWpmq2FN0xVS1FEOdAepbMO=_3tw@mail.gmail.com>
References: <1336516567-21737-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336516567-21737-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, May 9, 2012 at 10:36 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>

Thanks Mike! Applied.

Cheers,

Michael


> ---
> =A0man2/getcpu.2 | =A0 =A09 +++++++++
> =A01 file changed, 9 insertions(+)
>
> diff --git a/man2/getcpu.2 b/man2/getcpu.2
> index 03e724a..a9d0793 100644
> --- a/man2/getcpu.2
> +++ b/man2/getcpu.2
> @@ -48,6 +48,15 @@ The caller must be prepared to handle the situatio=
n when
> =A0and
> =A0.I node
> =A0are no longer the current CPU and node.
> +.SH "RETURN VALUE"
> +On success, 0 is returned.
> +On error, \-1 is returned, and
> +.I errno
> +is set appropriately.
> +.SH ERRORS
> +.TP
> +.B EFAULT
> +Arguments point outside the calling process's address space.
> =A0.SH VERSIONS
> =A0.BR getcpu ()
> =A0was added in kernel 2.6.19 for x86_64 and i386.
> --
> 1.7.9.7
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
