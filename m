From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] posix_fadvise.2: ffix
Date: Fri, 23 Sep 2011 07:08:37 +0200
Message-ID: <CAKgNAkiNsY+gt4-Ci6w4Atx_ZEn5j9C-agwGq4iyo1Ude7O9sw@mail.gmail.com>
References: <1316723402-9367-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1316723402-9367-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi David,

On Thu, Sep 22, 2011 at 10:30 PM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wr=
ote:
>
> Signed-off-by: David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

Thanks. Applied for 3.34.

Cheers,

Michael


> ---
> =A0man2/posix_fadvise.2 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man2/posix_fadvise.2 b/man2/posix_fadvise.2
> index dac3c9b..740e691 100644
> --- a/man2/posix_fadvise.2
> +++ b/man2/posix_fadvise.2
> @@ -171,7 +171,7 @@ system call that orders the arguments suitably:
> =A0.in
> =A0.PP
> =A0The behavior of this system call is otherwise exactly the same as
> -.BR posix_fadvise().
> +.BR posix_fadvise ().
> =A0No library support is provided for this system call in glibc.
> =A0.\" No ARM support in glibc.
> =A0.SH BUGS
> --
> 1.7.6.3
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
