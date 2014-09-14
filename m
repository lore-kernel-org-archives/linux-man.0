From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Q] ether_aton.3: where attributes(7) ?
Date: Sat, 13 Sep 2014 19:05:32 -0700
Message-ID: <5414F7EC.3010409@gmail.com>
References: <20140910134721.03372a02@keeper.home.local> <5411064B.6070601@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5411064B.6070601-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/10/2014 07:17 PM, Peng Haitao wrote:
> 
> On 09/10/2014 05:47 PM, Yuri Kozlov wrote:
>> Hello.
>>
>> >From ether_aton.3:
>> "For an explanation of the terms used in this section, see B<attributes>(7)."
>>
>> I do not found this file in the manpages git.
>>
>> It is external man page?
>>
> 
> attributes(7) has not been applied in manpages.
> http://www.spinics.net/lists/linux-man/msg06315.html

As Haitao notes, there is not yet an attributes(7) page.
I accidentally applied one of Hatao's patches to mainline
instead of another yet-to-be-merged branch,
http://git.kernel.org/cgit/docs/man-pages/man-pages.git/log/?h=attributes_reformat_2 .

Thanks,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
