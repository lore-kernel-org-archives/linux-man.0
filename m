From: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: Add description of CLEAR_REFS_MM_HIWATER_RSS
Date: Fri, 9 Sep 2016 14:54:50 +0900
Message-ID: <CAM9d7chCwNcb4qUAu7AvHxfSM+Uab5-qAPfFd9JdjAS4_RQVNg@mail.gmail.com>
References: <20160907150439.21524-1-namhyung@gmail.com> <20160908111946.GA10605@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160908111946.GA10605-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Cermak <petrcermak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

On Thu, Sep 8, 2016 at 8:19 PM, Petr Cermak <petrcermak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Thu, Sep 08, 2016 at 12:04:39AM +0900, Namhyung Kim wrote:
>> The Linux kernel commit 695f05593693 ("fs/proc/task_mmu.c: add
>> user-space support for resetting mm->hiwater_rss (peak RSS)") added a
>> way to reset peak RSS of a process but missed to update manpage.
>>
>> Cc: Petr Cermak <petrcermak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  man5/proc.5 | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/man5/proc.5 b/man5/proc.5
>> index 14588fe..5cb3c85 100644
>> --- a/man5/proc.5
>> +++ b/man5/proc.5
>> @@ -352,6 +352,11 @@ by the check-point restore system to discover which pages of a process
>>  have been dirtied since the file
>>  .IR /proc/[pid]/clear_refs
>>  was written to.
>> +.TP
>> +5 (since Linux 4.0)
>> +.\" Internally: CLEAR_REFS_MM_HIWATER_RSS
>> +Reset the peak resident set size ("high water mark") to the process's
>> +current value.
>>  .RE
>>  .IP
>>  Writing any value to
>> --
>> 2.9.3
>>
>
> Thanks for updating the documentation. I think you should also change
> the line above from:
>
>   "A further value can be written to affect a different bit:"
>
> to:
>
>   "Further values can be written to affect a different properties:"
>
> Apart from that,
>
> Acked-by: Petr Cermak <petrcermak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Thanks, I'll send v2 soon.

Namhyung


-- 
Thanks,
Namhyung Kim
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
