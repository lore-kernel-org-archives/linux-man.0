From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] setmntent() takes a filename, not fp
Date: Tue, 15 Sep 2009 06:19:04 +0200
Message-ID: <cfd18e0f0909142119p11f634edj18eb7b6224f64368@mail.gmail.com>
References: <1251893007-18490-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1251893007-18490-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Wed, Sep 2, 2009 at 2:03 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrot=
e:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
> =A0man3/getmntent.3 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man3/getmntent.3 b/man3/getmntent.3
> index f775fa1..32078a5 100644
> --- a/man3/getmntent.3
> +++ b/man3/getmntent.3
> @@ -68,7 +68,7 @@ These routines are used to access the file system d=
escription file
> =A0The
> =A0.BR setmntent ()
> =A0function opens the file system description file
> -\fIfp\fP and returns a file pointer which can be used by
> +\fIfilename\fP and returns a file pointer which can be used by
> =A0.BR getmntent ().
> =A0The argument \fItype\fP is the type of access
> =A0required and can take the same values as the \fImode\fP argument o=
f
> --
> 1.6.4

Thanks. Applied for 3.23.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
