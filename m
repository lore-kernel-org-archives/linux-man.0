From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: cgroups(7): documenting /sys/kernel/cgroup files
Date: Wed, 10 Jan 2018 20:14:20 +0100
Message-ID: <16c30b5d-d2c6-ffb0-9374-f48cb3bc154a@gmail.com>
References: <ff431fd8-f1c1-ed8d-2d69-64ea83a8a505@gmail.com>
 <CAKgNAkhk-527Rh6tGYJO-U3UXgwBC1+t5nB+5JEq62nTO2p15A@mail.gmail.com>
 <20180110124407.GA26913@castle.DHCP.thefacebook.com>
 <20180110140239.GX3668920@devbig577.frc2.facebook.com>
 <20180110174457.GI3668920@devbig577.frc2.facebook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <cgroups-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180110174457.GI3668920-4dN5La/x3IkLX0oZNxdnEQ2O0Ztt9esIQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: cgroups-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Roman Gushchin <guro-b10kYP2dOMg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:CONTROL GROUP (CGROUP)" <cgroups-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 01/10/2018 06:44 PM, Tejun Heo wrote:
> On Wed, Jan 10, 2018 at 06:02:39AM -0800, Tejun Heo wrote:
>> Hello,
>>
>> On Wed, Jan 10, 2018 at 04:44:14AM -0800, Roman Gushchin wrote:
>>> cgroup.threads is not listed because it's not delegatable (doesn't have
>>> CFTYPE_NS_DELEGATABLE flag set). I don't know if it was intended or just
>>> an accident (I believe the latter).
>>
>> So, thread mode isn't delegatble.  Marking a cgroup as threaded turns
>> that subtree threaded and join the parent's domain, so we can't allow
>> delegation roots to be turned threaded - just like we can't mark the
>> root cgroup threaded, and I'm not really not sure what it means to
>> delegate a portion of threaded subtree.
> 
> Please disregard.
> 
> Just like we can't mark the root cgroup threaded, we can't mark
> delegated subtree root's threaded, so cgroup.type is not delegatable.
> 
> However, the delegated root's children can definitely be marked
> threadaed and they will join the delegated root's domain and the
> threads are free to move between root and the threaded subtree.

Exactly, so cgroup.threads in the threaded root must be made
writable by the delegatee.

Thanks, Tejun.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
