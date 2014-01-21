From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] strtod.3: ATTRIBUTES: Note functions that are thread
 safe with exceptions
Date: Tue, 21 Jan 2014 11:08:22 +0800
Message-ID: <52DDE4A6.5070405@cn.fujitsu.com>
References: <1390205712-10266-1-git-send-email-penght@cn.fujitsu.com> <20140120122841.GC29966@aym.net2.nerim.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140120122841.GC29966-956IwFboN44acnK+F/IuxqxOck334EZe@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


On 01/20/2014 08:28 PM, Andre Majorel wrote:
>> +.BR strtold ()
>> +functions are thread-safe with exceptions.
>> +These functions can be safely used in multithreaded applications,
>> +as long as
>> +.BR setlocale (3)
>> +is not called to change the locale.
> 

The sentence is from the Oracle Solaris's manpages.

> Is the requirement that all threads be in the same locale ? Or
> that the thread that calls strtod() not use setlocale() at all ?
> Or maybe that setlocale() not be called by anyone after threads
> are created ? Or even that setlocale() not be used AT ALL by the
> process ?
> 
> It's not obvious to me which it is !
> 
> I think that a more specific wording would be useful.
> 

In a locale other than the standard "C" or "POSIX" locales, these function may
recognize additional locale-dependent syntax.
When these functions and setlocale() are simultaneously called in multithreaded applications,
these functions will not be thread safe.


-- 
Best Regards,
Peng
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
