From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Edited draft of bpf(2) man page for review/enhancement
Date: Wed, 22 Jul 2015 16:52:55 +0200
Message-ID: <55AFAE47.70209@gmail.com>
References: <556583B4.4000607@gmail.com> <55669E44.6050907@plumgrid.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55669E44.6050907-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>, Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Alexei,

Sorry for the long delay in following up....

On 05/28/2015 06:49 AM, Alexei Starovoitov wrote:
> On 5/27/15 1:43 AM, Michael Kerrisk (man-pages) wrote:
>> Hello Alexei,
>>
>> I took the draft 3 of the bpf(2) man page that you sent back in Marc=
h
>> and did some substantial editing to clarify the language and add a
>> few technical details. Could you please check the revised  version
>> below, to ensure I did not inject any errors.
>=20
> Great!
>=20
>> I also added a number of FIXMEs for pieces of the page that need
>> further work. Could you take a look at these and let me know your
>> thoughts, please.
>=20
> Thanks to Daniel for answering some of them :)
>=20
> Other answers and comments:
>=20
>> .SH DESCRIPTION
>> The
>> .BR bpf ()
>> system call performs a range of operations related to extended
>> Berkeley Packet Filters.
>> Extended BPF (or eBPF) is similar to
>> the original BPF (or classic BPF) used to filter network packets.
>> For both BPF and eBPF programs,
>=20
> btw, for tc man page we've adopted eBPF and cBPF abbreviations.
> Since just BPF was confusing especially in tc context that supports
> both. This man page mainly talking about eBPF, but I think it would
> help to call 'classic BPF' as 'cBPF' as well.
> tc-bpf manpage:
> https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/=
tree/man/man8/tc-bpf.8?h=3Dnet-next

I've made corresponding changes now in the bpf(2) page.

>> .\" FIXME In the next line, what is "a restricted C"? Where does
>> .\"       one get further information about it?
>=20
> As Daniel said there is no spec for this C. It's a normal C where
> things like loops, global variables, vararg, floating point,
> struct passing and bunch of other things are not supported.

I assume we're talking about the LLVM front-end, right?

Am I correct that these kernel source files are examples of this restri=
cted C:

samples/bpf/tcbpf1_kern.c
samples/bpf/tracex2_kern.c
samples/bpf/tracex4_kern.c
samples/bpf/tracex1_kern.c
samples/bpf/tracex3_kern.c
samples/bpf/sockex1_kern.c
samples/bpf/sockex2_kern.c

?

And samples/bpf/Makefile shows the necessary LLVM incantation
to produce the BPF binaries, right?

If that's correct, let me know, and I will then add some pointers
to these examples in the man page.

>> .\" FIXME In the following sentence, what does "takes hold" mean?
>> During verification, the program takes hold of maps that it intends =
to use,
>> so selected maps cannot be removed until the program is unloaded.
>=20
> if 'takes hold' is confusing, just remove that sentence.
> Its purpose was to describe that map will be still alive while
> some program is using it. Traditional refcnt approach.

See my reply to Daniel. (I added a sentence about reference counting.)

>> BPF programs can be attached to different events.
>> .\" FIXME: In the next sentence , "packets" are not "events". What
>> .\" do you really mean to say here? ("the arrival of a network packe=
t"?)
>> These events can be packets, tracing
>> events, and other types that may be added in the future.
>=20
> yes. For eBPF programs attached to sockets 'event =3D=3D arrival of
> a packet on that socket'.

Thanks. I amended the page text to make that clearer.

> For eBPF attached to tc classifier 'event =3D=3D classification
> request by qdisc'.

I added some words for this case too.


>> .\" FIXME Can maps be shared between processes? (E.g., what happens
>> .\"       when fork() is called?)
>=20
> yes. Would be good to mention ability to pass prog and map FDs
> via scm_rights.

I realize now that the existing page text could make it clearer
that BPF_PROG_LOAD returns a new file descriptor referring to the=20
eBPF program. (Right?) I've added some words in a couple of places
to make that more obvious.

Anyway, I added the following text in NOTES:

       eBPF objects (maps and programs) can  be  shared  between  pro=E2=
=80=90
       cesses.   For  example,  after fork(2), the child inherits file
       descriptors referring to the same eBPF objects.   In  addition,
       file  descriptors  referring to eBPF objects can be transferred
       over UNIX domain sockets.  File descriptors referring  to  eBPF
       objects  can  be  duplicated in the usual way, using dup(2) and
       similar calls.  An eBPF object is deallocated  only  after  all
       file descriptors referring to the object have been closed.

