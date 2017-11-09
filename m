From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] clock_getres.2: ffix
Date: Thu, 9 Nov 2017 08:55:16 +0100
Message-ID: <76dbe2de-3460-a268-d54c-93bfb429c335@gmail.com>
References: <55b5b761-3b19-6578-a83d-a2a9f7452459@gmail.com>
 <20171108115827.rachl42whbklzlpi@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171108115827.rachl42whbklzlpi-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/08/2017 12:58 PM, G. Branden Robinson wrote:
> At 2017-11-08T16:25:04+0900, Seonghun Lim wrote:
>> --- a/man2/clock_getres.2
>> +++ b/man2/clock_getres.2
>> @@ -275,7 +275,7 @@ If the CPUs in an SMP system have different clock sources, then
>>  there is no way to maintain a correlation between the timer registers since
>>  each CPU will run at a slightly different frequency.
>>  If that is the case, then
>> -.I clock_getcpuclockid(0)
>> +.BR clock_getcpuclockid(3)
> 
> That's not a man page cross reference, it's an example of a function
> call.

Right. Thanks for checking that Branden.

Cheers,

Michael

> Even if it were a man page cross reference, you would need a space
> between "clock_getcpuclockid" and "(3)".
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
