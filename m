From: MaShimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH V2] scalb.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 7 Jan 2015 13:49:46 +0800
Message-ID: <54ACC8FA.5070408@cn.fujitsu.com>
References: <1420594250-18228-1-git-send-email-mashimiao.fnst@cn.fujitsu.com> <54ACC7F2.2020400@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54ACC7F2.2020400-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,
On 01/07/2015 01:45 PM, Michael Kerrisk (man-pages) wrote:
> On 01/07/2015 02:30 AM, Ma Shimiao wrote:
>> The function scalb(), scalbf() and scalbl() are thread safe.
> 
> Hello Ma Shimiao,
> 
> The patches look the same to me. What was the reason for the V2 
> of this patch?
According to your comment, I changed the subject.
I added a space between the colon (:) and ATTRIBUTES.

Thanks,
> 
> Thanks,
> 
> Michael
> 
> 
>> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>> ---
>>  man3/scalb.3 | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/man3/scalb.3 b/man3/scalb.3
>> index 300ad4f..74e954a 100644
>> --- a/man3/scalb.3
>> +++ b/man3/scalb.3
>> @@ -174,6 +174,20 @@ These functions do not set
>>  .\" FIXME . Is it intentional that these functions do not set errno?
>>  .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6803
>>  .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6804
>> +.SH ATTRIBUTES
>> +For an explanation of the terms used in this section, see
>> +.BR attributes (7).
>> +.TS
>> +allbox;
>> +lbw28 lb lb
>> +l l l.
>> +Interface	Attribute	Value
>> +T{
>> +.BR scalb (),
>> +.BR scalbf (),
>> +.BR scalbl ()
>> +T}	Thread safety	MT-Safe
>> +.TE
>>  .SH CONFORMING TO
>>  .BR scalb ()
>>  is specified in POSIX.1-2001, but marked obsolescent.
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
