From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] capabilities.7: fix typo
Date: Thu, 8 Sep 2011 16:25:55 +0200
Message-ID: <CAKgNAkj=S-gGHQuDzdEdJ0Pt6uEsGdvZKCtNRLu7DJ9p6q6eWQ@mail.gmail.com>
References: <4E5E4248.1010602@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E4248.1010602-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: Just a typo. There's no flag named SECURE_KEEP_CAPS.
>
>
> diff --git a/man7/capabilities.7 b/man7/capabilities.7
> --- a/man7/capabilities.7
> +++ b/man7/capabilities.7
> @@ -845,7 +845,7 @@ flags are inherited by child processes.
> During an
> .BR execve (2),
> all of the flags are preserved, except
> -.B SECURE_KEEP_CAPS
> +.B SECBIT_KEEP_CAPS
> which is always cleared.
>
> An application can use the following call to lock itself,

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
