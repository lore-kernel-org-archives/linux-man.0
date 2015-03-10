From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Question about seccomp(2) man page example code
Date: Tue, 10 Mar 2015 18:24:21 +0100
Message-ID: <CAKgNAkhz=Dx9SRVadU_cVEiU-yxjAPxANwd2ZyJUxoWZkYUQEQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Kees,

I was looking further at the seccomp(2) man page we put togetehr a
while ago, and in particular at the example [1]. I realized that from
a readability view, the order of the statements is rather contorted,
so that we have branches to the end of the code (labels 5 and 6) to
handle the syscall and arch mismatch cases, rather than swapping the
branch order on the statements labeled 0 and 1, and having the kill
statements immediately follow the test statements.

However, I presume the ordering is as it is for efficiency reasons, so
that the common case involves no branch forward (i.e., a branch offset
of 0). Is that the case? If so, probably something should be said in
the man page.

Cheers,

Michael

[1] http://man7.org/linux/man-pages/man2/seccomp.2.html#EXAMPLE
-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
