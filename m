From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: shmget.2: format fix
Date: Wed, 07 Jan 2015 07:05:38 +0100
Message-ID: <54ACCCB2.20302@gmail.com>
References: <CALhU9tmwe8YmqU7L1o+ioBsR2LNRkOwtd6sCjd4ygva7qd2G6Q@mail.gmail.com> <54AB92A5.8060606@gmail.com> <CALhU9tk432R51QRqENgsqWCGRfeKswaats+AkrDD4VB96Ejnzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tk432R51QRqENgsqWCGRfeKswaats+AkrDD4VB96Ejnzw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Akihiro,

On 01/06/2015 05:06 PM, Akihiro Motoki wrote:
> Hi Michael,
> 
> Thanks for the feedback. The intention of using italic sounds reasonable
> and keeping it as-is looks good to me.
> 
> I would like to mention one point.
> When I first saw this, I thought it is a variable/parameter, but it wasn't.
> Italic style is used for two purposes: variable name and emphasis.
> Though it is a general topic, I personally prefer to bold for
> emphasizing a word.

Thanks for persisting a little further with this report.

So, as I reflect on this, I think the problem is a little subtler.
In most cases, it's easy to determine whether italic is used for
emphasis (because the italicized string is something that does not 
look like an identifier) or for an identifier. In this particular
case, it's not 100% obvious: because 'pages' looks like something
that could be a variable name, one has to pause to work out whether
it is or not. I think the solution here is to use a different 
formulation, one that removes the need for the reader to resolve 
this ambiguity, and I changed the wording to:

[[
.B SHMALL
System-wide limit on the total amount of shared memory,
measured in units of the system page size.
]]

Okay?

Cheers,

Michael


> 2015-01-06 16:45 GMT+09:00 Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> Hello Akihiro Motoki,
>>
>> Thanks for the patch. However, I think I think it is perhaps a little
>> better to leave the text as is. The point of the .I is to emphasize
>> that the unit of this limit is *pages*, while for several of the
>> other limits it is *bytes*. Does that sound okay?
>>
>> Cheers,
>>
>> Michael
>>
>> On 01/04/2015 10:37 PM, Akihiro Motoki wrote:
>>> diff --git a/man2/shmget.2 b/man2/shmget.2
>>> index 213a451..6d318d8 100644
>>> --- a/man2/shmget.2
>>> +++ b/man2/shmget.2
>>> @@ -283,9 +283,7 @@ The following limits on shared memory segment
>>> resources affect the
>>>  call:
>>>  .TP
>>>  .B SHMALL
>>> -System-wide limit on the number of
>>> -.I pages
>>> -of shared memory.
>>> +System-wide limit on the number of pages of shared memory.
>>>
>>>  On Linux, this limit can be read and modified via
>>>  .IR /proc/sys/kernel/shmall .
>>>
>>>
>>
>>
>> --
>> Michael Kerrisk
>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>> Linux/UNIX System Programming Training: http://man7.org/training/
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
