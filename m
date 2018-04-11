From: Quentin Monnet <quentin.monnet@netronome.com>
Subject: [RFC bpf-next v2 2/8] bpf: add documentation for eBPF helpers (01-11)
Date: Wed, 11 Apr 2018 16:42:21 +0100
Message-ID: <6db57eb9-13eb-db70-3afa-64b7c074aa7f@netronome.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-3-quentin.monnet@netronome.com>
 <20180410175605.2wqhaqx34a4o3gdi@ast-mbp.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180410175605.2wqhaqx34a4o3gdi@ast-mbp.dhcp.thefacebook.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

2018-04-10 10:56 UTC-0700 ~ Alexei Starovoitov
<alexei.starovoitov@gmail.com>
> On Tue, Apr 10, 2018 at 03:41:51PM +0100, Quentin Monnet wrote:
>> Add documentation for eBPF helper functions to bpf.h user header file.
>> This documentation can be parsed with the Python script provided in
>> another commit of the patch series, in order to provide a RST document
>> that can later be converted into a man page.
>>
>> The objective is to make the documentation easily understandable and
>> accessible to all eBPF developers, including beginners.
>>
>> This patch contains descriptions for the following helper functions, all
>> written by Alexei:
>>
>> - bpf_map_lookup_elem()
>> - bpf_map_update_elem()
>> - bpf_map_delete_elem()
>> - bpf_probe_read()
>> - bpf_ktime_get_ns()
>> - bpf_trace_printk()
>> - bpf_skb_store_bytes()
>> - bpf_l3_csum_replace()
>> - bpf_l4_csum_replace()
>> - bpf_tail_call()
>> - bpf_clone_redirect()
>>
>> Cc: Alexei Starovoitov <ast@kernel.org>
>> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
>> ---
>>  include/uapi/linux/bpf.h | 199 +++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 199 insertions(+)
>>
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index 45f77f01e672..2bc653a3a20f 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h
>> @@ -381,6 +381,205 @@ union bpf_attr {
>>   * intentional, removing them would break paragraphs for rst2man.
>>   *
>>   * Start of BPF helper function descriptions:
>> + *
>> + * void *bpf_map_lookup_elem(struct bpf_map *map, void *key)
>> + * 	Description
>> + * 		Perform a lookup in *map* for an entry associated to *key*.
>> + * 	Return
>> + * 		Map value associated to *key*, or **NULL** if no entry was
>> + * 		found.
>> + *
>> + * int bpf_map_update_elem(struct bpf_map *map, void *key, void *value, u64 flags)
>> + * 	Description
>> + * 		Add or update the value of the entry associated to *key* in
>> + * 		*map* with *value*. *flags* is one of:
>> + *
>> + * 		**BPF_NOEXIST**
>> + * 			The entry for *key* must not exist in the map.
>> + * 		**BPF_EXIST**
>> + * 			The entry for *key* must already exist in the map.
>> + * 		**BPF_ANY**
>> + * 			No condition on the existence of the entry for *key*.
>> + *
>> + * 		These flags are only useful for maps of type
>> + * 		**BPF_MAP_TYPE_HASH**. For all other map types, **BPF_ANY**
>> + * 		should be used.
> 
> I think that's not entirely accurate.
> The flags work as expected for all other map types as well
> and for lru map, sockmap, map in map the flags have practical use cases.
> 

Ok, I missed that. I have to go back and check how the flags are used
for those maps. I will cook up something cleaner for the next version of
the set.

>> + * 	Return
>> + * 		0 on success, or a negative error in case of failure.
>> + *

[...]

>> + *
>> + * int bpf_trace_printk(const char *fmt, u32 fmt_size, ...)
>> + * 	Description
>> + * 		This helper is a "printk()-like" facility for debugging. It
>> + * 		prints a message defined by format *fmt* (of size *fmt_size*)
>> + * 		to file *\/sys/kernel/debug/tracing/trace* from DebugFS, if
>> + * 		available. It can take up to three additional **u64**
>> + * 		arguments (as an eBPF helpers, the total number of arguments is
>> + * 		limited to five). Each time the helper is called, it appends a
>> + * 		line that looks like the following:
>> + *
>> + * 		::
>> + *
>> + * 			telnet-470   [001] .N.. 419421.045894: 0x00000001: BPF command: 2
>> + *
>> + * 		In the above:
>> + *
>> + * 			* ``telnet`` is the name of the current task.
>> + * 			* ``470`` is the PID of the current task.
>> + * 			* ``001`` is the CPU number on which the task is
>> + * 			  running.
>> + * 			* In ``.N..``, each character refers to a set of
>> + * 			  options (whether irqs are enabled, scheduling
>> + * 			  options, whether hard/softirqs are running, level of
>> + * 			  preempt_disabled respectively). **N** means that
>> + * 			  **TIF_NEED_RESCHED** and **PREEMPT_NEED_RESCHED**
>> + * 			  are set.
>> + * 			* ``419421.045894`` is a timestamp.
>> + * 			* ``0x00000001`` is a fake value used by BPF for the
>> + * 			  instruction pointer register.
>> + * 			* ``BPF command: 2`` is the message formatted with
>> + * 			  *fmt*.
> 
> the above depends on how trace_pipe was configured. It's a default
> configuration for many, but would be good to explain this a bit better.
> 

I did not know about that. Would you have a pointer about how to
configure trace_pipe, please?

>> + *
>> + * 		The conversion specifiers supported by *fmt* are similar, but
>> + * 		more limited than for printk(). They are **%d**, **%i**,
>> + * 		**%u**, **%x**, **%ld**, **%li**, **%lu**, **%lx**, **%lld**,
>> + * 		**%lli**, **%llu**, **%llx**, **%p**, **%s**. No modifier (size
>> + * 		of field, padding with zeroes, etc.) is available, and the
>> + * 		helper will silently fail if it encounters an unknown
>> + * 		specifier.
> 
> This is not true. bpf_trace_printk will return -EINVAL for unknown specifier.
> 

Correct, sorry about that. I never check the return value of
bpf_trace_printk(), and it's hard to realise it failed without resorting
to another bpf_trace_printk() :). I'll fix it, what about:

