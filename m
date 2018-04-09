From: Quentin Monnet <quentin.monnet@netronome.com>
Subject: Re: [RFC bpf-next] bpf: document eBPF helpers and add a script to
 generate man page
Date: Mon, 9 Apr 2018 14:25:26 +0100
Message-ID: <16d4d67a-ab36-3e58-1082-52f0898546e5@netronome.com>
References: <20180406111122.11038-1-quentin.monnet@netronome.com>
 <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <05d2d03a-0b39-9d0c-9ba0-3461afc45fac@iogearbox.net>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, ast@kernel.org
Cc: netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

2018-04-09 11:01 UTC+0200 ~ Daniel Borkmann <daniel@iogearbox.net>
> On 04/06/2018 01:11 PM, Quentin Monnet wrote:
>> eBPF helper functions can be called from within eBPF programs to perform
>> a variety of tasks that would be otherwise hard or impossible to do with
>> eBPF itself. There is a growing number of such helper functions in the
>> kernel, but documentation is scarce. The main user space header file
>> does contain a short commented description of most helpers, but it is
>> somewhat outdated and not complete. It is more a "cheat sheet" than a
>> real documentation accessible to new eBPF developers.
>>
>> This commit attempts to improve the situation by replacing the existing
>> overview for the helpers with a more developed description. Furthermore,
>> a Python script is added to generate a manual page for eBPF helpers. The
>> workflow is the following, and requires the rst2man utility:
>>
>>     $ ./scripts/bpf_helpers_doc.py \
>>             --filename include/uapi/linux/bpf.h > /tmp/bpf-helpers.rst
>>     $ rst2man /tmp/bpf-helpers.rst > /tmp/bpf-helpers.7
>>     $ man /tmp/bpf-helpers.7
>>
>> The objective is to keep all documentation related to the helpers in a
>> single place, and to be able to generate from here a manual page that
>> could be packaged in the man-pages repository and shipped with most
>> distributions [1].
>>
>> Additionally, parsing the prototypes of the helper functions could
>> hopefully be reused, with a different Printer object, to generate
>> header files needed in some eBPF-related projects.
>>
>> Regarding the description of each helper, it comprises several items:
>>
>> - The function prototype.
>> - A description of the function and of its arguments (except for a
>>   couple of cases, when there are no arguments and the return value
>>   makes the function usage really obvious).
>> - A description of return values (if not void).
>> - A listing of eBPF program types (if relevant, map types) compatible
>>   with the helper.
>> - Information about the helper being restricted to GPL programs, or not.
>> - The kernel version in which the helper was introduced.
>> - The commit that introduced the helper (this is mostly to have it in
>>   the source of the man page, as it can be used to track changes and
>>   update the page).
>>
>> For several helpers, descriptions are inspired (at times, nearly copied)
>> from the commit logs introducing them in the kernel--Many thanks to
>> their respective authors! They were completed as much as possible, the
>> objective being to have something easily accessible even for people just
>> starting with eBPF. There is probably a bit more work to do in this
>> direction for some helpers.
>>
>> Some RST formatting is used in the descriptions (not in function
>> prototypes, to keep them readable, but the Python script provided in
>> order to generate the RST for the manual page does add formatting to
>> prototypes, to produce something pretty) to get "bold" and "italics" in
>> manual pages. Hopefully, the descriptions in bpf.h file remains
>> perfectly readable. Note that the few trailing white spaces are
>> intentional, removing them would break paragraphs for rst2man.
>>
>> The descriptions should ideally be updated each time someone adds a new
>> helper, or updates the behaviour (compatibility extended to new program
>> types, new socket option supported...) or the interface (new flags
>> available, ...) of existing ones.
>>
>> [1] I have not contacted people from the man-pages project prior to
>>     sending this RFC, so I can offer no guaranty at this time that they
>>     would accept to take the generated man page.
>>
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-man@vger.kernel.org
>> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
> 
> Great work, thanks a lot for doing this!
> 
> [...]
>> + * int bpf_probe_read(void *dst, u32 size, const void *src)
>> + * 	Description
>> + * 		For tracing programs, safely attempt to read *size* bytes from
>> + * 		address *src* and store the data in *dst*.
>> + * 	Return
>> + * 		0 on success, or a negative error in case of failure.
>> + * 	For
>> + * 		*Tracing programs*.
>> + * 	GPL only
>> + * 		Yes
>> + * 	Since
>> + * 		Linux 4.1
>> + *
>> + * .. commit 2541517c32be
>>   *
>>   * u64 bpf_ktime_get_ns(void)
>> - *     Return: current ktime
>> - *
>> - * int bpf_trace_printk(const char *fmt, int fmt_size, ...)
>> - *     Return: length of buffer written or negative error
>> + * 	Description
>> + * 		Return the time elapsed since system boot, in nanoseconds.
>> + * 	Return
>> + * 		Current *ktime*.
>> + * 	For
>> + * 		All program types, except
>> + * 		**BPF_PROG_TYPE_CGROUP_DEVICE**.
> 
> I think we should probably always just list the actual program types instead,
> since when new types get added to the kernel not supporting bpf_ktime_get_ns()
> helper in this example, the above statement would be misleading (potentially
> more misleading than the other way around when it's not yet mentioned to be
> supported).

