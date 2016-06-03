From: Rahul Bedarkar <rahulbedarkar89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] mmap.2: improve example
Date: Fri, 3 Jun 2016 13:16:46 +0530
Message-ID: <CA+NV+Vn9_9eDLvNWhgH7pLFyf+Bjd-fU6Cu0POb3vF-Qb-CnTQ@mail.gmail.com>
References: <1464890187-4141-1-git-send-email-rahulbedarkar89@gmail.com> <06bc8862-f4b2-c024-3852-e1db3d2ae5fb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <06bc8862-f4b2-c024-3852-e1db3d2ae5fb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

On Fri, Jun 3, 2016 at 4:59 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Rahul,
>
>
> Given that handle_error() calls exit(), and that triggers close()
> on all FDs and munmap() on all mappings, I'm not sure this patch
> improves things. Can you say some more on why you think it is
> needed?

I think it is always better to free resources after use to avoid
memory leaks later. But doing that in such
simple example might be debatable.

May be at-least at the end we should call munmap() and close(). That
will cover munmap() usage as well.

Regards,

Rahul
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
