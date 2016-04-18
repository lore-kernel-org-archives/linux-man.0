From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: locale.5: adjust LC_IDENTIFICATION / abbreviation
Date: Mon, 18 Apr 2016 13:53:36 +0100
Message-ID: <5714D8D0.1020406@gmail.com>
References: <571489AA.7070105@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <571489AA.7070105-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/18/2016 08:15 AM, Marko Myllynen wrote:
> Hi Michael,
> 
> Tiny tweak to locale.5 based on the on ISO/IEC TR 14652:
> 
> http://www.open-std.org/jtc1/SC22/WG20/docs/n972-14652ft.pdf


Patch applied. Thanks, Marko!

Cheers,

Michael


> ---
>  man5/locale.5 | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index da46ef7..6772ac4 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -587,8 +587,7 @@ followed by a description of any special application
>  for which this document is intended.
>  .TP
>  .I abbreviation
> -.\" as far as I can tell... (mtk)
> -followed by the short name for this document.
> +followed by the short name for provider of the source of this document.
>  .TP
>  .I revision
>  followed by the revision number of this document.
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
