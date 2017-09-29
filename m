From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 1/1] pthread_detach.3: remove invalid and confusing statement
Date: Fri, 29 Sep 2017 18:25:26 +0200
Message-ID: <CAKgNAkhK=dS=dREBdoo3ROwwQ3GXRH5C+dhtAW6GgdyA4mfUNQ@mail.gmail.com>
References: <1443247457-3507-1-git-send-email-rahulbedarkar89@gmail.com>
 <5616DBB4.7060903@gmail.com> <CA+NV+Vmh7SHoqyToYbznHeO6qgr=c0dfw=4hnT5d0=VSNP5eNQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+NV+Vmh7SHoqyToYbznHeO6qgr=c0dfw=4hnT5d0=VSNP5eNQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rahul Bedarkar <rpal143-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Rahul,

A> very late follow-up...

On 13 October 2015 at 05:48, Rahul Bedarkar <rpal143-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Oct 9, 2015 at 2:40 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Rahul,
>>
>> On 09/26/2015 07:04 AM, Rahul Bedarkar wrote:
>>> In notes section, statement
>>>
>>> "(But note that the resources of all threads are freed when the
>>> process terminates.)"
>>>
>>> is confusing and invalid. In Linux, we don't really need to wait
>>> until application termination for system resources to be freed unless
>>> there is bug in application logic.
>>
>> While I'm not sure that that sentence is essential, it does serve
>> to remind the reader that all resources are freed on process
>> termination, regardless of whether pthread_detach() and pthread_join()
>> are used.
>>
>> It's not clear to me why you find it confusing or invalid.
>> Can you say more?
>
> Hi Michael,
>
> Why it should be a special case about pthread that we should mention
> that all resources are freed on process termination which is feature
> of an Operating system.
>
> When we don't mention it in open.2 or free.3, I thought it should not
> be mentioned in pthread case, as it is something not related to it.
>
> The sentence in bracket looks more confusing if we read previous one.
>
> "Either pthread_join(3) or pthread_detach() should be called for each
> thread that an application creates, so that  system  resources for the
> thread can be released.  (But note that the resources of all threads
> are freed when the process terminates.)"
>
> I think above sentences convey that you should call either
> pthread_join() or pthread_detach() so that resources are can be freed.
> But note that those won't get freed until process is terminated.
>
> That's why it looks confusing to me and looks invalid because note in
> bracket conveys different meaning than intended.

So, I changed that last sentence to try to eliminate such an ambiguity:

       Either  pthread_join(3)  or  pthread_detach()  should  be
       called for each thread that an  application  creates,  so
       that  system  resources  for  the thread can be released.
       (But note that the resources of any threads for which one
       of these actions has not been done will be freed when the
       process terminates.)

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
