From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH man v2] bpf.2: various updates/follow-ups to address some
 fixmes
Date: Tue, 28 Jul 2015 21:48:02 +0200
Message-ID: <55B7DC72.40205@gmail.com>
References: <36d5ffdcb1dc318cb25e0785eba31aff3014772f.1438109790.git.daniel@iogearbox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36d5ffdcb1dc318cb25e0785eba31aff3014772f.1438109790.git.daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Daniel,

On 07/28/2015 08:59 PM, Daniel Borkmann wrote:
> A couple of follow-ups to the bpf(2) man-page.

Could you write a short change log summarizing the changes 
made by the patch, please :-).

Nice work, but I have some comments below. Would you be so kind as to 
send a v3?

> Signed-off-by: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
> ---
>  v1->v2:
>   - Reworded __sync_fetch_and_add sentence, hope that's better.
> 
>  man2/bpf.2 | 143 ++++++++++++++++++++++++++++++++++++-------------------------
>  1 file changed, 85 insertions(+), 58 deletions(-)
> 
> diff --git a/man2/bpf.2 b/man2/bpf.2
> index 2b96ebc..189582d 100644
> --- a/man2/bpf.2
> +++ b/man2/bpf.2
> @@ -51,42 +51,41 @@ opcode extension provided by eBPF)
>  and access shared data structures such as eBPF maps.
>  .\"
>  .SS Extended BPF Design/Architecture
> -.\"
> -.\" FIXME In the following line, what does "different data types" mean?
> -.\"       Are the values in a map not just blobs?
> -.\" Daniel Borkmann commented:
> -.\"     Sort of, currently, these blobs can have different sizes of keys
> -.\"     and values (you can even have structs as keys). For the map itself
> -.\"     they are treated as blob internally. However, recently, bpf tail call
> -.\"     got added where you can lookup another program from an array map and
> -.\"     call into it. Here, that particular type of map can only have entries
> -.\"     of type of eBPF program fd. I think, if needed, adding a paragraph to
> -.\"     the tail call could be done as follow-up after we have an initial man
> -.\"     page in the tree included.
> -.\"
>  eBPF maps are a generic data structure for storage of different data types.
> +Data types are generally treated as binary blobs, so a user just specifies
> +the size of the key and the size of the value during map creation time. In

s/during/at/

"time. In$" ==> Please always start new sentences on new lines.

> +other words, a key/value for a given map can have an arbitrary structure.
> +
>  A user process can create multiple maps (with key/value-pairs being
>  opaque bytes of data) and access them via file descriptors.
>  Different eBPF programs can access the same maps in parallel.
>  It's up to the user process and eBPF program to decide what they store
>  inside maps.
> +
> +There's one special map type which is a program array. This map stores file

New sentence, new line. (and throughout.)

> +descriptors to other eBPF programs. Thus, when a lookup in that map is being
> +performed, the program flow is being redirected in-place to the beginning of

s/is being/is/

So is the tail call mechanism referred to below? If is is, then I think
this should be made more explicit in the text. It could just be something like
"See XXX below."

> +the new eBPF program without returning back. 
> The level of nesting has a fixed
> +limit of 32, thus that infinite loops cannot be crafted. During runtime, the

s/thus that/so that/

> +program file descriptors stored in that map can be modified, so program
> +functionality can be altered based on specific requirements. All programs
> +stored in such a map have been loaded into the kernel via
> +.BR bpf (2)
> +as well. In case a lookup has failed, the current programs continues its

s/programs/program/

> +execution.
>  .P
> -eBPF programs are loaded by the user
> -process and automatically unloaded when the process exits.
> -.\"
> -.\" FIXME Daniel Borkmann commented about the preceding sentence:
> -.\"
> -.\"     Generally that's true. Btw, in 4.1 kernel, tc(8) also got support for
> -.\"     eBPF classifier and actions, and here it's slightly different: in tc,
> -.\"     we load the programs, maps etc, and push down the eBPF program fd in
> -.\"     order to let the kernel hold reference on the program itself.
> -.\"
> -.\"     Thus, there, the program fd that the application owns is gone when the
> -.\"     application terminates, but the eBPF program itself still lives on
> -.\"     inside the kernel.
> -.\"
> -.\" Probably something should be said about this in this man page.
> -.\"
> +Generally, eBPF programs are loaded by the user process and automatically
> +unloaded when the process exits. In some cases, for example,
> +.BR tc-bpf (8)

s/(8)/(8),/

> +the program will continue to stay alive inside the kernel even after the
> +configuration process exits. In that case, the subsystem holds a reference

"configuration process" sounds odd. How about just "the process that loaded 
the program"?

And, what is "the subsystem"? That needs to be clearer. (It could just
be "the kernel"?)

> +to the program after the file descriptor has been dropped by the user. Thus,
> +whether a specific program continues to live inside the kernel depends on
> +how it is being further attached to a given subsystem after it has been

s/is being/is/

