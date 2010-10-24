From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] kexec_load manpage
Date: Sun, 24 Oct 2010 16:56:24 +0200
Message-ID: <AANLkTinHP0Z-sQOgtETQsQ_5ZV1UbT+tGDJ47B23E4=0@mail.gmail.com>
References: <20100619132633.GA24277@basil.fritz.box> <m1mxuqu8yr.fsf@fess.ebiederm.org>
 <AANLkTillNx5owgU4O71izNz9FEL06MiI-FquTZ3ofktP@mail.gmail.com> <AANLkTi=HKMce2UojSRmqVdoLO3H4v+6Xtp-bgFuHwH+D@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTi=HKMce2UojSRmqVdoLO3H4v+6Xtp-bgFuHwH+D-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kexec Mailing List <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hey Andi,

I'd like to push this page out the door, but I'm blocked doing so
until I hear back from you regarding the question below (plus a new
version of the page, if needed please).

Thanks,

Michael


On Sat, Sep 11, 2010 at 6:46 AM, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8@public.gmane.org=
m> wrote:
> Hi Andi,
>
> Ping!
>
> Cheers,
>
> Michael
>
>
> On Sat, Jun 26, 2010 at 3:23 PM, Michael Kerrisk <mtk.manpages@gmail.=
com> wrote:
>> Hi Andi,
>>
>> Are Eric's suggestions of "physical" below correct? If so, could you
>> amend the page and resubmit?
>>
>> Also, I'd prefer to have the reboot.2 and kexec_load.2 page as
>> separate patches, so could you split them on the resend please?
>>
>> Thanks,
>>
>> Michael
>>
>> On Sat, Jun 19, 2010 at 9:18 PM, Eric W. Biederman
>> <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org> wrote:
>>> Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> writes:
>>>
>>>> Here are the beginnings of a kexec_load manpage.
>>>>
>>>> Probably needs some more review from Eric and may need some additi=
onal
>>>> information.
>>>>
>>>> The syscall is actually only usable with a kernel patch to export
>>>> the header I just sent separately.
>>>
>>> The syscall has been used for years with a separate non-kernel head=
er.
>>>
>>>
>>> Eric
>>>
>>>
>>>> Also added the kexec subcall to reboot(2)
>>>>
>>>> -Andi
>>>>
>>>> diff --git a/man2/kexec_load.2 b/man2/kexec_load.2
>>>> new file mode 100644
>>>> index 0000000..f486641
>>>> --- /dev/null
>>>> +++ b/man2/kexec_load.2
>>>> @@ -0,0 +1,94 @@
>>>> +.TH KEXEC_LOAD 2 2010-06-16 "Linux" "Linux Programmer's Manual"
>>>> +.SH NAME
>>>> +kexec_load \- Load a new kernel for later execution.
>>>> +.SH SYNOPSIS
>>>> +.b #include <linux/kexec.h>
>>>> +.br
>>>> +.BI "long kexec_load(unsigned long " entry ", unsigned long " nr_=
segments ","
>>>> +.br
>>>> +.BI =A0 =A0 =A0 "struct kexec_segment *" segments ", unsigned lon=
g " flags ");"
>>>> +.SH DESCRIPTION
>>>> +.BR kexec_load
>>>> +loads a new kernel that can be executed later
>>>> +by
>>>> +.I reboot(2).
>>>> +An alternative approach is to specify
>>>> +.B KEXEC_ON_CRASH
>>>> +in the
>>>> +.I flags
>>>> +argument and then the new kernel will be automatically executed o=
n a
>>>> +system crash.
>>>> +.\" XXX figure out how this is really used
>>>> +With
>>>> +.B KEXEC_PRESERVE_CONTEXT
>>>> +specified in
>>>> +.I flags
>>>> +kexec will preserve the system hard and
>>>> +software state before executing the kexec kernel. This
>>>> +could be used for system suspend.
>>>> +
>>>> +.I flags
>>>> +also contains the architecture of the executed kernel or
>>>> +be
>>>> +.I KEXEC_ARCH_DEFAULT
>>>> +for the current architecture.
>>>> +Valid architectures are
>>>> +.I KEXEC_ARCH_I386,
>>>> +.I KEXEC_ARCH_X86_64,
>>>> +.I KEXEC_ARCH_PPC,
>>>> +.I KEXEC_ARCH_PPC64,
>>>> +.I KEXEC_ARCH_IA_64,
>>>> +.I KEXEC_ARCH_ARM,
>>>> +.I KEXEC_ARCH_S390,
>>>> +.I KEXEC_ARCH_SH,
>>>> +.I KEXEC_ARCH_MIPS,
>>>> +.I KEXEC_ARCH_MIPS_LE.
>>>> +The architecture must be executable on the CPU of the system.
>>>> +
>>>> +.I entry
>>>> +is the virtual entry address in the kernel image.
>>>
>>> Physical.
>>>
>>>> +.I nr_segments
>>>> +is the number of segments pointed to by the
>>>> +.I segments
>>>> +pointer.
>>>> +.I segments
>>>> +is an array of
>>>> +.I struct kexec_segment
>>>> +structures which define the kernel layout:
>>>> +.in +4n
>>>> +.nf
>>>> +
>>>> +struct kexec_segment {
>>>> + =A0 =A0 void =A0 *buf; =A0 =A0/* Buffer in user space */
>>>> + =A0 =A0 size_t =A0bufsz; =A0/* Buffer length in user space */
>>>> + =A0 =A0 void =A0 *mem; =A0 =A0/* Virtual address of kernel */
>>>> + =A0 =A0 size_t =A0memsz; =A0/* Virtual address length */
>>>
>>> There are again physical addresses.
>>>
>>> There is an expectation that at hand off from sys_kexec that
>>> virtual and physical addresses will be identity mapped. =A0But
>>> this isn't the old Alpha booting convention where you have
>>> a virtual address and then you have to parse the page table
>>> to figure out where your kernel was actually loaded.
>>>
>>>> +};
>>>> +.fi
>>>> +.in
>>>> +.PP
>>>> +.\" XXX elaborate on this
>>>> +The kernel image defined by
>>>> +.I segments
>>>> +is copied from the calling process into previously reserved memor=
y.
>>>> +.SH CONFORMING TO
>>>> +This system call is Linux-specific.
>>>> +.SH NOTES
>>>> +kexec_load is currently not defined in glibc. To call it use:
>>>> +.in +4n
>>>> +.nf
>>>> +#define _GNU_SOURCE
>>>> +#include <syscall.h>
>>>> +#include <asm/unistd.h>
>>>> +#include <linux/kexec.h>
>>>> +
>>>> +ret =3D syscall(__NR_kexec_load, entry, nr_segments, segments, fl=
ags);
>>>> +.fi
>>>> +.in
>>>> +.PP
>>>> +.I linux/kexec.h as a exported header is only available in 2.6.38
>>>> +and later kernels, in earlier kernels the constants need to be co=
pied
>>>> +out of the kernel source.
>>>> +.SH SEE ALSO
>>>> +.BR syscall (2),
>>>> +.BR reboot (2)
>>>> diff --git a/man2/reboot.2 b/man2/reboot.2
>>>> index 253bd34..87204b1 100644
>>>> --- a/man2/reboot.2
>>>> +++ b/man2/reboot.2
>>>> @@ -139,6 +139,11 @@ For the i386 architecture, the additional arg=
ument does not do
>>>> =A0anything at present (2.1.122), but the type of reboot can be
>>>> =A0determined by kernel command-line arguments ("reboot=3D...") to=
 be
>>>> =A0either warm or cold, and either hard or through the BIOS.
>>>> +.TP
>>>> +.B LINUX_REBOOT_KEXEC
>>>> +executes a kernel that has been loaded earlier
>>>> +with
>>>> +.I kexec_load(2).
>>>> =A0.SH "RETURN VALUE"
>>>> =A0For the values of
>>>> =A0.I cmd
>>>> @@ -177,4 +182,5 @@ and should not be used in programs intended to=
 be portable.
>>>> =A0.BR capabilities (7),
>>>> =A0.BR ctrlaltdel (8),
>>>> =A0.BR halt (8),
>>>> -.BR reboot (8)
>>>> +.BR reboot (8),
>>>> +.BR kexec_load (2)
>>>
>>
>>
>>
>> --
>> Michael Kerrisk
>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>> Author of "The Linux Programming Interface" http://blog.man7.org/
>>
>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Author of "The Linux Programming Interface"; http://man7.org/tlpi/
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
