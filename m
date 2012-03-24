From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: A bug in rtnetlink(3) man page?
Date: Sat, 24 Mar 2012 13:12:14 +1300
Message-ID: <CAKgNAkg2Hx-TaKJq1Md4y7wTWGBoa0fNnqXFBOfr-cLK7XRD1A@mail.gmail.com>
References: <655865.6909.qm@web112304.mail.gq1.yahoo.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <655865.6909.qm-F3IvdU5kI7cA0QRgWO9Mevu2YVrzzGjVVpNB7YpNyf8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Zhirikov <sfzhi-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Oct 23, 2009 at 12:06 AM, Sergei Zhirikov <sfzhi-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:
> Hi all,
>
> I believe there is a bug in rtnetlink(3) man page (http://www.kernel.org/doc/man-pages/online/pages/man3/rtnetlink.3.html). There seem to be an error in the example code (the EXAMPLE section). The line:
>
> rta->rta_len = sizeof(unsigned int);
>
> should be:
>
> rta->rta_len = RTA_LENGTH(sizeof(unsigned int));
>
> Can anyone please confirm if I'm right?

Someone just did.

See my next mail.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
