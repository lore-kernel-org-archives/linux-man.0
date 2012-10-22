From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: PATCH: Change manpage of times(2) to recommend clock_gettime(2),
 not gettimeofday(2)
Date: Mon, 22 Oct 2012 15:02:41 +0200
Message-ID: <CAKgNAkhBdRrz92wZm-ETX7vTZoM5xeKgGVvKJ4SkG+a-3X-MQg@mail.gmail.com>
References: <CA+kHd+d7WzVzCUbs2NA+9uVMGCeD9wgUMJ=h2WR1-8sb+e4DYQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+kHd+d7WzVzCUbs2NA+9uVMGCeD9wgUMJ=h2WR1-8sb+e4DYQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Habets <thomas-NmolrwyTDqqzQB+pC5nmwQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Thomas,

On Sun, Oct 7, 2012 at 11:37 PM, Thomas Habets <thomas-NmolrwyTDqqzQB+pC5nmwQ@public.gmane.org> wrote:
> Change manpage of times(2) to recommend clock_gettime(2), not gettimeofday(2)
>
> From times(2):
>   "To measure changes in elapsed time, use gettimeofday(2) instead."
>
> From gettimeofday(2):
>   "POSIX.1-2008 marks gettimeofday() as obsolete, recomending  the
>   use of clock_gettime(2) instead."
>
> Some context, showing how use of gettimeofday() causes actual bugs
> (also read comments):
> http://blog.habets.pp.se/2010/09/gettimeofday-should-never-be-used-to-measure-time

Thanks! Applied.

Cheers,

Michael


> diff --git a/man2/times.2 b/man2/times.2
> index a37874e..020103a 100644
> --- a/man2/times.2
> +++ b/man2/times.2
> @@ -174,7 +174,7 @@ combined with the fact that the returned value may overflow
>  .IR clock_t ,
>  means that a portable application would be wise to avoid using this value.
>  To measure changes in elapsed time, use
> -.BR gettimeofday (2)
> +.BR clock_gettime (2)
>  instead.
>  .\" .PP
>  .\" On older systems the number of clock ticks per second is given
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
