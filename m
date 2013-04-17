From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: Add info about /proc/[pid]/map_files directory (v2)
Date: Wed, 17 Apr 2013 08:33:35 +0200
Message-ID: <CAKgNAkhAREE9y5QgiFJsjt8CsHGCbdv4oAnf8eccr-fh-hRTBg@mail.gmail.com>
References: <516D8C61.5090004@parallels.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <516D8C61.5090004-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Apr 16, 2013 at 7:37 PM, Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org> wrote:
> It was added into Linux v3.3 and provides info about files being mmap-ed in
> a way _very_ similar to how /proc/[pid]/fd works. Thus I thought that the
> best place for the map_files' doc is where where the fd's doc is.
>
> v2: Added examples of how links look like and dependency on kernel config
> option CONFIG_CHECKPOINT_RESTORE.
>
> Signed-off-by: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>

Thanks Pavel. Applied.

Cheers,

Michael


> ---
>
> diff --git a/man5/proc.5 b/man5/proc.5
> index 520c5fc..1bfc63c 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -286,6 +286,42 @@ Thus the example command above could be written as:
>  .RB "$" " foobar \-i /dev/stdin \-o /dev/stdout ..."
>  .fi
>  .in
> +.TP
> +.IR /proc/[pid]/map_files/ " (since kernel 3.3)
> +This subdirectory contains entries corresponding to memory mapped
> +files (see
> +.BR mmap (2)).
> +Entries are named by memory region start and end pair,
> +and are symbolic links to the files themselves. Like this
> +.in +4n
> +.nf
> +
> +.RB "$" " ls -l /proc/self/map_files/"
> +lr--------. 1 root root 64 Apr 16 21:31 3252e00000-3252e20000 -> /usr/lib64/ld-2.15.so
> +\&...
> +.fi
> +.in
> +
> +Although these entries are present for memory regions that were
> +mapped with
> +.BR MAP_FILE
> +flag, the way anonymous shared memory (regions created with
> +.B MAP_ANON | MAP_SHARED
> +flags)
> +is implemented in Linux
> +makes such regions also appear on this directory. In that case
> +the target file would be the deleted /dev/zero one:
> +.in +4n
> +.nf
> +
> +.RB
> +lrw-------. 1 root root 64 Apr 16 21:33 7fc075d2f000-7fc075e6f000 -> /dev/zero (deleted)
> +.fi
> +.in
> +
> +This directory appears only if the
> +.B CONFIG_CHECKPOINT_RESTORE
> +kernel configuration option is enabled.
>  .\" FIXME Describe /proc/[pid]/loginuid
>  .\"       Added in 2.6.11; updating requires CAP_AUDIT_CONTROL
>  .\"       CONFIG_AUDITSYSCALL



--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
