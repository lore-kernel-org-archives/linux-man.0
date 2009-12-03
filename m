From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: pthread_join man page bug
Date: Thu, 3 Dec 2009 16:47:13 +0100
Message-ID: <cfd18e0f0912030747q5b6e0fb3hdfcd6986df31da17@mail.gmail.com>
References: <da5b0fda0912020038n1cda0b8ay59fc4f4d0c43c1fc@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <da5b0fda0912020038n1cda0b8ay59fc4f4d0c43c1fc-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sam Liao <phyomh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Dec 2, 2009 at 9:38 AM, Sam Liao <phyomh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The pthread_create here should be pthread_join.

Thanks. Fixed for man-pages-3.24.

Cheers,

Michael


> -----
>
> NOTES
>
> After a successful call to pthread_create(), the caller is guaranteed
> that the target thread has terminated.
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
