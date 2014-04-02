From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] mkfifo.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 2 Apr 2014 08:30:04 +0800
Message-ID: <533B5A0C.7000808@cn.fujitsu.com>
References: <1395626006-21719-1-git-send-email-penght@cn.fujitsu.com> <533B0191.7030703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <533B0191.7030703-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


On 04/02/2014 02:12 AM, Michael Kerrisk (man-pages) wrote:
> Thanks. Applied.
> 
> Haitao, something in your mail client changed,
> so that your "real" name no longer comes through as part
> of your messages (i.e., your address shows as
> 
> penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org
> 
> rather than 
> 
> Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> 

Yeah, I found the problem:(

> when I "git am" your patches. At the moment, I'm manually
> fixing the patches to add you real name. Would it e possible

Thank you very much.

> for you to reconfigure your mail client?
> 

Yes, the mail server is modified to Microsoft Exchange.

The mails should be OK in April?


-- 
Best Regards,
Peng

> Thanks,
> 
> Michael
> 
> 
> On 03/24/2014 02:55 AM, penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org wrote:
>> The functions mkfifo() and mkfifoat() are thread safe.
>>
>> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>> ---
>>  man3/mkfifo.3 | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/man3/mkfifo.3 b/man3/mkfifo.3
>> index 849efca..e1c0b84 100644
>> --- a/man3/mkfifo.3
>> +++ b/man3/mkfifo.3
>> @@ -25,7 +25,7 @@
>>  .\"
>>  .\" changed section from 2 to 3, aeb, 950919
>>  .\"
>> -.TH MKFIFO 3 2014-02-21 "GNU" "Linux Programmer's Manual"
>> +.TH MKFIFO 3 2014-03-24 "GNU" "Linux Programmer's Manual"
>>  .SH NAME
>>  mkfifo, mkfifoat \- make a FIFO special file (a named pipe)
>>  .SH SYNOPSIS
>> @@ -181,6 +181,13 @@ was added to glibc in version 2.4.
>>  It is implemented using
>>  .BR mknodat (2),
>>  available on Linux since kernel 2.6.16.
>> +.SH ATTRIBUTES
>> +.SS Multithreading (see pthreads(7))
>> +The
>> +.BR mkfifo ()
>> +and
>> +.BR mkfifoat ()
>> +functions are thread-safe.
>>  .SH CONFORMING TO
>>  .BR mkfifo ():
>>  POSIX.1-2001, POSIX.1-2008.
>>
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
