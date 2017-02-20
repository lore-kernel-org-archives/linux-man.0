From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc(5): clarify /proc/pid/environ behavior
Date: Mon, 20 Feb 2017 22:01:10 +0100
Message-ID: <3c4f7684-c49f-85dc-10c1-513b6182a0a9@gmail.com>
References: <20170215221654.10293-1-vapier@gentoo.org>
 <a6982b2f-7cd6-ad1d-d375-0a41ab539084@gmail.com>
 <20170220185458.GH28432@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170220185458.GH28432@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 02/20/2017 07:54 PM, Mike Frysinger wrote:
> On 20 Feb 2017 15:16, Michael Kerrisk (man-pages) wrote:
>> Thanks! Patch applied. I tweaked somewhat, in particular to further clarify
>> the file content is set at execve(2) time. Does the following look okay
>> to you?

Thanks for checkining, Mike.

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
