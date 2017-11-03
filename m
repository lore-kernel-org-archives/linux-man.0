From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: <sys/memfd.h> header
Date: Fri, 3 Nov 2017 21:01:09 +0100
Message-ID: <CAKgNAkjeMPPReMa+-_QpL1xZUtBy7yspBkPepG1F4LW6WO9H+w@mail.gmail.com>
References: <a989051a-3dcd-9fe6-ab23-5d9fd5d3442b@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a989051a-3dcd-9fe6-ab23-5d9fd5d3442b-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC += David Herrmann]

Hi Florian,

On 3 November 2017 at 20:22, Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> memfd_create(2) mentions a <sys/memfd.h>.  Is this a typo for
> <linux/memfd.h>?

Offhand, I do not know. This header file was listed in the original
draft of the page that I received from David Herrmann. (I did much
reworking of the page, but overlooked this detail.) Perhaps it was a
typo, or perhaps it was David's estimation that there would eventually
be such a glibc header.

> I want to implement the system call wrapper, but we're probably going to put
> it into <sys/mman.h> and have it include <linux/memfd.h> for _GNU_SOURCE.

I'm agnostic about it. Maybe David will have some thoughts.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
