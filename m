From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mmap.2: Add EOVERFLOW
Date: Mon, 25 Feb 2013 08:46:15 +0100
Message-ID: <CAKgNAkiHFs7hYu9a7fC6CLzV_tghZadCYtJS7xxUXp4c8iLk-A@mail.gmail.com>
References: <20121112105632.GB6764@rei.suse.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121112105632.GB6764-J5syqNJeCN7twjQa/ONI9g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: chrubis-AlSwsSmVLrQ@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Cyril,

On Mon, Nov 12, 2012 at 11:56 AM,  <chrubis-AlSwsSmVLrQ@public.gmane.org> wrote:
> This patch adds EOVERFLOW and conditions needed to
> trigger it into mmap.2 man page.

Thanks. Applied.

Cheers,

Michael


> --
> Cyril Hrubis
> chrubis-AlSwsSmVLrQ@public.gmane.org
>
> From e656978560e317b95a8315b9556690e8c03917f2 Mon Sep 17 00:00:00 2001
> From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> Date: Wed, 7 Nov 2012 11:52:55 +0100
> Subject: [PATCH 1/2] mmap.2: Add EOVERFLOW to ERRORS.
>
> The overflow could be triggered on 32 bit arch
> with large file extension (i.e. 64 bit off_t)
> if number of pages used for len plus number of
> pages used for offset would overflow 32 bit
> unsigned long.
>
> In this case we would hit this line from do_mmap_pgoff:
>
> ...
>         /* offset overflow? */
>         if ((pgoff + (len >> PAGE_SHIFT)) < pgoff)
>                 return -EOVERFLOW;
> ...
>
> Note that if the offset is too big (would overflow
> unsigned long in number of pages itself) you would hit
> EINVAL first.
>
> The code to trigger this condition could be
> seen in LTP git repo in:
>
> open_posix_testsuite/conformance/interfaces/mmap/31-1.c
>
> Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> ---
>  man2/mmap.2 |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/man2/mmap.2 b/man2/mmap.2
> index 042b833..29fcc3d 100644
> --- a/man2/mmap.2
> +++ b/man2/mmap.2
> @@ -470,6 +470,11 @@ was mounted no-exec.
>  was set but the object specified by
>  .I fd
>  is open for writing.
> +.TP
> +.B EOVERFLOW
> +happens on 32 bit architecture together with large file extension (i.e. using
> +64 bit off_t) when number of pages used for length plus number of pages used
> +for offset would overflow unsigned long (32 bits)
>  .LP
>  Use of a mapped region can result in these signals:
>  .TP
> --
> 1.7.8.6
>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
