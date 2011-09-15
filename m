From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: i have a question about manpage of crypt(3)
Date: Thu, 15 Sep 2011 06:19:33 +0200
Message-ID: <CAKgNAkiWDvYmJevFtoF9HrxokD75q4K1SqAuqeq4fSvHQX_d9g@mail.gmail.com>
References: <f85ce2efe985805a67261bc5f49a198c@tweb04-2.nm>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f85ce2efe985805a67261bc5f49a198c-9FmXepBcjPKQWpZ9lopvGA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Juhwan Yun <btakeya-8eaMts54rL0AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Juhwan Yun

On Sun, Dec 12, 2010 at 7:00 PM, Juhwan Yun <btakeya-8eaMts54rL0AvxtiuMwx3w@public.gmane.org> wrote:
>
> hi, i am a koream linux user.
>
> i have a question about manpage of crypt(3).
> we can use crypt function by include crypt.h,
> but manpage of crypt(3) seems don't tell about it.
> is there something wrong?
>
> thanks for reading :)
> and sorry about my poor english :(

Its true that one can use <crypt.h>, but the standards-conformant way
is <unistd.h>, so that's what the man page documents.

Thanks,

Michael

--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
