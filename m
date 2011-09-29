From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] stpcpy(3)/stpncpy(3): add POSIX.1-2008 standard info
Date: Thu, 29 Sep 2011 06:30:49 +0200
Message-ID: <CAKgNAkhGvydAfEJP=iku3Va-YhWAgPWsBcu8Ax7aqEWX0mYa8w@mail.gmail.com>
References: <1317149575-16752-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1317149575-16752-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Tue, Sep 27, 2011 at 8:52 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> Update the "CONFORMING TO" sections of these functions to mention tha=
t it
> is now part of the POSIX.1-2008 standard. =A0Also link in stpncpy(3) =
from
> the strncpy(3) man page.

Thanks. Applied (in two pieces--splitting out the last minor change) fo=
r 3.35.

Cheers,

Michael


> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
> =A0man3/stpcpy.3 =A0| =A0 =A09 +++++----
> =A0man3/stpncpy.3 | =A0 =A02 +-
> =A0man3/strcpy.3 =A0| =A0 =A01 +
> =A03 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/man3/stpcpy.3 b/man3/stpcpy.3
> index 40b951a..16e849b 100644
> --- a/man3/stpcpy.3
> +++ b/man3/stpcpy.3
> @@ -64,10 +64,10 @@ returns a pointer to the \fBend\fP of the string
> =A0\fIdest\fP (that is, the address of the terminating null byte)
> =A0rather than the beginning.
> =A0.SH "CONFORMING TO"
> -This function is not part of the C or POSIX.1 standards, and is
> -not customary on UNIX systems, but is not a GNU invention either.
> -Perhaps it comes from MS-DOS.
> -Nowadays, it is also present on the BSDs.
> +This function was added to POSIX.1-2008. Before that, it was not par=
t of
> +the C or POSIX.1 standards, nor customary on UNIX systems, but was n=
ot a
> +GNU invention either. Perhaps it came from MS-DOS. It is also presen=
t on
> +the BSDs.
> =A0.SH EXAMPLE
> =A0For example, this program uses
> =A0.BR stpcpy ()
> @@ -100,6 +100,7 @@ This function may overrun the buffer
> =A0.BR memccpy (3),
> =A0.BR memcpy (3),
> =A0.BR memmove (3),
> +.BR stpncpy (3),
> =A0.BR strcpy (3),
> =A0.BR string (3),
> =A0.BR wcpcpy (3)
> diff --git a/man3/stpncpy.3 b/man3/stpncpy.3
> index b4f78d8..04ec7c8 100644
> --- a/man3/stpncpy.3
> +++ b/man3/stpncpy.3
> @@ -62,7 +62,7 @@ returns a pointer to the terminating null
> =A0in \fIdest\fP, or, if \fIdest\fP is not null-terminated,
> =A0\fIdest + n\fP.
> =A0.SH "CONFORMING TO"
> -This function is a GNU extension.
> +This function was added to POSIX.1-2008. Before that, it was a GNU e=
xtension.
> =A0.SH "SEE ALSO"
> =A0.BR strncpy (3),
> =A0.BR wcpncpy (3)
> diff --git a/man3/strcpy.3 b/man3/strcpy.3
> index e79451d..ce72ad8 100644
> --- a/man3/strcpy.3
> +++ b/man3/strcpy.3
> @@ -138,6 +138,7 @@ in ways that may make the impossible possible.
> =A0.BR memcpy (3),
> =A0.BR memmove (3),
> =A0.BR stpcpy (3),
> +.BR stpncpy (3),
> =A0.BR strdup (3),
> =A0.BR string (3),
> =A0.BR wcscpy (3),
> --
> 1.7.6.1
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
