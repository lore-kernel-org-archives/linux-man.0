From: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Subject: Re: Edited draft of bpf(2) man page for review/enhancement
Date: Wed, 27 May 2015 21:49:08 -0700
Message-ID: <55669E44.6050907@plumgrid.com>
References: <556583B4.4000607@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <556583B4.4000607-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>, Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 5/27/15 1:43 AM, Michael Kerrisk (man-pages) wrote:
> Hello Alexei,
>
> I took the draft 3 of the bpf(2) man page that you sent back in March
> and did some substantial editing to clarify the language and add a
> few technical details. Could you please check the revised  version
> below, to ensure I did not inject any errors.

Great!

> I also added a number of FIXMEs for pieces of the page that need
> further work. Could you take a look at these and let me know your
> thoughts, please.

Thanks to Daniel for answering some of them :)

Other answers and comments:

> .SH DESCRIPTION
> The
> .BR bpf ()
> system call performs a range of operations related to extended
> Berkeley Packet Filters.
> Extended BPF (or eBPF) is similar to
> the original BPF (or classic BPF) used to filter network packets.
> For both BPF and eBPF programs,

btw, for tc man page we've adopted eBPF and cBPF abbreviations.
Since just BPF was confusing especially in tc context that supports
both. This man page mainly talking about eBPF, but I think it would
help to call 'classic BPF' as 'cBPF' as well.
tc-bpf manpage:
https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/tree/man/man8/tc-bpf.8?h=net-next

> .\" FIXME In the next line, what is "a restricted C"? Where does
> .\"       one get further information about it?

As Daniel said there is no spec for this C. It's a normal C where
things like loops, global variables, vararg, floating point,
struct passing and bunch of other things are not supported.

> .\" FIXME In the following sentence, what does "takes hold" mean?
> During verification, the program takes hold of maps that it intends to use,
> so selected maps cannot be removed until the program is unloaded.

if 'takes hold' is confusing, just remove that sentence.
Its purpose was to describe that map will be still alive while
some program is using it. Traditional refcnt approach.

> BPF programs can be attached to different events.
> .\" FIXME: In the next sentence , "packets" are not "events". What
> .\" do you really mean to say here? ("the arrival of a network packet"?)
> These events can be packets, tracing
> events, and other types that may be added in the future.

yes. For eBPF programs attached to sockets 'event == arrival of
a packet on that socket'.
For eBPF attached to tc classifier 'event == classification
request by qdisc'.

> .\" FIXME Can maps be shared between processes? (E.g., what happens
> .\"       when fork() is called?)

yes. Would be good to mention ability to pass prog and map FDs
via scm_rights.

>
>      struct {    /* Used by BPF_PROG_LOAD */
>          __u32         prog_type;
>          __u32         insn_cnt;
>          __aligned_u64 insns;      /* 'const struct bpf_insn *' */
>          __aligned_u64 license;    /* 'const char *' */
>          __u32         log_level;  /* verbosity level of verifier */
>          __u32         log_size;   /* size of user buffer */
>          __aligned_u64 log_buf;    /* user supplied 'char *'
>                                       buffer */
>      };

this part is already obsolete. The following field was added:
__u32           kern_version;   /* checked when prog_type=kprobe */
see commit 2541517c32be2.

> bpf_create_map(enum bpf_map_type map_type, int key_size,
>                 int value_size, int max_entries)
> {
>      union bpf_attr attr = {
>          .map_type = map_type,
>          .key_size = key_size,
>          .value_size = value_size,
>          .max_entries = max_entries
>      };
>
>      return bpf(BPF_MAP_CREATE, &attr, sizeof(attr));
> }

btw, this simple wrappers are currently in samples/bpf/ and
in iproute2/tc/tc_bpf.c. We're trying to consolidate them
into generic libbpf library in tools/lib/