> +loaded via
> +.BR bpf (2)
> +\.
> +
>  Each program is a set of instructions that is safe to run until
>  its completion.
>  An in-kernel verifier statically determines that the eBPF program
> @@ -105,20 +104,21 @@ A new event triggers execution of the eBPF program, which
>  may store information about the event in eBPF maps.
>  Beyond storing data, eBPF programs may call a fixed set of
>  in-kernel helper functions.
> +
>  The same eBPF program can be attached to multiple events and different
>  eBPF programs can access the same map:
>  
>  .in +4n
>  .nf
> -tracing     tracing     tracing     packet      packet
> -event A     event B     event C     on eth0     on eth1
> - |             |          |           |           |
> - |             |          |           |           |
> - --> tracing <--      tracing       socket    tc ingress
> -      prog_1           prog_2       prog_3    classifier
> -      |  |               |            |         prog_4
> -   |---  -----|  |-------|           map_3
> - map_1       map_2
> +tracing     tracing     tracing     packet      packet     packet
> +event A     event B     event C     on eth0     on eth1    on eth2
> + |             |          |           |           |          ^
> + |             |          |           |           v          |
> + --> tracing <--      tracing       socket    tc ingress   tc egress
> +      prog_1           prog_2       prog_3    classifier    action
> +      |  |               |            |         prog_4      prog_5
> +   |---  -----|  |-------|           map_3        |           |
> + map_1       map_2                                --| map_4 |--
>  .fi
>  .in
>  .\"
> @@ -612,10 +612,15 @@ since elements cannot be deleted.
>  replaces elements in a
>  .B nonatomic
>  fashion;
> -.\" FIXME
> -.\" Daniel Borkmann: when you have a value_size of sizeof(long), you can
> -.\" however use __sync_fetch_and_add() atomic builtin from the LLVM backend
> -for atomic updates, a hash-table map should be used instead.
> +for atomic updates, a hash-table map should be used instead. There's

s/There's/There is/

> +however one special case that can also be used with arrays: the atomic
> +built-in
> +.BR __sync_fetch_and_add()
> +can be used on 32 and 64 bit atomic counters. For example, it can be
> +applied on the whole value itself if it represents a single counter,
> +or in case of a structure containing mutiple counters, it could be

s/mutiple/multiple/

> +used on individual ones. This is quite often useful for aggregation
> +and accounting of events.
>  .RE
>  .IP
>  Among the uses for array maps are the following:
> @@ -626,11 +631,46 @@ and where the value is a collection of 'global' variables which
>  eBPF programs can use to keep state between events.
>  .IP *
>  Aggregation of tracing events into a fixed set of buckets.
> +.IP *
> +Accounting of networking events, for example, number of packets and packet
> +sizes.
>  .RE
>  .TP
>  .BR BPF_MAP_TYPE_PROG_ARRAY " (since Linux 4.2)"
> -.\" FIXME we need documentation of BPF_MAP_TYPE_PROG_ARRAY
> -[To be completed]
> +A program array map is a special kind of array map, whose map values only
> +contain valid file descriptors to other eBPF programs. Thus both, the

s/,//

> +key_size and value_size must be exactly four bytes. This map is being used

s/being used/used/

> +in conjunction with the
> +.BR bpf_tail_call()
> +helper.
> +
> +This means that an eBPF program with a program array map attached to it
> +can call from kernel side into
> +
> +.in +4n
> +.nf
> +void bpf_tail_call(void *context, void *prog_map, unsigned int index);
> +.fi
> +.in
> +
> +and therefore replace its own program flow with the one from the program
> +at the given program array slot if present. This can be regarded as kind
> +of a jump table to a different eBPF program. The callee program will then

s/callee/called/

> +reuse the same stack. When a jump into the new program has been performed,
> +it won't return to the old one anymore.
> +
> +In case at a given index of the program array, no eBPF program has been
> +found, execution continues with the current program. 

Make that:

    If no eBPF program is found at the(? not "a") given index of the program
    array, execution continues with the current eBPF program.

> This can be used as
> +a fall-through for default cases.
> +
> +A program array map is useful, for example, in tracing or networking, to
> +handle individual system calls resp. protocols in its own sub-programs and
> +use their identifiers as an individual map index. This approach may result
> +in performance benefits, and also allows to overcome the maximum instruction

s/allows to/makes it possible to/

> +limit of a single program. In dynamic evironments, a user space daemon may

Spelling "environments"

> +atomically replace individual sub-programs at run-time with newer versions
> +to alter overall program behaviour, for instance, when global policies might

s/behaviour/behavior/
(In man-pages, we consistently use American.)

> +change.
>  .\"
>  .SS eBPF programs
>  The
> @@ -699,20 +739,7 @@ is a license string, which must be GPL compatible to call helper functions
>  marked
>  .IR gpl_only .
>  (The licensing rules are the same as for kernel modules,
> -so that dual licenses, such as "Dual BSD/GPL", may be used.)
> -.\" Daniel Borkmann commented:
> -.\"     Not strictly. So here, the same rules apply as with kernel modules.
> -.\"     I.e. what the kernel checks for are the following license strings:
> -.\"
> -.\"     static inline int license_is_gpl_compatible(const char *license)
> -.\"     {
> -.\"     	return (strcmp(license, "GPL") == 0
> -.\"     		|| strcmp(license, "GPL v2") == 0
> -.\"     		|| strcmp(license, "GPL and additional rights") == 0
> -.\"     		|| strcmp(license, "Dual BSD/GPL") == 0
> -.\"     		|| strcmp(license, "Dual MIT/GPL") == 0
> -.\"     		|| strcmp(license, "Dual MPL/GPL") == 0);
> -.\"     }
> +so that also dual licenses, such as "Dual BSD/GPL", may be used.)
>  .IP *
>  .I log_buf
>  is a pointer to a caller-allocated buffer in which the in-kernel

Thanks,

Michael
 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
