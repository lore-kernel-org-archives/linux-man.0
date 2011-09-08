From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] mprotect.2: update example program
Date: Thu, 8 Sep 2011 17:29:09 +0200
Message-ID: <CAKgNAkieafqbv+S54h5B71UAJ_81DrAG9zGAXZ2HKKWpPmbU7w@mail.gmail.com>
References: <4E5E4E6B.10703@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E4E6B.10703-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: The description of the example program says that it makes
> the third page "read-only". Thus PROT_READ instead of PROT_NONE.

Thanks. Applied for 3.33.

Cheers,

Michael


> diff --git a/man2/mprotect.2 b/man2/mprotect.2
> --- a/man2/mprotect.2
> +++ b/man2/mprotect.2
> @@ -207,7 +207,7 @@ main(int argc, char *argv[])
> printf("Start of region: 0x%lx\\n", (long) buffer);
>
> if (mprotect(buffer + pagesize * 2, pagesize,
> - PROT_NONE) == \-1)
> + PROT_READ) == \-1)
> handle_error("mprotect");
>
> for (p = buffer ; ; )
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
