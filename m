From: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: aarch64 clone() man page omission
Date: Mon, 25 Apr 2016 20:42:18 +0100
Message-ID: <571E731A.6050809@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi there,

currently, the aarch64 clone() system call requires the stack to be
aligned at a 16 byte boundary, see arch/arm64/kernel/process.c,
copy_thread():

                if (stack_start) {
                        if (is_compat_thread(task_thread_info(p)))
                                childregs->compat_sp = stack_start;
                        /* 16-byte aligned stack mandatory on AArch64 */
                        else if (stack_start & 15)
                                return -EINVAL;
                        else
                                childregs->sp = stack_start;
                }


..and returns -EINVAL if not aligned correctly.  This should be added to
the manual page clone(2) as it took me a while to figure out why clone()
was failing with -EINVAL for aarch64 but not on x86.

Colin
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
