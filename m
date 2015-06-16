From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 99901] iopl is lost on fork and execve
Date: Tue, 16 Jun 2015 09:48:09 +0000
Message-ID: <bug-99901-11311-510Q2exEgl@https.bugzilla.kernel.org/>
References: <bug-99901-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-99901-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=99901

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Alex,

Thanks for this report and also for
https://bugzilla.kernel.org/show_bug.cgi?id=99911
I recall seeing your mailing list discussions on this and had been meaning to
follow up.

(In reply to Alex Henrie from comment #0)
> Created attachment 179841 [details]
> iopl3 test program
> 
> `man iopl` currently states "Permissions are inherited by fork(2) and
> execve(2)." This is not true. iopl has never been preserved across fork or
> execve on x64 kernels,[1] and it has not been preserved across those
> syscalls on x86 kernels since Linux 3.7.[2] There are no plans to change the
> current behavior for either architecture.[3-6]

Okay -- I'll come up with some man page text, but first I have a question in
the other bug.

Cheers,

Michael


> 
> A test program to demonstrate this behavior is attached.
> 
> [1]
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/
> x86/kernel/process_64.c
> [2]
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/
> x86/kernel/process_32.c?id=6783eaa2e1253fbcbe2c2f6bb4c843abf1343caf
> [3] https://lkml.org/lkml/2015/5/11/1054
> [4] https://lkml.org/lkml/2015/5/12/55
> [5] https://lkml.org/lkml/2015/5/12/537
> [6] https://lkml.org/lkml/2015/5/12/545

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
