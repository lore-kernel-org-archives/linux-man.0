From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 70801] ptrace PEEKDATA API is incorrect
Date: Wed, 19 Feb 2014 11:33:47 +0000
Message-ID: <bug-70801-11311-uFYQgl1coY@https.bugzilla.kernel.org/>
References: <bug-70801-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-70801-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=70801

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #2 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Andrew Hunter from comment #0)
> ptrace(2) manual gives us the API:
> 
>        PTRACE_PEEKTEXT, PTRACE_PEEKDATA
>               Read a word at the address addr in the tracee's memory,
>               returning the word as the result of the ptrace() call.  Linux
>               does not have separate text and data address spaces, so these
>               two requests are currently equivalent.  (data is ignored.)
> 
> checking kernel/ptrace.c gives us:
> 
> int ptrace_request(struct task_struct *child, long request,
> 		   unsigned long addr, unsigned long data)
> {
>  ...
> 	switch (request) {
> 	case PTRACE_PEEKTEXT:
> 	case PTRACE_PEEKDATA:
> 		return generic_ptrace_peekdata(child, addr, data);
> 
> 
> int generic_ptrace_peekdata(struct task_struct *tsk, unsigned long addr,
> 			    unsigned long data)
> {
> 	unsigned long tmp;
> 	int copied;
> 
> 	copied = access_process_vm(tsk, addr, &tmp, sizeof(tmp), 0);
> 	if (copied != sizeof(tmp))
> 		return -EIO;
> 	return put_user(tmp, (unsigned long __user *)data);
> }
> 
> So clearly data is _not_ ignored and the word is _not_ returned as the
> result of ptrace.  I also verified that various working ptrace calls in fact
> use the API as the kernel has it, not the man page.

I see that Mike Frysinger already got in with the technical details (thanks
Mike).

However, you caught me on one of those days when I can't let some things pass
without comment:

> This wants a relatively simple fix itself, but it does _not_ fill me with
> confidence as to the accuracy of the man page for the other requests; I
> strongly suggest you audit them for accuracy (sadly I don't have time to do
> this myself.)  Just a thought.

Let me paraphrase this report. "I saw a problem in the man page. I didn't
bother to check the latest version of the page (or at least, I did not check it
thoroughly... see
http://man7.org/linux/man-pages/man2/ptrace.2.html#RETURN_VALUE ). I presumed
that glibc didn't come into play (though I should know that most applications
use the glibc wrappers, not raw syscalls)." All of that's fine, I get reports
like that often enough. 

But then "I told the maintainer that the fix was simple, but didn't bother to
provide a patch or even a suggested rewording. Finally, I made a somewhat snide
comment regarding my suspicions about the quality of the man page, told the
maintainer that I couldn't be bothered doing anything about my suspicions, but
suggested that they should."

Now, last time I looked, you were not paying me to work on man pages. (Indeed,
it is entirely unpaid.) So, the principal difference between us with respect to
improving the pages is purely one of willingness to actually _do_ something. I
strongly suggest you might want to check the tone of your report. Just a
thought.

Pleasantries out of the way, I acknowledge that even if one looked at the
latest version of the man page, the story is not obvious enough (that's the
valuable piece of your report), and I applied a patch,
http://git.kernel.org/cgit/docs/man-pages/man-pages.git/commit/?id=051ec121f004f2bcdb8f059c56c690d680b04872

-- 
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
