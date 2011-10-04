From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: printf 3
Date: Tue, 4 Oct 2011 07:46:21 +0200
Message-ID: <CAKgNAkgrL4tXZmrLaauLNxSv7rngKxsnkk8pWA1AoP1urk-_5g@mail.gmail.com>
References: <4E8A4C32.9000607@jguk.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E8A4C32.9000607-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jon,

On Tue, Oct 4, 2011 at 1:58 AM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
>
> Looking at this page:
> http://man7.org/linux/man-pages/online/pages/man3/printf.3.html
>
> "If an output error is encountered, a negative value is returned."
>
> I am thinking if this could be clarified. If I call printf(NULL), errno is
> set to EINVAL, and -1 is returned.
>
> Perhaps could be expanded to add:
>
> "If a parameter error is encountered, errno set to EINVAL, and -1 is
> returned. If an output error is encountered, errno set EIO and -1 returned.

The apparently vague wording is deliberate. Glibc may generally return
-1, but POSIX simply says "a negative value", and that's all that is
guaranteed to an application.

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
