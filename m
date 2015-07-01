From: Ambrose Feinstein <ambrose-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: mmap(MAP_NORESERVE) and SIGSEGV on OOM
Date: Tue, 30 Jun 2015 17:09:13 -0700
Message-ID: <CANStQM3rAm=ekUv6Xqb6+z76--XZf1Vb=P5v3HzawEZ4-e7GvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://man7.org/linux/man-pages/man2/mmap.2.html says of MAP_NORESERVE

> When swap space is not reserved one might get SIGSEGV upon a write if
> no physical memory is available.

I think this sentence should be removed, or perhaps qualified with
specific circumstances or past kernel versions.  It likely descends
from documentation for some other operating system with different
behavior, but as best I can tell from reading the kernel sources and
experimenting, it does not describe Linux.

In Linux, the effect of MAP_NORESERVE is only to set VM_NORESERVE in
the vma flags, exempting the mapping from the "heuristic overcommit"
accounting; it doesn't affect the fault path.  And I know of no
out-of-memory situation in which the kernel generates SIGSEGV.  The
closest I can see is touching a MAP_SHARED region backed by a full
tmpfs, which generates SIGBUS.  For anonymous mappings the kernel
invokes the OOM killer.

The man page later hedges

> BUGS
>
> On Linux there are no guarantees like those suggested above under
> MAP_NORESERVE.

Perhaps this is meant to negate the SIGSEGV remark, but it seems more
meant for the previous sentence which actually contains the word
"guarantee".  "One might get SIGSEGV" doesn't sound like any sort of
guarantee to me.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
