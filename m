From: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Subject: Re: Draft 3 of bpf(2) man page for review
Date: Thu, 23 Jul 2015 14:47:14 +0200
Message-ID: <55B0E252.2010207@iogearbox.net>
References: <55AFE46F.3090800@gmail.com> <55AFED75.2030208@plumgrid.com> <55AFF8BF.3050204@gmail.com> <55B0B461.1020201@iogearbox.net> <55B0CECA.2010105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B0CECA.2010105-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 07/23/2015 01:23 PM, Michael Kerrisk (man-pages) wrote:
=2E..
>> Btw, a user obviously can close() the map fds if he
>> wants to, but ultimatively they're freed when the program unloads.
>
> Okay. (Not sure if you meant that something should be added to the pa=
ge.)

I think not necessary.

[...]
>>>                 The attributes key_size and value_size will be used=
 by the
>>
>> attribute's?
>
> Nope. But I changed this to "The key_size and value_size attributes w=
ill be",
> which may read clearer.

Sorry, true, I was a bit confused. :)

[...]
>> The type __u64 is kernel internal, so if there's no strict reason to=
 use it,
>> we should just use what's provided by stdint.h.
>
> Agreed. Done. (By the way, what about all the __u32 and __u64 element=
s in the
> bpf_attr union?)

I wouldn't change the bpf_attr from the uapi.

Just the provided example code here, I presume people might copy from h=
ere when
they build their own library and in userspace uint64_t seems to be more=
 natural.

[...]
>>>                 *  map_update_elem()  replaces  elements  in an non=
-atomic
>>>                    fashion; for atomic updates, a hash-table map sh=
ould be
>>>                    used instead.
>>
>> This point here is most important, i.e. to not have false user expec=
ations.
>> Maybe it's also worth mentioning that when you have a value_size of =
sizeof(long),
>> you can however use __sync_fetch_and_add() atomic builtin from the L=
LVM backend.
>
> I think I'll leave out that detail for the moment.

Ok, I guess we could revisit/clarify that at a later point in time. I'd=
 add
a TODO comment to the source or the like, as this also is related to th=
e 2nd
below use case (aggregation/accounting), where an array is typically us=
ed.

>>>                 Among the uses for array maps are the following:
>>>
>>>                 *  As "global" eBPF variables: an array of 1 elemen=
t whose
>>>                    key is (index) 0 and where the value is a collec=
tion of
>>>                    'global'  variables which eBPF programs can use =
to keep
>>>                    state between events.
>>>
>>>                 *  Aggregation of tracing events into a fixed set o=
f buck=E2=80=90
>>>                    ets.

[...]
>>>          *  license is a license string, which must be GPL  compati=
ble  to
>>>             call helper functions marked gpl_only.
>>
>> Not strictly. So here, the same rules apply as with kernel modules. =
I.e. what
>> the kernel checks for are the following license strings:
>>
>> static inline int license_is_gpl_compatible(const char *license)
>> {
>> 	return (strcmp(license, "GPL") =3D=3D 0
>> 		|| strcmp(license, "GPL v2") =3D=3D 0
>> 		|| strcmp(license, "GPL and additional rights") =3D=3D 0
>> 		|| strcmp(license, "Dual BSD/GPL") =3D=3D 0
>> 		|| strcmp(license, "Dual MIT/GPL") =3D=3D 0
>> 		|| strcmp(license, "Dual MPL/GPL") =3D=3D 0);
>> }
>>
>> With any of them, the eBPF program is declared GPL compatible. Maybe=
 of interest
>> for those that want to use dual licensing of some sort.
>
> So, I'm a little unclear here. What text do you suggest for the page?

Maybe we should mention in addition that the same licensing rules apply=
 as
in case with kernel modules, so also dual licenses could be used.

>>>          *  log_buf is a pointer to a caller-allocated buffer in wh=
ich the
>>>             in-kernel verifier can store the verification log.   Th=
is  log
>>>             is  a  multi-line  string  that  can be checked by the =
program
>>>             author in order to understand how the  verifier  came  =
to  the
>>>             conclusion  that the BPF program is unsafe.  The format=
 of the
>>>             output can change at any time as the verifier evolves.
>>>
>>>          *  log_size size of the buffer pointed to  by  log_bug.   =
If  the
>>>             size  of  the buffer is not large enough to store all v=
erifier
>>>             messages, -1 is returned and errno is set to ENOSPC.
>>>
>>>          *  log_level verbosity level of the verifier.  A  value  o=
f  zero
>>>             means that the verifier will not provide a log.
>>
>> Note that the log buffer is optional as mentioned here log_level =3D=
 0. The
