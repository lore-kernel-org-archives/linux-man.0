From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] locale.5: add iconv(1) reference
Date: Wed, 13 May 2015 17:12:10 +0200
Message-ID: <555369CA.2000906@gmail.com>
References: <55531051.3080305@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55531051.3080305-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 05/13/2015 10:50 AM, Marko Myllynen wrote:
> Hi,
> 
> one more tweak to locale(5) page, since it now describes transliteration
> let's add a reference to iconv(1) which has an example how it works and
> how it can be tested.

Applied. Thanks, Marko.

Cheers,

Michael


> ---
>  man5/locale.5 |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/man5/locale.5 b/man5/locale.5
> index a1b94be..40c360e 100644
> --- a/man5/locale.5
> +++ b/man5/locale.5
> @@ -1236,6 +1236,7 @@ This manual page isn't complete.
>  .\" .SH AUTHOR
>  .\" Jochen Hein (Hein-SVAqIv1tV6Auki3NsKDZl5HjxUfvIkdz@public.gmane.org)
>  .SH SEE ALSO
> +.BR iconv (1),
>  .BR locale (1),
>  .BR localedef (1),
>  .BR localeconv (3),
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
