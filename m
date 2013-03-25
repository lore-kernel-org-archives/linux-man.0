From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] libaio: man: Remove POSIX aio interface description.
Date: Mon, 25 Mar 2013 11:36:27 -0400
Message-ID: <x49k3ovcwzo.fsf@segfault.boston.devel.redhat.com>
References: <20130325152557.GA3809@rei.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130325152557.GA3809-J5syqNJeCN7twjQa/ONI9g@public.gmane.org> (Cyril Hrubis's message of
	"Mon, 25 Mar 2013 16:25:58 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org> writes:

> These pages appears to be copied from libc manual
> and describe interface that is implemented elsewhere:
>
> http://www.gnu.org/software/libc/manual/html_node/Asynchronous-I_002fO.html

Thanks, Cryil, I've already committed something similar to my private working
branch of libaio:

commit 485723669addf25eab4f4cc7a3e1da0b392b7c11
Author: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Mar 11 14:17:22 2013 -0400

    man: remove bogus .1 pages
    
    I have no idea why there would ever be man pages in section 1 for
    the libaio routines, so let's get rid of them.  Note that they
    were often incomplete and/or wrong.
    
    Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

commit a70f638383b0969f79110710bd0870b160bc7068
Author: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Mar 4 11:44:08 2013 -0500

    man: remove the glibc aio man pages
    
    These pages are not maintained here, and they don't describe any
    functions this library provides, so let's get rid of them.
    
    Reported-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

I'm also working on some updates to the io_* system call man pages
provided by man-pages.  I'll push that work out as soon as I am
finished.  Sorry for the delay and duplicated work.

-Jeff
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
