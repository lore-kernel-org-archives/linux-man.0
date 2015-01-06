From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ilogb.3: tfix
Date: Tue, 06 Jan 2015 08:06:10 +0100
Message-ID: <54AB8962.7070005@gmail.com>
References: <CALhU9t=z4xgTuPqvQ_V_bN=VXYN9NP=qA9YZuOh5fSdEDR7tGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9t=z4xgTuPqvQ_V_bN=VXYN9NP=qA9YZuOh5fSdEDR7tGg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Akihiro Motoki,

Patch applied. Thank you!

Cheers,

Michael

On 01/04/2015 10:30 PM, Akihiro Motoki wrote:
> diff --git a/man3/ilogb.3 b/man3/ilogb.3
> index aeacc29..0e8b8d7 100644
> --- a/man3/ilogb.3
> +++ b/man3/ilogb.3
> @@ -145,7 +145,7 @@ functions are thread-safe.
>  C99, POSIX.1-2001.
>  .SH BUGS
>  .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6794
> -Before version 2.16, the following bugs xisted in the
> +Before version 2.16, the following bugs existed in the
>  glibc implementation of these functions:
>  .IP * 3
>  The domain error case where
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
