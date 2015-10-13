From: Rahul Bedarkar <rpal143-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 1/1] pthread_detach.3: remove invalid and confusing statement
Date: Tue, 13 Oct 2015 09:18:30 +0530
Message-ID: <CA+NV+Vmh7SHoqyToYbznHeO6qgr=c0dfw=4hnT5d0=VSNP5eNQ@mail.gmail.com>
References: <1443247457-3507-1-git-send-email-rahulbedarkar89@gmail.com> <5616DBB4.7060903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5616DBB4.7060903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Oct 9, 2015 at 2:40 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Rahul,
>
> On 09/26/2015 07:04 AM, Rahul Bedarkar wrote:
>> In notes section, statement
>>
>> "(But note that the resources of all threads are freed when the
>> process terminates.)"
>>
>> is confusing and invalid. In Linux, we don't really need to wait
>> until application termination for system resources to be freed unless
>> there is bug in application logic.
>
> While I'm not sure that that sentence is essential, it does serve
> to remind the reader that all resources are freed on process
> termination, regardless of whether pthread_detach() and pthread_join()
> are used.
>
> It's not clear to me why you find it confusing or invalid.
> Can you say more?

Hi Michael,

Why it should be a special case about pthread that we should mention
that all resources are freed on process termination which is feature
of an Operating system.

When we don't mention it in open.2 or free.3, I thought it should not
be mentioned in pthread case, as it is something not related to it.

The sentence in bracket looks more confusing if we read previous one.

"Either pthread_join(3) or pthread_detach() should be called for each
thread that an application creates, so that  system  resources for the
thread can be released.  (But note that the resources of all threads
are freed when the process terminates.)"

I think above sentences convey that you should call either
pthread_join() or pthread_detach() so that resources are can be freed.
But note that those won't get freed until process is terminated.

That's why it looks confusing to me and looks invalid because note in
bracket conveys different meaning than intended.

Regards,
Rahul

>
> Thanks,
>
> Michael
>
>
>> Signed-off-by: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  man3/pthread_detach.3 | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/man3/pthread_detach.3 b/man3/pthread_detach.3
>> index 106914b..2c53409 100644
>> --- a/man3/pthread_detach.3
>> +++ b/man3/pthread_detach.3
>> @@ -101,8 +101,6 @@ or
>>  .BR pthread_detach ()
>>  should be called for each thread that an application creates,
>>  so that system resources for the thread can be released.
>> -(But note that the resources of all threads are freed when the
>> -process terminates.)
>>  .SH EXAMPLE
>>  The following statement detaches the calling thread:
>>
>>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
