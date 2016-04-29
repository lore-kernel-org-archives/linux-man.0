From: Georg Sauthoff <mail-vzQcyvifq/Y@public.gmane.org>
Subject: prctl() PR_SET_PDEATHSIG race condition note
Date: Fri, 29 Apr 2016 21:06:06 +0200
Message-ID: <20160429190606.GA30805@dell12.lru.li>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

regarding the PR_SET_PDEATHSIG paragraph in prctl(2):

> PR_SET_PDEATHSIG (since Linux 2.1.57)
>       Set the parent death signal of the calling process to arg2
>       (either a signal value in the range 1..maxsig, or 0 to clear).
>       This is the signal that the calling process will get when its
>       parent dies.  This value is cleared for the child of a fork(2)
>       and (since Linux 2.4.36 / 2.6.23) when executing a set-user-ID
>       or set-group-ID binary, or a binary that has associated
>       capabilities (see capabilities(7)).  This value is preserved
>       across execve(2).
>
>       Warning: the "parent" in this case is considered to be the
>       thread that created this process.  In other words, the signal
>       will be sent when that thread terminates (via, for example,
>       pthread_exit(3)), rather than after all of the threads in the
>       parent process terminate.

Perhaps it makes sense to add a note regarding a race condition
between the child being able to call prctl() and an early exit of
the parent process (after a successful fork()); i.e. when the
parent death signal is installed after the parent has already
died.

See for example following links that may indicate that this isn't
necessarily obvious:

- http://lkml.iu.edu/hypermail/linux/kernel/0003.1/0769.html
- http://stackoverflow.com/a/284443/427158

If you like you can include a code snippet how to use
prctl(PR_SET_PDEATHSIGH, ) race condition free, cf. the snippets
I've included in my answer on SO:
http://stackoverflow.com/a/36945270/427158


Best regards
Georg
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
