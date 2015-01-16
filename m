From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] getpw.3: Function could return -1 and set errno to zero.
Date: Fri, 16 Jan 2015 16:02:42 -0500
Message-ID: <54B97C72.6060809@redhat.com>
References: <54B8857F.2060307@redhat.com> <54B8B1EB.4040000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B8B1EB.4040000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 01/16/2015 01:38 AM, Michael Kerrisk (man-pages) wrote:
> This patch was broken. (I think you must have prepared a preceding
> patch that you did not send.

Sorry for that, I had a busy tree and was trying to push out all the
temporary patches I had pending.

> I take your point, but I think a little more could be said. I instead
> applied the patch below. Okay?

Yes, modulo what I expect is a typo. Comments inline.

> Thanks,
> 
> Michael
> 
> diff --git a/man3/getpw.3 b/man3/getpw.3
> index cf7eb69..9f2732f 100644
> --- a/man3/getpw.3
> +++ b/man3/getpw.3
> @@ -75,16 +75,26 @@ The
>  function returns 0 on success; on error, it returns \-1, and
>  .I errno
>  is set to indicate the error.
> +
> +If
> +.I uid
> +is not found in the password database,
> +.BR getpw ()
> +returns 0, sets

Should be "returns -1" not "returns 0".

> +.I errno
> +to 0, and leaves
> +.I buf
> +unchanged.
>  .SH ERRORS
>  .TP
> +.BR 0 " or " ENOENT
> +No user corresponding to
> +.IR uid .
> +.TP
>  .B EINVAL
>  .I buf
>  is NULL.
>  .TP
> -.B ENOENT
> -No user corresponding to
> -.IR uid .
> -.TP
>  .B ENOMEM
>  Insufficient memory to allocate
>  .I passwd
> 

OK with that change.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
