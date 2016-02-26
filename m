From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] times.2: an incorrect description in NOTES
Date: Fri, 26 Feb 2016 16:38:45 +0100
Message-ID: <56D07185.3090102@gmail.com>
References: <A08AE9AAF58B274598D033A64FFA03C613167122@G01JPEXMBYT04>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <A08AE9AAF58B274598D033A64FFA03C613167122@G01JPEXMBYT04>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Kondo, Naoya" <kondo-naoya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Naoya,

On 02/26/2016 05:34 AM, Kondo, Naoya wrote:
> Hi,
> 
> times(2) man page has an incorrect description in NOTES, it says that
> (2^32/HZ) - 300 is about 429 million. It is correct only if HZ=10 which
> does not look common today. So just removing "(i.e., about 429 million)"
> is good enough.

Thanks for the patch. I've applied it.

Cheers,

Michael

> ----
> Signed-off-by: Naoya Kondo <kondo-naoya-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
> 
> --- man-pages-4.04/man2/times.2	2015-12-29 21:51:44.000000000 +0900
> +++ man-pages-4.04-fix/man2/times.2	2016-02-25 12:04:33.062739815 +0900
> @@ -168,7 +168,7 @@
>  is measured has varied across kernel versions.
>  On Linux 2.4 and earlier this point is the moment the system was booted.
>  Since Linux 2.6, this point is \fI(2^32/HZ) \- 300\fP
> -(i.e., about 429 million) seconds before system boot time.
> +seconds before system boot time.
>  This variability across kernel versions (and across UNIX implementations),
>  combined with the fact that the returned value may overflow the range of
>  .IR clock_t ,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
