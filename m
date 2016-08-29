From: Mats Wichmann <mats-mBRmNHn34rVzbRFIqnYvSA@public.gmane.org>
Subject: Re: Man page bug report about pthread_join
Date: Mon, 29 Aug 2016 15:48:33 -0600
Message-ID: <279302ac-6ca2-a061-8d98-42ff6ea5a3cd@wichmann.us>
References: <CAPrqJzHFonOuZW+k=G662CK59gpftyUCdPsYFSRUWRRDbfCaLQ@mail.gmail.com>
 <590f86e0-6af1-5fd6-d1ac-c798acbd4763@gmail.com>
 <d3925e02-c02a-b969-5221-ea98fcbadbaf@wichmann.us>
 <eccff3a8-f68a-4843-5ce6-b14976b260be@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <eccff3a8-f68a-4843-5ce6-b14976b260be-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?546L5a6I5aCw?= <wangshouyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/29/2016 01:59 PM, Michael Kerrisk (man-pages) wrote:
> Hello Mats,

>> The wording here comes off kind of awkward. How about this as an
>> alternate thought:
>>
>> If retval is not NULL, pthread_join shall return a pointer to a location
>> containing the exit status of the target thread in retval. If the target
>> thread was canceled, the exit status will indicate PTHREAD_CANCELED.
> 
> I guess it's in the eye of the beholder. 

of course.


>> While we're here, this page doesn't mention the justification for
>> joining in the first place, which is to have an opportunity to clean up
>> after a thread exits - or rather, it is mentioned, but in a negative
>> sense ("failure to join with a thread that is joinable..."). I don't
>> immediately have a proposal, but could think about it if anyone believes
>> that's a good idea.
> 
> I added a sentence at the end of the first paragraph in NOTES:
> 
>        After a successful call to pthread_join(), the caller  is  guaran‐
>        teed  that  the target thread has terminated.  <<The caller may then
>        choose to do any clean-up that is required  after  termination  of
>        the  thread  (e.g.,  freeing  memory  or other resources that were
>        allocated to the target thread).>>
> 
> Helpful?

Yes, I think that improves things.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
