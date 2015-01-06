From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Addition to memcmp(3)
Date: Tue, 06 Jan 2015 07:33:30 +0100
Message-ID: <54AB81BA.5010504@gmail.com>
References: <E1XqHLn-00041P-MO@fangorn.moria.de> <CAKgNAkjb4Kp+KmYj1uL9qXSJBj0JKWz8G0+eyD6UFJKFbGGPzQ@mail.gmail.com> <E1Y66PS-0000RC-IQ@palantir.moria.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1Y66PS-0000RC-IQ-lBFDS8/7i9huFsqOOl7tcLNAH6kLmebB@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/31/2014 12:41 AM, Michael Haardt wrote:
>> I placed this piece in a new NOTES section.
>>
>> Some text here about what one should do instead of using memcmp()
>> might be helpful. Do you have any suggestions?
> 
> Obviously a comparison with constant CPU usage is asked for, which is
> rather easy to implement given that secrets are usually only compared
> for being equal.  AFAIK neither POSIX nor C99 offers a function for that.
> I don't know if glibc does.  NetBSD does (consttime_memequal), but that
> does not help portable code, so I have no good suggestion really.

Thanks. I'll add this text to the page:

+Instead, a function that performs comparisons in constant time is required.
+Some operating systems provide such a function (e.g., NetBSD's
+.BR const_memequal ()),
+but no such function is specified in POSIX.
+On Linux, it may be necessary to implement such a function oneself.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
