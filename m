From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Accessing epoll(4) gives Error 403: Forbidden
Date: Wed, 21 Sep 2011 08:05:30 +0200
Message-ID: <CAKgNAkik5Kubg_vevOZG5zmacqbK1c-511NihtXi3kO1wcDzjw@mail.gmail.com>
References: <CALejDOFxwzn2hOyaf27Q3SxNu9_15On6gL08PER4JTLS9VwAnA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALejDOFxwzn2hOyaf27Q3SxNu9_15On6gL08PER4JTLS9VwAnA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Soh Kam Yung <sohkamyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Sep 21, 2011 at 8:03 AM, Soh Kam Yung <sohkamyung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Trying to read epoll(4) [
> http://man7.org/linux/man-pages/online/pages/man4/epoll.4.html ]
> returns
>
> =====
> 403
> Forbidden
>
> You don't have permission to access
> /linux/man-pages/online/pages/man4/epoll.4.html on this server.
> =====

Thanks for the report Kam-Yung. Something needs to be fixed. In the
meantime, this works:

http://man7.org/linux/man-pages/online/pages/man7/epoll.7.html

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
