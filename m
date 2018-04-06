From: Quentin Monnet <quentin.monnet@netronome.com>
Subject: [RFC bpf-next] bpf: document eBPF helpers and add a script to generate man page
Date: Fri,  6 Apr 2018 12:11:22 +0100
Message-ID: <20180406111122.11038-1-quentin.monnet@netronome.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: daniel@iogearbox.net, ast@kernel.org
Cc: netdev@vger.kernel.org, oss-drivers@netronome.com, quentin.monnet@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

eBPF helper functions can be called from within eBPF programs to perform
a variety of tasks that would be otherwise hard or impossible to do with
eBPF itself. There is a growing number of such helper functions in the
kernel, but documentation is scarce. The main user space header file
does contain a short commented description of most helpers, but it is
somewhat outdated and not complete. It is more a "cheat sheet" than a
real documentation accessible to new eBPF developers.

This commit attempts to improve the situation by replacing the existing
overview for the helpers with a more developed description. Furthermore,
a Python script is added to generate a manual page for eBPF helpers. The
workflow is the following, and requires the rst2man utility:

    $ ./scripts/bpf_helpers_doc.py \
            --filename include/uapi/linux/bpf.h > /tmp/bpf-helpers.rst
    $ rst2man /tmp/bpf-helpers.rst > /tmp/bpf-helpers.7
    $ man /tmp/bpf-helpers.7

The objective is to keep all documentation related to the helpers in a
single place, and to be able to generate from here a manual page that
could be packaged in the man-pages repository and shipped with most
distributions [1].

Additionally, parsing the prototypes of the helper functions could
hopefully be reused, with a different Printer object, to generate
header files needed in some eBPF-related projects.

Regarding the description of each helper, it comprises several items:

- The function prototype.
- A description of the function and of its arguments (except for a
  couple of cases, when there are no arguments and the return value
  makes the function usage really obvious).
- A description of return values (if not void).
- A listing of eBPF program types (if relevant, map types) compatible
  with the helper.
- Information about the helper being restricted to GPL programs, or not.
- The kernel version in which the helper was introduced.
- The commit that introduced the helper (this is mostly to have it in
  the source of the man page, as it can be used to track changes and
  update the page).

For several helpers, descriptions are inspired (at times, nearly copied)
from the commit logs introducing them in the kernel--Many thanks to
their respective authors! They were completed as much as possible, the
objective being to have something easily accessible even for people just
starting with eBPF. There is probably a bit more work to do in this
direction for some helpers.

Some RST formatting is used in the descriptions (not in function
prototypes, to keep them readable, but the Python script provided in
order to generate the RST for the manual page does add formatting to
prototypes, to produce something pretty) to get "bold" and "italics" in
manual pages. Hopefully, the descriptions in bpf.h file remains
perfectly readable. Note that the few trailing white spaces are
intentional, removing them would break paragraphs for rst2man.

The descriptions should ideally be updated each time someone adds a new
helper, or updates the behaviour (compatibility extended to new program
types, new socket option supported...) or the interface (new flags
available, ...) of existing ones.

[1] I have not contacted people from the man-pages project prior to
    sending this RFC, so I can offer no guaranty at this time that they
    would accept to take the generated man page.

