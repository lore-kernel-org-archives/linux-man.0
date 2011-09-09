From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] arp.7: minor rewording
Date: Fri, 9 Sep 2011 15:47:17 +0200
Message-ID: <CAKgNAkhE-Kx3Ve8TZZB=yp_iVmc4MPe==3pR1bgPGJBd+FQN3w@mail.gmail.com>
References: <4E5E41A8.80600@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E41A8.80600-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Hi.
>
> man-pages version: latest git repository
> why: field arp_pa is not a socket, but a struct sockaddr address.
>
>
> diff --git a/man7/arp.7 b/man7/arp.7
> --- a/man7/arp.7
> +++ b/man7/arp.7
> @@ -100,7 +100,7 @@ capability or an effective UID of 0.
> .I arp_pa
> must be an
> .B AF_INET
> -socket and
> +address and
> .I arp_ha
> must have the same type as the device which is specified in
> .IR arp_dev .
>
>
> And more minor patches will follow.

Thanks. Fixed for man-pages-3.33.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
