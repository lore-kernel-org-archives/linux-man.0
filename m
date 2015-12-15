From: Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>
Subject: Re: The time(2) man page conflicts with glibc
Date: Tue, 15 Dec 2015 15:31:23 +0100
Message-ID: <mvm7fkf941w.fsf@hawking.suse.de>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>
	<CAKCAbMj-X+wLKX3=MDm9z3L9zyikemxCNggu2bfw6=o6K5PGgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKCAbMj-X+wLKX3=MDm9z3L9zyikemxCNggu2bfw6=o6K5PGgg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Zack Weinberg's message of "Tue, 15 Dec 2015 09:14:36 -0500")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>
Cc: "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org> writes:

> I did.  The *actual system call* does indeed return -EFAULT when
> memory is invalid, which will be observed as 0xfffffffffffffff2 in the
> return value.  However, the *vDSO shortcut* (which does not trap into
> the kernel) will just segfault the application.  This is an observable
> ABI difference between statically and dynamically linked binaries.

Undefined behaviour can change any time in any way and is not part of
the ABI.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab-l3A5Bk7waGM@public.gmane.org
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
