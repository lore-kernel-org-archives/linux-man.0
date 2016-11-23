From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] sched/autogroup: Fix 64bit kernel nice adjustment
Date: Wed, 23 Nov 2016 15:20:38 +0100
Message-ID: <34cea28b-c8c7-31e3-e920-90f113d22abe@gmail.com>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
 <1479897217.4306.6.camel@gmx.de>
 <d21cf0b2-5c62-5a49-8758-58793c454cc2@gmail.com>
 <1479910341.4306.46.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479910341.4306.46.camel@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Galbraith <efault@gmx.de>
Cc: mtk.manpages@gmail.com, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@kernel.org>, linux-man <linux-man@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-man@vger.kernel.org

On 11/23/2016 03:12 PM, Mike Galbraith wrote:
> On Wed, 2016-11-23 at 14:47 +0100, Michael Kerrisk (man-pages) wrote:
>> Hello Mike,
>>
>> On 11/23/2016 11:33 AM, Mike Galbraith wrote:
>>> On Tue, 2016-11-22 at 16:59 +0100, Michael Kerrisk (man-pages)
>>> wrote:
>>>
>>>>        ┌─────────────────────────────────────────────────────┐
>>>>        │FIXME                                                │
>>>>        ├─────────────────────────────────────────────────────┤
>>>>        │Regarding the previous paragraph...  My tests  indi‐ │
>>>>        │cate  that writing *any* value to the autogroup file │
>>>>        │causes the task group to get a lower priority.  This │
>>>
>>> Because autogroup didn't call the then meaningless scale_load()...
>>
>> So, does that mean that this buglet kicked in starting (only) in 
>> Linux 4.7 with commit 2159197d66770ec01f75c93fb11dc66df81fd45b?
> 
> Yeah, that gave it teeth.

Thanks for the confirmation. Are you aiming to see the fix 
merged for 4.9, or will this wait for 4.10?

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
