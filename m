From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: Add "VmSwap" to /proc/[pid]/status
Date: Fri, 26 Dec 2014 07:20:51 +0100
Message-ID: <CAKgNAkgK0Bwcfkz_NYEZF-+XMpCje0Ff4sCPup_xFtbXhCxetQ@mail.gmail.com>
References: <E1Y0APl-0002WV-Ai@garkbit.lan> <549984F9.9090501@gmail.com>
 <20141224002412.GA1719@timegate.de> <549ACCFE.3030809@gmail.com> <549B571E.8080407@jp.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <549B571E.8080407-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kamezawa Hiroyuki <kamezawa.hiroyu-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Cc: Sven Hoexter <sven-jJOYKVDXsn5H4x6Dk/4f9A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Kame,

On Thu, Dec 25, 2014 at 1:15 AM, Kamezawa Hiroyuki
<kamezawa.hiroyu-+CUm20s59erQFUHtdCDX3A@public.gmane.org> wrote:
> On 2014/12/24 23:26, Michael Kerrisk (man-pages) wrote:
>>
>> On 12/24/2014 01:24 AM, Sven Hoexter wrote:
>>>
>>> On Tue, Dec 23, 2014 at 04:06:33PM +0100, Michael Kerrisk (man-pages)
>>> wrote:
>>>
>>> Hi,
>>>
>>>> On 12/14/2014 03:20 PM, Sven Hoexter wrote:
>>>>>
>>>>> Documented as is in Documentation/filesystems/proc.txt of Linux 3.18.
>>>>>
>>>>> Signed-off-by: Sven Hoexter <sven-jJOYKVDXsn5H4x6Dk/4f9A@public.gmane.org>
>>>>> ---
>>>>>   man5/proc.5 | 4 ++++
>>>>>   1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/man5/proc.5 b/man5/proc.5
>>>>> index 96077d0..b16f2a7 100644
>>>>> --- a/man5/proc.5
>>>>> +++ b/man5/proc.5
>>>>> @@ -1587,6 +1587,7 @@ VmStk:        88 kB
>>>>>   VmExe:       572 kB
>>>>>   VmLib:      1708 kB
>>>>>   VmPTE:        20 kB
>>>>> +VmSwap:        0 kB
>>>>>   Threads:        1
>>>>>   SigQ:   0/3067
>>>>>   SigPnd: 0000000000000000
>>>>> @@ -1672,6 +1673,9 @@ Shared library code size.
>>>>>   .IR VmPTE :
>>>>>   Page table entries size (since Linux 2.6.10).
>>>>>   .IP *
>>>>> +.IR VmSwap :
>>>>> +Size of swap usage (the number of referred swapents).
>>>>> +.IP *
>>>>>   .IR Threads :
>>>>>   Number of threads in process containing this thread.
>>>>>   .IP *
>>>>
>>>>
>>>> Thanks for this patch. I've applied, and added text that the field
>>>> appeared in Linux 2.6.34. However, I have a question: what does the
>>>> text "(the number of referred swapents)" mean? Is this field
>>>> not just reporting a value in kB (i.e., the number of kB across all
>>>> swap entries)?
>>>
>>>
>>> I copied the text verbatim from what I found in the proc.txt
>>> documentation. To be honest so far I failed to understand
>>> what exactly is counted and did not trust the kB unit at all.
>>> (It did not matter for my usecase.)
>>>
>>> Maybe KAMEZAWA Hiroyuki can shed some light on what exactly
>>> is counted here and if the kB unit makes sense here and why?
>>>
>>> Looking at commit b084d4353ff99d824d3bc5a5c2c22c70b1fba722
>>> it seems to be a value incremented/decremented with every
>>> page table entry moved to swap/moved out of swap, but I'm
>>> far away from claiming that this is stuff I understand.
>>
>>
>> Okay. Pending any input from KAMEZAWA Hiroyuki, I have simply removed
>> the text "(the number of referred swapents)".
>>
>
> The counter is
>
>  +1 when a page table entry is modified to refer a swap.
>  -1 when a page table entry, which referes swap, is modified to some other.
>
> Then, proc.text says "the number of referred swapents". But this may not be
> suitable for man pages.
>
> How about, "swapped-out virtual memory size"  ?


Thanks. Amended as you suggest.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
