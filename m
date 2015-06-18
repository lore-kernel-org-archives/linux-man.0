From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fgetpwent.3: ATTRIBUTES: Note function that is not thread-safe
Date: Thu, 18 Jun 2015 09:02:33 +0200
Message-ID: <55826D09.3040707@gmail.com>
References: <1423640516-25520-1-git-send-email-mashimiao.fnst@cn.fujitsu.com> <5532A1DB.3030009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5532A1DB.3030009-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Zeng Linggang,

This patch from a while ago was sent by Ma Shimiao. Since you've now
taken up the work of Ma Shimiao, I bring you into this discussion.
The patch stalled because of some terminology questions that Ma Shimiao
wanted to resolve with Alexandre (in CC), but I'm not sure if there
was any progress. (I'll thread you into that discussion as well, which
took place off list.) Maybe you can discuss with Ma Shimiao and pursue 
with Alexandre?

Cheers,

Michael


On 04/18/2015 08:26 PM, Michael Kerrisk (man-pages) wrote:
> On 02/11/2015 08:41 AM, Ma Shimiao wrote:
>> The marking matches glibc marking.
> 
> Hello Ma Shimiao,
> 
> This is just a reminder for us both that this patch is awaiting
> resolution of some questions with Alexandre.
> 
> Cheers,
> 
> Michael
> 
>> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>> ---
>>  man3/fgetpwent.3 | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/man3/fgetpwent.3 b/man3/fgetpwent.3
>> index 3076494..3c4a57a 100644
>> --- a/man3/fgetpwent.3
>> +++ b/man3/fgetpwent.3
>> @@ -98,6 +98,18 @@ structure.
>>  .TP
>>  .I /etc/passwd
>>  password database file
>> +.SH ATTRIBUTES
>> +For an explanation of the terms used in this section, see
>> +.BR attributes (7).
>> +.TS
>> +allbox;
>> +lb lb lb
>> +l l l.
>> +Interface	Attribute	Value
>> +T{
>> +.BR fgetpwent ()
>> +T}	Thread safety	MT-Unsafe race:fpwent
>> +.TE
>>  .SH CONFORMING TO
>>  SVr4.
>>  .SH SEE ALSO
>>
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
