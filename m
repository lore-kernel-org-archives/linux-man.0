From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Wed, 07 Jan 2015 07:16:48 +0100
Message-ID: <54ACCF50.4070001@gmail.com>
References: <544118FA.3070003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <544118FA.3070003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>"Michael Kerrisk (gmail)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Ma Shimiao,

You can see the whole discussion thread here:

http://thread.gmane.org/gmane.linux.man/7223

Thanks,

Michael


On 10/17/2014 03:26 PM, Michael Kerrisk (man-pages) wrote:
> Hello Haitao,
> 
> I was comparing some of the MT-Safety markings in man-pages versus the glibc
> manual (https://www.gnu.org/software/libc/manual/html_mono/libc.html)
> I found four cases that seem to contradict. Are there errors in either
> the man pages or in the glibc manual?
> 
> ==
> ctermid.3       MT-Unsafe race:ctermid/!s
> 	glibc: MT-Safe
> 
> man-pages and glibc manual disagree (man-pages seems to be more
> precise than glibc).
> 
> ==
> getcwd.3        MT-Safe env
> 	glibc: MT-Safe
> 
> man-pages and glibc manual disagree on "env" (man-pages seems 
> to be more precise than glibc).
> 
> ==
> getlogin.3      MT-Unsafe race:cuserid/!string locale
> 	glibc: MT-Unsafe race:getlogin race:utent sig:ALRM timer locale
> 
> man-pages and glibc manual disagree on "race:cuserid/!string" versus
> "race:getlogin"
> 
> ==
> regex.3         MT-Safe env
> 	glibc: MT-Safe locale
> 
> man-pages and glibc manual disagree on "env" versus "locale"
> 
> ==
> 
> Cheers,
> 
> Michael
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
