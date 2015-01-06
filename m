From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: shmget.2: format fix
Date: Wed, 7 Jan 2015 01:06:03 +0900
Message-ID: <CALhU9tk432R51QRqENgsqWCGRfeKswaats+AkrDD4VB96Ejnzw@mail.gmail.com>
References: <CALhU9tmwe8YmqU7L1o+ioBsR2LNRkOwtd6sCjd4ygva7qd2G6Q@mail.gmail.com>
 <54AB92A5.8060606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54AB92A5.8060606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

Thanks for the feedback. The intention of using italic sounds reasonable
and keeping it as-is looks good to me.

I would like to mention one point.
When I first saw this, I thought it is a variable/parameter, but it wasn't.
Italic style is used for two purposes: variable name and emphasis.
Though it is a general topic, I personally prefer to bold for
emphasizing a word.

Thanks,
Akihiro

2015-01-06 16:45 GMT+09:00 Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Hello Akihiro Motoki,
>
> Thanks for the patch. However, I think I think it is perhaps a little
> better to leave the text as is. The point of the .I is to emphasize
> that the unit of this limit is *pages*, while for several of the
> other limits it is *bytes*. Does that sound okay?
>
> Cheers,
>
> Michael
>
> On 01/04/2015 10:37 PM, Akihiro Motoki wrote:
>> diff --git a/man2/shmget.2 b/man2/shmget.2
>> index 213a451..6d318d8 100644
>> --- a/man2/shmget.2
>> +++ b/man2/shmget.2
>> @@ -283,9 +283,7 @@ The following limits on shared memory segment
>> resources affect the
>>  call:
>>  .TP
>>  .B SHMALL
>> -System-wide limit on the number of
>> -.I pages
>> -of shared memory.
>> +System-wide limit on the number of pages of shared memory.
>>
>>  On Linux, this limit can be read and modified via
>>  .IR /proc/sys/kernel/shmall .
>>
>>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/

-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
