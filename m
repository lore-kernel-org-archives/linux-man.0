From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] cmsg.3: fix typo
Date: Thu, 8 Sep 2011 16:24:28 +0200
Message-ID: <CAKgNAkhba5FhD-F3W=pMjvnyS9igg2AruDpC3Jsni4n08AVHwQ@mail.gmail.com>
References: <4E5E4281.4070205@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E4281.4070205-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
>
>
> diff --git a/man3/cmsg.3 b/man3/cmsg.3
> --- a/man3/cmsg.3
> +++ b/man3/cmsg.3
> @@ -105,7 +105,7 @@ Use
> on the
> .I msghdr
> to get the first control message and
> -.BR CMSG_NEXTHDR ()
> +.BR CMSG_NXTHDR ()
> to get all subsequent ones.
> In each control message, initialize
> .I cmsg_len

Thanks. Applied for man-pages-3.33.

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
