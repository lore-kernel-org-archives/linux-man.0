From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: add missing proc stats fields
Date: Thu, 29 May 2014 09:57:36 +0200
Message-ID: <5386E870.3070402@gmail.com>
References: <20140527121059.15025.95410.stgit@unused-4-157.brq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140527121059.15025.95410.stgit-/v0jm+aXwyk2pP1PFFXgSPXAX3CI6PSWQQ4Iyu8u01E@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jchaloup <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, johnsonm-MGnxaD/BIt43uPMLIKxrzw@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/27/2014 02:10 PM, jchaloup wrote:
> Adding missing proc stats fields from
> https://www.kernel.org/doc/Documentation/filesystems/proc.txt,
> caption: Table 1-4: Contents of the stat files (as of 2.6.30-rc7).
> Distribution: Fedora 20. Man-pages: man-pages-3.67.

Jan,

Thank you for this patch. Note, however, that these fields were
not added in 2.6.30. Rather, the first three were in 3.3 and
the remainder were in 3.5. I applied this patch and amended to
note the correct versions.

Thanks,

Michael

> 
> Signed-off-by: jchaloup <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man5/proc.5 |   32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index a106b17..620e6e3 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -1385,6 +1385,38 @@ for a guest operating system), measured in clock ticks (divide by
>  .IR sysconf(_SC_CLK_TCK) ).
>  .RE
>  .TP
> +\fIstart_data\fP %lu (since Linux 2.6.30)
> +(45) Address above which program data+bss is placed.
> +.RE
> +.TP
> +\fIend_data\fP %lu (since Linux 2.6.30)
> +(46) Address below which program data+bss is placed.
> +.RE
> +.TP
> +\fIstart_brk\fP %lu (since Linux 2.6.30)
> +(47) Address above which program heap can be expanded with brk().
> +.RE
> +.TP
> +\fIarg_start\fP %lu (since Linux 2.6.30)
> +(48) Address above which program command line is placed.
> +.RE
> +.TP
> +\fIarg_end\fP %lu (since Linux 2.6.30)
> +(49) Address below which program command line is placed.
> +.RE
> +.TP
> +\fIenv_start\fP %lu (since Linux 2.6.30)
> +(50) Address above which program environment is placed.
> +.RE
> +.TP
> +\fIenv_end\fP %lu (since Linux 2.6.30)
> +(51) Address below which program environment is placed.
> +.RE
> +.TP
> +\fIexit_code\fP %d (since Linux 2.6.30)
> +(52) The thread's exit_code in the form reported by the waitpid system.
> +.RE
> +.TP
>  .I /proc/[pid]/statm
>  Provides information about memory usage, measured in pages.
>  The columns are:
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
