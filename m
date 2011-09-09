From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: error in socket(7) -- ref bind(2), not bind(8)
Date: Fri, 9 Sep 2011 16:39:09 +0200
Message-ID: <CAKgNAki9ME+ZxVr+azAPL-gCHh60QkcnbeO992yLbwiNkhL4GQ@mail.gmail.com>
References: <20110515144948.GA14265@qemfd.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110515144948.GA14265-URhJvLu/5VteoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nick black <dankamongmen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, May 15, 2011 at 4:49 PM, nick black <dankamongmen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> socket(7)'s SO_BINDTODEVICE description suggests use of bind(8) with
> packet(7) sockets. i'm pretty sure you mean the system call bind(2),
> not the name server.

Yes. Will be fixed in man-pages-3.33.

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
