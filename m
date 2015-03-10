From: Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH man-pages] bpf.2: new page documenting bpf(2)
Date: Tue, 10 Mar 2015 14:16:57 +0100
Message-ID: <CAKvUva8a2vZ9racK0BTaAk5K7UROoW-hSbc_bgBAQtbQjQdXvg@mail.gmail.com>
References: <1425939036-30044-1-git-send-email-ast@plumgrid.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425939036-30044-1-git-send-email-ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Alexei

Please find some comments and suggestions below.


On Mon, Mar 9, 2015 at 11:10 PM, Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org> wrote:
> Signed-off-by: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
> ---
>  man2/bpf.2 |  593 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 593 insertions(+)
>  create mode 100644 man2/bpf.2
>
> diff --git a/man2/bpf.2 b/man2/bpf.2
> new file mode 100644
> index 0000000..21b42b4
> --- /dev/null
> +++ b/man2/bpf.2
> @@ -0,0 +1,593 @@
> +.TH BPF 2 2015-03-09 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +bpf - perform a command on extended BPF map or program

s/extended/an extended/

> +.SH SYNOPSIS
> +.nf
> +.B #include <linux/bpf.h>
> +.sp
> +.BI "int bpf(int cmd, union bpf_attr *attr, unsigned int size);
> +
> +.SH DESCRIPTION
> +.BR bpf()
> +syscall is a multiplexor for a range of different operations on extended BPF
> +which can be characterized as "universal in-kernel virtual machine".
> +Extended BPF (or eBPF) is similar to original Berkeley Packet Filter

s/original/the original/

> +(or "classic BPF") used to filter network packets. Both statically analyze
> +the programs before loading them into the kernel to ensure that programs cannot

s/programs/(e)BPF programs/ (?)

s/that programs/that they/

> +harm the running system.
> +.P
> +eBPF extends classic BPF in multiple ways including ability to call

s/ability/the ability/


> +in-kernel helper functions and access shared data structures like BPF maps.
> +The programs can be written in a restricted C that is compiled into

s/C/C dialect/ (?)

> +eBPF bytecode and executed on the in-kernel virtual machine or JITed into native
> +instruction set.

s/native instruction set/native code/ (?)


> +.SS Extended BPF Design/Architecture
> +.P
> +BPF maps is a generic storage of different types.

Maybe better:
+BPF maps are a generic data structure for storage of different data types.

> +User process can create multiple maps (with key/value being

s/User/A user/

s/key\/value/key\/value-pairs/

> +opaque bytes of data) and access them via file descriptor. In parallel BPF
> +programs can access maps from inside the kernel.

Better:

BPF programs can access maps from inside the kernel in parallel.


> +It's up to user process and BPF program to decide what they store inside maps.

s/to user process/to the user process/


> +.P
> +BPF programs are similar to kernel modules. They are loaded by the user
> +process and automatically unloaded when process exits. Each BPF program is

s/process/the process/


> +a safe run-to-completion set of instructions. BPF verifier statically

Maybe better:

Each BPF program is a set of instructions that is safe to run until
its completion.

s/BPF verifier/The BPF verifier/


> +determines that the program terminates and is safe to execute. During
> +verification the program takes a hold of maps that it intends to use,

s/takes a hold/takes hold/


> +so selected maps cannot be removed until the program is unloaded. The program
> +can be attached to different events. These events can be packets, tracing
> +events and other types in the future. A new event triggers execution of

s/in the future/that may be added in the future/

> +the program which may store information about the event in the maps.
> +Beyond storing data the programs may call into in-kernel helper functions.
> +The same program can be attached to multiple events. Different programs can

s/\. D/and d/ (?)

> +access the same map:
> +.nf
> +  tracing     tracing     tracing     packet     packet
> +  event A     event B     event C     on eth0    on eth1
> +   |             |          |           |          |
> +   |             |          |           |          |
> +   --> tracing <--      tracing       socket     socket
> +        prog_1           prog_2       prog_3     prog_4
> +        |  |               |            |
> +     |---  -----|  |-------|           map_3
> +   map_1       map_2
> +.fi
> +.SS Syscall Arguments
> +.B bpf()
> +syscall operation is determined by
> +.IR cmd
> +which can be one of the following:
> +.TP
> +.B BPF_MAP_CREATE
> +Create a map with given type and attributes and return map FD

s/given type/the given type/


