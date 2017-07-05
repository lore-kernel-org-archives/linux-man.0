From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getrandom.2: tfix
Date: Wed, 5 Jul 2017 10:20:17 +0200
Message-ID: <7c355f2f-fe4d-ce21-2367-7358175cc443@gmail.com>
References: <248f9a13-139b-9605-bac2-e083f2880aa9@epipe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <248f9a13-139b-9605-bac2-e083f2880aa9-wN/OigK0MJ0AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Janne Snabb <snabb-wN/OigK0MJ0AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/27/2017 07:42 PM, Janne Snabb wrote:

Thanks, Janne. Applied.

Cheers,

Michael

> diff --git a/man2/getrandom.2 b/man2/getrandom.2
> index a550fa5ad..86302759e 100644
> --- a/man2/getrandom.2
> +++ b/man2/getrandom.2
> @@ -178,7 +178,7 @@ can be used to obtain randomness, see
>  Unlike
>  .IR /dev/random
>  and
> -.IR /dev/random ,
> +.IR /dev/urandom ,
>  .BR getrandom ()
>  does not involve the use of pathnames or file descriptors.
>  Thus,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
