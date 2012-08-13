From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: proc(5): minor text updates
Date: Mon, 13 Aug 2012 22:41:38 +0200
Message-ID: <CAKgNAkh_PxqPy+jK0t6WG54KQXOkm2JBTDw69qEtqOsaeTVGAg@mail.gmail.com>
References: <50202153.6030808@googlemail.com> <CAKgNAkhrmpZuF45iOA52akABSm4hUy4ygR=vEg4XQ_4Ri7DjRw@mail.gmail.com>
 <502935C1.60901@googlemail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <502935C1.60901-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tolga Dalman <tolga.dalman-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Tolga,

On Mon, Aug 13, 2012 at 7:13 PM, Tolga Dalman
<tolga.dalman-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hi Michael,
>
> On 08/13/12 09:35, Michael Kerrisk (man-pages) wrote:
>>> while reading the /proc/[pid]/stat part in proc(5), I noticed two minor
>>> issues that should be fixed:
>>>
>>> 1. The text reads: "flags %u (%lu before Linux 2.6.22) kernel flags word
>>> of the process. For bit meanings, see  the  PF_*  defines  in
>>> <linux/sched.h>."
>>>
>>> PF_* is obvisously wrong. It should be CLONE_*.
>>
>> I haven't looked closely, but I think PF_* is correct. Why do you think
>> it's wrong?
>
> To my understanding, flags contains process flags (i.e., CLONE_*), which
> are defined in <linux/sched.h>. PF_* flags, on the other hand, specify
> protocol flags. Those are not related to <linux/sched.h> at all, but defined
> in <bits/socket.h>

Ahh -- yes, an easy mistake to make I think. The thing is there are
two unrelated sets of constants in the PF_* namespace. Take a look in
linux/sched.h to see the other set, which is (AFAICS) the set that is
used in this /proc file.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
