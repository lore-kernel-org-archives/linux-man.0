From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Man page bug report about pthread_join
Date: Tue, 30 Aug 2016 07:59:36 +1200
Message-ID: <eccff3a8-f68a-4843-5ce6-b14976b260be@gmail.com>
References: <CAPrqJzHFonOuZW+k=G662CK59gpftyUCdPsYFSRUWRRDbfCaLQ@mail.gmail.com>
 <590f86e0-6af1-5fd6-d1ac-c798acbd4763@gmail.com>
 <d3925e02-c02a-b969-5221-ea98fcbadbaf@wichmann.us>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d3925e02-c02a-b969-5221-ea98fcbadbaf-mBRmNHn34rVzbRFIqnYvSA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mats Wichmann <mats-mBRmNHn34rVzbRFIqnYvSA@public.gmane.org>, =?UTF-8?B?546L5a6I5aCw?= <wangshouyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Mats,

On 08/30/2016 04:41 AM, Mats Wichmann wrote:
> On 08/28/2016 03:58 PM, Michael Kerrisk (man-pages) wrote:
>> Hello 王守堰,
>>
>> On 08/24/2016 09:11 PM, 王守堰 wrote:
>>> Hi:
>>>   I have checked the newest version of pthread_join at
>>> *http://man7.org/linux/man-pages/man3/pthread_join.3.html
>>> <http://man7.org/linux/man-pages/man3/pthread_join.3.html>*
>>>   I think there exists something wront in this sentence:
>>>
>>> If *retval* is not NULL, then *pthread_join*() copies the exit status of
>>>        the target thread (i.e., the value that the target thread supplied to
>>>        pthread_exit(3)
>>> <http://man7.org/linux/man-pages/man3/pthread_exit.3.html>) into the
>>> location pointed to by **retval*.
>>>
>>> I think it should be "into the location pointed to by *retval" *or
>>> "into **retval".*
>>>
>>> Because the actual behavior of pthread_join() is like:  *retval = exit_status;
>>>
>>> But the current man page description means: *(*retval) = exit_status;
>>>
>>> Do you agree with me?
>>>
>>> Hope your reply.
>>
>> I agree that there is a bit of confusion in the wording of the page.
>> I changed this paragraph to read:
>>
>>        If retval is not NULL, then pthread_join() copies the exit  status
>>        of  the target thread (i.e., the value that the target thread sup‐
>>        plied to pthread_exit(3)) into the location pointed to by  retval.
>>        If the target thread was canceled, then PTHREAD_CANCELED is placed
>>        in the location pointed to by retval.
>>
>> Okay?
>>
>> Cheers,
> 
> The wording here comes off kind of awkward. How about this as an
> alternate thought:
> 
> If retval is not NULL, pthread_join shall return a pointer to a location
> containing the exit status of the target thread in retval. If the target
> thread was canceled, the exit status will indicate PTHREAD_CANCELED.

I guess it's in the eye of the beholder. To me, your phrasing sounds a
little awkward :-}. So, for the moment I'm inclined to leave things be.

> I don't think the aside (i.e. the value that ...) adds any value.

Hmm. I don't so far agree. I think it's a helpful tip to the reader to 
let them know where this exit status comes from. Why do you think it 
isn't?

> While we're here, this page doesn't mention the justification for
> joining in the first place, which is to have an opportunity to clean up
> after a thread exits - or rather, it is mentioned, but in a negative
> sense ("failure to join with a thread that is joinable..."). I don't
> immediately have a proposal, but could think about it if anyone believes
> that's a good idea.

I added a sentence at the end of the first paragraph in NOTES:

       After a successful call to pthread_join(), the caller  is  guaran‐
       teed  that  the target thread has terminated.  <<The caller may then
       choose to do any clean-up that is required  after  termination  of
       the  thread  (e.g.,  freeing  memory  or other resources that were
       allocated to the target thread).>>

Helpful?

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
