From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] prctl.2: uncomment PR_SET_MM options in Linux 3.5
Date: Sat, 22 Feb 2014 10:06:22 +0100
Message-ID: <5308688E.90205@gmail.com>
References: <1392252556-23254-1-git-send-email-kir@openvz.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392252556-23254-1-git-send-email-kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, criu-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/13/2014 01:49 AM, Kir Kolyshkin wrote:
> Some of the PR_SET_MM options were merged to vanilla kernel
> later, and appeared in Linux 3.5. Those are:
>  - PR_SET_MM_ARG_START
>  - PR_SET_MM_ARG_END
>  - PR_SET_MM_ENV_START
>  - PR_SET_MM_ENV_END
>  - PR_SET_MM_AUXV
>  - PR_SET_MM_EXE_FILE
> 
> This patch merely uncomments description and error codes
> for these options, which were present but commented out,
> and removes the appropriate FIXME marks.

Hello Kir,

Thanks for attending to this. I've applied all four of your patches.

Cheers,

Michael


> Signed-off-by: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
> ---
>  man2/prctl.2 | 186 +++++++++++++++++++++++++++++------------------------------
>  1 file changed, 90 insertions(+), 96 deletions(-)
> 
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index 70636e5..db8174a 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -711,67 +711,64 @@ value.
>  The requirements for the address are the same as for the
>  .BR PR_SET_MM_START_BRK
>  option.
> -.\" FIXME The following (until ========) is not yet in mainline kernel,
> -.\" so commented out for the moment.
> -.\" .TP
> -.\" .BR PR_SET_MM_ARG_START
> -.\" Set the address above which the program command line is placed.
> -.\" .TP
> -.\" .BR PR_SET_MM_ARG_END
> -.\" Set the address below which the program command line is placed.
> -.\" .TP
> -.\" .BR PR_SET_MM_ENV_START
> -.\" Set the address above which the program environment is placed.
> -.\" .TP
> -.\" .BR PR_SET_MM_ENV_END
> -.\" Set the address below which the program environment is placed.
> -.\" .IP
> -.\" The address passed with
> -.\" .BR PR_SET_MM_ARG_START ,
> -.\" .BR PR_SET_MM_ARG_END ,
> -.\" .BR PR_SET_MM_ENV_START ,
> -.\" and
> -.\" .BR PR_SET_MM_ENV_END
> -.\" should belong to a process stack area.
> -.\" Thus, the corresponding memory area must be readable, writable, and
> -.\" (depending on the kernel configuration) have the
> -.\" .BR MAP_GROWSDOWN
> -.\" attribute set (see
> -.\" .BR mmap (2)).
> -.\" .TP
> -.\" .BR PR_SET_MM_AUXV
> -.\" Set a new auxiliary vector.
> -.\" The
> -.\" .I arg3
> -.\" argument should provide the address of the vector.
> -.\" The
> -.\" .I arg4
> -.\" is the size of the vector.
> -.\" .TP
> -.\" .BR PR_SET_MM_EXE_FILE
> -.\" Supersede the
> -.\" .IR /proc/pid/exe
> -.\" symbolic link with a new one pointing to a new executable file
> -.\" identified by the file descriptor provided in
> -.\" .I arg3
> -.\" argument.
> -.\" The file descriptor should be obtained with a regular
> -.\" .BR open (2)
> -.\" call.
> -.\" .IP
> -.\" To change the symbolic link, one needs to unmap all existing
> -.\" executable memory areas, including those created by the kernel itself
> -.\" (for example the kernel usually creates at least one executable
> -.\" memory area for the ELF
> -.\" .IR \.text
> -.\" section).
> -.\" .IP
> -.\" The second limitation is that such transitions can be done only once
> -.\" in a process life time.
> -.\" Any further attempts will be rejected.
> -.\" This should help system administrators to monitor unusual
> -.\" symbolic-link transitions over all process running in a system.
> -.\" ========== END FIXME
> +.TP
> +.BR PR_SET_MM_ARG_START
> +Set the address above which the program command line is placed.
> +.TP
> +.BR PR_SET_MM_ARG_END
> +Set the address below which the program command line is placed.
> +.TP
> +.BR PR_SET_MM_ENV_START
> +Set the address above which the program environment is placed.
> +.TP
> +.BR PR_SET_MM_ENV_END
> +Set the address below which the program environment is placed.
> +.IP
> +The address passed with
> +.BR PR_SET_MM_ARG_START ,
> +.BR PR_SET_MM_ARG_END ,
> +.BR PR_SET_MM_ENV_START ,
> +and
> +.BR PR_SET_MM_ENV_END
> +should belong to a process stack area.
> +Thus, the corresponding memory area must be readable, writable, and
> +(depending on the kernel configuration) have the
> +.BR MAP_GROWSDOWN
> +attribute set (see
> +.BR mmap (2)).
> +.TP
> +.BR PR_SET_MM_AUXV
> +Set a new auxiliary vector.
> +The
> +.I arg3
> +argument should provide the address of the vector.
> +The
> +.I arg4
> +is the size of the vector.
> +.TP
> +.BR PR_SET_MM_EXE_FILE
> +Supersede the
> +.IR /proc/pid/exe
> +symbolic link with a new one pointing to a new executable file
> +identified by the file descriptor provided in
> +.I arg3
> +argument.
> +The file descriptor should be obtained with a regular
> +.BR open (2)
> +call.
> +.IP
> +To change the symbolic link, one needs to unmap all existing
> +executable memory areas, including those created by the kernel itself
> +(for example the kernel usually creates at least one executable
> +memory area for the ELF
> +.IR \.text
> +section).
> +.IP
> +The second limitation is that such transitions can be done only once
> +in a process life time.
> +Any further attempts will be rejected.
> +This should help system administrators to monitor unusual
> +symbolic-link transitions over all process running in a system.
>  .RE
>  .\"
>  .SH RETURN VALUE
> @@ -916,41 +913,38 @@ is
>  and the caller does not have the
>  .B CAP_SYS_RESOURCE
>  capability.
> -.\" FIXME The following (until ========) is not yet in mainline kernel,
> -.\" so commented out for the moment.
> -.\" .TP
> -.\" .B EACCES
> -.\" .I option
> -.\" is
> -.\" .BR PR_SET_MM ,
> -.\" and
> -.\" .I arg3
> -.\" is
> -.\" .BR PR_SET_MM_EXE_FILE ,
> -.\" the file is not executable.
> -.\" .TP
> -.\" .B EBUSY
> -.\" .I option
> -.\" is
> -.\" .BR PR_SET_MM ,
> -.\" .I arg3
> -.\" is
> -.\" .BR PR_SET_MM_EXE_FILE ,
> -.\" and this the second attempt to change the
> -.\" .I /proc/pid/exe
> -.\" symbolic link, which is prohibited.
> -.\" .TP
> -.\" .B EBADF
> -.\" .I option
> -.\" is
> -.\" .BR PR_SET_MM ,
> -.\" .I arg3
> -.\" is
> -.\" .BR PR_SET_MM_EXE_FILE ,
> -.\" and the file descriptor passed in
> -.\" .I arg4
> -.\" is not valid.
> -.\" ========== END FIXME
> +.TP
> +.B EACCES
> +.I option
> +is
> +.BR PR_SET_MM ,
> +and
> +.I arg3
> +is
> +.BR PR_SET_MM_EXE_FILE ,
> +the file is not executable.
> +.TP
> +.B EBUSY
> +.I option
> +is
> +.BR PR_SET_MM ,
> +.I arg3
> +is
> +.BR PR_SET_MM_EXE_FILE ,
> +and this the second attempt to change the
> +.I /proc/pid/exe
> +symbolic link, which is prohibited.
> +.TP
> +.B EBADF
> +.I option
> +is
> +.BR PR_SET_MM ,
> +.I arg3
> +is
> +.BR PR_SET_MM_EXE_FILE ,
> +and the file descriptor passed in
> +.I arg4
> +is not valid.
>  .\" The following can't actually happen, because prctl() in
>  .\" seccomp mode will cause SIGKILL.
>  .\" .TP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
