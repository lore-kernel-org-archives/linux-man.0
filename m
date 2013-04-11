From: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Subject: Re: vdso(7): new man page
Date: Thu, 11 Apr 2013 14:31:55 -0400
Message-ID: <CALCETrXwfpH=dRZ82MqjWWL0oFohigcUHgLPnRPpnisOHYxKQQ@mail.gmail.com>
References: <201304092317.01590.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201304092317.01590.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Apr 9, 2013 at 8:17 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> so i've slapped this together.  i think the HISTORY section could use more
> filling out, but that'd probably be more for funsies rather than usefulness.
>

This looks good to me.  It may be worth mentioning that programs must
not assume anything about where the vDSO is mapped -- that may change
from kernel to kernel or exec to exec, unless the particular
architecture makes some guarantee.


> .SS Example Background
> Making syscalls themselves can incur significant penalty.
> In x86 systems, you can trigger a software interrupt (int $0x80) to tell the
> kernel you wish to make a syscall.
> Internally, this means the call has to go through the normal interrupt layers
> to save/restore context before it even gets a chance to start processing the
> system call.
> Wouldn't it be nicer if you could start processing the system call immediately?
> With newer revisions of the x86 architecture, there is now a syscall/sysenter
> instruction that does exactly that (jumps directly to the system call entry).
> However, rather than require the C library to figure out if this functionality
> is available itself, the vDSO includes symbols that can be used.
> This is typically referred to using the term "vsyscall".

I find this a bit confusing.  The term "vsyscall" means something
different on x86_64, and syscall and sysenter are different
instructions.  How about this:

Making syscalls can be slow.
In x86 32-bit systems, you can trigger a software interrupt (int
$0x80) to tell the
kernel you wish to make a syscall.  This instruction is expensive: it
goes through the full interrupt handling paths in microcode and in the
kernel.  Newer processors have faster, incompatible ways to issue
system calls, and the kernel abstracts these through an entry point in
the vdso.  (The terminology can be confusing.  On x86_32, this
function is called __kernel_vsyscall, but on x86_64, the term
"vsyscall" refers to an obsolete way to ask the kernel what time it is
or what cpu the caller is on.)

--Andy
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