Cc: linux-doc@vger.kernel.org
Cc: linux-man@vger.kernel.org
Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
---
 include/uapi/linux/bpf.h   | 2237 ++++++++++++++++++++++++++++++++++++--------
 scripts/bpf_helpers_doc.py |  568 +++++++++++
 2 files changed, 2429 insertions(+), 376 deletions(-)
 create mode 100755 scripts/bpf_helpers_doc.py

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index c5ec89732a8d..f47aeddbbe0a 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -367,394 +367,1879 @@ union bpf_attr {
 
 /* BPF helper function descriptions:
  *
- * void *bpf_map_lookup_elem(&map, &key)
- *     Return: Map value or NULL
- *
- * int bpf_map_update_elem(&map, &key, &value, flags)
- *     Return: 0 on success or negative error
- *
- * int bpf_map_delete_elem(&map, &key)
- *     Return: 0 on success or negative error
- *
- * int bpf_probe_read(void *dst, int size, void *src)
- *     Return: 0 on success or negative error
+ * void *bpf_map_lookup_elem(struct bpf_map *map, void *key)
+ * 	Description
+ * 		Perform a lookup in *map* for an entry associated to *key*.
+ * 	Return
+ * 		Map value associated to *key*, or **NULL** if no entry was
+ * 		found.
+ * 	For
+ * 		All types of programs. Limited to maps of types
+ * 		**BPF_MAP_TYPE_HASH**,
+ * 		**BPF_MAP_TYPE_ARRAY**,
+ * 		**BPF_MAP_TYPE_PERCPU_HASH**,
+ * 		**BPF_MAP_TYPE_PERCPU_ARRAY**,
+ * 		**BPF_MAP_TYPE_LRU_HASH**,
+ * 		**BPF_MAP_TYPE_LRU_PERCPU_HASH**,
+ * 		**BPF_MAP_TYPE_LPM_TRIE**,
+ * 		**BPF_MAP_TYPE_ARRAY_OF_MAPS**,
+ * 		and **BPF_MAP_TYPE_HASH_OF_MAPS**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 3.19
+ *
+ * .. commit d0003ec01c66
+ *
+ * int bpf_map_update_elem(struct bpf_map *map, void *key, void *value, u64 flags)
+ * 	Description
+ * 		Add or update the value of the entry associated to *key* in
+ * 		*map* with *value*. *flags* is one of:
+ *
+ * 		**BPF_NOEXIST**
+ * 			The entry for *key* must not exist in the map.
+ * 		**BPF_EXIST**
+ * 			The entry for *key* must already exist in the map.
+ * 		**BPF_ANY**
+ * 			No condition on the existence of the entry for *key*.
+ *
+ * 		These flags are only useful for maps of type
+ * 		**BPF_MAP_TYPE_HASH**. For all other map types, **BPF_ANY**
+ * 		should be used.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		All types of programs. Limited to maps of types
+ * 		**BPF_MAP_TYPE_HASH**,
+ * 		**BPF_MAP_TYPE_ARRAY**,
+ * 		**BPF_MAP_TYPE_PERCPU_HASH**,
+ * 		**BPF_MAP_TYPE_PERCPU_ARRAY**,
+ * 		**BPF_MAP_TYPE_LRU_HASH**,
+ * 		**BPF_MAP_TYPE_LRU_PERCPU_HASH**,
+ * 		and **BPF_MAP_TYPE_LPM_TRIE**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 3.19
+ *
+ * .. commit d0003ec01c66
+ *
+ * int bpf_map_delete_elem(struct bpf_map *map, void *key)
+ * 	Description
+ * 		Delete entry with *key* from *map*.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		All types of programs. Limited to maps of types
+ * 		**BPF_MAP_TYPE_HASH**,
+ * 		**BPF_MAP_TYPE_ARRAY**,
+ * 		**BPF_MAP_TYPE_PERCPU_HASH**,
+ * 		**BPF_MAP_TYPE_PERCPU_ARRAY**,
+ * 		**BPF_MAP_TYPE_LRU_HASH**,
+ * 		**BPF_MAP_TYPE_LRU_PERCPU_HASH**,
+ * 		and **BPF_MAP_TYPE_LPM_TRIE**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 3.19
+ *
+ * .. commit d0003ec01c66
+ *
+ * int bpf_probe_read(void *dst, u32 size, const void *src)
+ * 	Description
+ * 		For tracing programs, safely attempt to read *size* bytes from
+ * 		address *src* and store the data in *dst*.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		*Tracing programs*.
+ * 	GPL only
+ * 		Yes
+ * 	Since
+ * 		Linux 4.1
+ *
+ * .. commit 2541517c32be
  *
  * u64 bpf_ktime_get_ns(void)
- *     Return: current ktime
- *
- * int bpf_trace_printk(const char *fmt, int fmt_size, ...)
- *     Return: length of buffer written or negative error
+ * 	Description
+ * 		Return the time elapsed since system boot, in nanoseconds.
+ * 	Return
+ * 		Current *ktime*.
+ * 	For
+ * 		All program types, except
+ * 		**BPF_PROG_TYPE_CGROUP_DEVICE**.
+ * 	GPL only
+ * 		Yes
+ * 	Since
+ * 		Linux 4.1
+ *
+ * .. commit d9847d310ab4
+ *
+ * int bpf_trace_printk(const char *fmt, u32 fmt_size, ...)
+ * 	Description
+ * 		This helper is a "printk()-like" facility for debugging. It
+ * 		prints a message defined by format *fmt* (of size *fmt_size*)
+ * 		to file *\/sys/kernel/debug/tracing/trace* from DebugFS, if
+ * 		available. It can take up to three additional **u64**
+ * 		arguments (as an eBPF helpers, the total number of arguments is
+ * 		limited to five). Each time the helper is called, it appends a
+ * 		line that looks like the following:
+ *
+ * 		::
+ *
+ * 			telnet-470   [001] .N.. 419421.045894: 0x00000001: BPF command: 2
+ *
+ * 		In the above:
+ *
+ * 			* ``telnet`` is the name of the current task.
+ * 			* ``470`` is the PID of the current task.
+ * 			* ``001`` is the CPU number on which the task is
+ * 			  running.
+ * 			* In ``.N..``, each character refers to a set of
+ * 			  options (whether irqs are enabled, scheduling
+ * 			  options, whether hard/softirqs are running, level of
+ * 			  preempt_disabled respectively). **N** means that
+ * 			  **TIF_NEED_RESCHED** and **PREEMPT_NEED_RESCHED**
+ * 			  are set.
+ * 			* ``419421.045894`` is a timestamp.
+ * 			* ``0x00000001`` is a fake value used by BPF for the
+ * 			  instruction pointer register.
+ * 			* ``BPF command: 2`` is the message formatted with
+ * 			  *fmt*.
+ *
+ * 		The conversion specifiers supported by *fmt* are similar, but
+ * 		more limited than for printk(). They are **%d**, **%i**,
+ * 		**%u**, **%x**, **%ld**, **%li**, **%lu**, **%lx**, **%lld**,
+ * 		**%lli**, **%llu**, **%llx**, **%p**, **%s**. No modifier (size
+ * 		of field, padding with zeroes, etc.) is available, and the
+ * 		helper will silently fail if it encounters an unknown
+ * 		specifier.
+ *
+ * 		Also, note that **bpf_trace_printk**\ () is slow, and should
+ * 		only be used for debugging purposes. For passing values to user
+ * 		space, perf events should be preferred.
+ * 	Return
+ * 		The number of bytes written to the buffer, or a negative error
+ * 		in case of failure.
+ * 	For
+ * 		All types of programs.
+ * 	GPL only
+ * 		Yes
+ * 	Since
+ * 		Linux 4.1
+ *
+ * .. commit 9c959c863f82
  *
  * u32 bpf_prandom_u32(void)
- *     Return: random value
- *
- * u32 bpf_raw_smp_processor_id(void)
- *     Return: SMP processor ID
- *
- * int bpf_skb_store_bytes(skb, offset, from, len, flags)
- *     store bytes into packet
- *     @skb: pointer to skb
- *     @offset: offset within packet from skb->mac_header
- *     @from: pointer where to copy bytes from
- *     @len: number of bytes to store into packet
- *     @flags: bit 0 - if true, recompute skb->csum
- *             other bits - reserved
- *     Return: 0 on success or negative error
- *
- * int bpf_l3_csum_replace(skb, offset, from, to, flags)
- *     recompute IP checksum
- *     @skb: pointer to skb
- *     @offset: offset within packet where IP checksum is located
- *     @from: old value of header field
- *     @to: new value of header field
- *     @flags: bits 0-3 - size of header field
- *             other bits - reserved
- *     Return: 0 on success or negative error
- *
- * int bpf_l4_csum_replace(skb, offset, from, to, flags)
- *     recompute TCP/UDP checksum
- *     @skb: pointer to skb
- *     @offset: offset within packet where TCP/UDP checksum is located
- *     @from: old value of header field
- *     @to: new value of header field
- *     @flags: bits 0-3 - size of header field
- *             bit 4 - is pseudo header
- *             other bits - reserved
- *     Return: 0 on success or negative error
- *
- * int bpf_tail_call(ctx, prog_array_map, index)
- *     jump into another BPF program
- *     @ctx: context pointer passed to next program
- *     @prog_array_map: pointer to map which type is BPF_MAP_TYPE_PROG_ARRAY
- *     @index: 32-bit index inside array that selects specific program to run
- *     Return: 0 on success or negative error
- *
- * int bpf_clone_redirect(skb, ifindex, flags)
- *     redirect to another netdev
- *     @skb: pointer to skb
- *     @ifindex: ifindex of the net device
- *     @flags: bit 0 - if set, redirect to ingress instead of egress
- *             other bits - reserved
- *     Return: 0 on success or negative error
+ * 	Return
+ * 		A random 32-bit unsigned value.
+ * 	For
+ * 		All program types, except **BPF_PROG_TYPE_CGROUP_DEVICE**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.1
+ *
+ * .. commit 03e69b508b6f
+ *
+ * u32 bpf_get_smp_processor_id(void)
+ * 	Return
+ * 		The SMP (Symmetric multiprocessing) processor id.
+ * 	For
+ * 		*Networking programs*.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.1
+ *
+ * .. commit c04167ce2ca0
+ *
+ * int bpf_skb_store_bytes(struct sk_buff *skb, u32 offset, const void *from, u32 len, u64 flags)
+ * 	Description
+ * 		Store *len* bytes from address *from* into the packet
+ * 		associated to *skb*, at *offset*. *flags* are a combination of
+ * 		**BPF_F_RECOMPUTE_CSUM** (automatically recompute the
+ * 		checksum for the packet after storing the bytes) and
+ * 		**BPF_F_INVALIDATE_HASH** (set *skb*\ **->hash**, *skb*\
+ * 		**->swhash** and *skb*\ **->l4hash** to 0).
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**,
+ * 		**BPF_PROG_TYPE_SK_SKB**,
+ * 		**BPF_PROG_TYPE_CGROUP_SKB**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.1
+ *
+ * .. commit 91bc4822c3d6
+ *
+ * int bpf_l3_csum_replace(struct sk_buff *skb, u32 offset, u64 from, u64 to, u64 size)
+ * 	Description
+ * 		Recompute the IP checksum for the packet associated to *skb*.
+ * 		Computation is incremental, so the helper must know the former
+ * 		value of the header field that was modified (*from*), the new
+ * 		value of this field (*to*), and the number of bytes (2 or 4)
+ * 		for this field, stored in *size*. Alternatively, it is possible
+ * 		to store the difference between the previous and the new values
+ * 		of the header field in *to*, by setting *from* and *size* to 0.
+ * 		For both methods, *offset* indicates the location of the IP
+ * 		checksum within the packet.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.1
+ *
+ * .. commit 91bc4822c3d6
+ *
+ * int bpf_l4_csum_replace(struct sk_buff *skb, u32 offset, u64 from, u64 to, u64 flags)
+ * 	Description
+ * 		Recompute the TCP or UDP checksum for the packet associated to
+ * 		*skb*. Computation is incremental, so the helper must know the
+ * 		former value of the header field that was modified (*from*),
+ * 		the new value of this field (*to*), and the number of bytes (2
+ * 		or 4) for this field, stored on the lowest four bits of
+ * 		*flags*. Alternatively, it is possible to store the difference
+ * 		between the previous and the new values of the header field in
+ * 		*to*, by setting *from* and the four lowest bits of *flags* to
+ * 		0. For both methods, *offset* indicates the location of the IP
+ * 		checksum within the packet. In addition to the size of the
+ * 		field, *flags* can be added (bitwise OR) actual flags. With
+ * 		**BPF_F_MARK_MANGLED_0**, a null checksum is left untouched
+ * 		(unless **BPF_F_MARK_ENFORCE** is added as well), and for
+ * 		updates resulting in a null checksum the value is set to
+ * 		**CSUM_MANGLED_0** instead. Flag **BPF_F_PSEUDO_HDR**
+ * 		indicates the checksum is to be computed against a
+ * 		pseudo-header.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.1
+ *
+ * .. commit 91bc4822c3d6
+ *
+ * int bpf_tail_call(void *ctx, struct bpf_map *prog_array_map, u32 index)
+ * 	Description
+ * 		This special helper is used to trigger a "tail call", or in
+ * 		other words, to jump into another eBPF program. The contents of
+ * 		eBPF registers and stack are not modified, the new program
+ * 		"inherits" them from the caller. This mechanism allows for
+ * 		program chaining, either for raising the maximum number of
+ * 		available eBPF instructions, or to execute given programs in
+ * 		conditional blocks. For security reasons, there is an upper
+ * 		limit to the number of successive tail calls that can be
+ * 		performed.
+ *
+ * 		Upon call of this helper, the program attempts to jump into a
+ * 		program referenced at index *index* in *prog_array_map*, a
+ * 		special map of type **BPF_MAP_TYPE_PROG_ARRAY**, and passes
+ * 		*ctx*, a pointer to the context.
+ *
+ * 		If the call succeeds, the kernel immediately runs the first
+ * 		instruction of the new program. This is not a function call,
+ * 		and it never goes back to the previous program. If the call
+ * 		fails, then the helper has no effect, and the caller continues
+ * 		to run its own instructions. A call can fail if the destination
+ * 		program for the jump does not exist (i.e. *index* is superior
+ * 		to the number of entries in *prog_array_map*), or if the
+ * 		maximum number of tail calls has been reached for this chain of
+ * 		programs. This limit is defined in the kernel by the macro
+ * 		**MAX_TAIL_CALL_CNT** (not accessible to user space), which
+ * 		is currently set to 32.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		All program types, except **BPF_PROG_TYPE_CGROUP_DEVICE**.
+ * 		Limited to maps of type **BPF_MAP_TYPE_PROG_ARRAY**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.2
+ *
+ * .. commit 04fd61ab36ec
+ *
+ * int bpf_clone_redirect(struct sk_buff *skb, u32 ifindex, u64 flags)
+ * 	Description
+ * 		Clone and redirect the packet associated to *skb* to another
+ * 		net device of index *ifindex*. The only flag supported for now
+ * 		is **BPF_F_INGRESS**, which indicates the packet is to be
+ * 		redirected to the ingress interface instead of (by default)
+ * 		egress.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.2
+ *
+ * .. commit 3896d655f4d4
  *
  * u64 bpf_get_current_pid_tgid(void)
- *     Return: current->tgid << 32 | current->pid
+ * 	Return
+ * 		A 64-bit integer containing the current tgid and pid, and
+ * 		created as such:
+ * 		*current_task*\ **->tgid << 32 \|**
+ * 		*current_task*\ **->pid**.
+ * 	For
+ * 		*Tracing programs*.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.2
+ *
+ * .. commit ffeedafbf023
  *
  * u64 bpf_get_current_uid_gid(void)
- *     Return: current_gid << 32 | current_uid
- *
- * int bpf_get_current_comm(char *buf, int size_of_buf)
- *     stores current->comm into buf
- *     Return: 0 on success or negative error
- *
- * u32 bpf_get_cgroup_classid(skb)
- *     retrieve a proc's classid
- *     @skb: pointer to skb
- *     Return: classid if != 0
- *
- * int bpf_skb_vlan_push(skb, vlan_proto, vlan_tci)
- *     Return: 0 on success or negative error
- *
- * int bpf_skb_vlan_pop(skb)
- *     Return: 0 on success or negative error
- *
- * int bpf_skb_get_tunnel_key(skb, key, size, flags)
- * int bpf_skb_set_tunnel_key(skb, key, size, flags)
- *     retrieve or populate tunnel metadata
- *     @skb: pointer to skb
- *     @key: pointer to 'struct bpf_tunnel_key'
- *     @size: size of 'struct bpf_tunnel_key'
- *     @flags: room for future extensions
- *     Return: 0 on success or negative error
- *
- * u64 bpf_perf_event_read(map, flags)
- *     read perf event counter value
- *     @map: pointer to perf_event_array map
- *     @flags: index of event in the map or bitmask flags
- *     Return: value of perf event counter read or error code
- *
- * int bpf_redirect(ifindex, flags)
- *     redirect to another netdev
- *     @ifindex: ifindex of the net device
- *     @flags:
- *	  cls_bpf:
- *          bit 0 - if set, redirect to ingress instead of egress
- *          other bits - reserved
- *	  xdp_bpf:
- *	    all bits - reserved
- *     Return: cls_bpf: TC_ACT_REDIRECT on success or TC_ACT_SHOT on error
- *	       xdp_bfp: XDP_REDIRECT on success or XDP_ABORT on error
- * int bpf_redirect_map(map, key, flags)
- *     redirect to endpoint in map
- *     @map: pointer to dev map
- *     @key: index in map to lookup
- *     @flags: --
- *     Return: XDP_REDIRECT on success or XDP_ABORT on error
- *
- * u32 bpf_get_route_realm(skb)
- *     retrieve a dst's tclassid
- *     @skb: pointer to skb
- *     Return: realm if != 0
- *
- * int bpf_perf_event_output(ctx, map, flags, data, size)
- *     output perf raw sample
- *     @ctx: struct pt_regs*
- *     @map: pointer to perf_event_array map
- *     @flags: index of event in the map or bitmask flags
- *     @data: data on stack to be output as raw data
- *     @size: size of data
- *     Return: 0 on success or negative error
- *
- * int bpf_get_stackid(ctx, map, flags)
- *     walk user or kernel stack and return id
- *     @ctx: struct pt_regs*
- *     @map: pointer to stack_trace map
- *     @flags: bits 0-7 - numer of stack frames to skip
- *             bit 8 - collect user stack instead of kernel
- *             bit 9 - compare stacks by hash only
- *             bit 10 - if two different stacks hash into the same stackid
- *                      discard old
- *             other bits - reserved
- *     Return: >= 0 stackid on success or negative error
- *
- * s64 bpf_csum_diff(from, from_size, to, to_size, seed)
- *     calculate csum diff
- *     @from: raw from buffer
- *     @from_size: length of from buffer
- *     @to: raw to buffer
- *     @to_size: length of to buffer
- *     @seed: optional seed
- *     Return: csum result or negative error code
- *
- * int bpf_skb_get_tunnel_opt(skb, opt, size)
- *     retrieve tunnel options metadata
- *     @skb: pointer to skb
- *     @opt: pointer to raw tunnel option data
- *     @size: size of @opt
- *     Return: option size
- *
- * int bpf_skb_set_tunnel_opt(skb, opt, size)
- *     populate tunnel options metadata
- *     @skb: pointer to skb
- *     @opt: pointer to raw tunnel option data
- *     @size: size of @opt
- *     Return: 0 on success or negative error
- *
- * int bpf_skb_change_proto(skb, proto, flags)
- *     Change protocol of the skb. Currently supported is v4 -> v6,
- *     v6 -> v4 transitions. The helper will also resize the skb. eBPF
- *     program is expected to fill the new headers via skb_store_bytes
- *     and lX_csum_replace.
- *     @skb: pointer to skb
- *     @proto: new skb->protocol type
- *     @flags: reserved
- *     Return: 0 on success or negative error
- *
- * int bpf_skb_change_type(skb, type)
- *     Change packet type of skb.
- *     @skb: pointer to skb
- *     @type: new skb->pkt_type type
- *     Return: 0 on success or negative error
- *
- * int bpf_skb_under_cgroup(skb, map, index)
- *     Check cgroup2 membership of skb
- *     @skb: pointer to skb
- *     @map: pointer to bpf_map in BPF_MAP_TYPE_CGROUP_ARRAY type
- *     @index: index of the cgroup in the bpf_map
- *     Return:
- *       == 0 skb failed the cgroup2 descendant test
- *       == 1 skb succeeded the cgroup2 descendant test
- *        < 0 error
- *
- * u32 bpf_get_hash_recalc(skb)
- *     Retrieve and possibly recalculate skb->hash.
- *     @skb: pointer to skb
- *     Return: hash
+ * 	Return
+ * 		A 64-bit integer containing the current GID and UID, and
+ * 		created as such: *current_gid* **<< 32 \|** *current_uid*.
+ * 	For
+ * 		All tracing programs, as well as programs of types
+ * 		**BPF_PROG_TYPE_CGROUP_DEVICE**,
+ * 		**BPF_PROG_TYPE_CGROUP_SOCK**,
+ * 		**BPF_PROG_TYPE_SOCK_OPS**,
+ * 		**BPF_PROG_TYPE_CGROUP_SOCK_ADDR**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.2
+ *
+ * .. commit ffeedafbf023
+ *
+ * int bpf_get_current_comm(char *buf, u32 size_of_buf)
+ * 	Description
+ * 		Copy the **comm** attribute of the current task into *buf* of
+ * 		*size_of_buf*. The **comm** attribute contains the name of
+ * 		the executable (excluding the path) for the current task. The
+ * 		*size_of_buf* must be strictly positive. On success, the
+ * 		helper makes sure that the *buf* is NUL-terminated. On failure,
+ * 		it is filled with zeroes.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		*Tracing programs*.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.2
+ *
+ * .. commit ffeedafbf023
+ *
+ * u32 bpf_get_cgroup_classid(struct sk_buff *skb)
+ * 	Description
+ * 		Retrieve the classid for the current task, i.e. for the
+ * 		net_cls (network classifier) cgroup to which *skb* belongs.
+ * 	Return
+ * 		The classid, or 0 for the default unconfigured classid.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_IN**, **BPF_PROG_TYPE_LWT_OUT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.3
+ *
+ * .. commit 8d20aabe1c76
+ *
+ * int bpf_skb_vlan_push(struct sk_buff *skb, __be16 vlan_proto, u16 vlan_tci)
+ * 	Description
+ * 		Push a *vlan_tci* (VLAN tag control information) of protocol
+ * 		*vlan_proto* to the packet associated to *skb*, then update
+ * 		the checksum. Note that if *vlan_proto* is different from
+ * 		**ETH_P_8021Q** and **ETH_P_8021AD**, it is considered to
+ * 		be **ETH_P_8021Q**.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.3
+ *
+ * .. commit 4e10df9a60d9
+ *
+ * int bpf_skb_vlan_pop(struct sk_buff *skb)
+ * 	Description
+ * 		Pop a VLAN header from the packet associated to *skb*.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.3
+ *
+ * .. commit 4e10df9a60d9
+ *
+ * int bpf_skb_get_tunnel_key(struct sk_buff *skb, struct bpf_tunnel_key *key, u32 size, u64 flags)
+ * 	Description
+ * 		Get tunnel metadata. This helper takes a pointer *key* to an
+ * 		empty **struct bpf_tunnel_key** of **size**, that will be
+ * 		filled with tunnel metadata for the packet associated to *skb*.
+ * 		The *flags* can be set to **BPF_F_TUNINFO_IPV6**, which
+ * 		indicates that the tunnel is based on IPv6 protocol instead of
+ * 		IPv4.
+ *
+ * 		This is typically used on the receive path to perform a lookup
+ * 		or a packet redirection based on the value of *key*:
+ *
+ * 		::
+ *
+ * 			struct bpf_tunnel_key key = {};
+ * 			bpf_skb_get_tunnel_key(skb, &key, sizeof(key), 0);
+ * 			     lookup or redirect based on key ...
+ *
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.3
+ *
+ * .. commit d3aa45ce6b94
+ *
+ * int bpf_skb_set_tunnel_key(struct sk_buff *skb, struct bpf_tunnel_key *key, u32 size, u64 flags)
+ * 	Description
+ * 		Populate tunnel metadata for packet associated to *skb.* The
+ * 		tunnel metadata is set to the contents of *key*, of *size*. The
+ * 		*flags* can be set to a combination of the following values:
+ *
+ * 		**BPF_F_TUNINFO_IPV6**
+ * 			Indicate that the tunnel is based on IPv6 protocol
+ * 			instead of IPv4.
+ * 		**BPF_F_ZERO_CSUM_TX**
+ * 			For IPv4 packets, add a flag to tunnel metadata
+ * 			indicating that checksum computation should be skipped
+ * 			and checksum set to zeroes.
+ * 		**BPF_F_DONT_FRAGMENT**
+ * 			Add a flag to tunnel metadata indicating that the
+ * 			packet should not be fragmented.
+ * 		**BPF_F_SEQ_NUMBER**
+ * 			Add a flag to tunnel metadata indicating that a
+ * 			sequence number should be added to tunnel header before
+ * 			sending the packet. This flag was added for GRE
+ * 			encapsulation, but might be used with other protocols
+ * 			as well in the future.
+ *
+ * 		Here is a typical usage on the transmit path:
+ *
+ * 		::
+ *
+ * 			struct bpf_tunnel_key key;
+ * 			     populate key ...
+ * 			bpf_skb_set_tunnel_key(skb, &key, sizeof(key), 0);
+ * 			bpf_clone_redirect(skb, vxlan_dev_ifindex, 0);
+ *
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.3
+ *
+ * .. commit d3aa45ce6b94
+ *
+ * u64 bpf_perf_event_read(struct bpf_map *map, u64 flags)
+ * 	Description
+ * 		Read the value of a perf event counter. This helper relies on a
+ * 		*map* of type **BPF_MAP_TYPE_PERF_EVENT_ARRAY**. The
+ * 		nature of the perf event counter is selected at the creation of
+ * 		the *map*. The *map* is an array whose size is the number of
+ * 		available CPU cores, and each cell contains a value relative to
+ * 		one core. The value to retrieve is indicated by *flags*, that
+ * 		contains the index of the core to look up, masked with
+ * 		**BPF_F_INDEX_MASK**. Alternatively, *flags* can be set to
+ * 		**BPF_F_CURRENT_CPU** to indicate that the value for the
+ * 		current CPU core should be retrieved.
+ *
+ * 		Note that before Linux 4.13, only hardware perf event can be
+ * 		retrieved.
+ * 	Return
+ * 		The value of the perf event counter read from the map, or a
+ * 		negative error code in case of failure.
+ * 	For
+ * 		*Tracing programs*. Limited to maps of type
+ * 		**BPF_MAP_TYPE_PERF_EVENT_ARRAY**.
+ * 	GPL only
+ * 		Yes
+ * 	Since
+ * 		Linux 4.3
+ *
+ * .. commit 35578d798400
+ *
+ * int bpf_redirect(u32 ifindex, u64 flags)
+ * 	Description
+ * 		Redirect the packet to another net device of index *ifindex*.
+ * 		This helper is somewhat similar to **bpf_clone_redirect**\
+ * 		(), except that the packet is not cloned, which provides
+ * 		increased performance.
+ *
+ * 		For hooks other than XDP, *flags* can be set to
+ * 		**BPF_F_INGRESS**, which indicates the packet is to be
+ * 		redirected to the ingress interface instead of (by default)
+ * 		egress. Currently, XDP does not support any flag.
+ * 	Return
+ * 		For XDP, the helper returns **XDP_REDIRECT** on success or
+ * 		**XDP_ABORT** on error. For other program types, the values
+ * 		are **TC_ACT_REDIRECT** on success or **TC_ACT_SHOT** on
+ * 		error.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**,
+ * 		**BPF_PROG_TYPE_XDP**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.4 for most program types, but XDP support was only
+ * 		added in Linux 4.14.
+ *
+ * .. commit 27b29f63058d
+ *
+ * u32 bpf_get_route_realm(struct sk_buff *skb)
+ * 	Description
+ * 		Retrieve the realm or the route, that is to say the
+ * 		**tclassid** field of the destination for the *skb*.
+ * 	Return
+ * 		The realm of the route for the packet associated to *sdb*, or 0
+ * 		if none was found.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_IN**,
+ * 		**BPF_PROG_TYPE_LWT_OUT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.4
+ *
+ * .. commit c46646d0484f
+ *
+ * int bpf_perf_event_output(struct pt_reg *ctx, struct bpf_map *map, u64 flags, void *data, u64 size)
+ * 	Description
+ * 		Write perf raw sample into a perf event held by *map* of type
+ * 		**BPF_MAP_TYPE_PERF_EVENT_ARRAY**. This perf event must
+ * 		have the following attributes: **PERF_SAMPLE_RAW** as
+ * 		**sample_type**, **PERF_TYPE_SOFTWARE** as **type**, and
+ * 		**PERF_COUNT_SW_BPF_OUTPUT** as **config**.
+ *
+ * 		The *flags* are used to indicate the index in *map* for which
+ * 		the value must be put, masked with **BPF_F_INDEX_MASK**.
+ * 		Alternatively, *flags* can be set to **BPF_F_CURRENT_CPU**
+ * 		to indicate that the index of the current CPU core should be
+ * 		used.
+ *
+ * 		The value to write, of *size*, is passed through eBPF stack and
+ * 		pointed by *data*.
+ *
+ * 		The context of the program *ctx* needs also be passed to the
+ * 		helper, and will get interpreted as a pointer to a **struct
+ * 		pt_reg**.
+ *
+ * 		On user space, a program willing to read the values needs to
+ * 		call **perf_event_open**\ () on the perf event (either for
+ * 		one or for all CPUs) and to store the file descriptor into the
+ * 		*map*. This must be done before the eBPF program can send data
+ * 		into it. An example is available in file
+ * 		*samples/bpf/trace_output_user.c* in the Linux kernel source
+ * 		tree (the eBPF program counterpart is in
+ * 		*samples/bpf/trace_output_kern.c*). It looks like the
+ * 		following snippet:
+ *
+ * 		::
+ *
+ * 			volatile struct perf_event_mmap_page *header;
+ * 			struct perf_event_attr attr = {
+ * 			        .sample_type = PERF_SAMPLE_RAW,
+ * 			        .type = PERF_TYPE_SOFTWARE,
+ * 			        .config = PERF_COUNT_SW_BPF_OUTPUT,
+ * 			};
+ * 			int page_size;
+ * 			int mmap_size;
+ * 			int key = 0;
+ * 			int pmu_fd;
+ * 			void *base;
+ * 			
+ * 			if (load_bpf_file(filename))
+ * 			        return -1;
+ * 			
+ * 			pmu_fd = sys_perf_event_open(&attr,
+ * 			                             -1, // pid
+ * 			                              0, // cpu
+ * 			                             -1, // group_fd
+ * 			                              0);
+ * 			
+ * 			assert(pmu_fd >= 0);
+ * 			assert(bpf_map_update_elem(map_fd[0], &key,
+ * 			                           &pmu_fd, BPF_ANY) == 0);
+ * 			assert(ioctl(pmu_fd, PERF_EVENT_IOC_ENABLE, 0) == 0);
+ * 			
+ * 			page_size = getpagesize();
+ * 			mmap_size = page_size * (page_cnt + 1);
+ * 			
+ * 			base = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE,
+ * 			            MAP_SHARED, fd, 0);
+ * 			if (base == MAP_FAILED)
+ * 			        return -1;
+ * 			
+ * 			header = base;
+ *
+ * 		**bpf_perf_event_output**\ () achieves better performance
+ * 		than **bpf_trace_printk**\ () for sharing data with user
+ * 		space, and is much better suitable for streaming data from eBPF
+ * 		programs.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		*Tracing programs*, and programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_IN**,
+ * 		**BPF_PROG_TYPE_LWT_OUT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**,
+ * 		**BPF_PROG_TYPE_XDP**.
+ * 		Limited to maps of type **BPF_MAP_TYPE_PERF_EVENT_ARRAY**.
+ * 	GPL only
+ * 		Yes
+ * 	Since
+ * 		Linux 4.4
+ *
+ * .. commit a43eec304259
+ *
+ * int bpf_skb_load_bytes(const struct sk_buff *skb, u32 offset, void *to, u32 len)
+ * 	Description
+ * 		This helper was provided as an easy way to load data from a
+ * 		packet. It can be used to load *len* bytes from *offset* from
+ * 		the packet associated to *skb*, into the buffer pointed by
+ * 		*to*.
+ *
+ * 		Since Linux 4.7, this helper is deprecated in favor of
+ * 		"direct packet access", enabling packet data to be manipulated
+ * 		with *skb*\ **->data** and *skb*\ **->data_end** pointing
+ * 		respectively to the first byte of packet data and to the byte
+ * 		after the last byte of packet data.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SOCKET_FILTER**,
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_IN**,
+ * 		**BPF_PROG_TYPE_LWT_OUT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**,
+ * 		**BPF_PROG_TYPE_SK_SKB**,
+ * 		**BPF_PROG_TYPE_CGROUP_SKB**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.5
+ *
+ * .. commit 05c74e5e53f6
+ *
+ * int bpf_get_stackid(struct pt_reg *ctx, struct bpf_map *map, u64 flags)
+ * 	Description
+ * 		Walk a user or a kernel stack and return its id. To achieve
+ * 		this, the helper needs *ctx*, which is a pointer to the context
+ * 		on which the tracing program is executed, and a pointer to a
+ * 		*map* of type **BPF_MAP_TYPE_STACK_TRACE**.
+ *
+ * 		The last argument, *flags*, holds the number of stack frames to
+ * 		skip (from 0 to 255), masked with
+ * 		**BPF_F_SKIP_FIELD_MASK**. The next bits can be used to set
+ * 		a combination of the following flags:
+ *
+ * 		**BPF_F_USER_STACK**
+ * 			Collect a user space stack instead of a kernel stack.
+ * 		**BPF_F_FAST_STACK_CMP**
+ * 			Compare stacks by hash only.
+ * 		**BPF_F_REUSE_STACKID**
+ * 			If two different stacks hash into the same *stackid*,
+ * 			discard the old one.
+ *
+ * 		The stack id retrieved is a 32 bit long integer handle which
+ * 		can be further combined with other data (including other stack
+ * 		ids) and used as a key into maps. This can be useful for
+ * 		generating a variety of graphs (such as flame graphs or off-cpu
+ * 		graphs).
+ *
+ * 		For walking a stack, this helper is an improvement over
+ * 		**bpf_probe_read**\ (), which can be used with unrolled loops
+ * 		but is not efficient and consumes a lot of eBPF instructions.
+ * 		Instead, **bpf_get_stackid**\ () can collect up to
+ * 		**PERF_MAX_STACK_DEPTH** both kernel and user frames.
+ * 	Return
+ * 		The positive or null stack id on success, or a negative error
+ * 		in case of failure.
+ * 	For
+ * 		*Tracing programs*. Limited to maps of type
+ * 		**BPF_MAP_TYPE_STACK_TRACE**.
+ * 	GPL only
+ * 		Yes
+ * 	Since
+ * 		Linux 4.6
+ *
+ * .. commit d5a3b1f69186
+ *
+ * s64 bpf_csum_diff(__be32 *from, u32 from_size, __be32 *to, u32 to_size, __wsum seed)
+ * 	Description
+ * 		Compute a checksum difference, from the raw buffer pointed by
+ * 		*from*, of length *from_size* (that must be a multiple of 4),
+ * 		towards the raw buffer pointed by *to*, of size *to_size*
+ * 		(same remark). An optional *seed* can be added to the value.
+ *
+ * 		This is flexible enough to be used in several ways:
+ *
+ * 		* With *from_size* == 0, *to_size* > 0 and *seed* set to
+ * 		  checksum, it can be used when pushing new data.
+ * 		* With *from_size* > 0, *to_size* == 0 and *seed* set to
+ * 		  checksum, it can be used when removing data from a packet.
+ * 		* With *from_size* > 0, *to_size* > 0 and *seed* set to 0, it
+ * 		  can be used to compute a diff. Note that *from_size* and
+ * 		  *to_size* do not need to be equal.
+ * 	Return
+ * 		The checksum result, or a negative error code in case of
+ * 		failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_IN**,
+ * 		**BPF_PROG_TYPE_LWT_OUT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.6
+ *
+ * .. commit 7d672345ed29
+ *
+ * int bpf_skb_get_tunnel_opt(struct sk_buff *skb, u8 *opt, u32 size)
+ * 	Description
+ * 		Retrieve tunnel options metadata for the packet associated to
+ * 		*skb*, and store the raw tunnel option data to the buffer *opt*
+ * 		of *size*.
+ * 	Return
+ * 		The size of the option data retrieved.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.6
+ *
+ * .. commit 14ca0751c96f
+ *
+ * int bpf_skb_set_tunnel_opt(struct sk_buff *skb, u8 *opt, u32 size)
+ * 	Description
+ * 		Set tunnel options metadata for the packet associated to *skb*
+ * 		to the option data contained in the raw buffer *opt* of *size*.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.6
+ *
+ * .. commit 14ca0751c96f
+ *
+ * int bpf_skb_change_proto(struct sk_buff *skb, __be16 proto, u64 flags)
+ * 	Description
+ * 		Change the protocol of the *skb* to *proto*. Currently
+ * 		supported are transition from IPv4 to IPv6, and from IPv6 to
+ * 		IPv4. The helper takes care of the groundwork for the
+ * 		transition, including resizing the socket buffer. The eBPF
+ * 		program is expected to fill the new headers, if any, via
+ * 		**skb_store_bytes**\ () and to recompute the checksums with
+ * 		**bpf_l3_csum_replace**\ () and **bpf_l4_csum_replace**\
+ * 		().
+ *
+ * 		Internally, the GSO type is marked as dodgy so that headers are
+ * 		checked and segments are recalculated by the GSO/GRO engine.
+ * 		The size for GSO target is adapted as well.
+ *
+ * 		All values for *flags* are reserved for future usage, and must
+ * 		be left at zero.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.8
+ *
+ * .. commit 6578171a7ff0
+ *
+ * int bpf_skb_change_type(struct sk_buff *skb, u32 type)
+ * 	Description
+ * 		Change the packet type for the packet associated to *skb*. This
+ * 		comes down to setting *skb*\ **->pkt_type** to *type*, except
+ * 		the eBPF program does not have a write access to *skb*\
+ * 		**->pkt_type** beside this helper. Using a helper here allows
+ * 		for graceful handling of errors.
+ *
+ * 		The major use case is to change incoming *skb*s to
+ * 		**PACKET_HOST** in a programmatic way instead of having to
+ * 		recirculate via **redirect**\ (..., **BPF_F_INGRESS**), for
+ * 		example.
+ *
+ * 		Note that *type* only allows certain values. At this time, they
+ * 		are:
+ *
+ * 		**PACKET_HOST**
+ * 			Packet is for us.
+ * 		**PACKET_BROADCAST**
+ * 			Send packet to all.
+ * 		**PACKET_MULTICAST**
+ * 			Send packet to group.
+ * 		**PACKET_OTHERHOST**
+ * 			Send packet to someone else.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.8
+ *
+ * .. commit d2485c4242a82
+ *
+ * int bpf_skb_under_cgroup(struct sk_buff *skb, struct bpf_map *map, u32 index)
+ * 	Description
+ * 		Check whether *skb* is a descendant of the cgroup2 held by
+ * 		*map* of type **BPF_MAP_TYPE_CGROUP_ARRAY**, at *index*.
+ * 	Return
+ * 		The return value depends on the result of the test, and can be:
+ *
+ * 		* 0, if the *skb* failed the cgroup2 descendant test.
+ * 		* 1, if the *skb* succeeded the cgroup2 descendant test.
+ * 		* A negative error code, if an error occurred.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_IN**,
+ * 		**BPF_PROG_TYPE_LWT_OUT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**.
+ * 		Limited to maps of type **BPF_MAP_TYPE_CGROUP_ARRAY**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.8
+ *
+ * .. commit 4a482f34afcc
+ *
+ * u32 bpf_get_hash_recalc(struct sk_buff *skb)
+ * 	Description
+ * 		Retrieve the hash of the packet, *skb*\ **->hash**. If it is
+ * 		not set, in particular if the hash was cleared due to mangling,
+ * 		recompute this hash. Later accesses to the hash can be done
+ * 		directly with *skb*\ **->hash**.
+ *
+ * 		Calling **bpf_set_hash_invalid**\ (), changing a packet
+ * 		prototype with **bpf_skb_change_proto**\ (), or calling
+ * 		**bpf_skb_store_bytes**\ () with the
+ * 		**BPF_F_INVALIDATE_HASH** are actions susceptible to clear
+ * 		the hash and to trigger a new computation for the next call to
+ * 		**bpf_get_hash_recalc**\ ().
+ * 	Return
+ * 		The 32-bit hash.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_IN**,
+ * 		**BPF_PROG_TYPE_LWT_OUT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.8
+ *
+ * .. commit 13c5c240f789
  *
  * u64 bpf_get_current_task(void)
- *     Returns current task_struct
- *     Return: current
- *
- * int bpf_probe_write_user(void *dst, void *src, int len)
- *     safely attempt to write to a location
- *     @dst: destination address in userspace
- *     @src: source address on stack
- *     @len: number of bytes to copy
- *     Return: 0 on success or negative error
- *
- * int bpf_current_task_under_cgroup(map, index)
- *     Check cgroup2 membership of current task
- *     @map: pointer to bpf_map in BPF_MAP_TYPE_CGROUP_ARRAY type
- *     @index: index of the cgroup in the bpf_map
- *     Return:
- *       == 0 current failed the cgroup2 descendant test
- *       == 1 current succeeded the cgroup2 descendant test
- *        < 0 error
- *
- * int bpf_skb_change_tail(skb, len, flags)
- *     The helper will resize the skb to the given new size, to be used f.e.
- *     with control messages.
- *     @skb: pointer to skb
- *     @len: new skb length
- *     @flags: reserved
- *     Return: 0 on success or negative error
- *
- * int bpf_skb_pull_data(skb, len)
- *     The helper will pull in non-linear data in case the skb is non-linear
- *     and not all of len are part of the linear section. Only needed for
- *     read/write with direct packet access.
- *     @skb: pointer to skb
- *     @len: len to make read/writeable
- *     Return: 0 on success or negative error
- *
- * s64 bpf_csum_update(skb, csum)
- *     Adds csum into skb->csum in case of CHECKSUM_COMPLETE.
- *     @skb: pointer to skb
- *     @csum: csum to add
- *     Return: csum on success or negative error
- *
- * void bpf_set_hash_invalid(skb)
- *     Invalidate current skb->hash.
- *     @skb: pointer to skb
- *
- * int bpf_get_numa_node_id()
- *     Return: Id of current NUMA node.
- *
- * int bpf_skb_change_head()
- *     Grows headroom of skb and adjusts MAC header offset accordingly.
- *     Will extends/reallocae as required automatically.
- *     May change skb data pointer and will thus invalidate any check
- *     performed for direct packet access.
- *     @skb: pointer to skb
- *     @len: length of header to be pushed in front
- *     @flags: Flags (unused for now)
- *     Return: 0 on success or negative error
- *
- * int bpf_xdp_adjust_head(xdp_md, delta)
- *     Adjust the xdp_md.data by delta
- *     @xdp_md: pointer to xdp_md
- *     @delta: An positive/negative integer to be added to xdp_md.data
- *     Return: 0 on success or negative on error
+ * 	Return
+ * 		A pointer to the current task struct.
+ * 	For
+ * 		*Tracing programs*.
+ * 	GPL only
+ * 		Yes
+ * 	Since
+ * 		Linux 4.8
+ *
+ * .. commit 606274c5abd8
+ *
+ * int bpf_probe_write_user(void *dst, const void *src, u32 len)
+ * 	Description
+ * 		Attempt in a safe way to write *len* bytes from the buffer
+ * 		*src* to *dst* in memory. It only works for threads that are in
+ * 		user context.
+ *
+ * 		This helper should not be used to implement any kind of
+ * 		security mechanism because of TOC-TOU attacks, but rather to
+ * 		debug, divert, and manipulate execution of semi-cooperative
+ * 		processes.
+ *
+ * 		Keep in mind that this feature is meant for experiments, and it
+ * 		has a risk of crashing the system and running programs.
+ * 		Therefore, when an eBPF program using this helper is attached,
+ * 		a warning including PID and process name is printed to kernel
+ * 		logs.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		*Tracing programs*.
+ * 	GPL only
+ * 		Yes
+ * 	Since
+ * 		Linux 4.8
+ *
+ * .. commit 96ae52279594
+ *
+ * int bpf_current_task_under_cgroup(struct bpf_map *map, u32 index)
+ * 	Description
+ * 		Check whether the probe is being run is the context of a given
+ * 		subset of the cgroup2 hierarchy. The cgroup2 to test is held by
+ * 		*map* of type **BPF_MAP_TYPE_CGROUP_ARRAY**, at *index*.
+ * 	Return
+ * 		The return value depends on the result of the test, and can be:
+ *
+ * 		* 0, if the *skb* task belongs to the cgroup2.
+ * 		* 1, if the *skb* task does not belong to the cgroup2.
+ * 		* A negative error code, if an error occurred.
+ * 	For
+ * 		*Tracing programs*.
+ * 		Limited to maps of type **BPF_MAP_TYPE_CGROUP_ARRAY**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.9
+ *
+ * .. commit 60d20f9195b2
+ *
+ * int bpf_skb_change_tail(struct sk_buff *skb, u32 len, u64 flags)
+ * 	Description
+ * 		Resize (trim or grow) the packet associated to *skb* to the
+ * 		new *len*. The *flags* are reserved for future usage, and must
+ * 		be left at zero.
+ *
+ * 		The basic idea is that the helper performs the needed work to
+ * 		change the size of the packet, then the eBPF program rewrites
+ * 		the rest via helpers like **bpf_skb_store_bytes**\ (),
+ * 		**bpf_l3_csum_replace**\ (), **bpf_l3_csum_replace**\ ()
+ * 		and others. This helper is a slow path utility intended for
+ * 		replies with control messages. And because it is targeted for
+ * 		slow path, the helper itself can afford to be slow: it
+ * 		implicitly linearizes, unclones and drops offloads from the
+ * 		*skb*.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**,
+ * 		**BPF_PROG_TYPE_SK_SKB**,
+ * 		**BPF_PROG_TYPE_CGROUP_SKB**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.9
+ *
+ * .. commit 5293efe62df8
+ *
+ * int bpf_skb_pull_data(struct sk_buff *skb, u32 len)
+ * 	Description
+ * 		Pull in non-linear data in case the *skb* is non-linear and not
+ * 		all of *len* are part of the linear section. Make *len* bytes
+ * 		from *skb* readable and writable. If a zero value is passed for
+ * 		*len*, then the whole length of the *skb* is pulled.
+ *
+ * 		This helper is only needed for reading and writing with direct
+ * 		packet access.
+ *
+ * 		For direct packet access, when testing that offsets to access
+ * 		are within packet boundaries (test on *skb*\ **->data_end**)
+ * 		fails, programs just bail out, or, in the direct read case, use
+ * 		**bpf_skb_load_bytes()** as an alternative to overcome this
+ * 		limitation. If such data sits in non-linear parts, it is
+ * 		possible to pull them in once with the new helper, retest and
+ * 		eventually access them.
+ *
+ * 		At the same time, this also makes sure the skb is uncloned,
+ * 		which is a necessary condition for direct write. As this needs
+ * 		to be an invariant for the write part only, the verifier
+ * 		detects writes and adds a prologue that is calling
+ * 		**bpf_skb_pull_data()** to effectively unclone the skb from the
+ * 		very beginning in case it is indeed cloned.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_IN**, **BPF_PROG_TYPE_LWT_OUT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**,
+ * 		**BPF_PROG_TYPE_SK_SKB**,
+ * 		**BPF_PROG_TYPE_CGROUP_SKB**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.9
+ *
+ * .. commit 36bbef52c7eb
+ *
+ * s64 bpf_csum_update(struct sk_buff *skb, __wsum csum)
+ * 	Description
+ * 		Add the checksum *csum* into *skb*\ **->csum** in case the
+ * 		driver fed us an IP checksum. Return an error otherwise. This
+ * 		header is intended to be used in combination with
+ * 		**bpf_csum_diff()** helper, in particular when the checksum
+ * 		needs to be updated after data has been written into the packet
+ * 		through direct packet access.
+ * 	Return
+ * 		The checksum on success, or a negative error code in case of
+ * 		failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.9
+ *
+ * .. commit 36bbef52c7eb
+ *
+ * void bpf_set_hash_invalid(struct sk_buff *skb)
+ * 	Description
+ * 		Invalidate the current *skb*\ **->hash**. It can be used after
+ * 		mangling on headers through direct packet access, in order to
+ * 		indicate that the hash is outdated and to trigger a
+ * 		recalculation the next time the kernel tries to access this
+ * 		hash.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_LWT_XMIT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.9
+ *
+ * .. commit 7a4b28c6cc9f
+ *
+ * int bpf_get_numa_node_id(void)
+ * 	Description
+ * 		Return the id of the current NUMA node. The primary use case
+ * 		for this helper is the selection of sockets for the local NUMA
+ * 		node, when the program is attached to sockets using the
+ * 		**SO_ATTACH_REUSEPORT_EBPF** option (see also **socket(7)**).
+ * 	Return
+ * 		The id of current NUMA node.
+ * 	For
+ * 		All program types, except
+ * 		**BPF_PROG_TYPE_CGROUP_DEVICE**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.10
+ *
+ * .. commit 2d0e30c30f84
+ *
+ * int bpf_skb_change_head(struct sk_buff *skb, u32 len, u64 flags)
+ * 	Description
+ * 		Grows headroom of packet associated to *skb* and adjusts the
+ * 		offset of the MAC header accordingly, adding *len* bytes of
+ * 		space. It automatically extends and reallocates memory as
+ * 		required.
+ *
+ * 		This helper can be used on a layer 3 *skb* to push a MAC header
+ * 		for redirection into a layer 2 device.
+ *
+ * 		All values for *flags* are reserved for future usage, and must
+ * 		be left at zero.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_LWT_XMIT**,
+ * 		**BPF_PROG_TYPE_SK_SKB**,
+ * 		**BPF_PROG_TYPE_CGROUP_SKB**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.10
+ *
+ * .. commit 3a0af8fd61f9
+ *
+ * int bpf_xdp_adjust_head(struct xdp_buff *xdp_md, int delta)
+ * 	Description
+ * 		Adjust (move) *xdp_md*\ **->data** by *delta* bytes. Note that
+ * 		it is possible to use a negative value for *delta*. This helper
+ * 		can be used to prepare the packet for pushing or popping
+ * 		headers.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of type **BPF_PROG_TYPE_XDP**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.10
+ *
+ * .. commit 17bedab27231
  *
  * int bpf_probe_read_str(void *dst, int size, const void *unsafe_ptr)
- *     Copy a NUL terminated string from unsafe address. In case the string
- *     length is smaller than size, the target is not padded with further NUL
- *     bytes. In case the string length is larger than size, just count-1
- *     bytes are copied and the last byte is set to NUL.
- *     @dst: destination address
- *     @size: maximum number of bytes to copy, including the trailing NUL
- *     @unsafe_ptr: unsafe address
- *     Return:
- *       > 0 length of the string including the trailing NUL on success
- *       < 0 error
- *
- * u64 bpf_get_socket_cookie(skb)
- *     Get the cookie for the socket stored inside sk_buff.
- *     @skb: pointer to skb
- *     Return: 8 Bytes non-decreasing number on success or 0 if the socket
- *     field is missing inside sk_buff
- *
- * u32 bpf_get_socket_uid(skb)
- *     Get the owner uid of the socket stored inside sk_buff.
- *     @skb: pointer to skb
- *     Return: uid of the socket owner on success or overflowuid if failed.
- *
- * u32 bpf_set_hash(skb, hash)
- *     Set full skb->hash.
- *     @skb: pointer to skb
- *     @hash: hash to set
- *
- * int bpf_setsockopt(bpf_socket, level, optname, optval, optlen)
- *     Calls setsockopt. Not all opts are available, only those with
- *     integer optvals plus TCP_CONGESTION.
- *     Supported levels: SOL_SOCKET and IPPROTO_TCP
- *     @bpf_socket: pointer to bpf_socket
- *     @level: SOL_SOCKET or IPPROTO_TCP
- *     @optname: option name
- *     @optval: pointer to option value
- *     @optlen: length of optval in bytes
- *     Return: 0 or negative error
- *
- * int bpf_getsockopt(bpf_socket, level, optname, optval, optlen)
- *     Calls getsockopt. Not all opts are available.
- *     Supported levels: IPPROTO_TCP
- *     @bpf_socket: pointer to bpf_socket
- *     @level: IPPROTO_TCP
- *     @optname: option name
- *     @optval: pointer to option value
- *     @optlen: length of optval in bytes
- *     Return: 0 or negative error
- *
- * int bpf_sock_ops_cb_flags_set(bpf_sock_ops, flags)
- *     Set callback flags for sock_ops
- *     @bpf_sock_ops: pointer to bpf_sock_ops_kern struct
- *     @flags: flags value
- *     Return: 0 for no error
- *             -EINVAL if there is no full tcp socket
- *             bits in flags that are not supported by current kernel
- *
- * int bpf_skb_adjust_room(skb, len_diff, mode, flags)
- *     Grow or shrink room in sk_buff.
- *     @skb: pointer to skb
- *     @len_diff: (signed) amount of room to grow/shrink
- *     @mode: operation mode (enum bpf_adj_room_mode)
- *     @flags: reserved for future use
- *     Return: 0 on success or negative error code
- *
- * int bpf_sk_redirect_map(map, key, flags)
- *     Redirect skb to a sock in map using key as a lookup key for the
- *     sock in map.
- *     @map: pointer to sockmap
- *     @key: key to lookup sock in map
- *     @flags: reserved for future use
- *     Return: SK_PASS
- *
- * int bpf_sock_map_update(skops, map, key, flags)
- *	@skops: pointer to bpf_sock_ops
- *	@map: pointer to sockmap to update
- *	@key: key to insert/update sock in map
- *	@flags: same flags as map update elem
- *
- * int bpf_xdp_adjust_meta(xdp_md, delta)
- *     Adjust the xdp_md.data_meta by delta
- *     @xdp_md: pointer to xdp_md
- *     @delta: An positive/negative integer to be added to xdp_md.data_meta
- *     Return: 0 on success or negative on error
- *
- * int bpf_perf_event_read_value(map, flags, buf, buf_size)
- *     read perf event counter value and perf event enabled/running time
- *     @map: pointer to perf_event_array map
- *     @flags: index of event in the map or bitmask flags
- *     @buf: buf to fill
- *     @buf_size: size of the buf
- *     Return: 0 on success or negative error code
- *
- * int bpf_perf_prog_read_value(ctx, buf, buf_size)
- *     read perf prog attached perf event counter and enabled/running time
- *     @ctx: pointer to ctx
- *     @buf: buf to fill
- *     @buf_size: size of the buf
- *     Return : 0 on success or negative error code
- *
- * int bpf_override_return(pt_regs, rc)
- *	@pt_regs: pointer to struct pt_regs
- *	@rc: the return value to set
- *
- * int bpf_msg_redirect_map(map, key, flags)
- *     Redirect msg to a sock in map using key as a lookup key for the
- *     sock in map.
- *     @map: pointer to sockmap
- *     @key: key to lookup sock in map
- *     @flags: reserved for future use
- *     Return: SK_PASS
- *
- * int bpf_bind(ctx, addr, addr_len)
- *     Bind socket to address. Only binding to IP is supported, no port can be
- *     set in addr.
- *     @ctx: pointer to context of type bpf_sock_addr
- *     @addr: pointer to struct sockaddr to bind socket to
- *     @addr_len: length of sockaddr structure
- *     Return: 0 on success or negative error code
+ * 	Description
+ * 		Copy a NUL terminated string from an unsafe address
+ * 		*unsafe_ptr* to *dst*. The *size* should include the
+ * 		terminating NUL byte. In case the string length is smaller than
+ * 		*size*, the target is not padded with further NUL bytes. If the
+ * 		string length is larger than *size*, just *size*-1 bytes are
+ * 		copied and the last byte is set to NUL.
+ *
+ * 		On success, the length of the copied string is returned. This
+ * 		makes this helper useful in tracing programs for reading
+ * 		strings, and more importantly to get its length at runtime. See
+ * 		the following snippet:
+ *
+ * 		::
+ *
+ * 			SEC("kprobe/sys_open")
+ * 			void bpf_sys_open(struct pt_regs *ctx)
+ * 			{
+ * 			        char buf[PATHLEN]; // PATHLEN is defined to 256
+ * 			        int res = bpf_probe_read_str(buf, sizeof(buf),
+ * 				                             ctx->di);
+ *
+ * 				// Consume buf, for example push it to
+ * 				// userspace via bpf_perf_event_output(); we
+ * 				// can use res (the string length) as event
+ * 				// size, after checking its boundaries.
+ * 			}
+ *
+ * 		In comparison, using **bpf_probe_read()** helper here instead
+ * 		to read the string would require to estimate the length at
+ * 		compile time, and would often result in copying more memory
+ * 		than necessary.
+ *
+ * 		Another useful use case is when parsing individual process
+ * 		arguments or individual environment variables navigating
+ * 		*current*\ **->mm->arg_start** and *current*\
+ * 		**->mm->env_start**: using this helper and the return value,
+ * 		one can quickly iterate at the right offset of the memory area.
+ * 	Return
+ * 		On success, the strictly positive length of the string,
+ * 		including the trailing NUL character. On error, a negative
+ * 		value.
+ * 	For
+ * 		*Tracing programs*.
+ * 	GPL only
+ * 		Yes
+ * 	Since
+ * 		Linux 4.11
+ *
+ * .. commit a5e8c07059d0
+ *
+ * u64 bpf_get_socket_cookie(struct sk_buff *skb)
+ * 	Description
+ * 		Retrieve the socket cookie generated by the kernel from a
+ * 		**struct sk_buff** with a known socket. If none has been set
+ * 		yet, generate a new cookie. This helper can be useful for
+ * 		monitoring per socket networking traffic statistics as it
+ * 		provides a unique socket identifier per namespace.
+ * 	Return
+ * 		A 8-byte long non-decreasing number on success, or 0 if the
+ * 		socket field is missing inside *skb*.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SOCKET_FILTER**,
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_SK_SKB**,
+ * 		**BPF_PROG_TYPE_CGROUP_SKB**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.12
+ *
+ * .. commit 91b8270f2a4d
+ *
+ * u32 bpf_get_socket_uid(struct sk_buff *skb)
+ * 	Return
+ * 		The owner UID of the socket associated to *skb*. If the socket
+ * 		is **NULL**, or if it is not a full socket (i.e. if it is a
+ * 		time-wait or a request socket instead), **overflowuid** value
+ * 		is returned (note that **overflowuid** might also be the actual
+ * 		UID value for the socket).
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SOCKET_FILTER**,
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**,
+ * 		**BPF_PROG_TYPE_SK_SKB**,
+ * 		**BPF_PROG_TYPE_CGROUP_SKB**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.12
+ *
+ * .. commit 6acc5c291068
+ *
+ * u32 bpf_set_hash(struct sk_buff *skb, u32 hash)
+ * 	Description
+ * 		Set the full hash for *skb* (set the field *skb*\ **->hash**)
+ * 		to value *hash*.
+ * 	Return
+ * 		0
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.13
+ *
+ * .. commit ded092cd73c2c
+ *
+ * int bpf_setsockopt(struct bpf_sock_ops_kern *bpf_socket, int level, int optname, char *optval, int optlen)
+ * 	Description
+ * 		Emulate a call to **setsockopt()** on the socket associated to
+ * 		*bpf_socket*, which must be a full socket. The *level* at
+ * 		which the option resides and the name *optname* of the option
+ * 		must be specified, see **setsockopt(2)** for more information.
+ * 		The option value of length *optlen* is pointed by *optval*.
+ *
+ * 		This helper actually implements a subset of **setsockopt()**.
+ * 		It supports the following *level*\ s:
+ *
+ * 		* **SOL_SOCKET**, which supports the following *optname*\ s:
+ * 		  **SO_RCVBUF**, **SO_SNDBUF**, **SO_MAX_PACING_RATE**,
+ * 		  **SO_PRIORITY**, **SO_RCVLOWAT**, **SO_MARK**.
+ * 		* **IPPROTO_TCP**, which supports the following *optname*\ s:
+ * 		  **TCP_CONGESTION**, **TCP_BPF_IW**,
+ * 		  **TCP_BPF_SNDCWND_CLAMP**.
+ * 		* **IPPROTO_IP**, which supports *optname* **IP_TOS**.
+ * 		* **IPPROTO_IPV6**, which supports *optname* **IPV6_TCLASS**.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SOCK_OPS**,
+ * 		**BPF_PROG_TYPE_CGROUP_SOCK**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.13
+ *
+ * .. commit 8c4b4c7e9ff04
+ *
+ * int bpf_skb_adjust_room(struct sk_buff *skb, u32 len_diff, u32 mode, u64 flags)
+ * 	Description
+ * 		Grow or shrink the room for data in the packet associated to
+ * 		*skb* by *len_diff*, and according to the selected *mode*.
+ *
+ * 		There is a single supported mode at this time:
+ *
+ * 		* **BPF_ADJ_ROOM_NET**: Adjust room at the network layer
+ * 		  (room space is added or removed below the layer 3 header).
+ *
+ * 		All values for *flags* are reserved for future usage, and must
+ * 		be left at zero.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SCHED_CLS**,
+ * 		**BPF_PROG_TYPE_SCHED_ACT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.13
+ *
+ * .. commit 2be7e212d541
+ *
+ * int bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
+ * 	Description
+ * 		Redirect the packet to the endpoint referenced by *map* at
+ * 		index *key*. Depending on its type, his *map* can contain
+ * 		references to net devices (for forwarding packets through other
+ * 		ports), or to CPUs (for redirecting XDP frames to another CPU;
+ * 		but this is not fully implemented as of this writing).
+ *
+ * 		All values for *flags* are reserved for future usage, and must
+ * 		be left at zero.
+ * 	Return
+ * 		**XDP_REDIRECT** on success, or **XDP_ABORT** on error.
+ * 	For
+ * 		Programs of type **BPF_PROG_TYPE_XDP**.
+ * 		Limited to maps of types
+ * 		**BPF_MAP_TYPE_DEVMAP** and
+ * 		**BPF_MAP_TYPE_CPUMAP**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.14
+ *
+ * .. commit 97f91a7cf04ff
+ *
+ * int bpf_sk_redirect_map(struct bpf_map *map, u32 key, u64 flags)
+ * 	Description
+ * 		Redirect the packet to the socket referenced by *map* (of type
+ * 		**BPF_MAP_TYPE_SOCKMAP**) at index *key*. The only flag
+ * 		supported for now is **BPF_F_INGRESS**, which indicates the
+ * 		packet is to be redirected to the ingress side of the socket
+ * 		instead of (by default) egress.
+ *
+ * 		All values for *flags* are reserved for future usage, and must
+ * 		be left at zero.
+ * 	Return
+ * 		**SK_PASS** on success, or **SK_DROP** on error.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SK_SKB**,
+ * 		**BPF_PROG_TYPE_CGROUP_SKB**.
+ * 		Limited to maps of type **BPF_MAP_TYPE_SOCKMAP**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.14
+ *
+ * .. commit 174a79ff9515
+ *
+ * int bpf_sock_map_update(struct bpf_sock_ops_kern *skops, struct bpf_map *map, void *key, u64 flags)
+ * 	Description
+ * 		Add an entry to, or update a *map* referencing sockets. The
+ * 		*skops* is used as a new value for the entry associated to
+ * 		*key*. *flags* is one of:
+ *
+ * 		**BPF_NOEXIST**
+ * 			The entry for *key* must not exist in the map.
+ * 		**BPF_EXIST**
+ * 			The entry for *key* must already exist in the map.
+ * 		**BPF_ANY**
+ * 			No condition on the existence of the entry for *key*.
+ *
+ * 		If the *map* has eBPF programs (parser and verdict), those will
+ * 		be inherited by the socket being added. If the socket is
+ * 		already attached to eBPF programs, this results in an error.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SOCK_OPS**,
+ * 		**BPF_PROG_TYPE_CGROUP_SOCK**.
+ * 		Limited to maps of type **BPF_MAP_TYPE_SOCKMAP**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.14
+ *
+ * .. commit 174a79ff9515
+ *
+ * int bpf_xdp_adjust_meta(struct xdp_buff *xdp_md, int delta)
+ * 	Description
+ * 		Adjust the address pointed by *xdp_md*\ **->data_meta** by
+ * 		*delta* (which can be positive or negative). Note that this
+ * 		operation modifies the address stored in *xdp_md*\ **->data**,
+ * 		so the latter must be loaded only after the helper has been
+ * 		called.
+ *
+ * 		The use of *xdp_md*\ **->data_meta** is optional and programs
+ * 		are not required to use it. The rationale is that when the
+ * 		packet is processed with XDP (e.g. as DoS filter), it is
+ * 		possible to push further meta data along with it before passing
+ * 		to the stack, and to give the guarantee that an ingress eBPF
+ * 		program attached as a TC classifier on the same device can pick
+ * 		this up for further post-processing. Since TC works with socket
+ * 		buffers, it remains possible to set from XDP the **mark** or
+ * 		**priority** pointers, or other pointers for the socket buffer.
+ * 		Having this scratch space generic and programmable allows for
+ * 		more flexibility as the user is free to store whatever meta
+ * 		data they need.
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of type **BPF_PROG_TYPE_XDP**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.15
+ *
+ * .. commit 908432ca84fc
+ *
+ * int bpf_perf_event_read_value(struct bpf_map *map, u64 flags, struct bpf_perf_event_value *buf, u32 buf_size)
+ * 	Description
+ * 		Read the value of a perf event counter, and store it into *buf*
+ * 		of size *buf_size*. This helper relies on a *map* of type
+ * 		**BPF_MAP_TYPE_PERF_EVENT_ARRAY**. The nature of the perf
+ * 		event counter is selected at the creation of the *map*. The
+ * 		*map* is an array whose size is the number of available CPU
+ * 		cores, and each cell contains a value relative to one core. The
+ * 		value to retrieve is indicated by *flags*, that contains the
+ * 		index of the core to look up, masked with
+ * 		**BPF_F_INDEX_MASK**. Alternatively, *flags* can be set to
+ * 		**BPF_F_CURRENT_CPU** to indicate that the value for the
+ * 		current CPU core should be retrieved.
+ *
+ * 		This helper behaves in a way close to
+ * 		**bpf_perf_event_read**\ () helper, save that instead of
+ * 		just returning the value observed, it fills the *buf*
+ * 		structure. This allows for additional data to be retrieved: in
+ * 		particular, the enabled and running times (in *buf*\
+ * 		**->enabled** and *buf*\ **->running**, respectively) are
+ * 		copied.
+ *
+ * 		These values are interesting, because hardware PMU (Performance
+ * 		Monitoring Unit) counters are limited resources. When there are
+ * 		more PMU based perf events opened than available counters,
+ * 		kernel will multiplex these events so each event gets certain
+ * 		percentage (but not all) of the PMU time. In case that
+ * 		multiplexing happens, the number of samples or counter value
+ * 		will not reflect the case compared to when no multiplexing
+ * 		occurs. This makes comparison between different runs difficult.
+ * 		Typically, the counter value should be normalized before
+ * 		comparing to other experiments. The usual normalization is done
+ * 		as follows.
+ *
+ * 		::
+ *
+ * 			normalized_counter = counter * t_enabled / t_running
+ *
+ * 		Where t_enabled is the time enabled for event and t_running is
+ * 		the time running for event since last normalization. The
+ * 		enabled and running times are accumulated since the perf event
+ * 		open. To achieve scaling factor between two invocations of an
+ * 		eBPF program, users can can use CPU id as the key (which is
+ * 		typical for perf array usage model) to remember the previous
+ * 		value and do the calculation inside the eBPF program.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of type **BPF_PROG_TYPE_KPROBE**.
+ * 		Limited to maps of type **BPF_MAP_TYPE_PERF_EVENT_ARRAY**.
+ * 	GPL only
+ * 		Yes
+ * 	Since
+ * 		Linux 4.15
+ *
+ * .. commit 4bebdc7a85aa4
+ *
+ * int bpf_perf_prog_read_value(struct bpf_perf_event_data_kern *ctx, struct bpf_perf_event_value *buf, u32 buf_size)
+ * 	Description
+ * 		For en eBPF program attached to a perf event, retrieve the
+ * 		value of the event counter associated to *ctx* and store it in
+ * 		the structure pointed by *buf* and of size *buf_size*. Enabled
+ * 		and running times are also stored in the structure (see
+ * 		description of helper **bpf_perf_event_read_value**\ () for
+ * 		more details).
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of type **BPF_PROG_TYPE_PERF_EVENT**.
+ * 	GPL only
+ * 		Yes
+ * 	Since
+ * 		Linux 4.15
+ *
+ * .. commit cd86d1fd21025
+ *
+ * int bpf_getsockopt(struct bpf_sock_ops_kern *bpf_socket, int level, int optname, char *optval, int optlen)
+ * 	Description
+ * 		Emulate a call to **getsockopt()** on the socket associated to
+ * 		*bpf_socket*, which must be a full socket. The *level* at
+ * 		which the option resides and the name *optname* of the option
+ * 		must be specified, see **getsockopt(2)** for more information.
+ * 		The retrieved value is stored in the structure pointed by
+ * 		*opval* and of length *optlen*.
+ *
+ * 		This helper actually implements a subset of **getsockopt()**.
+ * 		It supports the following *level*\ s:
+ *
+ * 		* **IPPROTO_TCP**, which supports *optname*
+ * 		  **TCP_CONGESTION**.
+ * 		* **IPPROTO_IP**, which supports *optname* **IP_TOS**.
+ * 		* **IPPROTO_IPV6**, which supports *optname* **IPV6_TCLASS**.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of types
+ * 		**BPF_PROG_TYPE_SOCK_OPS**,
+ * 		**BPF_PROG_TYPE_CGROUP_SOCK**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.15
+ *
+ * .. commit f3edacbd697f9
+ *
+ * int bpf_override_return(struct pt_reg *regs, u64 rc)
+ * 	Description
+ * 		Used for error injection, this helper uses kprobes to override
+ * 		the return value of the probed function, and to set it to *rc*.
+ * 		The first argument is the context *regs* on which the kprobe
+ * 		works.
+ *
+ * 		This helper works by setting setting the PC (program counter)
+ * 		to an override function which is run in place of the original
+ * 		probed function. This means the probed function is not run at
+ * 		all. The replacement function just returns with the required
+ * 		value.
+ *
+ * 		This helper has security implications, and thus is subject to
+ * 		restrictions. It is only available if the kernel was compiled
+ * 		with the **CONFIG_BPF_KPROBE_OVERRIDE** configuration
+ * 		option, and in this case it only works on functions tagged with
+ * 		**ALLOW_ERROR_INJECTION** in the kernel code.
+ *
+ * 		Also, the helper is only available for the architectures having
+ * 		the CONFIG_FUNCTION_ERROR_INJECTION option. As of this writing,
+ * 		x86 architecture is the only one to support this feature.
+ * 	Return
+ * 		0
+ * 	For
+ * 		Programs of type **BPF_PROG_TYPE_KPROBE**.
+ * 	GPL only
+ * 		Yes
+ * 	Since
+ * 		Linux 4.16
+ *
+ * .. commit 9802d86585db9
+ *
+ * int bpf_sock_ops_cb_flags_set(struct bpf_sock_ops_kern *bpf_sock, int argval)
+ * 	Description
+ * 		Attempt to set the value of the **bpf_sock_ops_cb_flags** field
+ * 		for the full TCP socket associated to *bpf_sock_ops* to
+ * 		*argval*.
+ *
+ * 		The primary use of this field is to determine if there should
+ * 		be calls to eBPF programs of type
+ * 		**BPF_PROG_TYPE_SOCK_OPS** at various points in the TCP
+ * 		code. A program of the same type can change its value, per
+ * 		connection and as necessary, when the connection is
+ * 		established. This field is directly accessible for reading, but
+ * 		this helper must be used for updates in order to return an
+ * 		error if an eBPF program tries to set a callback that is not
+ * 		supported in the current kernel.
+ *
+ * 		The supported callback values that *argval* can combine are:
+ *
+ * 		* **BPF_SOCK_OPS_RTO_CB_FLAG** (retransmission time out)
+ * 		* **BPF_SOCK_OPS_RETRANS_CB_FLAG** (retransmission)
+ * 		* **BPF_SOCK_OPS_STATE_CB_FLAG** (TCP state change)
+ *
+ * 		Here are some examples of where one could call such eBPF
+ * 		program:
+ *
+ * 		* When RTO fires.
+ * 		* When a packet is retransmitted.
+ * 		* When the connection terminates.
+ * 		* When a packet is sent.
+ * 		* When a packet is received.
+ * 	Return
+ * 		Code **-EINVAL** if the socket is not a full TCP socket;
+ * 		otherwise, a positive number containing the bits that could not
+ * 		be set is returned (which comes down to 0 if all bits were set
+ * 		as required).
+ * 	For
+ * 		Programs of types **BPF_PROG_TYPE_SOCK_OPS**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.16
+ *
+ * .. commit b13d880721729
+ *
+ * int bpf_msg_redirect_map(struct sk_msg_buff *msg, struct bpf_map *map, u32 key, u64 flags)
+ * 	Description
+ * 		This helper is used in programs implementing policies at the
+ * 		socket level. If the message *msg* is allowed to pass (i.e. if
+ * 		the verdict eBPF program returns **SK_PASS**), redirect it to
+ * 		the socket referenced by *map* (of type
+ * 		**BPF_MAP_TYPE_SOCKMAP**) at index *key*. The only flag
+ * 		supported for now is **BPF_F_INGRESS**, which indicates the
+ * 		packet is to be redirected to the ingress side of the socket
+ * 		instead of (by default) egress.
+ * 	Return
+ * 		**SK_PASS** on success, or **SK_DROP** on error.
+ * 	For
+ * 		Programs of type **BPF_PROG_TYPE_SK_MSG**.
+ * 		Limited to maps of type **BPF_MAP_TYPE_SOCKMAP**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.17
+ *
+ * .. commit 4f738adba30a7
+ *
+ * int bpf_msg_apply_bytes(struct sk_msg_buff *msg, u32 bytes)
+ * 	Description
+ * 		For socket policies, apply the verdict of the eBPF program to
+ * 		the next *bytes* (number of bytes) of message *msg*.
+ *
+ * 		For example, this helper can be used in the following cases:
+ *
+ * 		* A single **sendmsg**\ () or **sendfile**\ () system call
+ * 		  contains multiple logical messages that the eBPF program is
+ * 		  supposed to read and for which it should apply a verdict.
+ * 		* An eBPF program only cares to read the first *bytes* of a
+ * 		  *msg*. If the message has a large payload, then setting up
+ * 		  and calling the eBPF program repeatedly for all bytes, even
+ * 		  though the verdict is already known, would create unnecessary
+ * 		  overhead.
+ *
+ * 		When called from within an eBPF program, the helper sets a
+ * 		counter internal to the BPF infrastructure, that is used to
+ * 		apply the last verdict to the next *bytes*. If *bytes* is
+ * 		smaller than the current data being processed from a
+ * 		**sendmsg**\ () or **sendfile**\ () system call, the first
+ * 		*bytes* will be sent and the eBPF program will be re-run with
+ * 		the pointer for start of data pointing to byte number *bytes*
+ * 		**+ 1**. If *bytes* is larger than the current data being
+ * 		processed, then the eBPF verdict will be applied to multiple
+ * 		**sendmsg**\ () or **sendfile**\ () calls until *bytes* are
+ * 		consumed.
+ *
+ * 		Note that if a socket closes with the internal counter holding
+ * 		a non-zero value, this is not a problem because data is not
+ * 		being buffered for *bytes* and is sent as it is received.
+ * 	Return
+ * 		0
+ * 	For
+ * 		Programs of type **BPF_PROG_TYPE_SK_MSG**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.17
+ *
+ * .. commit 2a100317c9ebc
+ *
+ * int bpf_msg_cork_bytes(struct sk_msg_buff *msg, u32 bytes)
+ * 	Description
+ * 		For socket policies, prevent the execution of the verdict eBPF
+ * 		program for message *msg* until *bytes* (byte number) have been
+ * 		accumulated.
+ *
+ * 		This can be used when one needs a specific number of bytes
+ * 		before a verdict can be assigned, even if the data spans
+ * 		multiple **sendmsg**\ () or **sendfile**\ () calls. The extreme
+ * 		case would be a user calling **sendmsg**\ () repeatedly with
+ * 		1-byte long message segments. Obviously, this is bad for
+ * 		performance, but it is still valid. If the eBPF program needs
+ * 		*bytes* bytes to validate a header, this helper can be used to
+ * 		prevent the eBPF program to be called again until *bytes* have
+ * 		been accumulated.
+ * 	Return
+ * 		0
+ * 	For
+ * 		Programs of type **BPF_PROG_TYPE_SK_MSG**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.17
+ *
+ * .. commit 91843d540a139
+ *
+ * int bpf_msg_pull_data(struct sk_msg_buff *msg, u32 start, u32 end, u64 flags)
+ * 	Description
+ * 		For socket policies, pull in non-linear data from user space
+ * 		for *msg* and set pointers *msg*\ **->data** and *msg*\
+ * 		**->data_end** to *start* and *end* bytes offsets into *msg*,
+ * 		respectively.
+ *
+ * 		If a program of type **BPF_PROG_TYPE_SK_MSG** is run on a
+ * 		*msg* it can only parse data that the (**data**, **data_end**)
+ * 		pointers have already consumed. For **sendmsg**\ () hooks this
+ * 		is likely the first scatterlist element. But for calls relying
+ * 		on the **sendpage** handler (e.g. **sendfile**\ ()) this will
+ * 		be the range (**0**, **0**) because the data is shared with
+ * 		user space and by default the objective is to avoid allowing
+ * 		user space to modify data while (or after) eBPF verdict is
+ * 		being decided. This helper can be used to pull in data and to
+ * 		set the start and end pointer to given values. Data will be
+ * 		copied if necessary (i.e. if data was not linear and if start
+ * 		and end pointers do not point to the same chunk).
+ *
+ * 		A call to this helper is susceptible to change data from the
+ * 		packet. Therefore, at load time, all checks on pointers
+ * 		previously done by the verifier are invalidated and must be
+ * 		performed again.
+ *
+ * 		All values for *flags* are reserved for future usage, and must
+ * 		be left at zero.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of type **BPF_PROG_TYPE_SK_MSG**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.17
+ *
+ * .. commit 015632bb30daa
+ *
+ * int bpf_bind(struct bpf_sock_addr_kern *ctx, struct sockaddr *addr, int addr_len)
+ * 	Description
+ * 		Bind the socket associated to *ctx* to the address pointed by
+ * 		*addr*, of length *addr_len*. This allows for making outgoing
+ * 		connection from the desired IP address, which can be useful for
+ * 		example when all processes inside a cgroup should use one
+ * 		single IP address on a host that has multiple IP configured.
+ *
+ * 		This helper works for IPv4 and IPv6, TCP and UDP sockets. The
+ * 		domain (*addr*\ **->sa_family**) must be **AF_INET** (or
+ * 		**AF_INET6**). Looking for a free port to bind to can be
+ * 		expensive, therefore binding to port is not permitted by the
+ * 		helper: *addr*\ **->sin_port** (or **sin6_port**, respectively)
+ * 		must be set to zero.
+ *
+ * 		As for the remote end, both parts of it can be overridden,
+ * 		remote IP and remote port. This can be useful if an application
+ * 		inside a cgroup wants to connect to another application inside
+ * 		the same cgroup or to itself, but knows nothing about the IP
+ * 		address assigned to the cgroup.
+ * 	Return
+ * 		0 on success, or a negative error in case of failure.
+ * 	For
+ * 		Programs of type **BPF_PROG_TYPE_CGROUP_SOCK_ADDR**.
+ * 		The attach type of the programs must be
+ * 		**BPF_CGROUP_INET4_CONNECT** or
+ * 		**BPF_CGROUP_INET6_CONNECT**.
+ * 	GPL only
+ * 		No
+ * 	Since
+ * 		Linux 4.17
+ *
+ * .. commit d74bad4e74ee3
  */
 #define __BPF_FUNC_MAPPER(FN)		\
 	FN(unspec),			\
diff --git a/scripts/bpf_helpers_doc.py b/scripts/bpf_helpers_doc.py
new file mode 100755
index 000000000000..aed59793a9b9
--- /dev/null
+++ b/scripts/bpf_helpers_doc.py
@@ -0,0 +1,568 @@
+#!/usr/bin/python3
+#
+# Copyright (C) 2018 Netronome Systems, Inc.
+#
+# This software is licensed under the GNU General License Version 2,
+# June 1991 as shown in the file COPYING in the top-level directory of this
+# source tree.
+#
+# THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS"
+# WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
+# BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+# FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE
+# OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME
+# THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+# In case user attempts to run with Python 2.
+from __future__ import print_function
+
+import argparse
+import re
+import sys, os
+
+class NoHelperFound(BaseException):
+    pass
+
+class ParsingError(BaseException):
+    def __init__(self, line='<line not provided>', reader=None):
+        if reader:
+            BaseException.__init__(self,
+                                   'Error at file offset %d, parsing line: %s' %
+                                   (reader.tell(), line))
+        else:
+            BaseException.__init__(self, 'Error parsing line: %s' % line)
+
+class Helper(object):
+    """
+    An object representing the description of an eBPF helper function.
+    @proto: function prototype of the helper function
+    @desc: textual description of the helper function
+    @ret: description of the return value of the helper function
+    @progtype: listing of the eBPF program types compatible with the helper
+    @gpl: attribute telling if this helper is only compatible with GPL programs
+    @since: Linux kernel version in which this helper was introduced
+    @commit: commit that introduced this helper in the source
+    """
+    def __init__(self, proto='', desc='', ret='', progtype='', gpl='',
+                 since='', commit=''):
+        self.proto = proto
+        self.desc = desc
+        self.ret = ret
+        self.progtype = progtype
+        self.gpl = gpl
+        self.since = since
+        self.commit = commit
+
+    def proto_break_down(self):
+        """
+        Break down helper function protocol into smaller chunks: return type,
+        name, distincts arguments.
+        """
+        arg_re = re.compile('^((const )?(struct )?(\w+|...))( (\**)(\w+))?$')
+        res = {}
+        proto_re = re.compile('^(.+) (\**)(\w+)\(((([^,]+)(, )?){1,5})\)$')
+
+        capture = proto_re.match(self.proto)
+        res['ret_type'] = capture.group(1)
+        res['ret_star'] = capture.group(2)
+        res['name']     = capture.group(3)
+        res['args'] = []
+
+        args    = capture.group(4).split(', ')
+        for a in args:
+            capture = arg_re.match(a)
+            res['args'].append({
+                'type' : capture.group(1),
+                'star' : capture.group(6),
+                'name' : capture.group(7)
+            })
+
+        return res
+
+class HeaderParser(object):
+    """
+    An object used to parse a file in order to extract the documentation of a
+    list of eBPF helper functions. All the helpers that can be retrieved are
+    stored as Helper object, in the self.helpers() array.
+    @filename: name of file to parse, usually include/uapi/linux/bpf.h in the
+               kernel tree
+    """
+    def __init__(self, filename):
+        self.reader = open(filename, 'r')
+        self.line = ''
+        self.helpers = []
+
+    def parse_helper(self):
+        proto    = self.parse_proto()
+        desc     = self.parse_desc()
+        ret      = self.parse_ret()
+        progtype = self.parse_progtype()
+        gpl      = self.parse_gpl()
+        since    = self.parse_since()
+        commit   = self.parse_commit()
+        return Helper(proto=proto, desc=desc, ret=ret, progtype=progtype,
+                      gpl=gpl, since=since, commit=commit)
+
+    def parse_proto(self):
+        # Argument can be of shape:
+        #   - "void"
+        #   - "type  name"
+        #   - "type *name"
+        #   - Same as above, with "const" and/or "struct" in front of type
+        #   - "..." (undefined number of arguments, for bpf_trace_printk())
+        # There is at least one term ("void"), and at most five arguments.
+        p = re.compile('^ \* ((.+) \**\w+\((((const )?(struct )?(\w+|\.\.\.)( \**\w+)?)(, )?){1,5}\))$')
+        capture = p.match(self.line)
+        if not capture:
+            raise NoHelperFound
+        self.line = self.reader.readline()
+        return capture.group(1)
+
+    def parse_desc(self):
+        p = re.compile('^ \* \tDescription$')
+        capture = p.match(self.line)
+        if not capture:
+            # Helper can have empty description and we might be parsing another
+            # attribute: return but do not consume.
+            return ''
+        # Description can be several lines, some of them possibly empty, and it
+        # stops when another subsection title is met.
+        desc = ''
+        while True:
+            self.line = self.reader.readline()
+            if self.line == ' *\n':
+                desc += '\n'
+            else:
+                p = re.compile('^ \* \t\t(.*)')
+                capture = p.match(self.line)
+                if capture:
+                    desc += capture.group(1) + '\n'
+                else:
+                    break
+        return desc
+
+    def parse_ret(self):
+        p = re.compile('^ \* \tReturn$')
+        capture = p.match(self.line)
+        if not capture:
+            # Helper can have empty retval and we might be parsing another
+            # attribute: return but do not consume.
+            return ''
+        # Return value description can be several lines, some of them possibly
+        # empty, and it stops when another subsection title is met.
+        ret = ''
+        while True:
+            self.line = self.reader.readline()
+            if self.line == ' *\n':
+                ret += '\n'
+            else:
+                p = re.compile('^ \* \t\t(.*)')
+                capture = p.match(self.line)
+                if capture:
+                    ret += capture.group(1) + '\n'
+                else:
+                    break
+        return ret
+
+    def parse_progtype(self):
+        p = re.compile('^ \* \tFor$')
+        capture = p.match(self.line)
+        if not capture:
+            raise ParsingError(self.line, self.reader)
+        # List of supported program types can be several lines, and it stops
+        # when another subsection title is met.
+        progtype = ''
+        while True:
+            self.line = self.reader.readline()
+            if self.line == ' *\n':
+                progtype += '\n'
+            else:
+                p = re.compile('^ \* \t\t(.*)')
+                capture = p.match(self.line)
+                if capture:
+                    progtype += capture.group(1) + '\n'
+                else:
+                    break
+        return progtype
+
+    def parse_gpl(self):
+        p = re.compile('^ \* \tGPL only$')
+        capture = p.match(self.line)
+        if not capture:
+            raise ParsingError(self.line, self.reader)
+        # GPL info is "Yes" or "No".
+        self.line = self.reader.readline()
+        p = re.compile('^ \* \t\t(Yes|No)$')
+        capture = p.match(self.line)
+        if not capture:
+            raise ParsingError(self.line, self.reader)
+        self.line = self.reader.readline()
+        return capture.group(1)
+
+    def parse_since(self):
+        p = re.compile('^ \* \tSince$')
+        capture = p.match(self.line)
+        if not capture:
+            raise ParsingError(self.line, self.reader)
+        # Minimal kernel version is usually just "Linux Major.minor"...
+        self.line = self.reader.readline()
+        p = re.compile('^ \* \t\tLinux ([0-9.]+)$')
+        capture = p.match(self.line)
+        if capture:
+            since = capture.group(1)
+            self.line = self.reader.readline()
+            self.line = self.reader.readline()
+        # ... But there are exceptions, spanning on several lines.
+        else:
+            since = ''
+            while True:
+                if self.line == ' *\n':
+                    since += '\n'
+                else:
+                    p = re.compile('^ \* \t\t(.*)')
+                    capture = p.match(self.line)
+                    if capture:
+                        since += capture.group(1) + '\n'
+                    else:
+                        break
+                self.line = self.reader.readline()
+        if not since:
+            raise ParsingError(self.line, self.reader)
+        return since
+
+    def parse_commit(self):
+        # Commit is a in a RST comment.
+        p = re.compile('^ \* .. commit ([a-f0-9]+)$')
+        capture = p.match(self.line)
+        if not capture:
+            raise ParsingError(self.line, self.reader)
+        self.line = self.reader.readline()
+        self.line = self.reader.readline()
+        return capture.group(1)
+
+    def run(self):
+        # Advance to start of helper function descriptions.
+        offset = self.reader.read().find('/* BPF helper function descriptions:')
+        if offset == -1:
+            raise Exception('Could not find start of eBPF helper descriptions list')
+        self.reader.seek(offset)
+        self.reader.readline()
+        self.reader.readline()
+        self.line = self.reader.readline()
+
+        while True:
+            try:
+                helper = self.parse_helper()
+                self.helpers.append(helper)
+            except NoHelperFound:
+                break
+
+        self.reader.close()
+        print('Parsed description of %d helper function(s)' % len(self.helpers),
+              file=sys.stderr)
+
+###############################################################################
+
+class Printer(object):
+    """
+    A generic class for printers. Printers should be created with an array of
+    Helper objects, and implement a way to print them in the desired fashion.
+    @helpers: array of Helper objects to print to standard output
+    """
+    def __init__(self, helpers):
+        self.helpers = helpers
+
+    def print_header(self):
+        pass
+
+    def print_footer(self):
+        pass
+
+    def print_one(self, helper):
+        pass
+
+    def print_all(self):
+        self.print_header()
+        for helper in self.helpers:
+            self.print_one(helper)
+        self.print_footer()
+
+class PrinterRST(Printer):
+    """
+    A printer for dumping collected information about helpers as a ReStructured
+    Text page compatible with the rst2man program, which can be used to
+    generate a manual page for the helpers.
+    @helpers: array of Helper objects to print to standard output
+    """
+    def print_header(self):
+        header = '''\
+.. Copyright (C) 2018 Netronome Systems, Inc.
+.. 
+.. %%%LICENSE_START(VERBATIM)
+.. Permission is granted to make and distribute verbatim copies of this
+.. manual provided the copyright notice and this permission notice are
+.. preserved on all copies.
+.. 
+.. Permission is granted to copy and distribute modified versions of this
+.. manual under the conditions for verbatim copying, provided that the
+.. entire resulting derived work is distributed under the terms of a
+.. permission notice identical to this one.
+.. 
+.. Since the Linux kernel and libraries are constantly changing, this
+.. manual page may be incorrect or out-of-date.  The author(s) assume no
+.. responsibility for errors or omissions, or for damages resulting from
+.. the use of the information contained herein.  The author(s) may not
+.. have taken the same level of care in the production of this manual,
+.. which is licensed free of charge, as they might when working
+.. professionally.
+.. 
+.. Formatted or processed versions of this manual, if unaccompanied by
+.. the source, must acknowledge the copyright and authors of this work.
+.. %%%LICENSE_END
+.. 
+.. Please do not edit this file. It was generated from the documentation
+.. located in file include/uapi/linux/bpf.h of the Linux kernel sources
+.. (helpers description), and from scripts/bpf_helpers_doc.py in the same
+.. repository (header and footer).
+
+===========
+BPF-HELPERS
+===========
+-------------------------------------------------------------------------------
+list of eBPF helper functions
+-------------------------------------------------------------------------------
+
+:Manual section: 7
+
+DESCRIPTION
+===========
+
+The extended Berkeley Packet Filter (eBPF) subsystem consists in programs
+written in a pseudo-assembly language, then attached to one of the several
+kernel hooks and run in reaction of specific events. This framework differs
+from the older, "classic" BPF (or "cBPF") in several aspects, one of them being
+the ability to call special functions (or "helpers") from within a program. For
+security reasons, these functions are restricted to a white-list of helpers
+defined in the kernel.
+
+These helpers are used by eBPF programs to interact with the system, or with
+the context in which they work. For instance, they can be used to print
+debugging messages, to get the time since the system was booted, to interact
+with eBPF maps, or to manipulate network packets metadata. Since there are
+several eBPF program types, and that they do not run in the same context, each
+program type can only call a subset of those helpers.
+
+Due to eBPF conventions, a helper can not have more than five arguments.
+
+This document is an attempt to list and document the helpers available to eBPF
+developers. They are sorted by chronological order (the oldest helpers in the
+kernel at the top).
+
+PROGRAM TYPES
+=============
+
+In the description of the helpers below, "*tracing programs*" stands for
+programs of types:
+**BPF_PROG_TYPE_KPROBE**,
+**BPF_PROG_TYPE_TRACEPOINT**,
+**BPF_PROG_TYPE_PERF_EVENT**,
+and **BPF_PROG_TYPE_RAW_TRACEPOINT**.
+
+The set of "*networking programs*" encompasses programs of types
+**BPF_PROG_TYPE_SOCKET_FILTER**,
+**BPF_PROG_TYPE_SCHED_CLS**,
+**BPF_PROG_TYPE_SCHED_ACT**,
+**BPF_PROG_TYPE_LWT_IN**,
+**BPF_PROG_TYPE_LWT_OUT**,
+**BPF_PROG_TYPE_LWT_XMIT**,
+**BPF_PROG_TYPE_SOCK_OPS**,
+**BPF_PROG_TYPE_SK_SKB**,
+**BPF_PROG_TYPE_CGROUP_SOCK**,
+**BPF_PROG_TYPE_CGROUP_SKB**,
+**BPF_PROG_TYPE_CGROUP_SOCK_ADDR**,
+**BPF_PROG_TYPE_XDP**,
+and **BPF_PROG_TYPE_SK_MSG**.
+
+.. BPF_PROG_TYPE_LWT_SEG6LOCAL
+.. BPF_BTF_LOAD
+
+Program type **BPF_PROG_TYPE_CGROUP_DEVICE** allows very few helpers, and
+enters in none of those categories for the purpose of the description.
+
+LICENCE
+=======
+
+Some helpers are for "GPL-only" eBPF programs. These functions rely on internal
+kernel components that can be only used in accordance to the GNU Privacy
+License (GPL), and so eBPF programs must themselves be compatible with this
+license to be allowed to use such helpers (The licensing rules are the same as
+for kernel modules, so that also dual licenses, such as "Dual BSD/GPL", may be
+used). This requires the programs are loaded with the correct license string
+passed (via **attr**) to the **bpf**\ () system call, and generally translates
+into the C source code of such programs containing a line similar similar to
+the following:
+
+::
+
+	char ____license[] __attribute__((section("license"), used)) = "GPL";
+
+HELPERS
+=======
+'''
+        print(header)
+
+    def print_footer(self):
+        footer = '''
+NOTES
+=====
+
+On the performance side, eBPF programs move to the stack all arguments to pass
+to the helpers, and call directly into the compiled helper functions without
+requiring any foreign-function interface. As a result, calling helpers
+introduce very little overhead.
+
+EXAMPLES
+========
+
+Example usage for most of the eBPF helpers listed in this manual page are
+available within the Linux kernel sources, at the following locations:
+
+* *samples/bpf/*
+* *tools/testing/selftests/bpf/*
+
+IMPLEMENTATION
+==============
+
+This manual page is an effort to document the existing eBPF helper functions.
+But as of this writing, the BPF sub-system is under heavy development. New eBPF
+program or map types are added, along with new helper functions. Some helpers
+are occasionally made available for additional program types. So in spite of
+the efforts of the community, this page might not be up-to-date. If you want to
+check by yourself what helper functions exist in your kernel, or what types of
+programs they can support, here are some files among the kernel tree that you
+may be interested in:
+
+* *include/uapi/linux/bpf.h* contains the full list of all helper functions.
+* *net/core/filter.c* contains the definition of most network-related helper
+  functions, and the list of program types from which they can be used.
+* *kernel/trace/bpf_trace.c* is the equivalent for most tracing program-related
+  helpers.
+* *kernel/bpf/verifier.c* contains the functions used to check that valid types
+  of eBPF maps are used with a given helper function.
+* *kernel/bpf/* directory contains other files in which additional helpers are
+  defined (for cgroups, sockmaps, etc.).
+
+Compatibility between helper functions and program types can generally be found
+in the files where helper functions are defined. Look for the **struct
+bpf_func_proto** objects and for functions returning them: these functions
+contain a list of helpers that a given program type can call. Note that the
+**default:** label of the **switch ... case** used to filter helpers can call
+other functions, themselves allowing access to additional helpers. The
+requirement for GPL license is also in those **struct bpf_func_proto**.
+
+Compatibility between helper functions and map types can be found in the
+**check_map_func_compatibility**\ () function in file *kernel/bpf/verifier.c*.
+
+Helper functions that invalidate the checks on **data** and **data_end**
+pointers for network processing are listed in function
+**bpf_helper_changes_pkt_data**\ () in file *net/core/filter.c*.
+
+SEE ALSO
+========
+
+**bpf**\ (2),
+**cgroups**\ (7),
+**ip**\ (8),
+**perf_event_open**\ (2),
+**sendmsg**\ (2),
+**socket**\ (7),
+**tc-bpf**\ (8)'''
+        print(footer)
+
+    def print_proto(self, helper):
+        """
+        Format function protocol with bold and italics markers. This makes RST
+        file less readable, but gives nice results in the manual page.
+        """
+        proto = helper.proto_break_down()
+
+        print('**%s %s%s(' % (proto['ret_type'],
+                              proto['ret_star'].replace('*', '\\*'),
+                              proto['name']),
+              end='')
+
+        comma = ''
+        for a in proto['args']:
+            one_arg = '{}{}'.format(comma, a['type'])
+            if a['name']:
+                if a['star']:
+                    one_arg += ' {}**\ '.format(a['star'].replace('*', '\\*'))
+                else:
+                    one_arg += '** '
+                one_arg += '*{}*\\ **'.format(a['name'])
+            comma = ', '
+            print(one_arg, end='')
+
+        print(')**')
+
+    def print_one(self, helper):
+        self.print_proto(helper)
+
+        if (helper.desc):
+            print('\tDescription')
+            # Do not strip all newline characters: formatted code at the end of
+            # a section must be followed by a blank line.
+            for line in re.sub('\n$', '', helper.desc, count=1).split('\n'):
+                print('{}{}'.format('\t\t' if line else '', line))
+
+        if (helper.ret):
+            print('\tReturn')
+            for line in helper.ret.rstrip().split('\n'):
+                print('{}{}'.format('\t\t' if line else '', line))
+
+        print('\tFor')
+        for line in helper.progtype.rstrip().split('\n'):
+            print('{}{}'.format('\t\t' if line else '', line))
+
+        print('\tGPL only')
+        print('\t\t%s' % helper.gpl)
+
+        print('\tSince')
+        if re.match(r'^[0-9.]+$', helper.since):
+            print('\t\tLinux %s' % helper.since)
+        else:
+            for line in helper.since.rstrip().split('\n'):
+                print('{}{}'.format('\t\t' if line else '', line))
+
+        print('')
+        print('.. commit %s' % helper.commit)
+        print('')
+
+###############################################################################
+
+# If script is launched from scripts/ from kernel tree and can access
+# ../include/uapi/linux/bpf.h, use it as a default name for the file to parse,
+# otherwise the --filename argument will be required from the command line.
+script = os.path.abspath(sys.argv[0])
+linuxRoot = os.path.dirname(os.path.dirname(script))
+bpfh = os.path.join(linuxRoot, 'include/uapi/linux/bpf.h')
+
+argParser = argparse.ArgumentParser(description="""
+Parse eBPF header file and generate documentation for eBPF helper functions.
+The RST-formatted output produced can be turned into a manual page with the
+rst2man utility.
+""")
+if (os.path.isfile(bpfh)):
+    argParser.add_argument('--filename', help='path to include/uapi/linux/bpf.h',
+                           default=bpfh)
+else:
+    argParser.add_argument('--filename', help='path to include/uapi/linux/bpf.h')
+args = argParser.parse_args()
+
+# Parse file.
+headerParser = HeaderParser(args.filename)
+headerParser.run()
+
+# Print formatted output to standard output.
+printer = PrinterRST(headerParser.helpers)
+printer.print_all()
-- 
2.14.1
