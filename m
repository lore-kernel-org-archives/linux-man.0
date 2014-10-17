From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getlogin.3: Reformat thread-safety information
Date: Fri, 17 Oct 2014 08:51:35 +0200
Message-ID: <5440BC77.3040906@gmail.com>
References: <1413518358-32200-1-git-send-email-penght@cn.fujitsu.com> <5440B1A9.8020304@gmail.com> <5440B745.9020003@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5440B745.9020003-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC expanded, just in case Carlos and Alexandre have something 
to add]

On 10/17/2014 08:29 AM, Peng Haitao wrote:
> 
> On 10/17/2014 02:05 PM, Michael Kerrisk (man-pages) wrote:
>> Hello Haitao,
>>
>> Just double checking one point. See below.
>>
>> On 10/17/2014 05:59 AM, Peng Haitao wrote:
>>> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>>> ---
>>>  man3/getlogin.3 | 24 ++++++++++++++----------
>>>  1 file changed, 14 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/man3/getlogin.3 b/man3/getlogin.3
>>> index fcbd0fb..828df2b 100644
>>> --- a/man3/getlogin.3
>>> +++ b/man3/getlogin.3
>>> @@ -138,19 +138,23 @@ password database file
>>>  (traditionally \fI/etc/utmp\fP;
>>>  some libc versions used \fI/var/adm/utmp\fP)
>>>  .SH ATTRIBUTES
>>> -.SS Multithreading (see pthreads(7))
>>> -The
>>> +For an explanation of the terms used in this section, see
>>> +.BR attributes (7).
>>> +.TS
>>> +allbox;
>>> +lb lb lb
>>> +l l l.
>>> +Interface	Attribute	Value
>>> +T{
>>>  .BR getlogin ()
>>> -function is not thread-safe.
>>> -.LP
>>> -The
>>> +T}	Thread safety	MT-Unsafe locale
>>
>> Should this be "MT-Safe locale"?
>>
> 
> getlogin() is MT-Unsafe and is influenced by setlocale(),
> So "MT-Unsafe locale" is right.

Thank you for the confirmation.

Just by the way, I see that the glibc manual says of getlogin:

    MT-Unsafe race:getlogin race:utent sig:ALRM timer locale

I guess this covers some cases beyond what you document. Is that
correct?

Thanks,

Michael
-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
