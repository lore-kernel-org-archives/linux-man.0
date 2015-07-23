From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Draft 3 of bpf(2) man page for review
Date: Thu, 23 Jul 2015 15:36:23 +0200
Message-ID: <55B0EDD7.8020407@gmail.com>
References: <55AFE46F.3090800@gmail.com> <55AFED75.2030208@plumgrid.com> <55AFF8BF.3050204@gmail.com> <55B0B461.1020201@iogearbox.net> <55B0CECA.2010105@gmail.com> <55B0E252.2010207@iogearbox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B0E252.2010207-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>, Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Daniel,

On 07/23/2015 02:47 PM, Daniel Borkmann wrote:
> On 07/23/2015 01:23 PM, Michael Kerrisk (man-pages) wrote:
> ...
>>> Btw, a user obviously can close() the map fds if he
>>> wants to, but ultimatively they're freed when the program unloads.
>>
>> Okay. (Not sure if you meant that something should be added to the p=
age.)
>=20
> I think not necessary.

Okay.


> [...]
>>>>                 The attributes key_size and value_size will be use=
d by the
>>>
>>> attribute's?
>>
>> Nope. But I changed this to "The key_size and value_size attributes =
will be",
>> which may read clearer.
>=20
> Sorry, true, I was a bit confused. :)

NP.

> [...]
>>> The type __u64 is kernel internal, so if there's no strict reason t=
o use it,
>>> we should just use what's provided by stdint.h.
>>
>> Agreed. Done. (By the way, what about all the __u32 and __u64 elemen=
ts in the
>> bpf_attr union?)
>=20
> I wouldn't change the bpf_attr from the uapi.

Okay.

> Just the provided example code here, I presume people might copy from=
 here when
> they build their own library and in userspace uint64_t seems to be mo=
re natural.

Yup.

> [...]
>>>>                 *  map_update_elem()  replaces  elements  in an no=
n-atomic
>>>>                    fashion; for atomic updates, a hash-table map s=
hould be
>>>>                    used instead.
>>>
>>> This point here is most important, i.e. to not have false user expe=
cations.
>>> Maybe it's also worth mentioning that when you have a value_size of=
 sizeof(long),
>>> you can however use __sync_fetch_and_add() atomic builtin from the =
LLVM backend.
>>
>> I think I'll leave out that detail for the moment.
>=20
> Ok, I guess we could revisit/clarify that at a later point in time. I=
'd add
> a TODO comment to the source or the like, as this also is related to =
the 2nd
> below use case (aggregation/accounting), where an array is typically =
used.

Okay. FIXME added.

>>>>                 Among the uses for array maps are the following:
>>>>
>>>>                 *  As "global" eBPF variables: an array of 1 eleme=
nt whose
>>>>                    key is (index) 0 and where the value is a colle=
ction of
>>>>                    'global'  variables which eBPF programs can use=
 to keep
>>>>                    state between events.
>>>>
>>>>                 *  Aggregation of tracing events into a fixed set =
of buck=E2=80=90
>>>>                    ets.
>=20
> [...]
>>>>          *  license is a license string, which must be GPL  compat=
ible  to
>>>>             call helper functions marked gpl_only.
>>>
>>> Not strictly. So here, the same rules apply as with kernel modules.=
 I.e. what
>>> the kernel checks for are the following license strings:
>>>
>>> static inline int license_is_gpl_compatible(const char *license)
>>> {
>>> 	return (strcmp(license, "GPL") =3D=3D 0
>>> 		|| strcmp(license, "GPL v2") =3D=3D 0
>>> 		|| strcmp(license, "GPL and additional rights") =3D=3D 0
>>> 		|| strcmp(license, "Dual BSD/GPL") =3D=3D 0
>>> 		|| strcmp(license, "Dual MIT/GPL") =3D=3D 0
>>> 		|| strcmp(license, "Dual MPL/GPL") =3D=3D 0);
>>> }
>>>
>>> With any of them, the eBPF program is declared GPL compatible. Mayb=
e of interest
>>> for those that want to use dual licensing of some sort.
>>
>> So, I'm a little unclear here. What text do you suggest for the page=
?
>=20
> Maybe we should mention in addition that the same licensing rules app=
ly as
> in case with kernel modules, so also dual licenses could be used.

Done.

>>>>          *  log_buf is a pointer to a caller-allocated buffer in w=
hich the
>>>>             in-kernel verifier can store the verification log.   T=
his  log
>>>>             is  a  multi-line  string  that  can be checked by the=
 program
>>>>             author in order to understand how the  verifier  came =
 to  the
>>>>             conclusion  that the BPF program is unsafe.  The forma=
t of the
>>>>             output can change at any time as the verifier evolves.
>>>>
>>>>          *  log_size size of the buffer pointed to  by  log_bug.  =
 If  the
>>>>             size  of  the buffer is not large enough to store all =
verifier
>>>>             messages, -1 is returned and errno is set to ENOSPC.
>>>>
>>>>          *  log_level verbosity level of the verifier.  A  value  =
of  zero
>>>>             means that the verifier will not provide a log.
>>>
>>> Note that the log buffer is optional as mentioned here log_level =3D=
 0. The
