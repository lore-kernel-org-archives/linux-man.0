From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] wmemchr.3: Reformat thread-safety information
Date: Wed, 25 Jun 2014 09:36:10 +0800
Message-ID: <53AA278A.20607@cn.fujitsu.com>
References: <1403225013-17384-1-git-send-email-penght@cn.fujitsu.com> <53A3CC51.7030101@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53A3CC51.7030101-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On 06/20/2014 01:53 PM, Michael Kerrisk (man-pages) wrote:
> Thank you, Haitao. Applied.
> 
> Might I ask you to review my changes to the following:
> 

I have reviewed all the changes in the following man-pages and
sent the patch "[PATCH] des_crypt.3: tfix" to fix trivial errors.


-- 
Best Regards,
Peng

>     adjtime.3
>     aio_error.3
>     aio_return.3
>     alloca.3
>     asinh.3
>     atan.3
>     basename.3
>     bcmp.3
>     bcopy.3
>     bsd_signal.3
>     byteorder.3
>     bzero.3
>     catgets.3
>     cbrt.3
>     ceil.3
>     cimag.3
>     clock_getcpuclockid.3
>     conj.3
>     copysign.3
>     cos.3
>     cproj.3
>     creal.3
>     crypt.3
>     daemon.3
>     des_crypt.3
>     difftime.3
>     dirfd.3
>     div.3
>     drand48_r.3
>     dysize.3
>     ecvt.3
>     encrypt.3
>     erf.3
>     erfc.3
>     ether_aton.3
> 
> Mainly, I'd like you to double check that I do not introduce errors
> (e.g., changing "not thread safe" to "MT-Safe"). There's a lot of 
> tedious cut and paste work involved, so there's a chance to add
> an error. (I already reviewed my changes, but I may have missed
> something.)
> 
> Cheers,
> 
> Michael
> 
> 
> 
> On 06/20/2014 02:43 AM, Peng Haitao wrote:
>> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>> ---
>>  man3/wmemchr.3 | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/man3/wmemchr.3 b/man3/wmemchr.3
>> index e038f74..d4fe235 100644
>> --- a/man3/wmemchr.3
>> +++ b/man3/wmemchr.3
>> @@ -49,10 +49,17 @@ or NULL if
>>  does
>>  not occur among these.
>>  .SH ATTRIBUTES
>> -.SS Multithreading (see pthreads(7))
>> -The
>> +For an explanation of the terms used in this section, see
>> +.BR attributes (7).
>> +.TS
>> +allbox;
>> +lb lb lb
>> +l l l.
>> +Interface	Attribute	Value
>> +T{
>>  .BR wmemchr ()
>> -function is thread-safe.
>> +T}	Thread safety	MT-Safe
>> +.TE
>>  .SH CONFORMING TO
>>  C99.
>>  .SH SEE ALSO
>>
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
