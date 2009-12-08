From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: sched_getcpu header file
Date: Tue, 8 Dec 2009 03:32:02 +0100
Message-ID: <cfd18e0f0912071832n1752852ap1e64ab2147f54dc8@mail.gmail.com>
References: <c5c36f160912061050l33d36e54g5fc2fb340876f4b6@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c5c36f160912061050l33d36e54g5fc2fb340876f4b6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samy Al Bahra <sbahra-U2IGjetiQ8Mdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Samy,

On Sun, Dec 6, 2009 at 7:50 PM, Samy Al Bahra <sbahra-U2IGjetiQ8Mdnm+yROfE0A@public.gmane.org> wrote:
> Hi,
>
> sched_getcpu(3):
> - #include <utmpx.h>
> + #include <sched.h>
>
> This is at least on version 3.23 of Linux man-pages.

Thanks.

Applied for man-pages-3.24.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
