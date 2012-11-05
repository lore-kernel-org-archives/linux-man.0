From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: various fixes
Date: Mon, 5 Nov 2012 17:15:20 +0100
Message-ID: <CAKgNAkjfsjPTny50xighNO2v+S52CW8bHfYyPDw-R=ZbieP1JA@mail.gmail.com>
References: <1352084275-1568-1-git-send-email-taffit@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352084275-1568-1-git-send-email-taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Pr=E9vot?= <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks David. Applied.

On Mon, Nov 5, 2012 at 3:57 AM, David Pr=E9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrot=
e:
> ---
>  man5/proc.5 |   21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/man5/proc.5 b/man5/proc.5
> index 88af7c5..0164ba6 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -1414,13 +1414,13 @@ with various options; those dependencies are =
noted in the list.
>  .TP
>  .IR MemTotal " %lu"
>  Total usable RAM (i.e. physical RAM minus a few reserved
> -bits and the kernel binary code)
> +bits and the kernel binary code).
>  .TP
>  .IR MemFree " %lu"
>  The sum of LowFree+HighFree.
>  .TP
>  .IR Buffers " %lu"
> -Relatively temporary storage for raw disk blocks
> +Relatively temporary storage for raw disk blocks that
>  shouldn't get tremendously large (20MB or so).
>  .TP
>  .IR Cached " %lu"
> @@ -1431,9 +1431,9 @@ Doesn't include
>  .IR SwapCached " %lu"
>  Memory that once was swapped out, is swapped back in but
>  still also is in the swap file.
> -(Iy memory pressure memory is high, these pages
> +(If memory pressure is high, these pages
>  don't need to be swapped out again because they are already
> -in the swapfile.
> +in the swap file.
>  This saves I/O.)
>  .TP
>  .IR Active " %lu"
> @@ -1469,7 +1469,7 @@ It is more eligible to be reclaimed for other p=
urposes.
>  .IR HighTotal " %lu"
>  (Starting with Linux 2.6.19, \fBCONFIG_HIGHMEM\fP is required.)
>  Total amount of highmem.
> -Highmem is all memory above ~860MB of physical memory
> +Highmem is all memory above ~860MB of physical memory.
>  Highmem areas are for use by user-space programs,
>  or for the page cache.
>  The kernel must use tricks to access
> @@ -1486,7 +1486,7 @@ Lowmem is memory which can be used for everythi=
ng that
>  highmem can be used for, but it is also available for the
>  kernel's use for its own data structures.
>  Among many other things,
> -it is where everything from the Slab is allocated.
> +it is where everything from Slab is allocated.
>  Bad things happen when you're out of lowmem.
>  .TP
>  .IR LowFree " %lu
> @@ -1494,7 +1494,8 @@ Bad things happen when you're out of lowmem.
>  Amount of free lowmem.
>  .TP
>  .IR MmapCopy " %lu (since Linux 2.6.29)"
> -(\fBCONFIG_MMU is required.)
> +.RB ( CONFIG_MMU
> +is required.)
>  [To be documented.]
>  .TP
>  .IR SwapTotal " %lu"
> @@ -1564,9 +1565,9 @@ of swap with a
>  .I overcommit_ratio
>  of 30, this formula yields a
>  .I CommitLimit
> -of 7.3G.
> +of 7.3GB.
>  For more details, see the memory overcommit documentation
> -in the kerenl source file
> +in the kernel source file
>  .IR Documentation/vm/overcommit-accounting .
>  .TP
>  .IR Committed_AS " %lu"
> @@ -1582,7 +1583,7 @@ allocated for the entire 1GB.
>  This 1GB is memory which has been "committed" to by the VM
>  and can be used at any time by the allocating application.
>  With strict overcommit enabled on the system (mode 2
> -.IR /proc/sys/vm/overcommit__memory ),
> +.IR /proc/sys/vm/overcommit_memory ),
>  allocations which would exceed the
>  .I CommitLimit
>  (detailed above) will not be permitted.
> --
> 1.7.10.4
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
