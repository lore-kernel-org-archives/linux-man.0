From: Quentin Monnet <quentin.monnet@netronome.com>
Subject: Re: [PATCH bpf-next v3 8/8] bpf: add documentation for eBPF helpers
 (58-64)
Date: Wed, 18 Apr 2018 15:09:41 +0100
Message-ID: <67e84a95-5e7b-1c2c-e90f-7bcc0026bd10@netronome.com>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-9-quentin.monnet@netronome.com>
 <20180418153448.574c6814@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180418153448.574c6814@redhat.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>
List-Id: linux-man@vger.kernel.org

2018-04-18 15:34 UTC+0200 ~ Jesper Dangaard Brouer <brouer@redhat.com>
> On Tue, 17 Apr 2018 15:34:38 +0100
> Quentin Monnet <quentin.monnet@netronome.com> wrote:
> 
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index 350459c583de..3d329538498f 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h
>> @@ -1276,6 +1276,50 @@ union bpf_attr {
>>   * 	Return
>>   * 		0 on success, or a negative error in case of failure.
>>   *
>> + * int bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
>> + * 	Description
>> + * 		Redirect the packet to the endpoint referenced by *map* at
>> + * 		index *key*. Depending on its type, his *map* can contain
>                                                     ^^^
> 
> "his" -> "this"

Thanks!

>> + * 		references to net devices (for forwarding packets through other
>> + * 		ports), or to CPUs (for redirecting XDP frames to another CPU;
>> + * 		but this is only implemented for native XDP (with driver
>> + * 		support) as of this writing).
>> + *
>> + * 		All values for *flags* are reserved for future usage, and must
>> + * 		be left at zero.
>> + * 	Return
>> + * 		**XDP_REDIRECT** on success, or **XDP_ABORT** on error.
>> + *
> 
> "XDP_ABORT" -> "XDP_ABORTED"

Ouch. And I did the same for bpf_redirect(). Thanks for the catch.

> 
> I don't know if it's worth mentioning in the doc/man-page; that for XDP
> using bpf_redirect_map() is a HUGE performance advantage, compared to
> the bpf_redirect() call ?

It seems worth to me. How would you simply explain the reason for this
difference?

Quentin
