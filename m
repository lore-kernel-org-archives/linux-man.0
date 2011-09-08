From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] mkstemp.3: added missing character
Date: Thu, 8 Sep 2011 17:30:25 +0200
Message-ID: <CAKgNAkjXw9q3ePUsn_D94E-JyT7SCQ8dqdGnWGDVf5uDW52yPg@mail.gmail.com>
References: <4E5E4B3C.1070007@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E4B3C.1070007-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: ':' character was missed.

Applied for 3.33.

Thanks,

Michael


> diff --git a/man3/mkstemp.3 b/man3/mkstemp.3
> --- a/man3/mkstemp.3
> +++ b/man3/mkstemp.3
> @@ -156,7 +156,7 @@ now \fItemplate\fP is unchanged.
> For
> .BR mkstemps ()
> and
> -.BR mkostemps ()
> +.BR mkostemps ():
> .I template
> is less than
> .I "(6 + suffixlen)"
>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
