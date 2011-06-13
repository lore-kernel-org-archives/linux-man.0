From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] fix O_DIRECT alignment notes in open(2)
Date: Mon, 13 Jun 2011 15:34:41 -0400
Message-ID: <x49boy17cfi.fsf@segfault.boston.devel.redhat.com>
References: <x49y615izh4.fsf@segfault.boston.devel.redhat.com>
	<BANLkTinRGRO+w6ap0ei_BbQ7kQNHLhkJ7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTinRGRO+w6ap0ei_BbQ7kQNHLhkJ7A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org> (Mark
	Robson's message of "Mon, 13 Jun 2011 20:13:55 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Robson <markxr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Mark Robson <markxr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On 13 June 2011 15:21, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
>> Hi,
>>
>> O_DIRECT requires alignment to the underlying device's logical block
>> size.  It used to be pretty safe to assume this was 512 bytes, but
>> that's no longer the case with the introduction of 4k logical sector
>> size devices.
>>
>> Feel free to change the wording in the man page as you see fit, but
>> here's an example of how it might be fixed...
>>
>
> It seems to me, that we should cite in the man page the system call required
> to get the underlying device's block size. Is this statfs(2) ?

Hi, Mark,

I've added back the CC list, not sure why it was dropped.

I think you would need to issue a BLKSSZGET ioctl to the block device.

Cheers,
Jeff
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
