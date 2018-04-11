From: Quentin Monnet <quentin.monnet@netronome.com>
Subject: Re: [RFC bpf-next v2 7/8] bpf: add documentation for eBPF helpers
 (51-57)
Date: Wed, 11 Apr 2018 19:01:26 +0100
Message-ID: <ef91a007-9eec-8afa-cd7e-2f1f8da79343@netronome.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-8-quentin.monnet@netronome.com>
 <cc54b41e-3f2f-e87f-042f-842c96308626@fb.com>
 <7e388b10-ccea-a2b0-e776-5420c8e7f521@netronome.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <7e388b10-ccea-a2b0-e776-5420c8e7f521@netronome.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Yonghong Song <yhs@fb.com>, daniel@iogearbox.net, ast@kernel.org
Cc: netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org, Lawrence Brakmo <brakmo@fb.com>, Josef Bacik <jbacik@fb.com>, Andrey Ignatov <rdna@fb.com>
List-Id: linux-man@vger.kernel.org

2018-04-11 16:44 UTC+0100 ~ Quentin Monnet <quentin.monnet@netronome.com>
> 2018-04-10 09:58 UTC-0700 ~ Yonghong Song <yhs@fb.com>
>> On 4/10/18 7:41 AM, Quentin Monnet wrote:
>>> Add documentation for eBPF helper functions to bpf.h user header file.
>>> This documentation can be parsed with the Python script provided in
>>> another commit of the patch series, in order to provide a RST document
>>> that can later be converted into a man page.
>>>
>>> The objective is to make the documentation easily understandable and
>>> accessible to all eBPF developers, including beginners.
>>>
>>> This patch contains descriptions for the following helper functions:
>>>
>>> Helpers from Lawrence:
>>> - bpf_setsockopt()
>>> - bpf_getsockopt()
>>> - bpf_sock_ops_cb_flags_set()
>>>
>>> Helpers from Yonghong:
>>> - bpf_perf_event_read_value()
>>> - bpf_perf_prog_read_value()
>>>
>>> Helper from Josef:
>>> - bpf_override_return()
>>>
>>> Helper from Andrey:
>>> - bpf_bind()
>>>
>>> Cc: Lawrence Brakmo <brakmo@fb.com>
>>> Cc: Yonghong Song <yhs@fb.com>
>>> Cc: Josef Bacik <jbacik@fb.com>
>>> Cc: Andrey Ignatov <rdna@fb.com>
>>> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
>>> ---

> [...]
> 
> Thanks Yonghong for the review!
> 
> I have a favor to ask of you. I got a bounce for Kaixu Xia's email
> address, and I don't know what alternative email address I could use. I
> CC-ed to have a review for helper bpf_perf_event_read() (in patch 6 of
> this series), which is rather close to bpf_perf_event_read_value().
> Would you mind having a look at that one too, please? The description is
> not long.

Well I read again the description I wrote, and actually the one for
bpf_perf_evnet_read() is nearly a subset of the one for
perf_event_read_value(). So the same comments that you raised earlier
apply, there's probably nothing more to review. But if you notice that
some important info is missing for bpf_perf_event_read(), I'm interested
too!

Quentin
