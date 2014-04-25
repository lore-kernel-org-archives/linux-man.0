From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/1] fcntl: F_GETFL: return value contains additional
 internal flags
Date: Fri, 25 Apr 2014 17:30:44 +0200
Message-ID: <535A7FA4.1000408@gmx.de>
References: <1398369940-13673-1-git-send-email-xypron.glpk@gmx.de> <CAKgNAkgi3XZY4v8JBPZjP=5sOmKpQPEMbaFJ8OSRnMW-+PyxLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgi3XZY4v8JBPZjP=5sOmKpQPEMbaFJ8OSRnMW-+PyxLQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 25.04.2014 15:46, Michael Kerrisk (man-pages) wrote:
> Hi Heinrich,
>
> On Thu, Apr 24, 2014 at 10:05 PM, Heinrich Schuchardt
> <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
>> flags = fcntl(fd, F_GETFL);
>>
>> can return more flags than those defined in the open(2) manpage, e.g.
>>    #define FMODE_NONOTIFY 0x1000000
>>
>> The manpage should point this out.
>>
>> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
>
> I think it might be good to mention a concrete example here. So, how
> about explicitly mentioning the FMODE_NONOTIFY and the fanotify(7) man
> page. Could you redraft?

Please, read my mail
Re: fanotify API: FMODE_NONOTIFY, FMODE_EXEC, FMODE_NOCMTIME
13.04.2014 16:05 (CEST)
http://www.spinics.net/lists/linux-man/msg05366.html

I mentioned that some other flags can be returned by fcntl, too. These 
are not specific to fanotify. The examples given were

0x20 (FMODE_EXEC), and
0x800 (FMODE_NOCMTIME)

All relevant flags are defined in
include/uapi/asm-generic/fcntl.h

So would it not make more sense to relate to this include instead of 
fanotify(7)?

I never got a reply to the question asked in aforementioned mail, 
whether the observed behavior should be mentioned in the BUGS section of 
fanotify(7).

Cheers

Heinrich

> Thanks,
>
> Michael
>
>
>> ---
>>   man2/fcntl.2 | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/man2/fcntl.2 b/man2/fcntl.2
>> index fc1d3b3..0fd2d0a 100644
>> --- a/man2/fcntl.2
>> +++ b/man2/fcntl.2
>> @@ -180,6 +180,9 @@ The file status flags and their semantics are described in
>>   Get the file access mode and the file status flags;
>>   .I arg
>>   is ignored.
>> +The return value contains the file status flags as described in
>> +.IR open (2).
>> +It may additionally contain status flags that are only used internally.
>>   .TP
>>   .BR F_SETFL " (\fIint\fP)"
>>   Set the file status flags to the value specified by
>> --
>> 1.9.2
>>
>
>
>

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
