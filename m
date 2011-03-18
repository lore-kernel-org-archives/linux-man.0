From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strerror: improve strerror_r description
Date: Fri, 18 Mar 2011 11:35:09 +0200
Message-ID: <AANLkTim_cCxXXGE_BgSV5ewEQziru=gH0LpeFAWRWdkb@mail.gmail.com>
References: <1300400795-9123-1-git-send-email-eblake@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1300400795-9123-1-git-send-email-eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

On Fri, Mar 18, 2011 at 12:26 AM, Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Signed-off-by: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
[...]
>
> http://sourceware.org/bugzilla/show_bug.cgi?id=3D12204
> documents glibc's change to come into compliance with POSIX
> regarding strerror_r return value. =A0The GNU strerror_r use
> of buf was confusing - I ended up writing a test program that
> proves that buf is unused for valid errnum, but contains
> truncated "unknown message" for out-of-range errnum.

Yeah, the only use of the buffer is to format "unknown error: %d" when
the errno is out of range - in all other cases it returns a constant
string (e.g. "Resource temporary unavailable"). strerror() behaves in
a similar way, and IIRC only when errno is out of bounds, strerror()
is not thread-safe on Linux - at least it was the last time I checked.

I did point this out in a glibc bug, but the reception was not that
warm :). I guess it's too late to change things at this point. OTOH,
this also makes using strerror/strerror_r portably more interesting.

>
> See also http://austingroupbugs.net/view.php?id=3D382
>
> =A0man3/strerror.3 | =A0 18 +++++++++++-------
> =A01 files changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/man3/strerror.3 b/man3/strerror.3
> index 37fc95d..8928a1e 100644
> --- a/man3/strerror.3
> +++ b/man3/strerror.3
> @@ -71,10 +71,10 @@ code passed in the argument \fIerrnum\fP, possibl=
y using the
> =A0part of the current locale to select the appropriate language.
> =A0This string must not be modified by the application, but may be
> =A0modified by a subsequent call to
> -.BR perror (3)
> -or
> =A0.BR strerror ().
> -No library function will modify this string.
> +No other library function, including
> +.BR perror (3),
> +will modify this string.
>
> =A0The
> =A0.BR strerror_r ()
> @@ -84,7 +84,7 @@ but is
> =A0thread safe.
> =A0This function is available in two versions:
> =A0an XSI-compliant version specified in POSIX.1-2001
> -(available since glibc 2.3.4),
> +(available since glibc 2.3.4, but not compliant until glibc 2.13),
> =A0and a GNU-specific version (available since glibc 2.0).
> =A0The XSI-compliant version is provided with the feature test macros
> =A0settings shown in the SYNOPSIS;
> @@ -120,7 +120,9 @@ then at most
> =A0.I buflen
> =A0bytes are stored (the string may be truncated if
> =A0.I buflen
> -is too small) and the string always includes a terminating null byte=
=2E
> +is too small and
> +.I errnum
> +is unknown). =A0The string always includes a terminating null byte.
> =A0.SH "RETURN VALUE"
> =A0The
> =A0.BR strerror ()
> @@ -133,9 +135,10 @@ or an "Unknown error nnn" message if the error n=
umber is unknown.
> =A0The XSI-compliant
> =A0.BR strerror_r ()
> =A0function returns 0 on success;
> -on error, \-1 is returned and
> +on error, glibc 2.13 returns a positive error number, while
> +older versions returned \-1 and set
> =A0.I errno
> -is set to indicate the error.
> +indicate the error instead.

to indicate the error instead?

> =A0.SH ERRORS
> =A0.TP
> =A0.B EINVAL
> @@ -165,6 +168,7 @@ On some systems,
> =A0.\" e.g., Solaris 8, HP-UX 11
> =A0.BR strerror ()
> =A0returns NULL if the error number is unknown.
> +POSIX.1-2008 requires the result to be non-NULL for all inputs.

Maybe you could mention C99 as well, since you were saying it also
mandates this behavior?

Otherwise, the patch looks ok to me.

> =A0On other systems,
> =A0.\" e.g., FreeBSD 5.4, Tru64 5.1B
> =A0.BR strerror ()
> --
> 1.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
