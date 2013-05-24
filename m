From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] getlogin.3: ATTRIBUTES: Note function that is not thread-safe
Date: Fri, 24 May 2013 08:51:58 +0800
Message-ID: <519EB9AE.6010902@cn.fujitsu.com>
References: <1369298684-892-1-git-send-email-penght@cn.fujitsu.com> <519DF98D.2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <519DF98D.2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On 05/23/2013 07:12 PM, Michael Kerrisk wrote:
>> +The
>> +.BR cuserid ()
>> +function is thread-safe with exceptions.
> 
> Peng,
> 
> I think it would be good to describe the exceptions here. Okay?
> Could you adjust and resent.
> 

OK, thanks.


-- 
Best Regards,
Peng

> Thanks,
> 
> Michael
> 
> 
>>  .SH CONFORMING TO
>>  .BR getlogin ()
>>  and
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
