From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: The time(2) man page conflicts with glibc
Date: Thu, 17 Dec 2015 06:53:17 +0100
Message-ID: <56724DCD.8050809@gmail.com>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com> <mvmegen94qs.fsf@hawking.suse.de> <CAMe9rOr_Ydg5Nr7aV8vS0vYEFehSwFBuxrMAnCFXyyVoTF4vJQ@mail.gmail.com> <5671696B.3070203@gmail.com> <CAMe9rOqsxCEia7OWqzJ-HzZWCra5BTyYqt4japjZTw0pY=fugw@mail.gmail.com> <56717032.7000007@gmail.com> <CAKCAbMjrKfsT7P=Q=+1zWC68552aK=ciod0HYk3=HWMvkYW26w@mail.gmail.com> <5671EE36.1000402@cs.ucla.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5671EE36.1000402-764C0pRuGfqVc3sceRu5cw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Eggert <eggert-764C0pRuGfqVc3sceRu5cw@public.gmane.org>, Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Paul,

On 12/17/2015 12:05 AM, Paul Eggert wrote:
> Zack Weinberg wrote:
>> When `t` is NULL, the call cannot fail.
> 
> This doesn't make it clear what happens when the time_t values roll around after 
> the year 2038, on 32-bit time_t hosts. How about adding some further text along 
> the following lines?
> 
> In GNU/Linux time(NULL) cannot fail with errno == EOVERFLOW, even on ABIs where 
> time_t is a signed 32-bit integer and when the clock ticks past the time 2**31 
> (2038-01-19 03:14:08 UTC, ignoring leap seconds). Instead, the behavior is 
> undefined when the system time is out of time_t range. Applications intended to 
> run after 2038 should use ABIs with time_t wider than 32 bits.
> .

Seems reasonable. I've added something close that. Thanks!

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
