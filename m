From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH V2] fgetgrent.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Feb 2015 16:20:36 +0800
Message-ID: <54DB10D4.1050508@cn.fujitsu.com>
References: <1423640156-25233-1-git-send-email-mashimiao.fnst@cn.fujitsu.com> <54DB0AE3.1080406@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54DB0AE3.1080406-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,
On 02/11/2015 03:55 PM, Michael Kerrisk (man-pages) wrote:
> On 02/11/2015 08:35 AM, Ma Shimiao wrote:
>> The marking matches glibc marking.
>>
>> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>> ---
>>  man3/fgetgrent.3 | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/man3/fgetgrent.3 b/man3/fgetgrent.3
>> index 57665dd..e599483 100644
>> --- a/man3/fgetgrent.3
>> +++ b/man3/fgetgrent.3
>> @@ -90,6 +90,18 @@ is set to indicate the cause.
>>  Insufficient memory to allocate
>>  .I group
>>  structure.
>> +.SH ATTRIBUTES
>> +For an explanation of the terms used in this section, see
>> +.BR attributes (7).
>> +.TS
>> +allbox;
>> +lb lb lb
>> +l l l.
>> +Interface	Attribute	Value
>> +T{
>> +.BR fgetgrent ()
>> +T}	Thread safety	MT-Unsafe race:fgrent
> 
> Why the change here in the V2? What does "fgrent" refer to?

race:fgrent is right mark, I made a mistake.
race:fgrent is similar to race:grent.
race:grent is used to indicate data race exists in getgrent(), setgrent() and endgrent(). 
race:fgrent is used to indicate data race exists when using fgetgrent() in multi-thread.

Best regards
> 
> Thanks,
> 
> Michael
> 
> 
>> +.TE
>>  .SH CONFORMING TO
>>  SVr4.
>>  .SH SEE ALSO
>>
> 
> 


-- 
Ma Shimiao
Development Dept.I
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
