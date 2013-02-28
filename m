From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: Add info about /proc/[pid]/map_files directory
Date: Thu, 28 Feb 2013 15:20:53 +0100
Message-ID: <CAKgNAki5SQu8UffqN_s6-1=nATPJaf+KSAPNkGzCPDyyRSupNw@mail.gmail.com>
References: <51225BF3.7080602@parallels.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51225BF3.7080602-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Pavel,

On Mon, Feb 18, 2013 at 5:50 PM, Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org> wrote:
> It was added into Linux v3.3 and provides info about files being mmap-ed in
> a way _very_ similar to how /proc/[pid]/fd works. Thus I thought that the
> best place for the map_files' doc is where where the fd's doc is.
>
> Signed-off-by: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>

Could you please resubmit with some added text that shows an example
of what you see in this file (including a /dev/zero case)? Also, the
patch should mention that CONFIG_CHECKPOINT_RESTORE is required.

Thanks,

Michael

> ---
>
> diff --git a/man5/proc.5 b/man5/proc.5
> index 30ca3a9..1226747 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -285,6 +285,23 @@ Thus the example command above could be written as:
>  .RB "$" " foobar \-i /dev/stdin \-o /dev/stdout ..."
>  .fi
>  .in
> +.TP
> +.IR /proc/[pid]/map_files/ " (since kernel 3.3)
> +This subdirectory contains entries corresponding to memory mapped
> +files (see
> +.BR mmap (2)).
> +Entries are named by memory region start and end pair,
> +and are symbolic links to the corresponding files.
> +
> +Although these entries are present for memory regions that were
> +mapped with
> +.BR MAP_FILE
> +flag, the way anonymous shared memory (regions created with
> +.B MAP_ANON | MAP_SHARED
> +flags)
> +is implemented in Linux
> +makes such regions also appear on this directory. In that case
> +the target file would be the /dev/zero one.
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
