From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] posix_fallocate.3: ATTRIBUTES: Note function that is
 thread-safe
Date: Thu, 5 Jun 2014 08:59:14 +0800
Message-ID: <538FC0E2.8010800@cn.fujitsu.com>
References: <1401760989-14814-1-git-send-email-penght@cn.fujitsu.com> <538F7063.4010300@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538F7063.4010300-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On 06/05/2014 03:15 AM, Michael Kerrisk (man-pages) wrote:
> Hello Haitao,
> 
> A note: my workflow has changed a little. From now on, I'd prefer
> that patches don't update the page timestamp, which instead is 
> now automatically updated by scripts.
> 

Got it, thanks.


-- 
Best Regards,
Peng

> Patch applied. Thank you!
> 
> Cheers,
> 
> Michael
> 
> 
> On 06/03/2014 04:03 AM, Peng Haitao wrote:
>> The function posix_fallocate() is thread safe.
>>
>> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>> ---
>>  man3/posix_fallocate.3 | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/man3/posix_fallocate.3 b/man3/posix_fallocate.3
>> index 6bf4f7c..921ae83 100644
>> --- a/man3/posix_fallocate.3
>> +++ b/man3/posix_fallocate.3
>> @@ -22,7 +22,7 @@
>>  .\" the source, must acknowledge the copyright and authors of this work.
>>  .\" %%%LICENSE_END
>>  .\"
>> -.TH POSIX_FALLOCATE 3  2013-02-12 "GNU" "Linux Programmer's Manual"
>> +.TH POSIX_FALLOCATE 3  2014-06-03 "GNU" "Linux Programmer's Manual"
>>  .SH NAME
>>  posix_fallocate \- allocate file space
>>  .SH SYNOPSIS
>> @@ -100,6 +100,11 @@ refers to a pipe.
>>  .SH VERSIONS
>>  .BR posix_fallocate ()
>>  is available since glibc 2.1.94.
>> +.SH ATTRIBUTES
>> +.SS Multithreading (see pthreads(7))
>> +The
>> +.BR posix_fallocate ()
>> +function is thread-safe.
>>  .SH CONFORMING TO
>>  POSIX.1-2001.
>>  
>>
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
