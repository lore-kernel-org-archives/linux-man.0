From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man-pages: ffix: Use an en-dash for ranges, numeric and
 alphabetic
Date: Tue, 22 Aug 2017 01:54:51 +0200
Message-ID: <14a1658d-1a6c-280a-4f49-74248f70e321@gmail.com>
References: <1502968702-32042-1-git-send-email-bjarniig@rhi.hi.is>
 <1664c5ff-5639-b5dc-0ebe-95e6defec4db@gmail.com>
 <20170821233238.GA3333@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170821233238.GA3333-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/22/2017 01:32 AM, Bjarni Ingi Gislason wrote:
> On Sat, Aug 19, 2017 at 10:06:40PM +0200, Michael Kerrisk (man-pages) wrote:
> [...]
>> I applied most of the changes here manually, since there were conflicts
>> with parallel changes I was making.
>>
>> Thanks for the patch. For future large patches, it would be good
>> to get some advance warning of the proposed changes, to prevent the
>> possibility of conflicts.
>>
> 
>   Yes.  I did not check the repository nor the mailing list, but do now.

Thanks.

>   I could have redone the patches after you where finished with your current
> changes.

I attempted to save you the trouble.

>   You have made some bad changes, used a minus (\-) (or an em-dash (typing
> error?) instead of the typographically correct en-dash, '\(en'.

Thanks for checking. I have fixed the em-dash cases now. The cases using \-
all occur in code (C or shell), and the convention there has long been to
use \-. In fact, I think \- and \(en might be exactly the same.

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
