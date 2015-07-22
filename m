From: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Subject: Re: Edited draft of bpf(2) man page for review/enhancement
Date: Wed, 22 Jul 2015 10:43:42 -0700
Message-ID: <55AFD64E.9040105@plumgrid.com>
References: <556583B4.4000607@gmail.com> <55669E44.6050907@plumgrid.com>
 <55AFAE47.70209@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55AFAE47.70209-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>, Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 7/22/15 7:52 AM, Michael Kerrisk (man-pages) wrote:
>> As Daniel said there is no spec for this C. It's a normal C where
>> things like loops, global variables, vararg, floating point,
>> struct passing and bunch of other things are not supported.
>
> I assume we're talking about the LLVM front-end, right?

yes. clang.
There is a bpf backend for gcc, but it's bit rotting now.

> Am I correct that these kernel source files are examples of this rest=
ricted C:
>
> samples/bpf/tcbpf1_kern.c
> samples/bpf/tracex2_kern.c
> samples/bpf/tracex4_kern.c
> samples/bpf/tracex1_kern.c
> samples/bpf/tracex3_kern.c
> samples/bpf/sockex1_kern.c
> samples/bpf/sockex2_kern.c

yes.

> And samples/bpf/Makefile shows the necessary LLVM incantation
> to produce the BPF binaries, right?

yes.
Now with llvm 3.7 coming out soon it's even simpler. Just:
clang -O2 -target bpf -c file.c

> Anyway, I added the following text in NOTES:
>
>         eBPF objects (maps and programs) can  be  shared  between  pr=
o=E2=80=90
>         cesses.   For  example,  after fork(2), the child inherits fi=
le
>         descriptors referring to the same eBPF objects.   In  additio=
n,
>         file  descriptors  referring to eBPF objects can be transferr=
ed
>         over UNIX domain sockets.  File descriptors referring  to  eB=
PF
>         objects  can  be  duplicated in the usual way, using dup(2) a=
nd
>         similar calls.  An eBPF object is deallocated  only  after  a=
ll
>         file descriptors referring to the object have been closed.
>
> Is the above all correct?

yes. all correct.

> This makes me curious: why was the BPF functionality not designed as
> a *set* of system calls (as per these wrappers), rather than the exis=
ting
> multiplexed call?

because new commands are much easier to add to existing syscall
instead of adding new syscall for every new command.

> [[
> If
> .I key
> is found, the operation returns zero and sets the
> .I next_key
> pointer to the key of the next element.
> ]]
>
> right?

yes.

>>>           BPF_MOV64_IMM(BPF_REG_1, 1),                /* r1 =3D 1 *=
/
>>>           BPF_XADD(BPF_DW, BPF_REG_0, BPF_REG_1, 0, 0),
>>> .\" FIXME What does 'lock' in the line below mean?
>>>                                   /* lock *(u64 *) r0 +=3D r1 */
>>
>> it means that it's 'lock xadd' equivalent.
>
> Sorry -- you've assumed I'm cleverer than I am... :-}
> I'm not wiser after that comment. What is 'lock xadd'?

I meant that it is =3D=3D atomic64_add

> If you might have a chance to look at my questions above and
> let me know your thoughts, then I could further edit the page
> before sending out the next draft.

I think would be great to get some form of the man page out and
work on it incrementally. Quite a few folks have asked for it.

Thanks!

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
