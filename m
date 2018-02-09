From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tmpfs(5): document current mount options
Date: Fri, 9 Feb 2018 07:13:49 +0100
Message-ID: <9a82d629-6731-7dc2-4b14-4833f7b180ea@gmail.com>
References: <20180127095928.6294-1-vapier@gentoo.org>
 <d92fae63-5d6a-56ea-1a69-973bee77395c@gmail.com>
 <20180205094352.tphbanrjsf5zp5jn@ws.net.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205094352.tphbanrjsf5zp5jn-xkT7n84Rsxv/9pzu0YdTqQ@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Karel Zak <kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Karel,

On 02/05/2018 10:43 AM, Karel Zak wrote:
> On Sun, Feb 04, 2018 at 10:03:28AM +0100, Michael Kerrisk (man-pages) wrote:
>> On 01/27/2018 10:59 AM, Mike Frysinger wrote:
>>> Some of this content is moved from the mount(8) man page.
>>> Style was based on proc(5) sections.
>>
>> Thanks. I've applied this. I also added some further details for the
>> 'mpol' and 'huge' options, largely drawn from kernel Documentation
>> files. Could you take a quick look at that new content?
>>
>> Is there any other text for mount(8) that should be imported to
>> tmpfs(5)?
> 
> It would be nice to completely remove filesystem specific stuff from
> mount(8). It's already done for filesystems with active community
> (like extN, XFS, etc), but the rest... ;-)
> 
> And another idea... what about to add a generic filesystem(5) (or
> section 7) man page to explain why we have filesystems, relation with
> mkfs programs, block devices, mount(8) ?

Well there is already this:
http://man7.org/linux/man-pages/man5/filesystems.5.html

Obviously, more pieces could be added to it though.

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
