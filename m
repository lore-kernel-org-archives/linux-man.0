From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] unicode.7: Document private use areas
Date: Thu, 11 Feb 2016 13:24:15 +0100
Message-ID: <56BC7D6F.8060801@gmail.com>
References: <56B9CD22.3090306@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B9CD22.3090306-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/09/2016 12:27 PM, Dr. Tobias Quathamer wrote:
> there's a quite old bug report in Debian about missing information in
> unicode.7. I've attached a patch with a wording suggestion.
> 
> <https://bugs.debian.org/285444>

Thanks, Tobias. Applied.

Cheers,

Michael


> ---
>  man7/unicode.7 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man7/unicode.7 b/man7/unicode.7
> index b21b5fb..dc586d8 100644
> --- a/man7/unicode.7
> +++ b/man7/unicode.7
> @@ -191,7 +191,7 @@ and
>  tells, how many positions (0\(en2) the cursor is advanced by the
>  output of a character.
>  .PP
> -.SS Private area
> +.SS Private Use Areas (PUA)
>  In the Basic Multilingual Plane,
>  the range 0xe000 to 0xf8ff will never be assigned to any characters by
>  the standard and is reserved for private usage.
> @@ -205,6 +205,11 @@ assigned to the Linux zone is maintained by LANANA and the registry
>  itself is
>  .I Documentation/unicode.txt
>  in the Linux kernel sources.
> +.PP
> +Two other planes are reserved for private usage, plane 15
> +(Supplementary Private Use Area-A, range 0xf0000 to 0xffffd)
> +and plane 16 (Supplementary Private Use Area-B, range
> +0x100000 to 0x10fffd).
>  .SS Literature
>  .IP * 3
>  Information technology \(em Universal Multiple-Octet Coded Character
> -- 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