> +.TP
> +.B BPF_MAP_LOOKUP_ELEM
> +Lookup element by key in a given map and return its value
> +.TP
> +.B BPF_MAP_UPDATE_ELEM
> +Create or update element (key/value pair) in a given map
> +.TP
> +.B BPF_MAP_DELETE_ELEM
> +Lookup and delete element by key in a given map
> +.TP
> +.B BPF_MAP_GET_NEXT_KEY
> +Lookup element by key in a given map and return key of next element
> +.TP
> +.B BPF_PROG_LOAD
> +Verify and load BPF program
> +.TP
> +.B attr
> +is a pointer to a union of type bpf_attr as defined below.
> +.TP
> +.B size
> +is the size of the union.
> +.P
> +.nf
> +union bpf_attr {
> +    struct { /* anonymous struct used by BPF_MAP_CREATE command */
> +        __u32             map_type;
> +        __u32             key_size;    /* size of key in bytes */
> +        __u32             value_size;  /* size of value in bytes */
> +        __u32             max_entries; /* max number of entries in a map */
> +    };
> +
> +    struct { /* anonymous struct used by BPF_MAP_*_ELEM commands */
> +        __u32             map_fd;
> +        __aligned_u64     key;
> +        union {
> +            __aligned_u64 value;
> +            __aligned_u64 next_key;
> +        };
> + __u64             flags;
> +    };
> +
> +    struct { /* anonymous struct used by BPF_PROG_LOAD command */
> +        __u32         prog_type;
> +        __u32         insn_cnt;
> +        __aligned_u64 insns;     /* 'const struct bpf_insn *' */
> +        __aligned_u64 license;   /* 'const char *' */
> +        __u32         log_level; /* verbosity level of verifier */
> +        __u32         log_size;  /* size of user buffer */
> +        __aligned_u64 log_buf;   /* user supplied 'char *' buffer */
> +    };
> +} __attribute__((aligned(8)));
> +.fi
> +.SS BPF maps
> +maps is a generic storage of different types for sharing data between kernel

Better:

BPF maps are a generic data structure for storige of different types
and sharing data...


> +and userspace.
> +
> +Any map type has the following attributes:
> +  . type
> +  . max number of elements
> +  . key size in bytes
> +  . value size in bytes
> +
> +The following wrapper functions demonstrate how this syscall can be used to
> +access the maps. The functions use the
> +.IR cmd
> +argument to invoke different operations.
> +.TP
> +.B BPF_MAP_CREATE
> +.nf
> +int bpf_create_map(enum bpf_map_type map_type, int key_size,
> +                   int value_size, int max_entries)
> +{
> +    union bpf_attr attr = {
> +        .map_type = map_type,
> +        .key_size = key_size,
> +        .value_size = value_size,
> +        .max_entries = max_entries
> +    };
> +
> +    return bpf(BPF_MAP_CREATE, &attr, sizeof(attr));
> +}
> +.fi
> +bpf() syscall creates a map of
> +.I map_type
> +type and given attributes
> +.I key_size, value_size, max_entries.
> +On success it returns process-local file descriptor. On error, \-1 is returned and

s/returns/returns a/


> +.I errno
> +is set to EINVAL or EPERM or ENOMEM.
> +
> +The attributes
> +.I key_size
> +and
> +.I value_size
> +will be used by verifier during program loading to check that program is calling

s/verifier/the verifier/

s/that program/that the program/

> +bpf_map_*_elem() helper functions with correctly initialized

s/correctly/a correctly/


> +.I key
> +and that program doesn't access map element

s/that program/that the program/

> +.I value
> +beyond specified

s/beyond/beyond the/


> +.I value_size.
> +For example, when map is created with key_size = 8 and program does:

s/map/a map/;s/program does:/the program calls/

> +.nf
> +bpf_map_lookup_elem(map_fd, fp - 4)
> +.fi
> +such program will be rejected,

s/such/the/

> +since in-kernel helper function bpf_map_lookup_elem(map_fd, void *key) expects

s/since/since the/


> +to read 8 bytes from 'key' pointer, but 'fp - 4' starting address will cause
> +out of bounds stack access.
> +
> +Similarly, when map is created with value_size = 1 and program does:

s/map/a map/

s/program does:/the program calls/

> +.nf
> +value = bpf_map_lookup_elem(...);
> +*(u32 *)value = 1;
> +.fi
> +such program will be rejected, since it accesses

