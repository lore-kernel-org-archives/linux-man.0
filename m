From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] scandir(3): add ENOENT/ENOTDIR errors
Date: Fri, 9 Sep 2011 17:36:35 +0200
Message-ID: <CAKgNAkhvmP6u1=VNHdfGJ0yWPk61Zo3ADRAqW8u0Kwee-AxR8w@mail.gmail.com>
References: <1314889627-26260-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1314889627-26260-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Thu, Sep 1, 2011 at 5:07 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrot=
e:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
> =A0man3/scandir.3 | =A0 =A06 ++++++
> =A01 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/man3/scandir.3 b/man3/scandir.3
> index 8ea5fec..46eaa73 100644
> --- a/man3/scandir.3
> +++ b/man3/scandir.3
> @@ -102,8 +102,14 @@ or greater than zero if the first argument is co=
nsidered to be
> =A0respectively less than, equal to, or greater than the second.
> =A0.SH ERRORS
> =A0.TP
> +.B ENOENT
> +The path in \fIdirp\fR does not exist.
> +.TP
> =A0.B ENOMEM
> =A0Insufficient memory to complete the operation.
> +.TP
> +.B ENOTDIR
> +The path in \fIdirp\fR is not a directory.
> =A0.SH VERSIONS
> =A0.BR versionsort ()
> =A0was added to glibc in version 2.1.

Thanks. Applied for man-pages-3.33.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
