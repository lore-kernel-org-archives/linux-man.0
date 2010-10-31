From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] kexec_load manpage
Date: Sun, 31 Oct 2010 07:19:13 +0100
Message-ID: <AANLkTimdXb0g0zVKGtCwwO0uBjzWidXAwSxPuxbcjyDP@mail.gmail.com>
References: <20100619132633.GA24277@basil.fritz.box> <m1mxuqu8yr.fsf@fess.ebiederm.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m1mxuqu8yr.fsf-+imSwln9KH6u2/kzUuoCbdi2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kexec Mailing List <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Eric,

On Sat, Jun 19, 2010 at 9:18 PM, Eric W. Biederman
<ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org> wrote:
> Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> writes:
>
>> Here are the beginnings of a kexec_load manpage.
>>
>> Probably needs some more review from Eric and may need some addition=
al
>> information.
>>
>> The syscall is actually only usable with a kernel patch to export
>> the header I just sent separately.
>
> The syscall has been used for years with a separate non-kernel header=
=2E
>
>
> Eric
>
>
>> Also added the kexec subcall to reboot(2)
>>
>> -Andi
>>
>> diff --git a/man2/kexec_load.2 b/man2/kexec_load.2
>> new file mode 100644
>> index 0000000..f486641
>> --- /dev/null
>> +++ b/man2/kexec_load.2
>> @@ -0,0 +1,94 @@
>> +.TH KEXEC_LOAD 2 2010-06-16 "Linux" "Linux Programmer's Manual"
>> +.SH NAME
>> +kexec_load \- Load a new kernel for later execution.
>> +.SH SYNOPSIS
>> +.b #include <linux/kexec.h>
>> +.br
>> +.BI "long kexec_load(unsigned long " entry ", unsigned long " nr_se=
gments ","
>> +.br
>> +.BI =A0 =A0 =A0 "struct kexec_segment *" segments ", unsigned long =
" flags ");"
>> +.SH DESCRIPTION
>> +.BR kexec_load
>> +loads a new kernel that can be executed later
>> +by
>> +.I reboot(2).
>> +An alternative approach is to specify
>> +.B KEXEC_ON_CRASH
>> +in the
>> +.I flags
>> +argument and then the new kernel will be automatically executed on =
a
>> +system crash.
>> +.\" XXX figure out how this is really used
>> +With
>> +.B KEXEC_PRESERVE_CONTEXT
>> +specified in
>> +.I flags
>> +kexec will preserve the system hard and
>> +software state before executing the kexec kernel. This
>> +could be used for system suspend.
>> +
>> +.I flags
>> +also contains the architecture of the executed kernel or
>> +be
>> +.I KEXEC_ARCH_DEFAULT
>> +for the current architecture.
>> +Valid architectures are
>> +.I KEXEC_ARCH_I386,
>> +.I KEXEC_ARCH_X86_64,
>> +.I KEXEC_ARCH_PPC,
>> +.I KEXEC_ARCH_PPC64,
>> +.I KEXEC_ARCH_IA_64,
>> +.I KEXEC_ARCH_ARM,
>> +.I KEXEC_ARCH_S390,
>> +.I KEXEC_ARCH_SH,
>> +.I KEXEC_ARCH_MIPS,
>> +.I KEXEC_ARCH_MIPS_LE.
>> +The architecture must be executable on the CPU of the system.
>> +
>> +.I entry
>> +is the virtual entry address in the kernel image.
>
> Physical.

Changed.

>> +.I nr_segments
>> +is the number of segments pointed to by the
>> +.I segments
>> +pointer.
>> +.I segments
>> +is an array of
>> +.I struct kexec_segment
>> +structures which define the kernel layout:
>> +.in +4n
>> +.nf
>> +
>> +struct kexec_segment {
>> + =A0 =A0 void =A0 *buf; =A0 =A0/* Buffer in user space */
>> + =A0 =A0 size_t =A0bufsz; =A0/* Buffer length in user space */
>> + =A0 =A0 void =A0 *mem; =A0 =A0/* Virtual address of kernel */
>> + =A0 =A0 size_t =A0memsz; =A0/* Virtual address length */
>
> There are again physical addresses.

Changed.

Thanks,

Michael

> There is an expectation that at hand off from sys_kexec that
> virtual and physical addresses will be identity mapped. =A0But
> this isn't the old Alpha booting convention where you have
> a virtual address and then you have to parse the page table
> to figure out where your kernel was actually loaded.

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
