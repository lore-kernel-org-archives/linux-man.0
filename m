From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] math_error.7: fix typo
Date: Thu, 8 Sep 2011 16:31:49 +0200
Message-ID: <CAKgNAkg+4fRrRYe3NLOX0p_mBf5rRTYvx2T4XdX1ki=MdDmbPg@mail.gmail.com>
References: <4E5E4A27.5040707@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E4A27.5040707-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: and one more typo.
>
>
> diff --git a/man7/math_error.7 b/man7/math_error.7
> --- a/man7/math_error.7
> +++ b/man7/math_error.7
> @@ -191,7 +191,7 @@ This identifier is supposed to indicate which of the two
> error-notification mechanisms
> .RI ( errno ,
> exceptions retrievable via
> -.BR fettestexcept (3))
> +.BR fetestexcept (3))
> is in use.
> The standards require that at least one be in use,
> but permit both to be available.

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