s/such/the/

s/accesses/accesses the/

> +.I value
> +pointer beyond specified 1 byte value_size limit.

s/beyond/beyond the/


> +
> +Currently two
> +.I map_type
> +are supported:
> +.nf
> +enum bpf_map_type {
> +   BPF_MAP_TYPE_UNSPEC,
> +   BPF_MAP_TYPE_HASH,
> +   BPF_MAP_TYPE_ARRAY,
> +};
> +.fi
> +.I map_type
> +selects one of the available map implementations in kernel. For all map_types

s/in kernel/in the kernel/


> +programs access maps with the same bpf_map_lookup_elem()/bpf_map_update_elem()
> +helper functions.
> +.TP
> +.B BPF_MAP_LOOKUP_ELEM
> +.nf
> +int bpf_lookup_elem(int fd, void *key, void *value)
> +{
> +    union bpf_attr attr = {
> +        .map_fd = fd,
> +        .key = ptr_to_u64(key),
> +        .value = ptr_to_u64(value),
> +    };
> +
> +    return bpf(BPF_MAP_LOOKUP_ELEM, &attr, sizeof(attr));
> +}
> +.fi
> +bpf() syscall looks up an element with given

s/with/with a/

> +.I key
> +in a map
> +.I fd.
> +If element is found it returns zero and stores element's value into

s/element/an element/


> +.I value.
> +If element is not found it returns \-1 and sets

s/element/no element/;s/not//


> +.I errno
> +to ENOENT.
> +.TP
> +.B BPF_MAP_UPDATE_ELEM
> +.nf
> +int bpf_update_elem(int fd, void *key, void *value, __u64 flags)
> +{
> +    union bpf_attr attr = {
> +        .map_fd = fd,
> +        .key = ptr_to_u64(key),
> +        .value = ptr_to_u64(value),
> +        .flags = flags,
> +    };
> +
> +    return bpf(BPF_MAP_UPDATE_ELEM, &attr, sizeof(attr));
> +}
> +.fi
> +The call creates or updates element with given

s/element/an element/

s/with/with a/

> +.I key/value
> +in a map
> +.I fd
> +according to
> +.I flags
> +which can have 3 possible values:

s/have/have one of/ (?)


> +.nf
> +#define BPF_ANY         0 /* create new element or update existing */
> +#define BPF_NOEXIST     1 /* create new element if it didn't exist */
> +#define BPF_EXIST       2 /* update existing element */
> +.fi
> +On success it returns zero.
> +On error, \-1 is returned and
> +.I errno
> +is set to EINVAL or EPERM or ENOMEM or E2BIG.

Maybe better:

+is set to EINVAL, EPERM, ENOMEM or E2BIG.


> +.B E2BIG
> +indicates that number of elements in the map reached

s/that/that the/


> +.I max_entries
> +limit specified at map creation time.
> +.B EEXIST
> +will be returned from call bpf_update_elem(fd, key, value, BPF_NOEXIST) if element

s/call/a call to/

s/element/the element/

> +with 'key' already exists in the map.
> +.B ENOENT
> +will be returned from call bpf_update_elem(fd, key, value, BPF_EXIST) if element

s/call/a call to/

s/element/the element/

> +with 'key' doesn't exist in the map.
> +.TP
> +.B BPF_MAP_DELETE_ELEM
> +.nf
> +int bpf_delete_elem(int fd, void *key)
> +{
> +    union bpf_attr attr = {
> +        .map_fd = fd,
> +        .key = ptr_to_u64(key),
> +    };
> +
> +    return bpf(BPF_MAP_DELETE_ELEM, &attr, sizeof(attr));
> +}
> +.fi
> +The call deletes an element in a map
> +.I fd
> +with given

s/with/with a/


> +.I key.
> +Returns zero on success. If element is not found it returns \-1 and sets

s/element/the element/


> +.I errno
> +to ENOENT.
> +.TP
> +.B BPF_MAP_GET_NEXT_KEY
> +.nf
> +int bpf_get_next_key(int fd, void *key, void *next_key)
> +{
> +    union bpf_attr attr = {
> +        .map_fd = fd,
> +        .key = ptr_to_u64(key),
> +        .next_key = ptr_to_u64(next_key),
> +    };
> +
> +    return bpf(BPF_MAP_GET_NEXT_KEY, &attr, sizeof(attr));
> +}
> +.fi
> +The call looks up an element by
> +.I key
> +in a given map
> +.I fd
> +and returns key of the next element into

