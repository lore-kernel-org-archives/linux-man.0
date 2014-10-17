From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] getlogin.3: Reformat thread-safety information
Date: Fri, 17 Oct 2014 15:49:26 +0800
Message-ID: <5440CA06.7010908@cn.fujitsu.com>
References: <1413518358-32200-1-git-send-email-penght@cn.fujitsu.com> <5440B1A9.8020304@gmail.com> <5440B745.9020003@cn.fujitsu.com> <5440BC77.3040906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5440BC77.3040906-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


On 10/17/2014 02:51 PM, Michael Kerrisk (man-pages) wrote:
> [CC expanded, just in case Carlos and Alexandre have something 
> to add]
> 
> On 10/17/2014 08:29 AM, Peng Haitao wrote:
>>
>> On 10/17/2014 02:05 PM, Michael Kerrisk (man-pages) wrote:
>>> Hello Haitao,
>>>
>>> Just double checking one point. See below.
>>>
>>> On 10/17/2014 05:59 AM, Peng Haitao wrote:
>>>> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>>>> ---
>>>>  man3/getlogin.3 | 24 ++++++++++++++----------
>>>>  1 file changed, 14 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/man3/getlogin.3 b/man3/getlogin.3
>>>> index fcbd0fb..828df2b 100644
>>>> --- a/man3/getlogin.3
>>>> +++ b/man3/getlogin.3
>>>> @@ -138,19 +138,23 @@ password database file
>>>>  (traditionally \fI/etc/utmp\fP;
>>>>  some libc versions used \fI/var/adm/utmp\fP)
>>>>  .SH ATTRIBUTES
>>>> -.SS Multithreading (see pthreads(7))
>>>> -The
>>>> +For an explanation of the terms used in this section, see
>>>> +.BR attributes (7).
>>>> +.TS
>>>> +allbox;
>>>> +lb lb lb
>>>> +l l l.
>>>> +Interface	Attribute	Value
>>>> +T{
>>>>  .BR getlogin ()
>>>> -function is not thread-safe.
>>>> -.LP
>>>> -The
>>>> +T}	Thread safety	MT-Unsafe locale
>>>
>>> Should this be "MT-Safe locale"?
>>>
>>
>> getlogin() is MT-Unsafe and is influenced by setlocale(),
>> So "MT-Unsafe locale" is right.
> 
> Thank you for the confirmation.
> 
> Just by the way, I see that the glibc manual says of getlogin:
> 
>     MT-Unsafe race:getlogin race:utent sig:ALRM timer locale
> 
> I guess this covers some cases beyond what you document. Is that
> correct?
> 

Yes.
I think "race:getlogin" result in MT-Unsafe.
"race:getlogin" is equal to the sentences in manpage:
getlogin() returns a pointer to a string containing ...
The string is statically allocated and might be overwritten on
subsequent calls to this function or to cuserid().


-- 
Best Regards,
Peng

> Thanks,
> 
> Michael
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
