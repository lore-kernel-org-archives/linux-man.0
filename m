From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] syscall(3): add more arches and improve error
 documentation
Date: Wed, 30 Dec 2015 11:50:33 +0100
Message-ID: <5683B6F9.4030208@gmail.com>
References: <1451440800-30438-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451440800-30438-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/30/2015 03:00 AM, Mike Frysinger wrote:
> Move the error register documentation into the main table rather than
> listing them in sentences after the fact.
> 
> Add sparc error return details.
> 
> Add details for alpha/arc/m68k/microblaze/nios2/powerpc/superh/tile/xtensa.
> 
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>

Great stuff! Thanks, Mike. Applied. (But afterward, I tweaked things a
little so the table was not so wide.)

Cheers,

Michael


> ---
>  man2/syscall.2 | 77 ++++++++++++++++++++++++++++++++++++++++------------------
>  1 file changed, 53 insertions(+), 24 deletions(-)
> 
> diff --git a/man2/syscall.2 b/man2/syscall.2
> index ee87416..d35f1ef 100644
> --- a/man2/syscall.2
> +++ b/man2/syscall.2
> @@ -150,47 +150,67 @@ The first table lists the instruction used to transition to kernel mode,
>  so you might have to refer to
>  .BR vdso (7)),
>  the register used to indicate the system call number,
> -and the register used to return the system call result.
> +the register used to return the system call result,
> +and the register used to signal an error.
>  .if t \{\
>  .ft CW
>  \}
>  .TS
> -l l1 l l1 l.
> -arch/ABI	instruction	syscall #	retval	Notes
> +l	l	l	l	l	l.
> +arch/ABI	instruction	syscall #	retval	error	Notes
>  _
> -arm/OABI	swi NR	-	a1	NR is syscall #
> -arm/EABI	swi 0x0	r7	r0
> -arm64	svc #0	x8	x0
> -blackfin	excpt 0x0	P0	R0
> -i386	int $0x80	eax	eax
> -ia64	break 0x100000	r15	r8	See below
> -mips	syscall	v0	v0	See below
> -parisc	ble 0x100(%sr2, %r0)	r20	r28
> -s390	svc 0	r1	r2	See below
> -s390x	svc 0	r1	r2	See below
> -sparc/32	t 0x10	g1	o0
> -sparc/64	t 0x6d	g1	o0
> -x86_64	syscall	rax	rax	See below
> -x32	syscall	rax	rax	See below
> +alpha	callsys	v0	a0	a3	See below *
> +arc	trap0	r8	r0	-
> +arm/OABI	swi NR	-	a1	-	NR is syscall #
> +arm/EABI	swi 0x0	r7	r0	-
> +arm64	svc #0	x8	x0	-
> +blackfin	excpt 0x0	P0	R0	-
> +i386	int $0x80	eax	eax	-
> +ia64	break 0x100000	r15	r8	r10	See below *
> +m68k	trap #0	d0	d0	-
> +microblaze	brki r14,8	r12	r3	-
> +mips	syscall	v0	v0	a3	See below *
> +nios2	trap	r2	r2	r7
> +parisc	ble 0x100(%sr2, %r0)	r20	r28	-
> +powerpc	sc	r0	r3	r0	See below *
> +s390	svc 0	r1	r2	-	See below **
> +s390x	svc 0	r1	r2	-	See below **
> +superh	trap #0x17	r3	r0	-	See below ****
> +sparc/32	t 0x10	g1	o0	psr/csr	See below *
> +sparc/64	t 0x6d	g1	o0	psr/csr	See below *
> +tile	swint1	R10	R00	R01	See below *
> +x86_64	syscall	rax	rax	-	See below ***
> +x32	syscall	rax	rax	-	See below ***
> +xtensa	syscall	a2	a2	-
>  .TE
>  .PP
> +*
> +On a few architectures,
> +a register is used as a boolean (0 == no error while -1 == error) to signal the
> +system call failed.
> +The actual error value is still contained in the return register.
> +On sparc, the carry bit (csr) in the processor status register (psr) is used
> +instead of a full register.
> +
> +**
>  For s390 and s390x, NR (the system call number)
>  may be passed directly with "svc NR" if it is less than 256.
>  
> +***
>  The x32 ABI uses the same instruction as the x86_64 ABI and is used on
>  the same processors.
>  To differentiate between them, the bit mask
>  .I __X32_SYSCALL_BIT
>  is bitwise-ORed into the system call number for system calls
>  under the x32 ABI.
> +Both syscall tables are available though, so setting the bit is not a hard
> +requirement.
>  
> -On a few architectures,
> -a register is used to indicate simple boolean failure of the system call:
> -ia64 uses
> -.I r10
> -for this purpose,
> -and mips uses
> -.IR a3 .
> +****
> +On SuperH, the trap number controls the maximum number of args passed.
> +A trap #0x10 can be used with only 0 arg syscalls,
> +a trap #0x11 can be used with 0 or 1 arg syscalls,
> +and so on up to 0x17 for 7 arg syscalls.
>  .if t \{\
>  .in
>  .ft P
> @@ -204,21 +224,30 @@ The second table shows the registers used to pass the system call arguments.
>  l	l2	l2	l2	l2	l2	l2	l2	l.
>  arch/ABI	arg1	arg2	arg3	arg4	arg5	arg6	arg7	Notes
>  _
> +alpha	a0	a1	a2	a3	a4	a5	-
> +arc	r0	r1	r2	r3	r4	r5	-
>  arm/OABI	a1	a2	a3	a4	v1	v2	v3
>  arm/EABI	r0	r1	r2	r3	r4	r5	r6
>  arm64	x0	x1	x2	x3	x4	x5	-
>  blackfin	R0	R1	R2	R3	R4	R5	-
>  i386	ebx	ecx	edx	esi	edi	ebp	-
>  ia64	out0	out1	out2	out3	out4	out5	-
> +m68k	d1	d2	d3	d4	d5	a0	-
> +microblaze	r5	r6	r7	r8	r9	r10	-
>  mips/o32	a0	a1	a2	a3	-	-	-	See below
>  mips/n32,64	a0	a1	a2	a3	a4	a5	-
> +nios2	r4	r5	r6	r7	r8	r9	-
>  parisc	r26	r25	r24	r23	r22	r21	-
> +powerpc	r3	r4	r5	r6	r7	r8	r9
>  s390	r2	r3	r4	r5	r6	r7	-
>  s390x	r2	r3	r4	r5	r6	r7	-
> +superh	r4	r5	r6	r7	r0	r1	r2
>  sparc/32	o0	o1	o2	o3	o4	o5	-
>  sparc/64	o0	o1	o2	o3	o4	o5	-
> +tile	R00	R01	R02	R03	R04	R05	-
>  x86_64	rdi	rsi	rdx	r10	r8	r9	-
>  x32	rdi	rsi	rdx	r10	r8	r9	-
> +xtensa	a6	a3	a4	a5	a8	a9	-
>  .TE
>  .PP
>  The mips/o32 system call convention passes
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
