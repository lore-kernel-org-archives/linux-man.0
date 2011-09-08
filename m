From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] math_error.7: fix typo
Date: Thu, 8 Sep 2011 16:27:59 +0200
Message-ID: <CAKgNAkjDtrT_wjtxSNFoaWuyLcWd7z_7PDcQbE-iB9VOhEeDZw@mail.gmail.com>
References: <4E5E49E7.8070207@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E49E7.8070207-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: just a typo.
>
>
> diff --git a/man7/math_error.7 b/man7/math_error.7
> --- a/man7/math_error.7
> +++ b/man7/math_error.7
> @@ -169,7 +169,7 @@ positive number in the specified type").
> .I errno
> may be set to
> .BR ERANGE ,
> -and an "overflow"
> +and an "underflow"
> .RB ( FE_UNDERFLOW )
> floating-point exception may be raised.

Thanks Seonghun. Applied for man-pages-3.33.

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
