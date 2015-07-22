From: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Subject: Re: Draft 3 of bpf(2) man page for review
Date: Wed, 22 Jul 2015 12:22:29 -0700
Message-ID: <55AFED75.2030208@plumgrid.com>
References: <55AFE46F.3090800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55AFE46F.3090800-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 7/22/15 11:43 AM, Michael Kerrisk (man-pages) wrote:
> .TH BPF 2 2015-03-10 "Linux" "Linux Programmer's Manual"

should the date be updated ?

> BPF maps are a generic data structure for storage of different data types.
> A user process can create multiple maps (with key/value-pairs being
> opaque bytes of data) and access them via file descriptors.
> eBPF programs can access maps from inside the kernel in parallel.
> .\"
> .\" FIXME!! What does the previous sentence mean?
> .\"
> .\" Isn't "from inside the kernel" redundant? (I mean: all eBPF programs
> .\" are running inside the kernel, right?)

99.9% of the time. yes. all eBPF programs are running inside the kernel,
though recently I've seen two versions of 'user space eBPF' where
kernel interpreter/x64_jit were ported to user space.
If you think 'from kernel' is redundant, just drop it.

> .\" And what does "in parallel" mean?
> .\" Would a simpler version of this sentence be correct? As in:
> .\"     "Different eBPF programs can access the same maps in parallel."

yes. different eBPF programs and user space processes can access the
same maps in parallel.

> The new map has the type specified by
> .IR map_type ,
> and attributes as specified in
> .IR key_size ,
> .IR value_size ,
> and
> .IR max_entries .
> .\" FIXME!! In the next sentence, what does "process-local" mean?
> On success, this operation returns a process-local file descriptor.

Just drop this unnecessary qualifier. Just 'returns a file descriptor'

> .in +4n
> .nf
> bpf_map_lookup_elem(map_fd, fp - 4)
> .fi
> .in
>
> the program will be rejected,
> since the in-kernel helper function
>
>      bpf_map_lookup_elem(map_fd, void *key)
>
> expects to read 8 bytes from
> .I key
> pointer, but
> .IR "fp\ -\ 4"
> .\" FIXME!! I'm lost! What is 'fp' in this context?

it refers to 2nd argument of 'bpf_map_lookup_elem(map_fd, fp - 4)'
fp = top of the stack.
fp - 4 = pointer to 4 bytes below top of the stack.
So 8 byte access from there will be out of bounds.

> The following map types are supported:
> .TP
> .B BPF_MAP_TYPE_HASH
> .\" commit 0f8e4bd8a1fc8c4185f1630061d0a1f2d197a475
> .\" FIXME!! Please review the following list of points, which draws
> .\" heavily from the commit message, but reworks the text significantly
> .\" and so may have introduced errors.
> Hash-table maps have the following characteristics:
> .RS
> .IP * 3
> Maps are created and destroyed by user-space programs.
> Both user-space and eBPF programs
> can perform lookuo, update, and delete operations.

typo 'lookup'

> .IP *
> The kernel takes care of allocating and freeing key/value pairs.
> .IP *
> The
> .BR map_update_elem ()
> helper with fail to insert new element when the
> .I max_entries
> limit is reached.
> (This ensures that eBPF programs cannot exhaust memory.)
> .IP *
> .BR map_update_elem ()
> replaces existing elements atomically.
> .RE
> .IP
> Hash-table maps are
> optimized for speed of lookup.
> .TP
> .B BPF_MAP_TYPE_ARRAY
> .\" commit 28fbcfa08d8ed7c5a50d41a0433aad222835e8e3
> .\" FIXME!! Please review the following list of points, which draws
> .\" heavily from the commit message, but reworks the text significantly
> .\" and so may have introduced errors.
> Array maps have the following characteristics:
> .RS
> .IP * 3
> Optimized for fastest possible lookup.
> In the future ithe verifier/JIT compiler

typo 'the'

> may recognize lookup() operations that employ a constant key
> and optimize it into constant pointer.
> It is possible to optimize a non-constant
> key into direct pointer arithmetic as well, since pointers and
> .I value_size
> are constant for the life of the eBPF program.
> In other words,
> .BR array_map_lookup_elem ()
> may be 'inlined' by the verifier/JIT compiler
> while preserving concurrent access to this map from user space.
> .IP *
> All array elements pre-allocated and zero initialized at init time
> .IP *
> The key is an array index, and must be exactly four bytes.
> .IP *
> .BR map_delete_elem ()
> fails with the error
> .BR EINVAL ,
> since elements cannot be deleted.
> .IP *
> .BR map_update_elem ()
> replaces elements in an non-atomic fashion;
> for atomic updates, a hash-table map should be used instead.

the description of hash and array maps looks good.

> .\" FIXME The following paragraph needs amending. Alexei commented:
> .\"
> .\"     Actually now in case of SOCKET_FILTER, SCHED_CLS, SCHED_ACT
> .\"     the program can now access skb fields.
> .\"     See 'struct __sk_buff' and commit 9bac3d6d548e5
> .\"
> .\" Do we want some text here to explain how the program access __sk_buff?

I think commit 9bac3d6d548e5 tried to explain it, but translating
that to english would be nice :)

> .\" FIXME!! Alexei, is the following correct?
> eBPF objects (maps and programs) can be shared between processes.
> For example, after
> .BR fork (2),
> the child inherits file descriptors referring to the same eBPF objects.
> In addition, file descriptors referring to eBPF objects can be
> transferred over UNIX domain sockets.
> File descriptors referring to eBPF objects can be duplicated
> in the usual way, using
> .BR dup (2)
> and similar calls.
> An eBPF object is deallocated only after all file descriptors
> referring to the object have been closed.

yes. all correct.

> eBPF programs can be written in a restricted C that is compiled (using the
> .B clang
> compiler) into eBPF bytecode and executed on the in-kernel virtual machine or
> just-in-time compiled into native code.
> (Various features are omitted from this restricted C, such as loops,
> global variables, variadic functions, floating-point numbers,
> and passing structures as function arguments.)
> Some examples can be found in the
> .I samples/bpf/*_kern.c
> files in the kernel source tree.

thanks. whole thing looks good.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