Agreed. I realise “All program types” is really awkward here.

>> + * 	GPL only
>> + * 		Yes
>> + * 	Since
>> + * 		Linux 4.1
>> + *
>> + * .. commit d9847d310ab4
>> + *

[...]

>> + * u32 bpf_get_smp_processor_id(void)
>> + * 	Return
>> + * 		The SMP (Symmetric multiprocessing) processor id.
>> + * 	For
>> + * 		*Networking programs*.
> 
> Ditto plus above is actually not correct. See tracing_func_proto():
> 
>         [...]
>         case BPF_FUNC_get_smp_processor_id:
>                 return &bpf_get_smp_processor_id_proto;
>         [...]

Thanks for the catch! I will fix on my side, even if we drop the "For"
section for now.

>> + * 	GPL only
>> + * 		No
>> + * 	Since
>> + * 		Linux 4.1
>> + *
>> + * .. commit c04167ce2ca0
>> + *
>> + * int bpf_skb_store_bytes(struct sk_buff *skb, u32 offset, const void *from, u32 len, u64 flags)
>> + * 	Description
>> + * 		Store *len* bytes from address *from* into the packet
>> + * 		associated to *skb*, at *offset*. *flags* are a combination of
>> + * 		**BPF_F_RECOMPUTE_CSUM** (automatically recompute the
>> + * 		checksum for the packet after storing the bytes) and
>> + * 		**BPF_F_INVALIDATE_HASH** (set *skb*\ **->hash**, *skb*\
>> + * 		**->swhash** and *skb*\ **->l4hash** to 0).
>> + *
>> + * 		A call to this helper is susceptible to change data from the
>> + * 		packet. Therefore, at load time, all checks on pointers
>> + * 		previously done by the verifier are invalidated and must be
>> + * 		performed again.
>> + * 	Return
> [...]
> 
> Agree with Alexei that 'Description' but also 'Return' is the most useful
> (the latter we can still improve a bit wrt errors). 'For' gets indeed quickly
> out of hand but I do think that for BPF program developers 'Since' has good
> value to quickly check when a helper could be available, but then again
> this is actually tied to an individual kconfig and/or program type, and could
> potentially require to add or (worst case) remove the info in a second commit
> e.g. after the merge window similar with the commit sha. Probably best indeed
> to stick to the signature, 'Description' and 'Return' initially.

I understand that the "For" section will be the hardest to maintain
up-to-date, however, I believe that--along with minimal kernel version
and GPL information--it would be useful for readers (Alexei, what is
your case against the "GPL only" section?). Daniel, your proposal for
the "Since" information in a second time sounds good! But I do not have
a solution right now for maintaining the "For" section on the long term.

Anyway, I am fine with keeping just signatures, descriptions and return
values for now. I will submit a new version with only those items.

> We should probably also have the bpf_helpers_doc.py workflow in a separate
> comment above this one such that developers don't have to look up the original
> commit message, but have the required steps to render the rst/man page available
> right where they need it.

Sure! I was considering adding some comments on top of the description,
but haven't done it for the RFC. I will do for the next version.

Thanks for the reviews!
Quentin
