From: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: statfs.2: f_spare[4]  or f_spare[5]
Date: Sat, 01 Nov 2014 13:00:12 +0100
Message-ID: <5454CB4C.6000805@redhat.com>
References: <5453FE6F.3010501@redhat.com> <20141101035621.GH26840@vapier.wh0rd.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141101035621.GH26840-eAEk4k+vi/E8xmjh+jFwDmGXanvQGlWp@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/01/2014 04:56 AM, Mike Frysinger wrote:
> On 31 Oct 2014 22:26, Jan Chaloupka wrote:
>> there is probably a wrong number in description of statfs structure. In
>> description section, struct statfs contains as a last field f_spare[5].
>> But the /usr/include/bits/statfs.h itself contains f_spare[4]
>> (glibc-headers-2.18 on f20).
>>
>> Looking into glibc-2.20, there is f_spare[6]. Looks like the structure
>> is gradually evolving :).
>>
>> Inspecting upstream history (gitk statfs.h), it shows it was f_spare[6]
>> since 1997.
> i wonder if we should strip f_spare from the man page.  it's not really useful.

I would prefer to keep f_spare.

As Siddhesh wrote, statfs.h is architecture/OS dependent in general. In 
a case of fedora (f20, f22) armv7hl, x86_64 and i686 has f_spare[4].

We could add a sentence right under struct statfs:
"Depending on your architecture or OS, length of f_spare of statfs 
struct can vary."

> the __SWORD_TYPE should probably be replaced with __fsword_t, and drop the
> __WORDSIZE logic.  that gets ugly with syscall ABIs.

  I am not sure if __SWORD_TYPE is no longer valid type and is replace 
by __fsword_t everywhere (all architectures and OS).

> -mike
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
