From: Quentin Monnet <quentin.monnet@netronome.com>
Subject: Re: [PATCH bpf-next v3 4/8] bpf: add documentation for eBPF helpers
 (23-32)
Date: Fri, 20 Apr 2018 19:54:37 +0100
Message-ID: <b7ef2bc0-90f7-8bd9-2dd2-3b5ba2a6d4b0@netronome.com>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-5-quentin.monnet@netronome.com>
 <6f1b43c7-5d79-7419-1053-d0b29c1e2bb9@iogearbox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <6f1b43c7-5d79-7419-1053-d0b29c1e2bb9@iogearbox.net>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, ast@kernel.org
Cc: netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

2018-04-19 13:16 UTC+0200 ~ Daniel Borkmann <daniel@iogearbox.net>
> On 04/17/2018 04:34 PM, Quentin Monnet wrote:
>> Add documentation for eBPF helper functions to bpf.h user header file.
>> This documentation can be parsed with the Python script provided in
>> another commit of the patch series, in order to provide a RST document
>> that can later be converted into a man page.
>>
>> The objective is to make the documentation easily understandable and
>> accessible to all eBPF developers, including beginners.
>>
>> This patch contains descriptions for the following helper functions, all
>> written by Daniel:
>>
>> - bpf_get_prandom_u32()
>> - bpf_get_smp_processor_id()
>> - bpf_get_cgroup_classid()
>> - bpf_get_route_realm()
>> - bpf_skb_load_bytes()
>> - bpf_csum_diff()
>> - bpf_skb_get_tunnel_opt()
>> - bpf_skb_set_tunnel_opt()
>> - bpf_skb_change_proto()
>> - bpf_skb_change_type()
>>
>> v3:
>> - bpf_get_prandom_u32(): Fix helper name :(. Add description, including
>>   a note on the internal random state.
>> - bpf_get_smp_processor_id(): Add description, including a note on the
>>   processor id remaining stable during program run.
>> - bpf_get_cgroup_classid(): State that CONFIG_CGROUP_NET_CLASSID is
>>   required to use the helper. Add a reference to related documentation.
>>   State that placing a task in net_cls controller disables cgroup-bpf.
>> - bpf_get_route_realm(): State that CONFIG_CGROUP_NET_CLASSID is
>>   required to use this helper.
>> - bpf_skb_load_bytes(): Fix comment on current use cases for the helper.
>>
>> Cc: Daniel Borkmann <daniel@iogearbox.net>
>> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
>> ---
>>  include/uapi/linux/bpf.h | 152 +++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 152 insertions(+)
>>
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index c59bf5b28164..d748f65a8f58 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h

[...]

>> @@ -615,6 +632,27 @@ union bpf_attr {
>>   * 	Return
>>   * 		0 on success, or a negative error in case of failure.
>>   *
>> + * u32 bpf_get_cgroup_classid(struct sk_buff *skb)
>> + * 	Description
>> + * 		Retrieve the classid for the current task, i.e. for the
>> + * 		net_cls (network classifier) cgroup to which *skb* belongs.
>> + *
>> + * 		This helper is only available is the kernel was compiled with
>> + * 		the **CONFIG_CGROUP_NET_CLASSID** configuration option set to
>> + * 		"**y**" or to "**m**".
>> + *
>> + * 		Note that placing a task into the net_cls controller completely
>> + * 		disables the execution of eBPF programs with the cgroup.
> 
> I'm not sure I follow the above sentence, what do you mean by that?

Please see comment below.

> I would definitely also add here that this helper is limited to cgroups v1
> only, and that it works on clsact TC egress hook but not the ingress one.
> 
>> + * 		Also note that, in the above description, the "network
>> + * 		classifier" cgroup does not designate a generic classifier, but
>> + * 		a particular mechanism that provides an interface to tag
>> + * 		network packets with a specific class identifier. See also the
> 
> The "generic classifier" part is a bit strange to parse. I would probably
> leave the first part out and explain that this provides a means to tag
> packets based on a user-provided ID for all traffic coming from the tasks
> belonging to the related cgroup.

In this paragraph and in the one above, I am trying to address Alexei
comments to the RFC v2:

    please add that kernel should be configured with
    CONFIG_NET_CLS_CGROUP=y|m
    and mention Documentation/cgroup-v1/net_cls.txt
    Otherwise 'network classifier' is way too generic.
    I'd also mention that placing a task into net_cls controller
    disables all of cgroup-bpf.

But I must admit I am struggling a bit on this helper. If I understand
correctly, "network classifier" is too generic and could be confused
with TC classifiers? Hence the attempt to avoid that in the second
paragraph... As for "placing a task into net_cls controller disables all
of cgroup-bpf", again if I understand correctly, I think it refers to
cgroup_sk_alloc_disable() being called in write_classid() in file
net/core/netclassid_cgroup.c. But I am not familiar with it and cannot
find a nice way to explain that in the doc :/.

>> + * 		related kernel documentation, available from the Linux sources
>> + * 		in file *Documentation/cgroup-v1/net_cls.txt*.
>> + * 	Return
>> + * 		The classid, or 0 for the default unconfigured classid.
>> + *
>>   * int bpf_skb_vlan_push(struct sk_buff *skb, __be16 vlan_proto, u16 vlan_tci)
>>   * 	Description
>>   * 		Push a *vlan_tci* (VLAN tag control information) of protocol
>> @@ -734,6 +772,16 @@ union bpf_attr {
>>   * 		are **TC_ACT_REDIRECT** on success or **TC_ACT_SHOT** on
>>   * 		error.
>>   *
>> + * u32 bpf_get_route_realm(struct sk_buff *skb)
>> + * 	Description
>> + * 		Retrieve the realm or the route, that is to say the
>> + * 		**tclassid** field of the destination for the *skb*. This
>> + * 		helper is available only if the kernel was compiled with
>> + * 		**CONFIG_IP_ROUTE_CLASSID** configuration option.
> 
> Could mention that this is a similar user provided tag like in the net_cls
> case with cgroups only that this applies to routes here (dst entries) which
> hold this tag.
> 
> Also, should say that this works with clsact TC egress hook or alternatively
> conventional classful egress qdiscs, but not on TC ingress. In case of clsact
> TC egress hook this has the advantage that the dst entry has not been dropped
> yet in the xmit path. Therefore, the dst entry does not need to be artificially
> held via netif_keep_dst() for a classful qdisc until the skb is freed.

Here I am not sure to follow, the advantage is for clsact, but this is
only for a classful qdisc that we can avoid holding the dst entry? How
does holding the entry with netif_keep_dst() translate, from a user
space point of view?

Thanks a lot for the exhaustive review!
Quentin
