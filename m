From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] catan.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 4 Feb 2015 14:18:27 +0800
Message-ID: <54D1B9B3.5080602@cn.fujitsu.com>
References: <1423029320-11638-1-git-send-email-mashimiao.fnst@cn.fujitsu.com> <54D1B8AF.7070407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54D1B8AF.7070407-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/04/2015 02:14 PM, Michael Kerrisk (man-pages) wrote:
> On 02/04/2015 06:55 AM, Ma Shimiao wrote:
>> The functions catan(), catanf() and catanl() are thread safe.
>> Their markings match glibc markings.
> 
> Hello Ma Shimiao,
> 
> Applied, but fixups were required. See below.

Ah..  I do just want to send a patch V2 to fix them...
> 
>> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>> ---
>>  man3/catan.3 | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/man3/catan.3 b/man3/catan.3
>> index 13e1023..ee4fbe9 100644
>> --- a/man3/catan.3
>> +++ b/man3/catan.3
>> @@ -33,6 +33,20 @@ One has:
>>  .fi
>>  .SH VERSIONS
>>  These functions first appeared in glibc in version 2.1.
>> +.SH ATTRIBUTES
>> +For an explanation of the terms used in this section, see
>> +.BR attributes (7).
>> +.TS
>> +allbox;
>> +lbw28 lb lb
>> +l l l.
>> +Interface  Attribute   Value
> 
> The whitespace above should have been tabs.
> 
>> +T{
>> +.BR catan (),
>> +.BR catanf (),
>> +.BR catanl ()
>> +T} Thread safety   MT-Safe
> 
> The whitespace above should have been tabs.
> 
>> +.TE
>>  .SH CONFORMING TO
>>  C99.
>>  .SH EXAMPLE
> 
> The above errors caused the table not to render. Please do check the
> rendered output for each patch.
> 
> Thanks,
> 
> Michael
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
