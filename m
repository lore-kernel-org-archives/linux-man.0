From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc(5): maps: document the "pathname" field
Date: Sun, 17 Mar 2013 11:16:41 +0100
Message-ID: <CAKgNAkh=W7U+GgJohWM4O2mo8kBjnc3POPfc11D5f2b1ewaUaw@mail.gmail.com>
References: <1363384034-11106-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363384034-11106-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Mike,

One more thought:

> +[stack:#] = A thread's stack (where the # is the thread's TID)
> +[vdso]    = The virtual dynamically linked shared object
> +[heap]    = The process's heap (no joke!)
> +.in
> +.fi
> +
> +The TID syntax was added in Linux 3.4.  It corresponds to the
> +.IR /proc/[pid]/task/[TID]/
> +path.

For pieces like this, it's very helpful to drop a comment into the
source noting the kernel (or glibc) commit that made the change, such
as

+.\" commit b76437579d1344b612cf1851ae610c636cec7db0

This lets me (and others looking at the patch) know very precisely
when the change occurred, and perhaps get some more information about
it.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
