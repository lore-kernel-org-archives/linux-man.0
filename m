From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] select.2: Mention the fd size limitation early and refer
 to poll
Date: Mon, 1 Feb 2016 15:23:26 +0100
Message-ID: <56AF6A5E.9040502@gmail.com>
References: <1454058532.3459.1.camel@gnutls.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454058532.3459.1.camel-c5N7Ur/I1ocdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikos Mavrogiannopoulos <nmav-c5N7Ur/I1ocdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Nikos,

On 01/29/2016 10:08 AM, Nikos Mavrogiannopoulos wrote:
> That is because the serious limitation of select imposing a limit
> on the values a file descriptor can have, is mentioned too late
> in the documentation in the notes section. The manpage should
> warn and refer to poll as soon as possible.

Agreed. I merged your patch, and in fact even expanded the details
quite a bit to emphasize this issue with (glibc) select()/pselect().

> (patch attached)

Thanks. (But inline patches are much easier to deal with...)

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
