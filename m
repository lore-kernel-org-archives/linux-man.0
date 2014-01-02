From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] vdso(7): new man page
Date: Fri, 3 Jan 2014 08:13:03 +1300
Message-ID: <CAKgNAkjySc2+hNU9rsi0-ThTboCz=oP9PNtEiviwUD7Ewjro+w@mail.gmail.com>
References: <201304092317.01590.vapier@gentoo.org> <201401011244.13632.vapier@gentoo.org>
 <52C472DF.8020107@gmail.com> <201401020729.05590.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201401020729.05590.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Fri, Jan 3, 2014 at 1:29 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrot=
e:
> On Wednesday 01 January 2014 14:56:15 Michael Kerrisk (man-pages) wro=
te:
>> .SH DESCRIPTION
>> The "vDSO" is a small shared library that
>> the kernel automatically maps into the
>> address space of all user-space applications.
>> Applications usually do not need to concern themselves with these de=
tails
>> as the vDSO is most commonly called by the C library.
>> This way you can code in the normal way using standard functions
>> and the C library will take care
>> of using any functionality that is available via the vDSO.
>
> seems like sentences in this new version are excessively wrapped.  fo=
r
> example, this first one will easily fit into two lines.  is this just=
 due to the
> editing process ?  content changed but things weren't re-wrapped ?  o=
r do you
> not wrap to 80 cols ?  (this is beyond the rule of "wrap to commas an=
d
> periods").

I prefer wrapping to about 75 columns or less. (I document this in
man-pages(7), but perhaps that's not prominently enough.) Reduces the
chances of wrapping problems with patches in some mailers. (And I may
have been overenthusiastic in wrapping lines that were close to 75
chars.)

>> There are some system calls the kernel provides that
>> user space code ends up using frequently,
>
> shouldn't this be "user-space" now ?

Yep.

>> .SH ARCHITECTURE_SPECIFIC NOTES
>
> change the _ to a space ?

Typo. Should have been "-"

>> The subsections below provide architecture-specific notes
>> on the vDSO.
>
> another example of a sentence easily fitting on one line (there are m=
any)
>
>> Note that the vDSO that is used is based on the ABI of your user-spa=
ce code
>> and not the ABI of the kernel.
>> Thus, for example,
>> when you run an i386 32-bit ELF binary,
>> you'll get the same vDSO regardless of whether you run it under
>> an i386 32-bit kernel or under an x86_64 64-bit kernel.
>> Thus, the name of the user-space ABI should be used to determine
>> which of the sections below is relevant.
>
> having two sentences in a row start with "Thus" is a little funny sou=
nding.
> could change one to "So" and largely be the same.

Thanks. Fixed now.

>> The system calls listed here have the same semantics as if you calle=
d them
>> directly via
>> .BR syscall (2),
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
>
> my troff foo is not strong.  this section renders funny for me -- the=
re's three
> blank lines above the table.  do you see the same thing ?

Strange. I don't.

>         The  Itanium port is somewhat tricky.  In addition to the vDS=
O above, it
>         also has "light-weight system calls" (also known as "fast sys=
calls" or
>         "fsys").  You can invoke these via the __kernel_syscall_via_e=
pc vDSO
>         helper.  The system calls listed here have the same semantics=
 as if you
>         called them directly via syscall(2), so refer to the relevant
>         documentation for each.  The table below lists the functions =
available
>         via this mechanism.
>
>
>
>        function
>        =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80
>        clock_gettime
>        getcpu
>
>> .SS parisc (hppa) functions
>> .\" See linux/arch/parisc/kernel/syscall.S
>> .\" See linux/Documentation/parisc/registers
>> The parisc port has a code page full of utility functions
>> called a gateway page.
>> Rather than use the normal ELF auxiliary vector approach,
>> it passes the address of
>> the page to the process via the SR2 register.
>> The permissions on the page are such that merely executing those add=
resses
>> automatically executes with kernel privileges and not in user-space.
>
> should be "user space" i think.

Yup.

Thanks for checking the page, Mike.

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
