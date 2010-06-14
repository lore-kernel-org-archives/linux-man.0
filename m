From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: posix_fadvise(2): mention sync_file_range(2)
Date: Mon, 14 Jun 2010 07:47:24 +0200
Message-ID: <AANLkTillz_fwys62TkDjRoCBLAHuZDviCRoqih0Rehdu@mail.gmail.com>
References: <4B8E6F28.2020109@gmx.ch>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4B8E6F28.2020109-OI3hZJvNYWs@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manfred Schwarb <manfred99-OI3hZJvNYWs@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Manfred,

On Wed, Mar 3, 2010 at 4:16 PM, Manfred Schwarb <manfred99-OI3hZJvNYWs@public.gmane.org> wrote:
> Hi,
>
> for POSIX_FADV_DONTNEED, syncing with fsync(2) or fdatasync(2) is recommended in
> the man page of posix_fadvise(2).
> However, for this task sync_file_range(2) is probably best suited, as it
> is fast and has the same granularity as posix_fadvise(2).
> akpm also used sync_file_range(2) for his user space helpers:
> http://userweb.kernel.org/~akpm/pagecache-management/pagecache-management/pagecache-management.c
>
> So I suggest to add sync_file_range(2) to the list of mentioned sync functions.

Thanks. Done, for man-pages-3.25.

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
