From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: Thread-safety of iconv()
Date: Thu, 18 Sep 2014 14:50:37 +0800
Message-ID: <541A80BD.8050509@cn.fujitsu.com>
References: <5416B235.8020309@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5416B235.8020309-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 09/15/2014 05:32 PM, Marko Myllynen wrote:
> Hi Michael, Haitao,
> 
> iconv(3) states:
> 
> ATTRIBUTES
>    Multithreading (see pthreads(7))
>        The iconv() function is thread-safe.
> 
> But iconv_open(3) says:
> 
> A conversion descriptor contains a conversion  state.   After  creation
> using iconv_open(), the state is in the initial state.  Using iconv(3)
> modifies the descriptor's conversion state.  (This implies that a  con-
> version descriptor can not be used in multiple threads simultaneously.)
> To bring the state back to the initial state, use iconv(3) with NULL as
> inbuf argument.
> 
> This looks a bit unclear, do you think you could clarify iconv(3) and/or
> iconv_open(3) a bit in thread-safety regard?
> 

Yes, I will clarify it.

When calling iconv() as iconv(cd, inbuf, ...) and iconv(cd, NULL, ...) 
in multiple threads simultaneously, Segmentation fault may occur.

So, I think the glibc's level "MT-Safe race:cd" is good.
http://www.gnu.org/software/libc/manual/html_mono/libc.html#index-iconv-1

Thanks.

-- 
Best Regards,
Peng
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
