From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] setfsuid.2: Fix note about errors from the syscall
 wrapper
Date: Sat, 2 Jul 2016 00:16:57 +0200
Message-ID: <eebefde7-320e-2b37-356b-59ea8ed8fed5@gmail.com>
References: <1467382449-32544-1-git-send-email-jannh@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467382449-32544-1-git-send-email-jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jann,

On 07/01/2016 04:14 PM, Jann Horn wrote:
> See sysdeps/unix/sysv/linux/i386/setfsuid.c in glibc-2.2.1.
> (This code is not present in modern glibc anymore.)

Thanks for the patch! Applied.

Cheers,

Michael

> Signed-off-by: Jann Horn <jannh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/setfsgid.2 | 6 ++++--
>  man2/setfsuid.2 | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/man2/setfsgid.2 b/man2/setfsgid.2
> index d1d021d..910b3fd 100644
> --- a/man2/setfsgid.2
> +++ b/man2/setfsgid.2
> @@ -77,8 +77,10 @@ This system call is present in Linux since version 1.2.
>  is Linux-specific and should not be used in programs intended
>  to be portable.
>  .SH NOTES
> -When glibc determines that the argument is not a valid group ID,
> -it will return \-1 and set \fIerrno\fP to
> +When old versions of glibc determine that the argument can not be
> +passed to the kernel without integer truncation (because the kernel
> +is old and does not support 32-bit group IDs),
> +they will return \-1 and set \fIerrno\fP to
>  .B EINVAL
>  without attempting
>  the system call.
> diff --git a/man2/setfsuid.2 b/man2/setfsuid.2
> index 57b125e..08735df 100644
> --- a/man2/setfsuid.2
> +++ b/man2/setfsuid.2
> @@ -77,8 +77,10 @@ This system call is present in Linux since version 1.2.
>  is Linux-specific and should not be used in programs intended
>  to be portable.
>  .SH NOTES
> -When glibc determines that the argument is not a valid user ID,
> -it will return \-1 and set \fIerrno\fP to
> +When old versions of glibc determine that the argument can not be
> +passed to the kernel without integer truncation (because the kernel
> +is old and does not support 32-bit user IDs),
> +they will return \-1 and set \fIerrno\fP to
>  .B EINVAL
>  without attempting
>  the system call.
>


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