>>> above example code of bpf_prog_load() suggests that it always needs=
 to be
>>> provided.
>>>
>>> I once ran indeed into an issue where the program itself was correc=
t, but
>>> it got rejected by the kernel, because my log buffer size was too s=
mall, so
>>> in tc, we now have it larger as bpf_log_buf[65536] ...
>>
>> So, I'm not clear. Do you mean that some piece of text here in the p=
age
>> should be changed? If so, could elaborate?
>=20
> I'd maybe only mention in addition that in log_level=3D0 case, we als=
o must not
> provide a log_buf and log_size, otherwise we get EINVAL.

I changed the text to:

       *  log_level  verbosity  level  of the verifier.  A value of zer=
o
          means that the verifier will not provide a log; in this  case=
,
          log_buf must be a NULL pointer, and log_size must be zero.

> [...]
>>> I had to read this twice. ;) Maybe this needs to be reworded slight=
ly.
>>>
>>> It just means that depending on the program type that the author se=
lects,
>>> you might end up with a different subset of helper functions, and a
>>> different program input/context. For example tracing does not have =
the
>>> exact same helpers as socket filters (it might have some that can b=
e used
>>> by both). Also, the eBPF program input (context) for socket filters=
 is a
>>> network packet, wheras for tracing you operate on a set of register=
s.
>>
>> Changed. Now we have:
>>
>>     eBPF program types
>>         The eBPF program type (prog_type) determines the subset of a=
 ker=E2=80=90
>>         nel helper functions that the program may call.  The program=
 type
>=20
> s/a//

=46ixed.

>>         also determines dthe program input (context)=E2=80=94the for=
mat of struct
>=20
> s/dthe/the/

=46ixed.

>>         bpf_context (which is the data blob passed into the eBPF  pr=
ogram
>>         as the first argument).
>>
>>         For  example, a tracing program does not have the exact same=
 sub=E2=80=90
>>         set of helper functions as a socket filter program  (though =
 they
>>         may have some helpers in common).  Similarly, the input (con=
text)
>>         for a tracing program is a set of register values,  while  f=
or  a
>>         socket filter it is a network packet.
>>
>>         The  set  of functions available to eBPF programs of a given=
 type
>>         may increase in the future.
>=20
> That's fine with me.

Okay.

> [...]
>>> I would also make a note about the JIT compiler here, i.e. that it'=
s disabled
>>> by default, and can be enabled via:
>>>
>>> * Normal mode: echo 1 > /proc/sys/net/core/bpf_jit_enable
>>>
>>> * Debugging mode: echo 2 > /proc/sys/net/core/bpf_jit_enable
>>>     [opcodes dumped in hex into the kernel log, which can then be d=
isassembled
>>
>> Here, I assume you mean thet the generated (native) opcodes are dump=
eed, right?
>=20
> Yes.
>=20
>>>      with tools/net/bpf_jit_disasm.c from the kernel tree]
>>>
>>> When enabled, after a eBPF program gets loaded, it's transparently =
compiled /
>>> translated inside the kernel into machine opcodes for better perfor=
mance,
>>> currently on x86_64, arm64 and s390.
>>
>> According to Documentation/networking/filter.txt the JIT compiler su=
pports
>> many more architectures:
>>
>>      The Linux kernel has a built-in BPF JIT compiler for x86_64,
>>      SPARC, PowerPC, ARM, ARM64, MIPS and s390 and can be enabled
>>      through CONFIG_BPF_JIT.
>>
>> Or am I misunderstanding something?
>=20
> The others only work for cBPF and have not (yet) be converted over to=
 eBPF.
>=20
> For the three mentioned above, the kernel internally migrates cBPF in=
to eBPF
> instructions and then JITs the eBPF result eventually.

Thanks for clearing that up -- I added the following sentence

    JIT compiler for eBPF is currently available for the x86-64, arm64,
    and s390 architectures.

Okay?

>=20
>> I added the following:
>>
>>         The kernel contains a just-in-time (JIT) compiler that trans=
lates
>>         eBPF  bytecode  into  native machine code for better perform=
ance.
>>         The JIT compiler is disabled by default, but its operation c=
an be
>>         controlled   by   writing   one   of   the  following  value=
s  to
>>         /proc/sys/net/core/bpf_jit_enable:
>>
>>         0  Disable JIT compilation (default).
>>
>>         1  Normal compilation.
>>
>>         2  Debugging mode.  The generated opcodes are dumped in hexa=
deci=E2=80=90
>>            mal  into the kernel log.  These opcodes can then be disa=
ssem=E2=80=90
>>            bled using the program tools/net/bpf_jit_disasm.c provide=
d  in
>>            the kernel source tree.
>>
>>>> SEE ALSO
>>>>          seccomp(2), socket(7), tc(8), tc-bpf(8)
>>>>
>>>>          Both classic and extended BPF are explained in the kernel=
  source
>>>>          file Documentation/networking/filter.txt.
>>>>
>>>
>=20
> Rest looks good for an initial version!

Yup!

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