>> above example code of bpf_prog_load() suggests that it always needs =
to be
>> provided.
>>
>> I once ran indeed into an issue where the program itself was correct=
, but
>> it got rejected by the kernel, because my log buffer size was too sm=
all, so
>> in tc, we now have it larger as bpf_log_buf[65536] ...
>
> So, I'm not clear. Do you mean that some piece of text here in the pa=
ge
> should be changed? If so, could elaborate?

I'd maybe only mention in addition that in log_level=3D0 case, we also =
must not
provide a log_buf and log_size, otherwise we get EINVAL.

[...]
>> I had to read this twice. ;) Maybe this needs to be reworded slightl=
y.
>>
>> It just means that depending on the program type that the author sel=
ects,
>> you might end up with a different subset of helper functions, and a
>> different program input/context. For example tracing does not have t=
he
>> exact same helpers as socket filters (it might have some that can be=
 used
>> by both). Also, the eBPF program input (context) for socket filters =
is a
>> network packet, wheras for tracing you operate on a set of registers=
=2E
>
> Changed. Now we have:
>
>     eBPF program types
>         The eBPF program type (prog_type) determines the subset of a =
ker=E2=80=90
>         nel helper functions that the program may call.  The program =
type

s/a//

>         also determines dthe program input (context)=E2=80=94the form=
at of struct

s/dthe/the/

>         bpf_context (which is the data blob passed into the eBPF  pro=
gram
>         as the first argument).
>
>         For  example, a tracing program does not have the exact same =
sub=E2=80=90
>         set of helper functions as a socket filter program  (though  =
they
>         may have some helpers in common).  Similarly, the input (cont=
ext)
>         for a tracing program is a set of register values,  while  fo=
r  a
>         socket filter it is a network packet.
>
>         The  set  of functions available to eBPF programs of a given =
type
>         may increase in the future.

That's fine with me.

[...]
>> I would also make a note about the JIT compiler here, i.e. that it's=
 disabled
>> by default, and can be enabled via:
>>
>> * Normal mode: echo 1 > /proc/sys/net/core/bpf_jit_enable
>>
>> * Debugging mode: echo 2 > /proc/sys/net/core/bpf_jit_enable
>>     [opcodes dumped in hex into the kernel log, which can then be di=
sassembled
>
> Here, I assume you mean thet the generated (native) opcodes are dumpe=
ed, right?

Yes.

>>      with tools/net/bpf_jit_disasm.c from the kernel tree]
>>
>> When enabled, after a eBPF program gets loaded, it's transparently c=
ompiled /
>> translated inside the kernel into machine opcodes for better perform=
ance,
>> currently on x86_64, arm64 and s390.
>
> According to Documentation/networking/filter.txt the JIT compiler sup=
ports
> many more architectures:
>
>      The Linux kernel has a built-in BPF JIT compiler for x86_64,
>      SPARC, PowerPC, ARM, ARM64, MIPS and s390 and can be enabled
>      through CONFIG_BPF_JIT.
>
> Or am I misunderstanding something?

The others only work for cBPF and have not (yet) be converted over to e=
BPF.

=46or the three mentioned above, the kernel internally migrates cBPF in=
to eBPF
instructions and then JITs the eBPF result eventually.

> I added the following:
>
>         The kernel contains a just-in-time (JIT) compiler that transl=
ates
>         eBPF  bytecode  into  native machine code for better performa=
nce.
>         The JIT compiler is disabled by default, but its operation ca=
n be
>         controlled   by   writing   one   of   the  following  values=
  to
>         /proc/sys/net/core/bpf_jit_enable:
>
>         0  Disable JIT compilation (default).
>
>         1  Normal compilation.
>
>         2  Debugging mode.  The generated opcodes are dumped in hexad=
eci=E2=80=90
>            mal  into the kernel log.  These opcodes can then be disas=
sem=E2=80=90
>            bled using the program tools/net/bpf_jit_disasm.c provided=
  in
>            the kernel source tree.
>
>>> SEE ALSO
>>>          seccomp(2), socket(7), tc(8), tc-bpf(8)
>>>
>>>          Both classic and extended BPF are explained in the kernel =
 source
>>>          file Documentation/networking/filter.txt.
>>>
>>

Rest looks good for an initial version!

Thanks,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