Better:

and sets the next_key pointer to the key of the next element.


> +.I next_key
> +pointer. If
> +.I key
> +is not found, it return zero and returns key of the first element into

s/return zero/returns zero/

Better:

...returns zero and sets the next_key pointer to the key of the first element.

> +.I next_key. If
> +.I key
> +is the last element, it returns \-1 and sets
> +.I errno
> +to ENOENT. Other possible
> +.I errno
> +values are ENOMEM, EFAULT, EPERM, EINVAL.

Maybe better:
+values are ENOMEM, EFAULT, EPERM and EINVAL.

> +This method can be used to iterate over all elements of the map.

s/of the/in the/ (?)


> +.TP
> +.B close(map_fd)
> +will delete the map
> +.I map_fd.
> +Exiting process will delete all maps automatically.

s/process/the process/

Maybe better:

When the BPF program exits all maps will be deleted automatically.

That is not the case when other BPF programs are still using the same
map though, right? So we should probably add something like

will be deleted automatically if they are not in use by another BPF
program.


> +.P
> +.SS BPF programs
> +
> +.TP
> +.B BPF_PROG_LOAD
> +This
> +.IR cmd
> +is used to load extended BPF program into the kernel.
> +
> +.nf
> +char bpf_log_buf[LOG_BUF_SIZE];
> +
> +int bpf_prog_load(enum bpf_prog_type prog_type,
> +                  const struct bpf_insn *insns, int insn_cnt,
> +                  const char *license)
> +{
> +    union bpf_attr attr = {
> +        .prog_type = prog_type,
> +        .insns = ptr_to_u64(insns),
> +        .insn_cnt = insn_cnt,
> +        .license = ptr_to_u64(license),
> +        .log_buf = ptr_to_u64(bpf_log_buf),
> +        .log_size = LOG_BUF_SIZE,
> +        .log_level = 1,
> +    };
> +
> +    return bpf(BPF_PROG_LOAD, &attr, sizeof(attr));
> +}
> +.fi
> +.B prog_type
> +is one of the available program types:
> +.nf
> +enum bpf_prog_type {
> +        BPF_PROG_TYPE_UNSPEC,
> +        BPF_PROG_TYPE_SOCKET_FILTER,
> +        BPF_PROG_TYPE_SCHED_CLS,
> +};
> +.fi
> +By picking
> +.I prog_type
> +program author selects a set of helper functions callable from

s/program/the program author/


> +the program and corresponding format of

s/corresponding/the corresponding/


> +.I struct bpf_context
> +(which is the data blob passed into the program as the first argument).

I cannot see where the struct bpf_context is being passed to the bpf()
call. Is there something missing?


> +For example, the programs loaded with
> +.I prog_type
> += BPF_PROG_TYPE_SOCKET_FILTER may call bpf_map_lookup_elem() helper,
> +whereas some future types may not be.

s/may not be/may not/


> +The set of functions available to the programs under given type may increase

s/given/a given/


> +in the future.
> +
> +Currently the set of functions for
> +.B BPF_PROG_TYPE_SOCKET_FILTER
> +is:
> +.nf
> +bpf_map_lookup_elem(map_fd, void *key)              // lookup key in a map_fd
> +bpf_map_update_elem(map_fd, void *key, void *value) // update key/value
> +bpf_map_delete_elem(map_fd, void *key)              // delete key in a map_fd
> +.fi
> +
> +and bpf_context is a pointer to 'struct sk_buff'. Programs cannot
> +access fields of 'sk_buff' directly.
> +
> +More program types may be added in the future. Like
> +.B BPF_PROG_TYPE_KPROBE
> +and bpf_context for it may be defined as a pointer to 'struct pt_regs'.
> +
> +.B insns
> +array of "struct bpf_insn" instructions

Missing full stop.

> +
> +.B insn_cnt
> +number of instructions in the program

Missing full stop.


> +
> +.B license
> +license string, which must be GPL compatible to call helper functions
> +marked gpl_only

Missing full stop.


> +
> +.B log_buf
> +user supplied buffer that in-kernel verifier is using to store verification

s/that/that the/

s/store/store the/


> +log. Log is a multi-line string that should be used by program author to

s/Log/This log/

s/program/the program/

Better:

This log is a multi-line string that can be checked by the program author
in order to undersand how the verifier came to the conclusion that the
BPF program is unsafe.


