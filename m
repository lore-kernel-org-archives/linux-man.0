From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fopen.3: tfix
Date: Mon, 7 May 2012 15:26:33 +1200
Message-ID: <CAKgNAkjLwjJfFmQYixAgTgo4bWCspp1P50J9ckKu5Zgb8Ad_MQ@mail.gmail.com>
References: <1336345829-22237-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336345829-22237-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, May 7, 2012 at 11:10 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wro=
te:
> Introduced in 4d9edb6 and afd6f6.

Thanks David. Applied.

M


> ---
> =A0man3/fopen.3 | =A0 =A06 ++----
> =A01 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/man3/fopen.3 b/man3/fopen.3
> index 820b4ff..b84fe9c 100644
> --- a/man3/fopen.3
> +++ b/man3/fopen.3
> @@ -327,11 +327,9 @@ If that operation is a wide-character operation,
> =A0the stream is marked wide-oriented,
> =A0and functions to convert to the coded character set are loaded.
> =A0.SH BUGS
> -In versions of glibc before
> -.SH BUGS
> =A0When parsing for individual flag characters in
> =A0.IR mode
> -(i.e., the characters preceding the "ccs" specification"),
> +(i.e., the characters preceding the "ccs" specification),
> =A0the glibc implementation of
> =A0.\" FIXME http://sourceware.org/bugzilla/show_bug.cgi?id=3D12685
> =A0.BR fopen ()
> @@ -343,7 +341,7 @@ to 7 (or, in glibc versions before 2.14, to 6,
> =A0which was not enough to include possible specifications such as "r=
b+cmxe").
> =A0The current implementation of
> =A0.BR fdopen ()
> -parses at most 5 characters in in
> +parses at most 5 characters in
> =A0.IR mode .
> =A0.SH "SEE ALSO"
> =A0.BR open (2),
> --
> 1.7.10
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
