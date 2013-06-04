From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] mbrlen.3: ATTRIBUTES: Note function that is thread safe
 with exceptions
Date: Tue, 04 Jun 2013 16:15:22 +0800
Message-ID: <51ADA21A.7090102@cn.fujitsu.com>
References: <1369820111-7081-1-git-send-email-penght@cn.fujitsu.com> <51A73299.7020709@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51A73299.7020709-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On 05/30/2013 07:06 PM, Michael Kerrisk wrote:
>> @@ -66,6 +66,12 @@ and sets \fIerrno\fP to \fBEILSEQ\fP, if an invalid multibyte sequence was
>>  encountered.
>>  It returns \fI(size_t)\ \-2\fP if it couldn't parse a complete multibyte
>>  character, meaning that \fIn\fP should be increased.
>> +.SH ATTRIBUTES
>> +.SS Multithreading(see pthreads(7))
> 
> Space added before "(see)" (and also in a number of other patches
> you already sent.
> 

Got it, thanks.


-- 
Best Regards,
Peng

> Thanks,
> 
> Michael
> 
> 
>> +The
>> +.BR mbrlen ()
>> +function is thread-safe with exceptions.
>> +It is not thread-safe if called with a NULL \fIps\fP parameter.
>>  .SH CONFORMING TO
>>  C99.
>>  .SH NOTES
>>
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
