From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3.1] proc.5: Add description of CLEAR_REFS_MM_HIWATER_RSS
Date: Tue, 20 Sep 2016 14:33:16 +0200
Message-ID: <0e95b43d-a7e5-9b64-cd08-ef021b8e06fe@gmail.com>
References: <20160910021642.2633-1-namhyung@gmail.com>
 <20160910021906.2762-1-namhyung@gmail.com>
 <20160912102745.GA10993@google.com>
 <9de6907d-269e-7662-8f21-f2102f8ae5ca@gmail.com>
 <CAM9d7cjOK3v5+qOq8K_ZYwPeOEVWuNCub_VaTj5ezasMDeYQZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM9d7cjOK3v5+qOq8K_ZYwPeOEVWuNCub_VaTj5ezasMDeYQZQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Petr Cermak <petrcermak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/16/2016 02:57 PM, Namhyung Kim wrote:
> Hi,
> 
> On Tue, Sep 13, 2016 at 5:36 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 09/12/2016 11:27 AM, Petr Cermak wrote:
>>> On Sat, Sep 10, 2016 at 11:19:06AM +0900, Namhyung Kim wrote:
>>>> The Linux kernel commit 695f05593693 ("fs/proc/task_mmu.c: add
>>>> user-space support for resetting mm->hiwater_rss (peak RSS)") added a
>>>> way to reset peak RSS of a process but missed to update manpage.
>>>>
>>>> Cc: Petr Cermak <petrcermak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>> Acked-by: Petr Cermak <petrcermak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>>> Signed-off-by: Namhyung Kim <namhyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>>  man5/proc.5 | 7 ++++++-
>>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/man5/proc.5 b/man5/proc.5
>>>> index 14588fe..5f0abad 100644
>>>> --- a/man5/proc.5
>>>> +++ b/man5/proc.5
>>>> @@ -340,7 +340,7 @@ process during the measured interval.
>>>>  If one is interested only in inspecting the selected mapping types,
>>>>  then the value 2 or 3 can be used instead of 1.
>>>>
>>>> -A further value can be written to affect a different bit:
>>>> +Further values can be written to affect different properties:
>>>>  .RS
>>>>  .TP
>>>>  4 (since Linux 3.11)
>>>> @@ -352,6 +352,11 @@ by the check-point restore system to discover which pages of a process
>>>>  have been dirtied since the file
>>>>  .IR /proc/[pid]/clear_refs
>>>>  was written to.
>>>> +.TP
>>>> +5 (since Linux 4.0)
>>>> +.\" Internally: CLEAR_REFS_MM_HIWATER_RSS
>>>> +Reset the peak resident set size ("high water mark") to the process'
>>>> +current value.
>>>>  .RE
>>>>  .IP
>>>>  Writing any value to
>>>> --
>>>> 2.9.3
>>>>
>>>
>>> Thanks a lot for the modifications.
>>>
>>> One more thing I've just realized: I believe that the correct spelling
>>> is "process's" because it's a singular noun.
>>
>> Yes, that's correct. I've fixed this.
> 
> I'm not a native English speaker so I likely to be wrong.  But IIRC I
> learned it when I was in the school, it should omit the last 's' when
> the word already ends with 's'.  Anyway I'm ok with the change and
> thanks for correcting the expression.

The rule is more complicated than that and tricky enough that even 
native speakers have trouble with it. I have to go check the details 
myself sometimes. As I understand it, "process's" is correct.

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
