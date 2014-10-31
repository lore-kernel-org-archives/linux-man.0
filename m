From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ilogb manpage
Date: Fri, 31 Oct 2014 07:27:19 +0100
Message-ID: <54532BC7.3000304@gmail.com>
References: <CANu=DmhD79gzEoXR=cSoKkQC6rzYwrP_iGD-Ljn6zf9GWFY0Qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANu=DmhD79gzEoXR=cSoKkQC6rzYwrP_iGD-Ljn6zf9GWFY0Qg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Newton <will.newton-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Will,

On 10/29/2014 01:18 PM, Will Newton wrote:
> Hi,
> 
> The ilogb manpage currently claims that errno is not set on error:
> 
>        Domain error: x is 0 or a NaN
>               An invalid floating-point exception (FE_INVALID) is raised.
> 
>               These functions do not set errno for this case.
> 
>        Domain error: x is an infinity
> 
>               These functions do not set errno or raise an exception
> for this case.
> 
> However this is at odds with the ISO C standard an the most recent glibc code:
> 
> int
> __ilogb (double x)
> {
>   int r = __ieee754_ilogb (x);
>   if (__builtin_expect (r == FP_ILOGB0, 0)
>       || __builtin_expect (r == FP_ILOGBNAN, 0)
>       || __builtin_expect (r == INT_MAX, 0))
>     {
>       __set_errno (EDOM);
>       feraiseexcept (FE_INVALID);
>     }
>   return r;
> }

Thanks for the report. Things were fixed in glibc 2.16
( https://www.sourceware.org/bugzilla/show_bug.cgi?id=6794 )
and I've now updated the man page.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
