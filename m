From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: open(2) says O_DIRECTORY is Linux-specific
Date: Thu, 10 Apr 2014 21:14:25 +0200
Message-ID: <5346ED91.9040306@gmail.com>
References: <CAF52+S5ATj7R-F=ni-S3M7ax4QrfN0wunvchQSuy-cqkYPNyow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAF52+S5ATj7R-F=ni-S3M7ax4QrfN0wunvchQSuy-cqkYPNyow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthew Dempsky <mdempsky-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/08/2014 10:14 PM, Matthew Dempsky wrote:
> http://man7.org/linux/man-pages/man2/open.2.html
> 
>        O_DIRECTORY
>               If pathname is not a directory, cause the open to fail.  This
>               flag is Linux-specific, and was added in kernel version
>               2.1.126, to avoid denial-of-service problems if opendir(3) is
>               called on a FIFO or tape device.
> 
> The "This flag is Linux-specific" bit is no longer true, since it was
> standardized by POSIX.1-2008 (as mentioned in the "CONFORMING TO"
> section later), and FreeBSD, NetBSD, and OpenBSD all implement it (at
> least according to their man pages).  Perhaps saying "This flag was
> Linux-specific until standardized by POSIX.1-2008, and was added in
> ..." would be more accurate?

Hi Matthew,

Thanks for the report. That text is indeed crufty, but all that's needed
is to remove the piece saying that the flag is Linux-speciifc, since
elsewhere in the page it is explained that it is in POSIX.1-2008.
I've simply removed the words "is Linux-specific, and".

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
