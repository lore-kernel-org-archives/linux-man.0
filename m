From: Ulrich Drepper <drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fallocate.2: mention <linux/falloc.h> for flag definitions
Date: Thu, 29 Sep 2011 16:28:17 -0400
Message-ID: <CAOPLpQddzx8RgFSvH4BSq8hKzUUn8T6r+r9jaY-+1uw439Fkaw@mail.gmail.com>
References: <1307571453-29756-1-git-send-email-egouriou@google.com> <CAKgNAkhRPoo2-LH59wno9aYgst_fwmjUH8vbjt5g03_MrLdD2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhRPoo2-LH59wno9aYgst_fwmjUH8vbjt5g03_MrLdD2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Eric Gouriou <egouriou-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Chinner <dchinner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Nauman Rafique <nauman-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Sep 21, 2011 at 00:30, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Ulrich, the glibc headers declare Linux's fallocate() syscall is
> _GNU_SOURCE is defined, but not the associated FALLOC_FL_PUNCH_HOLE
> and FALLOC_FL_KEEP_SIZE constants. Probably this needs to be fixed. Is
> this a glibc lack or is it that the constants are not exported from
> kernel headers in the way that glibc needs?

The kernel people made it clear that they don't care about correct
namespaces in headers.  This makes it pretty much impossible to use
most kernel headers.  I'd love to avoid mirroring headers but this
isn't possible without the appropriate #ifdefs in the kernel headers.

I probably will define those constants in fcntl.h.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