> +understand how verifier came to conclusion that program is unsafe. The format
> +of the output can change at any time as verifier evolves.

s/as/as the/


> +
> +.B log_size
> +size of user buffer. If size of the buffer is not large enough to store all

s/size/the size/


> +verifier messages, \-1 is returned and
> +.I errno
> +is set to ENOSPC.
> +
> +.B log_level
> +verbosity level of verifier, where zero means no logs provided

s/of/of the/

Better:

...verifier. A value of zero means that the verifier will not provide a log.


> +.TP
> +.B close(prog_fd)
> +will unload BPF program

s/BPF/the BPF/


> +.P
> +The maps are accesible from programs and used to exchange data between

s/accesible/accessible/


> +programs and between program and user space.

s/programs/BPF programs/

Maybe better:

...and between them and user space.


> +Programs process various events (like kprobe, packets) and
> +store the data into maps. User space fetches data from maps.

s/the/their/

s/data from/data from the/


> +Either the same or a different map may be used by user space as configuration

s/as/as a/


> +space to alter program behavior on the fly.
> +.SS Events
> +.P
> +Once the program is loaded, it can be attached to an event. Various kernel

s/the/a/


> +subsystems have different ways to do so. For example:
> +
> +.nf
> +setsockopt(sock, SOL_SOCKET, SO_ATTACH_BPF, &prog_fd, sizeof(prog_fd));
> +.fi
> +will attach the program
> +.I prog_fd
> +to socket
> +.I sock
> +which was received by prior call to socket().

s/by/from a/


> +
> +In the future
> +.nf
> +ioctl(event_fd, PERF_EVENT_IOC_SET_BPF, prog_fd);
> +.fi
> +may attach the program
> +.I prog_fd
> +to perf event
> +.I event_fd
> +which was received by prior call to perf_event_open().

s/by/from a/

> +
> +.SH EXAMPLES
> +.nf
> +/* bpf+sockets example:
> + * 1. create array map of 256 elements
> + * 2. load program that counts number of packets received
> + *    r0 = skb->data[ETH_HLEN + offsetof(struct iphdr, protocol)]
> + *    map[r0]++
> + * 3. attach prog_fd to raw socket via setsockopt()
> + * 4. print number of received TCP/UDP packets every second
> + */
> +int main(int ac, char **av)
> +{
> +    int sock, map_fd, prog_fd, key;
> +    long long value = 0, tcp_cnt, udp_cnt;
> +
> +    map_fd = bpf_create_map(BPF_MAP_TYPE_ARRAY, sizeof(key), sizeof(value), 256);
> +    if (map_fd < 0) {
> +        printf("failed to create map '%s'\\n", strerror(errno));
> +        /* likely not run as root */
> +        return 1;
> +    }
> +
> +    struct bpf_insn prog[] = {
> +        BPF_MOV64_REG(BPF_REG_6, BPF_REG_1),           /* r6 = r1 */
> +        BPF_LD_ABS(BPF_B, ETH_HLEN + offsetof(struct iphdr, protocol)), /* r0 = ip->proto */
> +        BPF_STX_MEM(BPF_W, BPF_REG_10, BPF_REG_0, -4), /* *(u32 *)(fp - 4) = r0 */
> +        BPF_MOV64_REG(BPF_REG_2, BPF_REG_10),          /* r2 = fp */
> +        BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, -4),         /* r2 = r2 - 4 */
> +        BPF_LD_MAP_FD(BPF_REG_1, map_fd),              /* r1 = map_fd */
> +        BPF_CALL_FUNC(BPF_FUNC_map_lookup_elem),       /* r0 = map_lookup(r1, r2) */
> +        BPF_JMP_IMM(BPF_JEQ, BPF_REG_0, 0, 2),         /* if (r0 == 0) goto pc+2 */
> +        BPF_MOV64_IMM(BPF_REG_1, 1),                   /* r1 = 1 */
> +        BPF_XADD(BPF_DW, BPF_REG_0, BPF_REG_1, 0, 0),  /* lock *(u64 *)r0 += r1 */
> +        BPF_MOV64_IMM(BPF_REG_0, 0),                   /* r0 = 0 */
> +        BPF_EXIT_INSN(),                               /* return r0 */
> +    };
> +
> +    prog_fd = bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, prog, sizeof(prog), "GPL");
> +
> +    sock = open_raw_sock("lo");
> +
> +    assert(setsockopt(sock, SOL_SOCKET, SO_ATTACH_BPF, &prog_fd, sizeof(prog_fd)) == 0);
> +
> +    for (;;) {
> +        key = IPPROTO_TCP;
> +        assert(bpf_lookup_elem(map_fd, &key, &tcp_cnt) == 0);
> +        key = IPPROTO_UDP
> +        assert(bpf_lookup_elem(map_fd, &key, &udp_cnt) == 0);
> +        printf("TCP %lld UDP %lld packets\n", tcp_cnt, udp_cnt);
> +        sleep(1);
> +    }
> +
> +    return 0;
> +}
> +.fi
> +.SH RETURN VALUE
> +For a successful call, the return value depends on the operation:
> +.TP
> +.B BPF_MAP_CREATE
> +The new file descriptor associated with BPF map.