> Currently, two
> .I map_type
> are supported:
>
> .in +4n
> .nf
> enum bpf_map_type {
>      BPF_MAP_TYPE_UNSPEC,
>      BPF_MAP_TYPE_HASH,
>      BPF_MAP_TYPE_ARRAY,

in the net-next tree we have BPF_MAP_TYPE_PROG_ARRAY as well.

> .\" FIXME Explain the purpose of BPF_MAP_TYPE_UNSPEC

only to reserve zero as invalid type. both for programs and maps.

> .\" FIXME We need an explanation of BPF_MAP_TYPE_HASH here
> .\" FIXME We need an explanation of BPF_MAP_TYPE_ARRAY here
> .\" FIXME We need an explanation of why one might choose HASH versus ARRAY

type implies underlying implementation.
commit 0f8e4bd8a1fc8c4 describes hash map.
commit 28fbcfa08d8ed7c describes array map.
Briefly:
hash - hashtable where map_update_elem() replaces elements in atomic 
way. Elements allocated on the fly.
array - all elements pre-allocated, zero initialized and cannot be
delete. Fastest possible lookup (just like arrays in C)

> .\" FIXME Here, I think we need some statement about what 'value' must
> .\"       point to. Presumable, it must be a buffer at least as large as
> .\"       the map's 'value_size' attribute?

yes. that's correct. Though buffer > value_size doesn't make sense.

> bpf_get_next_key(int fd, void *key, void *next_key)
> {
>      union bpf_attr attr = {
>          .map_fd = fd,
>          .key = ptr_to_u64(key),
>          .next_key = ptr_to_u64(next_key),
>      };
>
>      return bpf(BPF_MAP_GET_NEXT_KEY, &attr, sizeof(attr));
> }
> .fi
> .in
>
> .\" FIXME Need to explain the return value on success here.

hmm, you mean something like:
'If key is found, returns zero and sets next_key to the next element'?

> When the user-space program that created a map exits, all maps will
> be deleted automatically.
> .\" FIXME What are the semantics when a file descriptor is duplicated
> .\"       (dup() etc.)? (I.e., when is a map deallocated automatically?)

just like other pseudo files. The kernel side will be freed
when refcnt reaches zero, so dup or scm_rights passing will
keep map/program alive.

> enum bpf_prog_type {
>      BPF_PROG_TYPE_UNSPEC,
> .\" FIXME Explain the purpose of BPF_PROG_TYPE_UNSPEC
>      BPF_PROG_TYPE_SOCKET_FILTER,
>      BPF_PROG_TYPE_SCHED_CLS,
> .\" FIXME BPF_PROG_TYPE_SCHED_CLS appears not to exist?

The current list is:
enum bpf_prog_type {
         BPF_PROG_TYPE_UNSPEC,
         BPF_PROG_TYPE_SOCKET_FILTER,
         BPF_PROG_TYPE_KPROBE,
         BPF_PROG_TYPE_SCHED_CLS,
         BPF_PROG_TYPE_SCHED_ACT,
};

> .\" FIXME The next sentence fragment is incomplete
> and
> .I bpf_context
> is a pointer to a
> .IR "struct sk_buff" .
> Programs cannot access fields of
> .I sk_buff
> directly.

Actually now in case of SOCKET_FILTER, SCHED_CLS, SCHED_ACT
the program can now access skb fields.
See 'struct __sk_buff' and commit 9bac3d6d548e5

> More program types may be added in the future.
> .\" FIXME The following sentence is grammatically broken.
> .\"       What should it say?
> Like
> .B BPF_PROG_TYPE_KPROBE
> and
> .I bpf_context
> for it may be defined as a pointer to a
> .IR "struct pt_regs" .

Sorry. I meant to say that 'struct bpf_context * == struct pt_regs *'
in case of TYPE_KPROBE.

> is a license string, which must be GPL compatible to call helper functions
> .\" FIXME Maybe we should list the GPL compatible strings that can be
> .\"       specified?

probably not. At least I wouldn't.

> Maps are accessible from BPF programs and are used to exchange data between
> BPF programs and between BPF programs and user-space programs.
> Programs process various events (like kprobe, packets) and
> store their data into maps.
> User-space programs fetch data from the maps.
> .\" FIXME We need some elaboration here... What does the next sentence mean?
> Either the same or a different map may be used by user space
> as a configuration space to alter program behavior on the fly.

Sorry. I tried to emphasize that user space can use maps as a way to
pass information to the program.
For example, typical tracing program aggregates information
about kprobe events into a map, then user space reads it.
The information can go the other way too.
User space can populate a map with some data and depending
on that data, the program will do different things.

> .SH EXAMPLES
> .\" FIXME It would be nice if this was a complete working example

open_raw_sock() takes too many lines not related to bpf.
The examples in samples/bpf/*_kern.c are all functional :)
May be a reference will work instead?

>          BPF_MOV64_IMM(BPF_REG_1, 1),                /* r1 = 1 */
>          BPF_XADD(BPF_DW, BPF_REG_0, BPF_REG_1, 0, 0),
> .\" FIXME What does 'lock' in the line below mean?
>                                  /* lock *(u64 *) r0 += r1 */

it means that it's 'lock xadd' equivalent.

>          BPF_MOV64_IMM(BPF_REG_0, 0),                /* r0 = 0 */
>          BPF_EXIT_INSN(),                            /* return r0 */
>      };
>
>      prog_fd = bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, prog,
> .\" FIXME The next line looks wrong. Should it not be
> .\"
> .\"           sizeof(prog) / sizeof(struct bpf_insn) ?
>                              sizeof(prog), "GPL");

sizeof(prog) is correct for this particular sample code.
btw, this full example is in samples/bpf/sock_example.c

Thanks a lot!

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
