From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 99911] ioperm is kept on fork
Date: Tue, 16 Jun 2015 09:56:23 +0000
Message-ID: <bug-99911-11311-2QiIscMXiF@https.bugzilla.kernel.org/>
References: <bug-99911-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-99911-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=99911

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Alex Henrie from comment #0)
> Created attachment 179851 [details]
> fork-and-beep test program
> 
> `man ioperm` currently states "Permissions are not inherited by the child
> created by fork(2); following a fork(2) the child must turn on those
> permissions that it needs." This is not true. I do not know if it was true
> at some point in the past, but ioperm is preserved across a fork at least as
> far back as Linux 2.6.26.
> 
> A test program to demonstrate this behavior is attached.

So, there's two possibilities here. Either the man page has always been wrong,
or once it was right, and then in the distant past things changed. I suspect
that the latter is more likely, but I could be wrong. If the latter is the
case, then even if we can't easily work out when the change occurred, it would
probably be nice to have a note in the page saying that once upon a time the
behavior was different.

With that in mind, could I ask you a favor. Could you take a quick look at the
Linux 1.0 sources (https://www.kernel.org/pub/linux/kernel/v1.0/ ). If I am
reading them correctly, then indeed back then the man page text was true. I am
looking at sys_ioperm() in kernel/ioport.c:

asmlinkage int sys_ioperm(unsigned long from, unsigned long num, int turn_on)
{
...
        set_bitmap((unsigned long *)current->tss.io_bitmap, from, num,
!turn_on);
        return 0;
}

and sys_fork() in kernel/fork.c:

asmlinkage int sys_fork(struct pt_regs regs)
{
...
        p->tss.bitmap = offsetof(struct tss_struct,io_bitmap);
        for (i = 0; i < IO_BITMAP_SIZE+1 ; i++) /* IO bitmap is actually SIZE+1
*/
                p->tss.io_bitmap[i] = ~0;
...
}

That latter piece code appears to be resetting the map in the child, but
perhaps I am misreading.

Thanks,

Michael

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