Is the above all correct?

>>      struct {    /* Used by BPF_PROG_LOAD */
>>          __u32         prog_type;
>>          __u32         insn_cnt;
>>          __aligned_u64 insns;      /* 'const struct bpf_insn *' */
>>          __aligned_u64 license;    /* 'const char *' */
>>          __u32         log_level;  /* verbosity level of verifier */
>>          __u32         log_size;   /* size of user buffer */
>>          __aligned_u64 log_buf;    /* user supplied 'char *'
>>                                       buffer */
>>      };
>=20
> this part is already obsolete. The following field was added:
> __u32           kern_version;   /* checked when prog_type=3Dkprobe */
> see commit 2541517c32be2.

Okay. Added.

>> bpf_create_map(enum bpf_map_type map_type, int key_size,
>>                 int value_size, int max_entries)
>> {
>>      union bpf_attr attr =3D {
>>          .map_type =3D map_type,
>>          .key_size =3D key_size,
>>          .value_size =3D value_size,
>>          .max_entries =3D max_entries
>>      };
>>
>>      return bpf(BPF_MAP_CREATE, &attr, sizeof(attr));
>> }
>=20
> btw, this simple wrappers are currently in samples/bpf/ and
> in iproute2/tc/tc_bpf.c. We're trying to consolidate them
> into generic libbpf library in tools/lib/

This makes me curious: why was the BPF functionality not designed as
a *set* of system calls (as per these wrappers), rather than the existi=
ng
multiplexed call?

>> Currently, two
>> .I map_type
>> are supported:
>>
 >> .in +4n
>> .nf
>> enum bpf_map_type {
>>      BPF_MAP_TYPE_UNSPEC,
>>      BPF_MAP_TYPE_HASH,
>>      BPF_MAP_TYPE_ARRAY,
>=20
> in the net-next tree we have BPF_MAP_TYPE_PROG_ARRAY as well.

Okay. I see that that has hit 4.2, and we'll need to have some document=
ation.
I've added a FIXME placeholder.

>> .\" FIXME Explain the purpose of BPF_MAP_TYPE_UNSPEC
>=20
> only to reserve zero as invalid type. both for programs and maps.

Okay. Thanks.

>> .\" FIXME We need an explanation of BPF_MAP_TYPE_HASH here
>> .\" FIXME We need an explanation of BPF_MAP_TYPE_ARRAY here
>> .\" FIXME We need an explanation of why one might choose HASH versus=
 ARRAY
>=20
> type implies underlying implementation.
> commit 0f8e4bd8a1fc8c4 describes hash map.
> commit 28fbcfa08d8ed7c describes array map.
> Briefly:
> hash - hashtable where map_update_elem() replaces elements in atomic=20
> way. Elements allocated on the fly.
> array - all elements pre-allocated, zero initialized and cannot be
> delete. Fastest possible lookup (just like arrays in C)

Okay -- I have tried to extract suitable text from the commit messages.
I'll send that in the next version for review.

>> .\" FIXME Here, I think we need some statement about what 'value' mu=
st
>> .\"       point to. Presumable, it must be a buffer at least as larg=
e as
>> .\"       the map's 'value_size' attribute?
>=20
> yes. that's correct. Though buffer > value_size doesn't make sense.

Thanks. I added that info to the page.

>> bpf_get_next_key(int fd, void *key, void *next_key)
>> {
>>      union bpf_attr attr =3D {
>>          .map_fd =3D fd,
>>          .key =3D ptr_to_u64(key),
>>          .next_key =3D ptr_to_u64(next_key),
>>      };
>>
>>      return bpf(BPF_MAP_GET_NEXT_KEY, &attr, sizeof(attr));
>> }
>> .fi
>> .in
>>
>> .\" FIXME Need to explain the return value on success here.
>=20
> hmm, you mean something like:
> 'If key is found, returns zero and sets next_key to the next element'=
?

So:

[[
If
=2EI key
is found, the operation returns zero and sets the=20
=2EI next_key
pointer to the key of the next element.
]]

right?

>> When the user-space program that created a map exits, all maps will
>> be deleted automatically.
>> .\" FIXME What are the semantics when a file descriptor is duplicate=
d
>> .\"       (dup() etc.)? (I.e., when is a map deallocated automatical=
ly?)
>=20
> just like other pseudo files. The kernel side will be freed
> when refcnt reaches zero, so dup or scm_rights passing will
> keep map/program alive.

