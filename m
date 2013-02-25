From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mmap.2: Add note about partial page in BUGS section
Date: Mon, 25 Feb 2013 09:00:09 +0100
Message-ID: <CAKgNAkiK9FOSBsTuuC=kdkdg60z9WEAr67VEzubsJ065BCVCCQ@mail.gmail.com>
References: <20121112112544.GC6764@rei.suse.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121112112544.GC6764-J5syqNJeCN7twjQa/ONI9g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: chrubis-AlSwsSmVLrQ@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Cyril,

On Mon, Nov 12, 2012 at 12:25 PM,  <chrubis-AlSwsSmVLrQ@public.gmane.org> wrote:
> Hi!
> This adds note about Linux behavior with partial page at the end of the
> object. The problem here is that pages that contains only part of a
> file (because the file size is not multiple of PAGE_SIZE) stays in page
> cache even after the mapping is unmapped and the file closed. So if some
> proces dirties such page other mappings will see the the changes rather
> than zeroes.
>
> I've also attached reproducer which is a stripped down version of LTP
> test. The child creates file of the size of PAGE_SIZE/2, maps it,
> changes content after the PAGE_SIZE/2. The parent waits for child to
> exit, maps the same file and checks the content after the PAGE_SIZE/2.
> Uncommenting the msync() makes the test succeed.

Thanks. And thanks also for the test program. I've applied this patch.

Cheers,

Michael


> From 24dda667d02a128274133a60f8985bb061fe056c Mon Sep 17 00:00:00 2001
> From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> Date: Wed, 7 Nov 2012 12:20:19 +0100
> Subject: [PATCH 2/2] mmap.2: Add note about partial page in BUGS
>
> Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> ---
>  man2/mmap.2 |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
>
> diff --git a/man2/mmap.2 b/man2/mmap.2
> index 29fcc3d..5d2f7ee 100644
> --- a/man2/mmap.2
> +++ b/man2/mmap.2
> @@ -573,6 +573,15 @@ Since kernel 2.6.12,
>  fails with the error
>  .B EINVAL
>  for this case.
> +
> +POSIX specifies that system shall always zero fill any partial page at the end
> +of the object and that system will newer write any modification of object
> +beyond its end. On Linux when you write data to such partial page after the end
> +of the object the data stays in page cache even after you closed and unmaped
> +the file and although the data are newer written to the file itself subsequent
> +mappings may see the modified content. In some cases this could be fixed by
> +calling msync before the unmap takes place, this however doesn't work on tmpfs
> +(for example when using shm ipc interface).
>  .SH EXAMPLE
>  .\" FIXME . Add an example here that uses an anonymous shared region for
>  .\" IPC between parent and child.
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
