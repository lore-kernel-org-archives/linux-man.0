From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: vdso(7): new man page
Date: Thu, 27 Jun 2013 02:00:13 +0200
Message-ID: <CAKgNAkgwmfBeyijCHj+y2FSQbgSDY8izW-9DAqbw4wgD2y1pAA@mail.gmail.com>
References: <201304092317.01590.vapier@gentoo.org> <201304112128.47633.vapier@gentoo.org>
 <519CC681.6080502@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <519CC681.6080502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

Ping!

Cheers,

Michael



On Wed, May 22, 2013 at 3:22 PM, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Mike,
>
> On 04/12/13 03:28, Mike Frysinger wrote:
>> here's v2 w/Andy's feedback
>
> Thanks for this--it's a nice piece of work. Could you take a
> look at my comments below and send a v3, please.
>
>> .\" Written by Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
>> .\"
>> .\" %%%LICENSE_START(PUBLIC_DOMAIN)
>> .\" This page is in the public domain.  Suck it.
>
> Okay -- not my first choice for a license, but so be it.
> But, how about we lose the "Suck it."...
>
>> .\" %%%LICENSE_END
>> .\"
>> .TH VDSO 7 2013-04-09 "Linux" "Linux Programmer's Manual"
>> .SH NAME
>> vDSO \- overview of the virtual ELF dynamic shared object
>> .SH SYNOPSIS
>> .B #include <sys/auxv.h>
>>
>> .B void *vdso = (uintptr_t)getauxval(AT_SYSINFO_EHDR);
>
> Add space before "getauxval". (Usual convention for casts in code examples
> in man pages.)
>
>> .SH DESCRIPTION
>> The "vDSO" is a small shared library that the kernel automatically maps into the
>> address space of all userspace applications.
>
> 1,$s/userspace applications/user-space applications/
>
>> Applications themselves usually need not concern themselves with this as it is
>> most commonly called by the C library.
>
> This last sentence doesn't quite make sense, since "this" and "it" refer to
> different things (I believe). Do you want something like:
>
>         Applications generally do not need to care about the details since
>         the vDSO is automatically employed by the C library
>
> ?
>
>> This way you can write using standard functions and the C library will take care
>> of using any available functionality.
>>
>> Why does this object exist at all?
>
> s/this object/the vDSO/
>
>> There are some facilities the kernel provides that userspace ends up using
>
> s/userspace/user space/
>
> (When used as a noun, and in other places in the page as well)
>
>
>> frequently to the point that such calls can dominate overall performance.
>> This is due both to the frequency of the call as well as the context overhead
>> from exiting userspace and entering the kernel.
>>
>> The rest of this documentation is geared towards the curious and/or C library
>> writers rather than general developers.
>> If you're trying to call the vDSO in your own application rather than using
>> the C library, you're most likely doing it wrong.
>> .SS Example Background
>
> Convention for SS headings is that only the first word is capitalized (unless
> English usage dictates otherwise--e.g., for a proper noun)
>
>> Making syscalls can be slow.
>
> 1,$s/syscall/system call/
>
> (and other instances in the page)
>
>> In x86 32bit systems, you can trigger a software interrupt (int $0x80) to tell
>
> s/32bit/32-bit/
>
>> the kernel you wish to make a syscall.
>> However, this instruction is expensive: it goes through the full interrupt
>> handling paths in the processor's microcode as well as in the kernel.
>> Newer processors have faster (but backwards incompatible) instructions to
>> initiate system calls.
>> Rather than require the C library to figure out if this functionality is
>> available at runtime itself, it can use functions provided by the kernel in
>> the vDSO.
>
> That last point (after the comma) is the most interesting (IMO) of the use
> cases of the vDSO. If you cared to expand on the details (i.e., are what
> are mechanics of the operation of those functions provided by the kernel),
> I think that would be interesting for the reader.
>
>> Note that the terminology can be confusing.
>> On x86 systems, the vDSO function is named "__kernel_vsyscall", but on x86_64,
>> the term "vsyscall" also refers to an obsolete way to ask the kernel what time
>> it is or what cpu the caller is on.
>
> s/cpu/CPU/
>
>> Another frequent system call is gettimeofday().
>> This is called both directly by userspace applications as well as indirectly by
>> the C library.
>> Think timestamps or timing loops or polling -- all of these frequently need to
>> know what time it is right now.
>> This information is also not secret -- any application in any privilege mode
>> (root or any user) will get the same answer.
>> Thus the kernel arranges for the information required to answer this question
>> to be placed in memory the process can access.
>> Now a call to gettimeofday() changes from a syscall to a normal function call
>> and a few memory accesses.
>> .SS Finding The vDSO
>
> s/The/the/
>
>> The base address of the vDSO (if one exists) is passed by the kernel to each
>> program in the initial auxiliary vector.
>> Specifically, via the
>> .B AT_SYSINFO_EHDR
>> tag.
>>
>> You must not assume the vDSO is mapped at any particular location in the
>> user's memory map.
>> The base address will usually be randomized at runtime every time a new is
>
> Missing word after "new".
>
>> processed (at
>> .BR execve (2)
>> time).
>> This is done for security reasons to prevent standard "return-to-libc" attacks.
>>
>> For some architectures, there is also a
>> .B AT_SYSINFO
>> tag.
>> This is used only for locating the vsyscall entry point and is frequently
>> omitted or set to 0 (meaning it's not available).
>> It is a throw back to the initial vDSO work (see
>
> s/throw back/throwback/
>
>> .IR HISTORY
>> below) and should be avoided.
>>
>> Refer to
>> .BR getauxval (3)
>> for more details on accessing these fields.
>> .SS File Format
>
> s/Format/format/
>
>> Since the vDSO is a fully formed ELF, you can do symbol lookups on it.
>
> Missing word after ELF.
>
>> This allows new symbols to be added with newer kernel releases, and for the
>> C library to detect available functionality at runtime when running under
>> different kernel versions.
>> Often times the C library will do detection with the first call and then
>> cache the result for subsequent calls.
>>
>> All symbols are also versioned (using the GNU version format).
>> This allows the kernel (in the very unlikely situation) to update the function
>
> s/situation/case that it is necessary/
>
>> signature without breaking backwards compatibility.
>> This means changing the arguments that it accepts as well as the return value.
>
> What is "it" in the previous line? (Please replace with a suitable noun.)
>
>> When looking up a symbol in the vDSO, you must always include the version you
>> are writing against.
>>
>> Typically the vDSO follows the naming convention of prefixing all symbols with
>> "__vdso_" or "__kernel_" so as to distinguish from other standard symbols.
>
> s/distinguish/distinguish them/
>
>> e.g. The "gettimeofday" function is named "__vdso_gettimeofday".
>>
>> You use the standard C calling conventions when calling any of these functions.
>> No need to worry about weird register or stack behavior.
>
> That last sentence is a little incomplete. Could you expand/reword a little
> please.
>
>> .SH NOTES
>> .SS Source
>> When you compile the kernel, it will automatically compile and link the vDSO
>> code for you.
>> You will frequently find it under the arch specific dir:
>
> s/arch specific dir/architecture-specific directory/
>
>> .br
>
> Change that last to a blank line, and then indent the next line by 4 spaces.
>
>> find arch/$ARCH/ -name '*vdso*.so*' -o -name '*gate*.so*'
>>
>> Note that the vDSO that is used is based on the ABI of your userspace code
>> and not the ABI of the kernel.
>> i.e. If you run an i386 32bit ELF under an i386 32bit kernel or under an
>
> s/i.e. If/In other words, if/
> s/32bit/32-big/g
>
>> x86_64 64bit kernel, you'll get the same vDSO.
>
> s/64bit/64-bit/
>
>> So when referring to sections below, use the userspace ABI.
>
> It's not clear what you mean here when you say "use the userspace ABI."
> Could you clarify?
>
>> .SS vDSO Names
>
> s/Names/names/
>
>> The name of this shared object varies across architectures.
>> It will often show up in things like glibc's `ldd` output.
>> The exact name should not matter to any code, so please do not hardcode it.
>
> s/please//
>
>> .if t \{\
>> .ft CW
>> \}
>> .TS
>> l l.
>> user ABI      vDSO name
>> _
>> aarch64       linux-vdso.so.1
>> ia64  linux-gate.so.1
>> ppc/32        linux-vdso32.so.1
>> ppc/64        linux-vdso64.so.1
>> s390  linux-vdso32.so.1
>> s390x linux-vdso64.so.1
>> sh    linux-gate.so.1
>> i386  linux-gate.so.1
>> x86_64        linux-vdso.so.1
>> x86/x32       linux-vdso.so.1
>> .TE
>> .if t \{\
>> .in
>> .ft P
>> \}
>> .SS aarch64 functions
>> .\" See linux/arch/arm64/kernel/vdso/vdso.lds.S
>> .if t \{\
>> .ft CW
>> \}
>> .TS
>> l l.
>> symbol        version
>> _
>> __kernel_rt_sigreturn LINUX_2.6.39
>> __kernel_gettimeofday LINUX_2.6.39
>> __kernel_clock_gettime        LINUX_2.6.39
>> __kernel_clock_getres LINUX_2.6.39
>> .TE
>> .if t \{\
>> .in
>> .ft P
>> \}
>> .SS bfin (Blackfin) functions
>> .\" See linux/arch/blackfin/kernel/fixed_code.S
>> .\" See http://docs.blackfin.uclinux.org/doku.php?id=linux-kernel:fixed-code
>
> Thanks -- adding references like the above in the source is helpful
> for future maintenance.
>
>> As this cpu lacks a MMU, it doesn't setup a vDSO in the normal sense.
>
> s/cpu/CPU/
> s/MMU/memory-management unit (MMU)/
> s/setup/set up/
>
>> Instead, it maps at boot time a few raw functions into a fixed location in
>> memory.
>> Userspace apps then call directly into that.
>
> s/apps/applications/
>
>> There is no provision for backwards compatibility beyond sniffing raw opcodes,
>> but as this is an embedded CPU, it can get away with things -- some of the
>> object formats it runs aren't even ELF based (they're bFLT/FLAT).
>>
>> For documentation on this format, it's better you refer to the public docs:
>> .br
>> http://docs.blackfin.uclinux.org/doku.php?id=linux-kernel:fixed-code
>> .SS ia64 (Itanium) functions
>> .\" See linux/arch/ia64/kernel/gate.lds.S
>> .\" Also linux/arch/ia64/kernel/fsys.S and linux/Documentation/ia64/fsys.txt
>> .if t \{\
>> .ft CW
>> \}
>> .TS
>> l l.
>> symbol        version
>> _
>> __kernel_sigtramp     LINUX_2.5
>> __kernel_syscall_via_break    LINUX_2.5
>> __kernel_syscall_via_epc      LINUX_2.5
>> .TE
>> .if t \{\
>> .in
>> .ft P
>> \}
>>
>> The Itanium port actually likes to get tricky.
>> In addition to the vDSO above, it also has "light-weight system calls" aka
>
> s/aka/also known as/
>
>> "fast syscalls" aka "fsys".
>
> s/aka/or/
>
>> You can invoke these via the __kernel_syscall_via_epc vDSO helper.
>> The system calls listed here have the same semantics as if you called them
>> directly via
>> .BR syscall (3),
>> so refer to the relevant
>> documentation for each.
>> The table below lists the functions available via this mechanism.
>> .if t \{\
>> .ft CW
>> \}
>> .TS
>> l.
>> function
>> _
>> clock_gettime
>> getcpu
>> getpid
>> getppid
>> gettimeofday
>> set_tid_address
>> .TE
>> .if t \{\
>> .in
>> .ft P
>> \}
>> .SS ppc/32 functions
>> .\" See linux/arch/powerpc/kernel/vdso32/vdso32.lds.S
>> The functions marked with a
>> .I *
>> below are only available when the kernel is
>> a powerpc64 (64bit) kernel.
>
> s/64bit/64-bit/
>
>> .if t \{\
>> .ft CW
>> \}
>> .TS
>> l l.
>> symbol        version
>> _
>> __kernel_clock_getres LINUX_2.6.15
>> __kernel_clock_gettime        LINUX_2.6.15
>> __kernel_datapage_offset      LINUX_2.6.15
>> __kernel_get_syscall_map      LINUX_2.6.15
>> __kernel_get_tbfreq   LINUX_2.6.15
>> __kernel_getcpu \fI*\fR       LINUX_2.6.15
>> __kernel_gettimeofday LINUX_2.6.15
>> __kernel_sigtramp_rt32        LINUX_2.6.15
>> __kernel_sigtramp32   LINUX_2.6.15
>> __kernel_sync_dicache LINUX_2.6.15
>> __kernel_sync_dicache_p5      LINUX_2.6.15
>> .TE
>> .if t \{\
>> .in
>> .ft P
>> \}
>> .SS ppc/64 functions
>> .\" See linux/arch/powerpc/kernel/vdso64/vdso64.lds.S
>> .if t \{\
>> .ft CW
>> \}
>> .TS
>> l l.
>> symbol        version
>> _
>> __kernel_clock_getres LINUX_2.6.15
>> __kernel_clock_gettime        LINUX_2.6.15
>> __kernel_datapage_offset      LINUX_2.6.15
>> __kernel_get_syscall_map      LINUX_2.6.15
>> __kernel_get_tbfreq   LINUX_2.6.15
>> __kernel_getcpu       LINUX_2.6.15
>> __kernel_gettimeofday LINUX_2.6.15
>> __kernel_sigtramp_rt64        LINUX_2.6.15
>> __kernel_sync_dicache LINUX_2.6.15
>> __kernel_sync_dicache_p5      LINUX_2.6.15
>> .TE
>> .if t \{\
>> .in
>> .ft P
>> \}
>> .SS s390 functions
>> .\" See linux/arch/s390/kernel/vdso32/vdso32.lds.S
>> .if t \{\
>> .ft CW
>> \}
>> .TS
>> l l.
>> symbol        version
>> _
>> __kernel_clock_getres LINUX_2.6.29
>> __kernel_clock_gettime        LINUX_2.6.29
>> __kernel_gettimeofday LINUX_2.6.29
>> .TE
>> .if t \{\
>> .in
>> .ft P
>> \}
>> .SS s390x functions
>> .\" See linux/arch/s390/kernel/vdso64/vdso64.lds.S
>> .if t \{\
>> .ft CW
>> \}
>> .TS
>> l l.
>> symbol        version
>> _
>> __kernel_clock_getres LINUX_2.6.29
>> __kernel_clock_gettime        LINUX_2.6.29
>> __kernel_gettimeofday LINUX_2.6.29
>> .TE
>> .if t \{\
>> .in
>> .ft P
>> \}
>> .SS sh (SuperH) functions
>> .\" See linux/arch/sh/kernel/vsyscall/vsyscall.lds.S
>> .if t \{\
>> .ft CW
>> \}
>> .TS
>> l l.
>> symbol        version
>> _
>> __kernel_rt_sigreturn LINUX_2.6
>> __kernel_sigreturn    LINUX_2.6
>> __kernel_vsyscall     LINUX_2.6
>> .TE
>> .if t \{\
>> .in
>> .ft P
>> \}
>> .SS i386 functions
>> .\" See linux/arch/x86/vdso/vdso32/vdso32.lds.S
>> .if t \{\
>> .ft CW
>> \}
>> .TS
>> l l.
>> symbol        version
>> _
>> __kernel_sigreturn    LINUX_2.5
>> __kernel_rt_sigreturn LINUX_2.5
>> __kernel_vsyscall     LINUX_2.5
>> .TE
>> .if t \{\
>> .in
>> .ft P
>> \}
>> .SS x86_64 functions
>> .\" See linux/arch/x86/vdso/vdso.lds.S
>> Each of these symbols are also available without the "__vdso_" prefix, but
>
> Either:
> s/Each of these symbols are/All of these symbols are/
> or
> s/Each of these symbols are/Each of these symbols is/
>
>> you should ignore those and stick to the names below.
>> .if t \{\
>> .ft CW
>> \}
>> .TS
>> l l.
>> symbol        version
>> _
>> __vdso_clock_gettime  LINUX_2.6
>> __vdso_getcpu LINUX_2.6
>> __vdso_gettimeofday   LINUX_2.6
>> __vdso_time   LINUX_2.6
>> .TE
>> .if t \{\
>> .in
>> .ft P
>> \}
>> .SS x86/x32 functions
>> .\" See linux/arch/x86/vdso/vdso32.lds.S
>> .if t \{\
>> .ft CW
>> \}
>> .TS
>> l l.
>> symbol        version
>> _
>> __vdso_clock_gettime  LINUX_2.6
>> __vdso_getcpu LINUX_2.6
>> __vdso_gettimeofday   LINUX_2.6
>> __vdso_time   LINUX_2.6
>> .TE
>> .if t \{\
>> .in
>> .ft P
>> \}
>> .SH HISTORY
>
> Better to have this as
>
> .SS History
>
>> The vDSO was originally just a single function -- the vsyscall.
>> In older kernels, you might see that in a process's memory map rather than vdso.
>> Overtime, people realized that this was a great way to pass more functionality
>
> s/Overtime/Over time/
>
>> to userspace, so it was reconceived as a vDSO in the current format.
>> .SH SEE ALSO
>> .BR syscalls (2),
>> .BR getauxval (3),
>> .BR proc (5)
>>
>> The docs/examples/sources in the Linux sources:
>> .nf
>> Documentation/ABI/stable/vdso
>> linux/Documentation/ia64/fsys.txt
>> Documentation/vDSO/* (includes examples of using the vDSO)
>> find arch/ -iname '*vdso*' -o -iname '*gate*'
>> .fi
>>
>
> In the next iteration, could you include a second (separate) patch to
> syscalls.2  and getauxval.3 that adds
> .BR vdso (7)
> under SEE ALSO.
>
> Thanks,
>
> Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
