From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] locale.5: update BUGS note
Date: Fri, 17 Jul 2015 00:05:43 +0200
Message-ID: <55A82AB7.4080309@gmail.com>
References: <558BB0DE.9060504@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <558BB0DE.9060504-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Marko,

On 06/25/2015 09:42 AM, Marko Myllynen wrote:
> Hi Michael,
> 
> let's at least update the BUGS note in locale(5), not sure is it
> really needed any more at all.

Nah. I'll just kill that section altogether, I think.

Cheers,

Michael

> ---
>  man5/locale.5 | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index 22cda04..2d29b6e 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -1321,7 +1321,9 @@ or
>  depending on whether the week and work week actually starts on Sunday or
>  Monday for the locale.
>  .SH BUGS
> -This manual page isn't complete.
> +The above
> +.I LC_COLLATE
> +section is not complete.
>  .\" .SH AUTHOR
>  .\" Jochen Hein (Hein-SVAqIv1tV6Auki3NsKDZl5HjxUfvIkdz@public.gmane.org)
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
