From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Typo in memchr(3)
Date: Fri, 9 Sep 2011 15:47:00 +0200
Message-ID: <CAKgNAkgqtDWzof__c_z2fiB=C9Jh76UQ1P4-utadPBTo8KSzng@mail.gmail.com>
References: <CAM2GC0CrzxG9hT9ACF6gHnjQwdgrJjid0kW1wZ3VWmDOOT_tpQ@mail.gmail.com>
 <CAKgNAkg1rEDPezU+Q0AvSJEb4vYJ=KXCAmoC_1kk3BMVz9CUDQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkg1rEDPezU+Q0AvSJEb4vYJ=KXCAmoC_1kk3BMVz9CUDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Laire <johannes-Dl1KTzG68bE@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

[Resending to linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org]

On Thu, Sep 8, 2011 at 6:07 PM, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Aug 15, 2011 at 9:39 AM, Johannes Laire <johannes-Dl1KTzG68bE@public.gmane.org> wrote:
>> memchr(3)
>>> If the character c is not in the string s, then rawmemchr() may proceed to
>>> search beyond the end of the string, and the result is unspecified. The
>>> folowing call is a fast means of locating a string's terminating null byte:
>>
>> The word "folowing" needs a second "l". Also, "undefined" instead of
>> "unspecified" would be more in line with common C usage.
>
> Thanks. Fixed for man-pages-3.33.
>
> Cheers,
>
> Michael
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Author of "The Linux Programming Interface"; http://man7.org/tlpi/
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
