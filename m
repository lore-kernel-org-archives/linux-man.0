From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: BUG: shm_overview notes mistype
Date: Fri, 10 Sep 2010 08:16:52 +0200
Message-ID: <AANLkTi=nmBrYPedQgSKqjpAt3J=tVBR8aYpFrh1A5fJ-@mail.gmail.com>
References: <20090922062141.GA11068@mail.rocksoft.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090922062141.GA11068-VRWxn6jUk2XIWXg0qMyPgwC/G2K4zDHf@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Stoakes <tim-TvTPyCxgtD3R7s880joybQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Tim,

On Tue, Sep 22, 2009 at 8:21 AM, Tim Stoakes <tim-TvTPyCxgtD3R7s880joybQ@public.gmane.org> wrote:
> man-pages version 3.22, Gentoo linux
>
> $ man shm_overview
>
> In the NOTES section, second sentence:
> "
> System V shared memory (shmget(2), shmop(2), etc.) is an older semaphore
> API.
> "
>
> It's not a semaphore API, it's a shared memory API.

Thanks. Fixed for man-pages-3.27.

> Perhaps this is a paste-o from the sem_overview man page.

(Probably.)

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
