From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: struct aiocb structure man page
Date: Sun, 3 Oct 2010 18:06:26 +0200
Message-ID: <AANLkTi=n8mtx9aE75V_bmdH_RSaa5mf6k0UVXQrv0miu@mail.gmail.com>
References: <AANLkTimurYOmpjhewOJTKnR1LNeFA9E4JY+kAPn6uh5A@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimurYOmpjhewOJTKnR1LNeFA9E4JY+kAPn6uh5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jon,

On Thu, Sep 16, 2010 at 1:20 PM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
>
> http://www.kernel.org/doc/man-pages/online/pages/man3/aio_write.3.html
>
> Is it possible to also hyperlink the "struct aiocb" to the structure?
>
> I would also be interested in SIGEV_THREAD documentation.
>
> To give an example of some code. we set this macro within the aiocb structure:
>
> aio.aio_sigevent.sigev_notify = SIGEV_THREAD;
>
> I only found this page about SIGEV_THREAD :
> http://www.kernel.org/doc/man-pages/online/pages/man2/timer_create.2.html

I've just now pushed to git a new aio(7) man pages that documents the
aiocb structure. Also, various pages have been updated to point to the
recently added sigevent(7) page, which documents SIGEV_*. The changes
will be released in man-pages-3.28.

thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
