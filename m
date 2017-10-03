From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: LC_MESSAGES is not C99
Date: Tue, 3 Oct 2017 20:41:44 +0200
Message-ID: <e92fcc09-75bc-fb66-11e0-23bb2c2ec0ed@gmail.com>
References: <201107081202.42824.giecrilj@stegny.2a.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201107081202.42824.giecrilj-n4IAqcmFnHAX1+iMCFCb4w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?S8WZacWhdG9mIMW9ZWxlY2hvdnNraQ==?= <giecrilj-n4IAqcmFnHAX1+iMCFCb4w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Křištof

Better late than never...

On 07/08/2011 12:02 PM, Křištof Želechovski wrote:
> Regarding setlocale(3): it should be noted that while setlocale
> itself is in C99, LC_MESSAGES is a POSIX extension. This category
> should not be used in applications that claim to be portable outside
> POSIX, such as CGIC [1].

I added this text to the page:

       The  C  standards  specify only the categories LC_ALL, LC_COLLATE,
       LC_CTYPE, LC_MONETARY,  LC_NUMERIC,  and  LC_TIME.   POSIX.1  adds
       LC_MESSAGES.  The remaining categories are GNU extensions.

Cheers,

Michael

> 
> Best regards,
> Chris
> 
> ___
> [1] <URL: http://www.boutell.com/cgic/ >
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
