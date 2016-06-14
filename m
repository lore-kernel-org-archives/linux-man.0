From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: locale.5, repertoiremap.5: clarify keyword syntax
Date: Tue, 14 Jun 2016 18:36:07 +0200
Message-ID: <4426c2fa-1ae9-03a9-05bb-525d6a653599@gmail.com>
References: <575E5E9B.9030301@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575E5E9B.9030301-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/13/2016 09:19 AM, Marko Myllynen wrote:
> Hi Michael,
> 
> All the glibc locale/repertoiremap files use the format described in the
> patch below, the fix is trivial (and adds an example just in case), I
> presume these were copypasted from charmaps.5 page, all the glibc charmaps
> use slightly different format for keywords (I'll send a separate patch
> to address charmaps.5 next).

Thanks, Marko. Applied!

Cheers,

Michael


> ---
>  man5/locale.5        |  8 +++++---
>  man5/repertoiremap.5 | 14 ++++++++++----
>  2 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index ad2aac0..4889d39 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -41,13 +41,13 @@ for additional details for these categories.
>  The locale definition file starts with a header that may consist
>  of the following keywords:
>  .TP
> -.I <escape_char>
> +.I escape_char
>  is followed by a character that should be used as the
>  escape-character for the rest of the file to mark characters that
>  should be interpreted in a special way.
>  It defaults to the backslash (\\).
>  .TP
> -.I <comment_char>
> +.I comment_char
>  is followed by a character that will be used as the
>  comment-character for the rest of the file.
>  It defaults to the number sign (#).
> @@ -168,7 +168,9 @@ Room number, door designation.
>  Floor number.
>  .TP
>  %C
> -Country designation, from the <country_post> keyword.
> +Country designation, from the
> +.I country_post
> +keyword.
>  .TP
>  %l
>  Local township within town or city (since glibc 2.24).
> diff --git a/man5/repertoiremap.5 b/man5/repertoiremap.5
> index be473f7..93b7770 100644
> --- a/man5/repertoiremap.5
> +++ b/man5/repertoiremap.5
> @@ -33,12 +33,12 @@ names are used instead of now preferred Unicode code points.
>  The repertoiremap file starts with a header that may consist of the
>  following keywords:
>  .TP
> -.I <comment_char>
> +.I comment_char
>  is followed by a character that will be used as the
>  comment character for the rest of the file.
>  It defaults to the number sign (#).
>  .TP
> -.I <escape_char>
> +.I escape_char
>  is followed by a character that should be used as the escape character
>  for the rest of the file to mark characters that should be interpreted
>  in a special way.
> @@ -50,9 +50,9 @@ in the first column.
>  
>  The mapping lines have the following form:
>  .TP
> -.I <symbolic-name> <code-point> <comment>
> +.I <symbolic-name> <code-point> comment
>  This defines exactly one mapping,
> -.I <comment>
> +.I comment
>  being optional.
>  .PP
>  The mapping section ends with the string
> @@ -63,6 +63,12 @@ The mapping section ends with the string
>  Usual default repertoire map path.
>  .SH CONFORMING TO
>  POSIX.2.
> +.SH EXAMPLE
> +A mnemonic for the Euro sign can be defined as follows:
> +.PP
> +.nf
> +<Eu> <U20AC> EURO SIGN
> +.fi
>  .SH NOTES
>  Repertoire maps are deprecated in favor of Unicode code points.
>  .SH SEE ALSO
> 
> Thanks,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
