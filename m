From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] prctl.2: Add PR_SET_MM option description
Date: Wed, 21 Mar 2012 06:21:19 +1300
Message-ID: <CAKgNAkgJm01K9+GhnouxUwOUW3gk+YiuHLfofrs7adWzEqqO8Q@mail.gmail.com>
References: <1331326042-32558-1-git-send-email-gorcunov@openvz.org> <1331326042-32558-2-git-send-email-gorcunov@openvz.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331326042-32558-2-git-send-email-gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Cyrill,

The PR_SET_MM operation adds a number of new error cases to prctl(2).
Could you extend you patch to add these under ERRORS?

Thanks,

Michael


On Sat, Mar 10, 2012 at 9:47 AM, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org> =
wrote:
> CC: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
> Signed-off-by: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
> ---
> =A0man2/prctl.2 | =A0104 ++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++
> =A01 files changed, 104 insertions(+), 0 deletions(-)
>
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index effad2a..7a50ac1 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -378,6 +378,110 @@ Return the current per-process machine check ki=
ll policy.
> =A0All unused
> =A0.BR prctl ()
> =A0arguments must be zero.
> +.TP
> +.BR PR_SET_MM " (since Linux 3.3)"
> +Allows a user to modify certain kernel memory map descriptor fields
> +of the calling process.
> +Usually these fields are set by the kernel and dynamic loader (see
> +.BR ld.so (8)
> +for more information) and a regular application should not use this =
feature.
> +Still there are cases such as self-modifying programs, where a progr=
am might
> +find it useful to change its own memory map.
> +The kernel must be built with
> +.BR CONFIG_CHECKPOINT_RESTORE
> +option turned on, otherwise this feature will not be accessible
> +from a user space level.
> +The calling process must have
> +.BR CAP_SYS_RESOURCE
> +(see
> +.BR capabilities (7)
> +for details) capability granted.
> +The value in
> +.I arg2
> +is one of the options below, while
> +.I arg3
> +provides a new value for this option.
> +
> +.BR PR_SET_MM_START_CODE
> +to set the address above which program text can run.
> +The corresponding memory area must be readable and executable,
> +but not writable or shareable (see
> +.BR mprotect (2)
> +and
> +.BR mmap (2)
> +for more information).
> +
> +.BR PR_SET_MM_END_CODE
> +to set the address below which program text can run.
> +The corresponding memory area must be readable and executable,
> +but not writable or shareable.
> +
> +.BR PR_SET_MM_START_DATA
> +to set the address above which program data+bss is placed.
> +The corresponding memory area must be readable and writable,
> +but not executable or shareable.
> +
> +.B PR_SET_MM_END_DATA
> +to set the address below which program data+bss is placed.
> +The corresponding memory area must be readable and writable,
> +but not executable or shareable.
> +
> +.BR PR_SET_MM_START_STACK
> +to set the start address of the stack.
> +The corresponding memory area must be readable and writable.
> +
> +.BR PR_SET_MM_START_BRK
> +to set the address above which program heap can be expanded with
> +.BR brk (2)
> +call.
> +The address must not be greater than ending address of
> +the current program data segment, neither it may exceed
> +resource limit for data (see
> +.BR setrlimit (2)
> +for more information).
> +
> +.BR PR_SET_MM_BRK
> +to set the current
> +.BR brk (2)
> +value.
> +The requirements for address are the same as for
> +.BR PR_SET_MM_START_BRK
> +option.
> +
> +.BR PR_SET_MM_ARG_START
> +to set the address above which program command line is placed.
> +
> +.BR PR_SET_MM_ARG_END
> +to set the address below which program command line is placed.
> +
> +.BR PR_SET_MM_ENV_START
> +to set the address above which program environment is placed.
> +
> +.BR PR_SET_MM_ENV_END
> +to set the address below which program environment is placed.
> +
> +The address passed with
> +.BR PR_SET_MM_ARG_START ,
> +.BR PR_SET_MM_ARG_END ,
> +.BR PR_SET_MM_ENV_START ,
> +.BR PR_SET_MM_ENV_END ,
> +should belong to a process stack area, thus corresponding memory are=
a
> +must be readable, writable and (depending on the kernel
> +configuration) has
> +.BR MAP_GROWSDOWN
> +attribute set (see
> +.BR mmap (2)
> +for details).
> +
> +.BR PR_SET_MM_AUXV
> +to set a new auxiliary vector.
> +The
> +.I arg3
> +argument should provide the address of the vector.
> +The
> +.I arg4
> +is the size of the vector.
> +.\"
> =A0.SH "RETURN VALUE"
> =A0On success,
> =A0.BR PR_GET_DUMPABLE ,
> --
> 1.7.7.6
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
