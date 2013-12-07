From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Miscount in ld.so(8)
Date: Sat, 07 Dec 2013 14:34:18 -0800
Message-ID: <52A3A26A.6040104@gmail.com>
References: <CAMmAXYx_hckjpmm38Jsv+Qq=Jzay8kEikhbT5Yd8kEiON6TkXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMmAXYx_hckjpmm38Jsv+Qq=Jzay8kEikhbT5Yd8kEiON6TkXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alfred Agrell <alfred-q+Fw1ITNTbbiB9QmIjCX8w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/28/13 03:22, Alfred Agrell wrote:
> The ENVIRONMENT section of ld.so(8) says "There are four important
> environment variables", then lists six environment variables.
> 
> Version and distribution used:
> <http://man7.org/linux/man-pages/man8/ld.so.8.html>, version 3.54,
> dated 2013-07-15. I believe that is the latest version and the highest
> upstream.
> 

Thanks. I've applied the patch below.

Cheers,

Michael


-- a/man8/ld.so.8
+++ b/man8/ld.so.8
-There are four important environment variables.
+Among the more important environment variables are the following:
 .TP
 .B LD_ASSUME_KERNEL
 (glibc since 2.2.3)

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
