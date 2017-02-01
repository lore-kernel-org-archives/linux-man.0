From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Small bug in vsnprintf(3) man page
Date: Thu, 2 Feb 2017 09:36:09 +1300
Message-ID: <d94fd3bd-574e-36d0-c961-a4d1589d9207@gmail.com>
References: <CAJ3xPgHrjzuneKDPzPsY3EqXcmO0dZFjN6tnccdupEgYMOoK3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJ3xPgHrjzuneKDPzPsY3EqXcmO0dZFjN6tnccdupEgYMOoK3w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Erik Roland van der Meer <ervdmeer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Erik

On 01/31/2017 11:02 PM, Erik Roland van der Meer wrote:
> Hello,
> 
> I believe I have discovered a small bug in the vsnprintf(3) man page.
> It occurs online at http://man7.org/linux/man-pages/man3/fprintf.3.html
> which reports itself as part of the 4.09 release. I discovered it in the
> Ubuntu 16.04 man page with reports itself as part of the 4.04 release.
> 
> It is in the code example of char *make_message(const char *fmt, ...) at
> the end.
> I believe that the second call to va_end(ap) should be moved to above the
> if-block
> that precedes it, so that the va_list ap will be cleaned up in all cases.

Yes, that seems right to me. I've changed as you suggest

> With deep gratitude for all the help the manpages have been for me
> throughout the years,

You're very welcome!

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
