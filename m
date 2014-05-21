From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [patch] fanotify.7: Fix description of FAN_EVENT_NEXT()
Date: Wed, 21 May 2014 08:19:25 +0200
Message-ID: <537C456D.5090005@gmx.de>
References: <53799494.2080609@gmail.com> <537A5454.2040707@gmx.de> <537B05F5.7010800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537B05F5.7010800-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 20.05.2014 09:36, Michael Kerrisk (man-pages) wrote:
> Hi Heinrich,
>
> On 05/19/2014 08:58 PM, Heinrich Schuchardt wrote:
>> Hello Michael,
>>
>> the proposed new description of FAN_EVENT_NEXT is correct.
>
> Thanks for checking. I've added a Reviewed-by for you.
>
>>
>> Should FAN_EVENT_METADATA_LEN also be put into the section with macros?
>>
>> .B FAN_EVENT_METADATA_LEN
>> This macro returns the size of structure
>> .I fanotify_event_metadata
>> in bytes.
>> This is the minimum size (and currently the only size) of any event
>> metadata.
>
> I'm inclined not to, but I might be wrong. Is there a reason that
> user-space might use it?

FAN_EVENT_METADATA_LEN is the minimum size of a buffer used to read 
fanotify events. Of cause the user may use sizeof to calculate it 
himself. Anyway there is already some mentioning of 
FAN_EVENT_METADATA_LEN in fanotify.7.

You remarked inotify read buffers should be 4 byte aligned on some CPUs.
Shouldn't the same hold true for fanotify?

Best regards

Heinrich

>
> Cheers,
>
> Michael
>
>
>> On 19.05.2014 07:20, Michael Kerrisk (man-pages) wrote:
>>> Hi Heinrich,
>>>
>>> I realized that the description of FAN_EVENT_NEXT() is not quite correct.
>>> It does not update 'meta', but instead returns a pointer to the next
>>> structure. I tried also to add a bit more detail to the description.
>>> Does the following patch look okay to you?
>>>
>>> Cheers,
>>>
>>> Michael
>>>
>>>
>>> --- a/man7/fanotify.7
>>> +++ b/man7/fanotify.7
>>> @@ -309,13 +309,24 @@ against the length of the metadata structure and the
>>>    field of the first metadata structure in the buffer.
>>>    .TP
>>>    .B FAN_EVENT_NEXT(meta, len)
>>> -This macro sets the pointer
>>> -.I meta
>>> -to the next metadata structure using the length indicated in the
>>> +This macro uses the length indicated in the
>>>    .I event_len
>>> -field of the metadata structure and reduces the remaining length of the
>>> -buffer
>>> -.IR len .
>>> +field of the metadata structure pointed to by
>>> +.IR meta
>>> +to calculate the address of the next metadata structure that follows
>>> +.IR meta .
>>> +.I len
>>> +is the number of bytes of metadata that currently remain in the buffer.
>>> +The macro returns a pointer to the next metadata structure that follows
>>> +.IR meta ,
>>> +and reduces
>>> +.I len
>>> +by the number of bytes in the the metadata structure that
>>> +has been skipped over (i.e., it subtracts
>>> +.IR meta\->event_len
>>> +from
>>> +.IR len ).
>>> +.\"
>>>    .SS Monitoring an fanotify file descriptor for events
>>>    When an fanotify event occurs, the fanotify file descriptor indicates as
>>>    readable when passed to
>>>
>>
>>
>
>

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
