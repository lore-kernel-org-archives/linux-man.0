From: Kamezawa Hiroyuki <kamezawa.hiroyu-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] proc.5: Add "VmSwap" to /proc/[pid]/status
Date: Thu, 25 Dec 2014 09:15:26 +0900
Message-ID: <549B571E.8080407@jp.fujitsu.com>
References: <E1Y0APl-0002WV-Ai@garkbit.lan> <549984F9.9090501@gmail.com> <20141224002412.GA1719@timegate.de> <549ACCFE.3030809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <549ACCFE.3030809-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sven Hoexter <sven-jJOYKVDXsn5H4x6Dk/4f9A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 2014/12/24 23:26, Michael Kerrisk (man-pages) wrote:
> On 12/24/2014 01:24 AM, Sven Hoexter wrote:
>> On Tue, Dec 23, 2014 at 04:06:33PM +0100, Michael Kerrisk (man-pages) wrote:
>>
>> Hi,
>>
>>> On 12/14/2014 03:20 PM, Sven Hoexter wrote:
>>>> Documented as is in Documentation/filesystems/proc.txt of Linux 3.18.
>>>>
>>>> Signed-off-by: Sven Hoexter <sven-jJOYKVDXsn5H4x6Dk/4f9A@public.gmane.org>
>>>> ---
>>>>   man5/proc.5 | 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/man5/proc.5 b/man5/proc.5
>>>> index 96077d0..b16f2a7 100644
>>>> --- a/man5/proc.5
>>>> +++ b/man5/proc.5
>>>> @@ -1587,6 +1587,7 @@ VmStk:        88 kB
>>>>   VmExe:       572 kB
>>>>   VmLib:      1708 kB
>>>>   VmPTE:        20 kB
>>>> +VmSwap:        0 kB
>>>>   Threads:        1
>>>>   SigQ:   0/3067
>>>>   SigPnd: 0000000000000000
>>>> @@ -1672,6 +1673,9 @@ Shared library code size.
>>>>   .IR VmPTE :
>>>>   Page table entries size (since Linux 2.6.10).
>>>>   .IP *
>>>> +.IR VmSwap :
>>>> +Size of swap usage (the number of referred swapents).
>>>> +.IP *
>>>>   .IR Threads :
>>>>   Number of threads in process containing this thread.
>>>>   .IP *
>>>
>>> Thanks for this patch. I've applied, and added text that the field
>>> appeared in Linux 2.6.34. However, I have a question: what does the
>>> text "(the number of referred swapents)" mean? Is this field
>>> not just reporting a value in kB (i.e., the number of kB across all
>>> swap entries)?
>>
>> I copied the text verbatim from what I found in the proc.txt
>> documentation. To be honest so far I failed to understand
>> what exactly is counted and did not trust the kB unit at all.
>> (It did not matter for my usecase.)
>>
>> Maybe KAMEZAWA Hiroyuki can shed some light on what exactly
>> is counted here and if the kB unit makes sense here and why?
>>
>> Looking at commit b084d4353ff99d824d3bc5a5c2c22c70b1fba722
>> it seems to be a value incremented/decremented with every
>> page table entry moved to swap/moved out of swap, but I'm
>> far away from claiming that this is stuff I understand.
>
> Okay. Pending any input from KAMEZAWA Hiroyuki, I have simply removed
> the text "(the number of referred swapents)".
>

The counter is

  +1 when a page table entry is modified to refer a swap.
  -1 when a page table entry, which referes swap, is modified to some other.

Then, proc.text says "the number of referred swapents". But this may not be
suitable for man pages.

How about, "swapped-out virtual memory size"  ?


Regards,
-Kame








--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
