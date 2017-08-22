From: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCTH 0/2] pthread_mutexattr_setrobust() and pthread_mutex_consistent()
Date: Tue, 22 Aug 2017 10:19:48 +0800
Message-ID: <CAJYFCiPM6Hy1cPF2mUBu5bVqxNX+5kvKnJZLhYzMMwuMiHCKeg@mail.gmail.com>
References: <CAJYFCiMZN09HaHpvKgxz3mqzmcaXAWmkz=BmgOW9WVdRKOhDsg@mail.gmail.com>
 <36ab9ec0-b496-c007-c12f-065fd618e7fd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36ab9ec0-b496-c007-c12f-065fd618e7fd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

2017-08-22 8:33 GMT+08:00 Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Hello Yubin
>
> On 08/20/2017 11:42 AM, Yubin Ruan wrote:
>> Hi Michael,
>> This patch series introduce three pthread functions for linux-man:
>>     * pthread_mutexattr_setrobust()
>>     * pthread_mutexattr_getrobust()
>>     * pthread_mutex_consistent()
>>
>> I put pthread_mutexattr_setrobust() and pthread_mutexattr_getrobust()
>> altogether since they are related.
>>
>> I obtain my information about these functions mainly from reading the
>> glibc source code and do some testing. There might be some mistake,
>> but they are mostly correct (95% or so).
>>
>> Following this email would be those man pages in plain text and nroff
>> format. I have tested those nroff file on my Linux box using man, and
>> it look pretty well. Please point out if there are any mistake in
>> formatting.
>
> Thanks for the drafts. Could I ask you to review the man-pages(7)
> page. There's a number of details described in that page
> which should be fixed in the drafts. Also, please try rendering
> your pages with "man -l <page>". This will show problems with
> the example code. See the chown(2) man page example for
> the required escape sequences for "\n" and the single quote.

No problem. I would fix the formatting issues.

Yubin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