"No modifier (size of field, padding with zeroes, etc.) is available,
and the helper will return **-EINVAL** (but print nothing) if it
encounters an unknown specifier."

(I would like to keep the "print nothing" idea, at the beginning I spent
some time myself trying to figure out why my bpf_trace_prink() seemed to
be never called--I was simply trying to print with "%#x".)

>> + *
>> + * 		Also, note that **bpf_trace_printk**\ () is slow, and should
>> + * 		only be used for debugging purposes. For passing values to user
>> + * 		space, perf events should be preferred.
> 
> please mention the giant dmesg warning that people will definitely
> notice when they try to use this helper.

This is a good idea, I will mention it.

>> + * 	Return
>> + * 		The number of bytes written to the buffer, or a negative error
>> + * 		in case of failure.
>> + *

[...]

>> + * int bpf_tail_call(void *ctx, struct bpf_map *prog_array_map, u32 index)
>> + * 	Description
>> + * 		This special helper is used to trigger a "tail call", or in
>> + * 		other words, to jump into another eBPF program. The contents of
>> + * 		eBPF registers and stack are not modified, the new program
>> + * 		"inherits" them from the caller. This mechanism allows for
> 
> "inherits" is a technically correct, but misleading statement,
> since callee program cannot access caller's registers and stack.
> 

I can replace this sentence by:

"The same stack frame is used (but values on stack and in registers for
the caller are not accessible to the callee)."

>> + * 		program chaining, either for raising the maximum number of
>> + * 		available eBPF instructions, or to execute given programs in
>> + * 		conditional blocks. For security reasons, there is an upper
>> + * 		limit to the number of successive tail calls that can be
>> + * 		performed.
>> + *
>> + * 		Upon call of this helper, the program attempts to jump into a
>> + * 		program referenced at index *index* in *prog_array_map*, a
>> + * 		special map of type **BPF_MAP_TYPE_PROG_ARRAY**, and passes
>> + * 		*ctx*, a pointer to the context.
>> + *
>> + * 		If the call succeeds, the kernel immediately runs the first
>> + * 		instruction of the new program. This is not a function call,
>> + * 		and it never goes back to the previous program. If the call
>> + * 		fails, then the helper has no effect, and the caller continues
>> + * 		to run its own instructions. A call can fail if the destination
>> + * 		program for the jump does not exist (i.e. *index* is superior
>> + * 		to the number of entries in *prog_array_map*), or if the
>> + * 		maximum number of tail calls has been reached for this chain of
>> + * 		programs. This limit is defined in the kernel by the macro
>> + * 		**MAX_TAIL_CALL_CNT** (not accessible to user space), which
>> + * 		is currently set to 32.
>> + * 	Return
>> + * 		0 on success, or a negative error in case of failure.
>> + *
>> + * int bpf_clone_redirect(struct sk_buff *skb, u32 ifindex, u64 flags)
>> + * 	Description
>> + * 		Clone and redirect the packet associated to *skb* to another
>> + * 		net device of index *ifindex*. The only flag supported for now
>> + * 		is **BPF_F_INGRESS**, which indicates the packet is to be
>> + * 		redirected to the ingress interface instead of (by default)
>> + * 		egress.
> 
> imo the above sentence is prone to misinterpretation.
> Can you rephrase it to say that both redirect to ingress and redirect to egress
> are supported and flag is used to indicate which path to take ?
> 

I could replace with the following:

"Clone and redirect the packet associated to *skb* to another net device
of index *ifindex*. Both ingress and egress interfaces can be used for
redirection. The **BPF_F_INGRESS** value in *flags* is used to make the
distinction (ingress path is selected if the flag is present, egress
path otherwise). This is the only flag supported for now."

I think I wrote similar things about other helpers using BPF_F_INGRESS
flag, I will also update them accordingly.

>> + *
>> + * 		A call to this helper is susceptible to change data from the
>> + * 		packet. Therefore, at load time, all checks on pointers
>> + * 		previously done by the verifier are invalidated and must be
>> + * 		performed again.
>> + * 	Return
>> + * 		0 on success, or a negative error in case of failure.
>>   */
>>  #define __BPF_FUNC_MAPPER(FN)		\
>>  	FN(unspec),			\
>> -- 
>> 2.14.1
>>
