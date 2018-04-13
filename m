From: Quentin Monnet <quentin.monnet@netronome.com>
Subject: Re: [RFC bpf-next v2 4/8] bpf: add documentation for eBPF helpers
 (23-32)
Date: Fri, 13 Apr 2018 19:18:38 +0100
Message-ID: <866e9593-0247-87e6-35d8-6fde1f8e382b@netronome.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-5-quentin.monnet@netronome.com>
 <20180413002838.atu7shp5cuubx32p@ast-mbp.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180413002838.atu7shp5cuubx32p@ast-mbp.dhcp.thefacebook.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

2018-04-12 17:28 UTC-0700 ~ Alexei Starovoitov
<alexei.starovoitov@gmail.com>
> On Tue, Apr 10, 2018 at 03:41:53PM +0100, Quentin Monnet wrote:
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
>> Cc: Daniel Borkmann <daniel@iogearbox.net>
>> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
>> ---
>>  include/uapi/linux/bpf.h | 125 +++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 125 insertions(+)
>>
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index f3ea8824efbc..d147d9dd6a83 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h

[...]

>> @@ -604,6 +612,13 @@ union bpf_attr {
>>   * 	Return
>>   * 		0 on success, or a negative error in case of failure.
>>   *
>> + * u32 bpf_get_cgroup_classid(struct sk_buff *skb)
>> + * 	Description
>> + * 		Retrieve the classid for the current task, i.e. for the
>> + * 		net_cls (network classifier) cgroup to which *skb* belongs.
> 
> please add that kernel should be configured with CONFIG_NET_CLS_CGROUP=y|m
> and mention Documentation/cgroup-v1/net_cls.txt

Ok.

> Otherwise 'network classifier' is way too generic.

I am not so familiar with cgroups. What would you suggest instead?

> I'd also mention that placing a task into net_cls controller
> disables all of cgroup-bpf.

Could you please explain a bit more? Placing a task into the controller
is using:

	echo <task_pid>  >  /sys/fs/cgroup/<my_cgroup_name>/tasks

correct? Then if I do this, it disables all of cgroup-bpf. Does this
mean that I loose the possibility to use or add BPF programs to all
cgroup-related attach points for this cgroup? I think I missed something
here.

>> + * 	Return
>> + * 		The classid, or 0 for the default unconfigured classid.
>> + *
>>   * int bpf_skb_vlan_push(struct sk_buff *skb, __be16 vlan_proto, u16 vlan_tci)
>>   * 	Description
>>   * 		Push a *vlan_tci* (VLAN tag control information) of protocol

I have no particular comments on the other items you reported on this
patch, I will fix them. Thanks!

Quentin
