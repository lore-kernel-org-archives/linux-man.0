From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] koi8-u.7: charset pages unification, minor cleanups
Date: Wed, 01 Oct 2014 11:05:56 +0200
Message-ID: <542BC3F4.9090400@gmail.com>
References: <542A860D.7060108@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542A860D.7060108-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 09/30/2014 12:29 PM, Marko Myllynen wrote:
> - adjust references
> - remove stray comments, streamline description
>   (charsets(7) and Wikipedia provide more detailed
>    and up-to-date description)
> - list differences between koi8-r.7 vs koi8-u.7
> - cosmetics

Thanks, Marko. Applied (for the moment, in a local branch).

Cheers,

Michael


> ---
>  man7/koi8-u.7 |   21 +++++++++------------
>  1 files changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/man7/koi8-u.7 b/man7/koi8-u.7
> index b4d63c4..420b160 100644
> --- a/man7/koi8-u.7
> +++ b/man7/koi8-u.7
> @@ -25,24 +25,18 @@
>  .\" 2009-01-15, mtk, Some edits
>  .\"
>  .TH KOI8-U 7 2014-03-18 "Linux" "Linux Programmer's Manual"
> -.nh
>  .SH NAME
> -koi8-u \- Ukrainian character set encoded in octal, decimal, and
> -hexadecimal
> +koi8-u \- Ukrainian character set encoded in octal, decimal,
> +and hexadecimal
>  .SH DESCRIPTION
> -KOI8-U (KOI8 Ukrainian, described in RFC\ 2310)
> -is the de-facto standard character set for encoding Ukrainian texts.
> -KOI8-U is compatible with KOI8-R (RFC 1489)
> -for all Russian letters, and extends KOI8-R with four
> -Ukrainian letters (in both uppercase and lowercase)
> -in locations that are compliant with ISO-IR-111.
> +RFC\ 2310 defines an 8-bit character set, KOI8-U.
> +KOI8-U encodes the
> +characters used in Ukrainian and Byelorussian.
>  .SS KOI8-U characters
>  The following table displays the characters in KOI8-U, which
>  are printable and unlisted in the
>  .BR ascii (7)
>  manual page.
> -.\" The fourth column will only show the proper glyphs
> -.\" in an environment configured for koi8-u.
>  .TS
>  l l l c lp-1.
>  Oct	Dec	Hex	Char	Description
> @@ -193,4 +187,7 @@ The differences from KOI8-R are in the hex positions
>  A4, A6, A7, AD, B4, B6, B7, and BD.
>  .SH SEE ALSO
>  .BR ascii (7),
> -.BR koi8-r (7)
> +.BR charsets (7),
> +.BR iso_8859-5 (7),
> +.BR koi8-r (7),
> +.BR utf-8 (7)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
