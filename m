From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man-pages MT attributes status / update
Date: Mon, 19 Jan 2015 10:16:22 +0100
Message-ID: <54BCCB66.4010102@gmail.com>
References: <54B8CD54.4090701@gmail.com> <54BC6114.3060309@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54BC6114.3060309-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Ma Shimiao

On 01/19/2015 02:42 AM, Ma Shimiao wrote:
> Hello Michael
> 
> On 01/16/2015 04:35 PM, Michael Kerrisk (man-pages) wrote:
[...]
>> I imagine that there are still some remaining differences 
>> between the man-pages and glibc MT-safety markings. Do you have
>> an idea of how many pages remain to be fixed?
> 
> I think there are still 24 pages need to be fixed.
> I hope I can finish them in this week.

Great!

>> By the way, as far as I can tell, we now have all man-pages 
>> attributes markings in the "new look" boxed format. Can you 
>> confirm?
> 
> There is a page man3/iconv.3 which is still not in the "new look".
> Peng has sent a patch to fix it at 10/14/2014 03:39 PM, but the
> patch has not been applied.

Thanks for spotting that! Fixed now.

>> I hope that switching to the new branch does not present 
>> any inconvenience to you. Of course, with this change, now
> 
> No, it doesn't.

Good.

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
