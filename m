From: Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>
Subject: Re: [man-pages PATCH 1/5] s390_runtime_instr.2: note that
 runtime_instr.h is not a public header
Date: Sat, 20 Jan 2018 12:28:39 +0100
Message-ID: <20180120112839.GB6287@osiris>
References: <20180114185622.GA23506@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180114185622.GA23506-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Schwidefsky <schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, QingFeng Hao <haoqf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Jan Glauber <jang-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alexey Ishchuk <aishchuk-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sun, Jan 14, 2018 at 07:56:22PM +0100, Eugene Syromyatnikov wrote:
> For some reason, runtime_instr.h is inside arch/s390/include/asm/ and
> not arch/s390/include/uapi/asm/, so it's not readily available to the
> user space programs. Let's reflect it.
> 
> * man2/s390_runtime_instr.2 (.SH SYNOPSYS): Comment out the #include
> <asm/runtime_instr.h> statement.
> (.SH NOTES): Note the existence and presence of runtime_instr.h header
> inside the Linux kernel source tree.
> ---
>  man2/s390_runtime_instr.2 | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/s390_runtime_instr.2 b/man2/s390_runtime_instr.2
> index 18c2c07..f979692 100644
> --- a/man2/s390_runtime_instr.2
> +++ b/man2/s390_runtime_instr.2
> @@ -27,8 +27,9 @@
>  s390_runtime_instr \- enable/disable s390 CPU run-time instrumentation
>  .SH SYNOPSIS
>  .nf
> -.B #include <asm/runtime_instr.h>
> -.PP
> +.\" This header never had been a part of uapi as of 4.15
> +.\" .B #include <asm/runtime_instr.h>
> +.\" .PP
>  .BI "int s390_runtime_instr(int " command ", int " signum ");
>  .fi
>  .SH DESCRIPTION
> @@ -85,6 +86,12 @@ The run-time instrumentation facility is available beginning with System z EC12.
>  Glibc does not provide a wrapper for this system call, use
>  .BR syscall (2)
>  to call it.
> +.PP
> +Kernel's header
> +.B arch/s390/include/asm/runtime_instr.h
> +contains the necessary declarations for using run-time instrumentation.
> +Unfortunately, it hasn't been included as a part of Linux's UAPI
> +as of Linux 4.15.

IMHO we shouldn't document the file name of a kernel header that is not
exported. It's name and location can change anytime. I will move the kernel
header file to the uapi directory where it should have been since a long
time.
Thanks for reporting!

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
