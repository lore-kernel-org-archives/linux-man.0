From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tmpfs(5): document current mount options
Date: Fri, 9 Feb 2018 07:13:03 +0100
Message-ID: <529bc7c4-9ff2-25f9-5956-cb85f012d6cb@gmail.com>
References: <20180127095928.6294-1-vapier@gentoo.org>
 <d92fae63-5d6a-56ea-1a69-973bee77395c@gmail.com>
 <20180205161817.GD9138@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205161817.GD9138@vapier>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Mike,

On 02/05/2018 05:18 PM, Mike Frysinger wrote:
> On 04 Feb 2018 10:03, Michael Kerrisk (man-pages) wrote:
>> On 01/27/2018 10:59 AM, Mike Frysinger wrote:
>>> Some of this content is moved from the mount(8) man page.
>>> Style was based on proc(5) sections.
>>
>> Thanks. I've applied this.
> 
> you meant commit 462a385e9a239ac58e0db188d1d7ed94f36c2d6f ?  was the
> author change a typo ?  am i more than person and didn't realize ?

Yes, I messed up while amending a commit :-(. I'll fix that for the
manually produced changelog.

>> I also added some further details for the
>> 'mpol' and 'huge' options, largely drawn from kernel Documentation
>> files. Could you take a quick look at that new content?
> 
> seems fine

Thanks for checking.
 
>> Is there any other text for mount(8) that should be imported to
>> tmpfs(5)?
> 
> i slurped all the tmpfs specific stuff out here.  there's room for
> moving more stuff out, but into new pages.  that'll take more effort.

So, I see there is this text in mount(8):

              Note that trying to mount a tmpfs with an mpol option  will
              fail  if the running kernel does not support NUMA; and will
              fail if its nodelist specifies a node which is not  online.
              If your system relies on that tmpfs being mounted, but from
              time to time runs a kernel built  without  NUMA  capability
              (perhaps  a  safe  recovery  kernel),  or  with fewer nodes
              online, then it is advisable to omit the mpol  option  from
              automatic  mount  options.  It can be added later, when the
              tmpfs is  already  mounted  on  MountPoint,  by  'mount  -o
              remount,mpol=Policy:NodeList MountPoint'.

Will that stay there, or should it move to tmpfs(5)?

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