s/with/with the/

> +.TP
> +.B BPF_PROG_LOAD
> +The new file descriptor associated with BPF program.

s/with/with the/

> +.TP
> +All other commands
> +Zero.
> +.PP
> +On error, \-1 is returned, and
> +.I errno
> +is set appropriately.
> +.SH ERRORS
> +.TP
> +.B EPERM
> +bpf() syscall was made without sufficient privilege
> +(without the
> +.B CAP_SYS_ADMIN
> +capability).
> +.TP
> +.B ENOMEM
> +Cannot allocate sufficient memory.
> +.TP
> +.B EBADF
> +.I fd
> +is not an open file descriptor
> +.TP
> +.B EFAULT
> +One of the pointers (
> +.I key
> +or
> +.I value
> +or
> +.I log_buf
> +or
> +.I insns
> +) is outside accessible address space.

s/outside/outside the/


> +.TP
> +.B EINVAL
> +The value specified in
> +.I cmd
> +is not recognized by this kernel.
> +.TP
> +.B EINVAL
> +For
> +.BR BPF_MAP_CREATE ,
> +either
> +.I map_type
> +or attributes are invalid.
> +.TP
> +.B EINVAL
> +For
> +.BR BPF_MAP_*_ELEM
> +commands,
> +some of the fields of "union bpf_attr" unused by this command are not set

s/unused/that are not used/


> +to zero.
> +.TP
> +.B EINVAL
> +For
> +.BR BPF_PROG_LOAD,
> +attempt to load invalid program (unrecognized instruction or uses reserved

s/attempt/indicates an attempt/

s/invalid/an invalid/

Better:

...invalid program. BPF programs can be deemed invalid due to
unrecognized instructions, the use of reserved fields, jumps out of
range, infinite loops or calls of unknown functions.

> +fields or jumps out of range or loop detected or calls unknown function).
> +.TP
> +.BR EACCES
> +For
> +.BR BPF_PROG_LOAD,
> +though program has valid instructions, it was rejected, since it was deemed

s/though/even though the/

Maybe better:

even though all program instructions are valid, the program has been
rejected because it was deemed unsafe. This may be because it may have
accessed a disallowed memory region or an uninitialized stack/register or
because the function contraints don't match the actual types or because
there was a misaligned memory access.


> +unsafe (may access disallowed memory region or uninitialized stack/register
> +or function constraints don't match actual types or misaligned access). In
> +such case it is recommended to call bpf() again with
> +.I log_level = 1
> +and examine
> +.I log_buf
> +for specific reason provided by verifier.

s/for/for the/
s/by/by the/

> +.TP
> +.BR ENOENT
> +For
> +.B BPF_MAP_LOOKUP_ELEM
> +or
> +.B BPF_MAP_DELETE_ELEM,
> +indicates that element with given

s/that/that the/

s/with/with the/

> +.I key
> +was not found.
> +.TP
> +.BR E2BIG
> +program is too large or
> +a map reached
> +.I max_entries
> +limit (max number of elements).
> +.SH NOTES
> +These commands may be used only by a privileged process (one having the
> +.B CAP_SYS_ADMIN
> +capability).
> +.SH SEE ALSO
> +Both classic and extended BPF is explained in Documentation/networking/filter.txt

s/is/are/

> --
> 1.7.9.5

It may also be better to replace some instances of "program" with "(e)BPF
program" to make things clearer.

Please note that I have not looked at the code in detail (yet).

Thanks for your great work on eBPF!


Cheers,

Silvan
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
