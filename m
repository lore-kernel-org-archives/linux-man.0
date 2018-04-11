From: Quentin Monnet <quentin.monnet@netronome.com>
Subject: [RFC bpf-next v2 8/8] bpf: add documentation for eBPF helpers (58-64)
Date: Wed, 11 Apr 2018 16:45:50 +0100
Message-ID: <61abf6b0-854d-af3c-c2a3-b356f54ab84c@netronome.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-9-quentin.monnet@netronome.com>
 <20180411121759.4191e267@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180411121759.4191e267@redhat.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>
List-Id: linux-man@vger.kernel.org

2018-04-11 12:17 UTC+0200 ~ Jesper Dangaard Brouer <brouer@redhat.com>
> On Tue, 10 Apr 2018 15:41:57 +0100
> Quentin Monnet <quentin.monnet@netronome.com> wrote:
> 
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index 7343af4196c8..db090ad03626 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h
>> @@ -1250,6 +1250,51 @@ union bpf_attr {
>>   * 	Return
>>   * 		0 on success, or a negative error in case of failure.
>>   *
>> + * int bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
>> + * 	Description
>> + * 		Redirect the packet to the endpoint referenced by *map* at
>> + * 		index *key*. Depending on its type, his *map* can contain
>> + * 		references to net devices (for forwarding packets through other
>> + * 		ports), or to CPUs (for redirecting XDP frames to another CPU;
>> + * 		but this is not fully implemented as of this writing).
> 
> Stating that CPUMAP redirect "is not fully implemented" is confusing.
> The issue is that CPUMAP only works for "native" XDP.
> 
> What about saying:
> 
> "[...] or to CPUs (for redirecting XDP frames to another CPU;
>  but this is only implemented for native XDP as of this writing)"
> 

Fine by me, I will change it. Thank you Jesper for the review!

Quentin
