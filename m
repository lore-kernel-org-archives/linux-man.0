From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] endian.3: tfix
Date: Mon, 7 May 2012 05:33:09 +1200
Message-ID: <CAKgNAkgT5KtFf1oc+mTM3NSQuxeqbvBXg_RBAWeuzJmsigz51A@mail.gmail.com>
References: <1336322840-14233-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336322840-14233-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, David. Applied!

On Mon, May 7, 2012 at 4:47 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
> =A0man3/endian.3 | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man3/endian.3 b/man3/endian.3
> index e654a5a..ecd0ff6 100644
> --- a/man3/endian.3
> +++ b/man3/endian.3
> @@ -70,7 +70,7 @@ from big-endian order to host byte order.
> =A0The functions with names of the form "le\fInn\fPtoh" convert
> =A0from little-endian order to host byte order.
> =A0.SH VERSIONS
> -These function were added to glibc in version 2.9.
> +These functions were added to glibc in version 2.9.
> =A0.SH "CONFORMING TO"
> =A0These functions are nonstandard.
> =A0Similar functions are present on the BSDs,
> --
> 1.7.10
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
