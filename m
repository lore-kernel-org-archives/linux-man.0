From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iso_8859-6.7: charset pages unification, minor cleanups
Date: Wed, 01 Oct 2014 11:23:00 +0200
Message-ID: <542BC7F4.10500@gmail.com>
References: <542A862E.1080408@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542A862E.1080408-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lefteris Dimitroulakis <edimitro-6VGm6rrshF0@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 09/30/2014 12:30 PM, Marko Myllynen wrote:
> - adjust references
> - remove stray comments
> - cosmetics


Thanks, Marko. Applied (for the moment, in a local branch).

Cheers,

Michael




> ---
>  man7/iso_8859-6.7 |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/man7/iso_8859-6.7 b/man7/iso_8859-6.7
> index dcbe58f..84799f8 100644
> --- a/man7/iso_8859-6.7
> +++ b/man7/iso_8859-6.7
> @@ -29,7 +29,8 @@ and hexadecimal
>  .SH DESCRIPTION
>  The ISO 8859 standard includes several 8-bit extensions to the ASCII
>  character set (also known as ISO 646-IRV).
> -ISO 8859-6 encodes the characters used in the Arabic language.
> +ISO 8859-6 encodes the
> +characters used in the Arabic language.
>  .SS ISO 8859 alphabets
>  The full set of ISO 8859 alphabets includes:
>  .TS
> @@ -55,8 +56,6 @@ The following table displays the characters in ISO 8859-6, which
>  are printable and unlisted in the
>  .BR ascii (7)
>  manual page.
> -.\" The fourth column will only show the proper glyphs
> -.\" in an environment configured for ISO 8859-6.
>  .TS
>  l l l c lp-1.
>  Oct	Dec	Hex	Char	Description
> @@ -117,4 +116,6 @@ _
>  ISO 8859-6 lacks the glyphs required for many related languages,
>  such as Urdu and Persian (Farsi).
>  .SH SEE ALSO
> -.BR ascii (7)
> +.BR ascii (7),
> +.BR charsets (7),
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
