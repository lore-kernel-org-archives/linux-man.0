From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: aarch64 clone() man page omission
Date: Mon, 9 May 2016 23:01:39 +0200
Message-ID: <2a9c5b1d-b052-daeb-eca5-ecf98f9b29d4@gmail.com>
References: <571E731A.6050809@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <571E731A.6050809-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Colin,

On 04/25/2016 09:42 PM, Colin Ian King wrote:
> Hi there,
> 
> currently, the aarch64 clone() system call requires the stack to be
> aligned at a 16 byte boundary, see arch/arm64/kernel/process.c,
> copy_thread():
> 
>                 if (stack_start) {
>                         if (is_compat_thread(task_thread_info(p)))
>                                 childregs->compat_sp = stack_start;
>                         /* 16-byte aligned stack mandatory on AArch64 */
>                         else if (stack_start & 15)
>                                 return -EINVAL;
>                         else
>                                 childregs->sp = stack_start;
>                 }
> 
> 
> ..and returns -EINVAL if not aligned correctly.  This should be added to
> the manual page clone(2) as it took me a while to figure out why clone()
> was failing with -EINVAL for aarch64 but not on x86.

Thanks for the report!I applied the patch below. (Seem okay?)

Cheers,

Michael

diff --git a/man2/clone.2 b/man2/clone.2
index c9ce21c..184875a 100644
--- a/man2/clone.2
+++ b/man2/clone.2
@@ -969,6 +969,13 @@ but the kernel was not configured with the
 .B CONFIG_UTS
 option.
 .TP
+.B EINVAL
+.I child_stack
+is not aligned to a suitable boundary for this architecture.
+For example, on aarch64,
+.I child_stack
+must be a multiple of 16.
+.TP
 .B ENOMEM
 Cannot allocate sufficient memory to allocate a task structure for the
 child, or to copy those parts of the caller's context that need to be


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
