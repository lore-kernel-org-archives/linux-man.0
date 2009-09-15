From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Mistake in poll(2) - man-pages 3.22
Date: Tue, 15 Sep 2009 06:10:44 +0200
Message-ID: <cfd18e0f0909142110n6d0e61e4y8a544b14de1c73da@mail.gmail.com>
References: <d2657e860908300923s9afe2a8y13a2a658b8a707b9@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d2657e860908300923s9afe2a8y13a2a658b8a707b9-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rui rlex <rui.rlex-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Rui,

On Sun, Aug 30, 2009 at 6:23 PM, rui rlex <rui.rlex-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> In the poll(2) man-page is written that "The set of file descriptors to be
> monitored is specified in the fds argument, which is an array of nfds
> structures".
> It's an array of pollfd structs , not nfds structures.

This is rather a language issue. Think of it like this: "...which is
an array of 199 structures..."

Having said that, the wording could be clearer.

I removed "nfds" from that sentence, and added a sentence:

    The caller should specify the number of items in the fds
    array in nfds.

Cheers,

Michael
-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
