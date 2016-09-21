From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] quotactl.2 updates
Date: Wed, 21 Sep 2016 15:29:20 +0000
Message-ID: <CACGkJdv9cHAaK0Pdcv9Tzh=7Jyyi7_TFuxnGbttqwVHbpOG9tQ@mail.gmail.com>
References: <20160921032810.GA3699@obsidian> <CAKgNAkiMR9z718TjrFT6gyBm73HQ5RKfCq-qzpp3XYe_ndP0ZQ@mail.gmail.com>
 <CACGkJds0SO5R6pGD0U6ufaedbwMs9WQ2GTsSom+dL8QykXbJOw@mail.gmail.com> <4cf0e63a-1473-89a2-3c01-ca393d686626@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4cf0e63a-1473-89a2-3c01-ca393d686626-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

 -e trace=fadvise64_64
On Wed, Sep 21, 2016 at 1:55 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 09/21/2016 08:28 AM, Eugene Syromyatnikov wrote:
>> On Wed, Sep 21, 2016 at 5:55 AM, Michael Kerrisk (man-pages)
>> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Hi Eugene
>>>
>>> On 21 September 2016 at 05:28, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> Hello.
>>>>
>>>> The following set of patches provides set of updates for the quotactl.2
>>>> man page, mostly regarding XFS-specific subcommands.
>>>
>>> The patch series looks good. It'd he helpful to know how you derived
>>> the information in the patches. Could you tell me?
>> Sure, I've got this information by looking at kernel (mostly
>> fs/quota/quota.c, fs/quota/dquot.c, include/uapi/linux/quota.h,
>> include/uapi/linux/dqblk_xfs.h, include/linux/quota.h) and glibc
>> (sysdeps/unix/sysv/linux/sys/quota.h) sources during the course of
>> writing test for strace's quotactl syscall decoder.
>
> Thanks, Eugene. I've applied your patches, and done some editing.
> Could you please review the version pushed to git, and let me know if there
> are any issues?
Sure. I've checked it and found no regressions of any kind, thank you.
I do see some places for further improvement hovewer (minor additions
and clarifications, mostly), I'll provide them with another patchset
once they will be finalized.

> Cheers,
>
> Michael
>
>
>>>
>>> Thanks,
>>>
>>> Michael
>>>
>>>
>>>>
>>>> eSyr (4):
>>>>   quotactl.2: Additions regarding project quotas
>>>>   quotactl.2: Updated information regarding disk quota flags
>>>>   quotactl.2: Updated information regarding XFS-specific quotactl
>>>>     subcommands
>>>>   quotactl.2: wfix
>>>>
>>>>  man2/quotactl.2 |  260 ++++++++++++++++++++++++++++++++++++++++++++++++-------
>>>>  1 file changed, 229 insertions(+), 31 deletions(-)
>>>>
>>>> --
>>>> 1.7.10.4
>>>>
>>>
>>>
>>>
>>> --
>>> Michael Kerrisk
>>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>>> Linux/UNIX System Programming Training: http://man7.org/training/
>>
>>
>>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/



-- 
Eugene "eSyr" Syromyatnikov
mailto:evgSyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
xmpp:eSyr@jabber.{ru|org}
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