Thanks. As noted elsewhere, I added some text to cover this.

>> enum bpf_prog_type {
>>      BPF_PROG_TYPE_UNSPEC,
>> .\" FIXME Explain the purpose of BPF_PROG_TYPE_UNSPEC
>>      BPF_PROG_TYPE_SOCKET_FILTER,
>>      BPF_PROG_TYPE_SCHED_CLS,
>> .\" FIXME BPF_PROG_TYPE_SCHED_CLS appears not to exist?
>=20
> The current list is:
> enum bpf_prog_type {
>          BPF_PROG_TYPE_UNSPEC,
>          BPF_PROG_TYPE_SOCKET_FILTER,
>          BPF_PROG_TYPE_KPROBE,
>          BPF_PROG_TYPE_SCHED_CLS,
>          BPF_PROG_TYPE_SCHED_ACT,
> };

Thanks. Obviously some new stuff there to be documented. I've
added some FIXME placeholders.

>> .\" FIXME The next sentence fragment is incomplete
>> and
>> .I bpf_context
>> is a pointer to a
>> .IR "struct sk_buff" .
>> Programs cannot access fields of
>> .I sk_buff
>> directly.
>=20
> Actually now in case of SOCKET_FILTER, SCHED_CLS, SCHED_ACT
> the program can now access skb fields.
> See 'struct __sk_buff' and commit 9bac3d6d548e5

Okay. For the moment I've added a FIXME placeholder for this.

>> More program types may be added in the future.
>> .\" FIXME The following sentence is grammatically broken.
>> .\"       What should it say?
>> Like
>> .B BPF_PROG_TYPE_KPROBE
>> and
>> .I bpf_context
>> for it may be defined as a pointer to a
>> .IR "struct pt_regs" .
>=20
> Sorry. I meant to say that 'struct bpf_context * =3D=3D struct pt_reg=
s *'
> in case of TYPE_KPROBE.

Okay. I see now that we have more program types in 4.1.
I've added some FIXME placeholders to remind us to document them.

>> is a license string, which must be GPL compatible to call helper fun=
ctions
>> .\" FIXME Maybe we should list the GPL compatible strings that can b=
e
>> .\"       specified?
>=20
> probably not. At least I wouldn't.

Okay.

>> Maps are accessible from BPF programs and are used to exchange data =
between
>> BPF programs and between BPF programs and user-space programs.
>> Programs process various events (like kprobe, packets) and
>> store their data into maps.
>> User-space programs fetch data from the maps.
>> .\" FIXME We need some elaboration here... What does the next senten=
ce mean?
>> Either the same or a different map may be used by user space
>> as a configuration space to alter program behavior on the fly.
>=20
> Sorry. I tried to emphasize that user space can use maps as a way to
> pass information to the program.
> For example, typical tracing program aggregates information
> about kprobe events into a map, then user space reads it.
> The information can go the other way too.
> User space can populate a map with some data and depending
> on that data, the program will do different things.

Thanks for the clarification. I did some rewording here.

>> .SH EXAMPLES
>> .\" FIXME It would be nice if this was a complete working example
>=20
> open_raw_sock() takes too many lines not related to bpf.
> The examples in samples/bpf/*_kern.c are all functional :)
> May be a reference will work instead?

Thanks. I added a reference under EXAMPLES

>>          BPF_MOV64_IMM(BPF_REG_1, 1),                /* r1 =3D 1 */
>>          BPF_XADD(BPF_DW, BPF_REG_0, BPF_REG_1, 0, 0),
>> .\" FIXME What does 'lock' in the line below mean?
>>                                  /* lock *(u64 *) r0 +=3D r1 */
>=20
> it means that it's 'lock xadd' equivalent.

Sorry -- you've assumed I'm cleverer than I am... :-}
I'm not wiser after that comment. What is 'lock xadd'?

>>          BPF_MOV64_IMM(BPF_REG_0, 0),                /* r0 =3D 0 */
>>          BPF_EXIT_INSN(),                            /* return r0 */
>>      };
>>
>>      prog_fd =3D bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, prog,
>> .\" FIXME The next line looks wrong. Should it not be
>> .\"
>> .\"           sizeof(prog) / sizeof(struct bpf_insn) ?
>>                              sizeof(prog), "GPL");
>=20
> sizeof(prog) is correct for this particular sample code.
> btw, this full example is in samples/bpf/sock_example.c

Okay. Thanks.

If you might have a chance to look at my questions above and
let me know your thoughts, then I could further edit the page
before sending out the next draft.

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
