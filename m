From: Quentin Monnet <quentin.monnet@netronome.com>
Subject: [RFC bpf-next v2 7/8] bpf: add documentation for eBPF helpers (51-57)
Date: Wed, 11 Apr 2018 16:44:35 +0100
Message-ID: <7e388b10-ccea-a2b0-e776-5420c8e7f521@netronome.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-8-quentin.monnet@netronome.com>
 <cc54b41e-3f2f-e87f-042f-842c96308626@fb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <cc54b41e-3f2f-e87f-042f-842c96308626@fb.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Yonghong Song <yhs@fb.com>, daniel@iogearbox.net, ast@kernel.org
Cc: netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org, Lawrence Brakmo <brakmo@fb.com>, Josef Bacik <jbacik@fb.com>, Andrey Ignatov <rdna@fb.com>
List-Id: linux-man@vger.kernel.org

2018-04-10 09:58 UTC-0700 ~ Yonghong Song <yhs@fb.com>
> On 4/10/18 7:41 AM, Quentin Monnet wrote:
>> Add documentation for eBPF helper functions to bpf.h user header file.
>> This documentation can be parsed with the Python script provided in
>> another commit of the patch series, in order to provide a RST document
>> that can later be converted into a man page.
>>
>> The objective is to make the documentation easily understandable and
>> accessible to all eBPF developers, including beginners.
>>
>> This patch contains descriptions for the following helper functions:
>>
>> Helpers from Lawrence:
>> - bpf_setsockopt()
>> - bpf_getsockopt()
>> - bpf_sock_ops_cb_flags_set()
>>
>> Helpers from Yonghong:
>> - bpf_perf_event_read_value()
>> - bpf_perf_prog_read_value()
>>
>> Helper from Josef:
>> - bpf_override_return()
>>
>> Helper from Andrey:
>> - bpf_bind()
>>
>> Cc: Lawrence Brakmo <brakmo@fb.com>
>> Cc: Yonghong Song <yhs@fb.com>
>> Cc: Josef Bacik <jbacik@fb.com>
>> Cc: Andrey Ignatov <rdna@fb.com>
>> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
>> ---
>>   include/uapi/linux/bpf.h | 184
>> +++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 184 insertions(+)
>>
>> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
>> index 15d9ccafebbe..7343af4196c8 100644
>> --- a/include/uapi/linux/bpf.h
>> +++ b/include/uapi/linux/bpf.h

[...]

>> @@ -1255,6 +1277,168 @@ union bpf_attr {
>>    *         performed again.
>>    *     Return
>>    *         0 on success, or a negative error in case of failure.
>> + *
>> + * int bpf_perf_event_read_value(struct bpf_map *map, u64 flags,
>> struct bpf_perf_event_value *buf, u32 buf_size)
>> + *     Description
>> + *         Read the value of a perf event counter, and store it into
>> *buf*
>> + *         of size *buf_size*. This helper relies on a *map* of type
>> + *         **BPF_MAP_TYPE_PERF_EVENT_ARRAY**. The nature of the perf
>> + *         event counter is selected at the creation of the *map*. The
> 
> The nature of the perf event counter is selected when *map* is updated
> with perf_event fd's.
> 

Thanks, I will fix it.

>> + *         *map* is an array whose size is the number of available CPU
>> + *         cores, and each cell contains a value relative to one
>> core. The
> 
> It is confusing to mix core/cpu here. Maybe just use perf_event
> convention, always using cpu?
> 

Right, I'll remove occurrences of "core".

>> + *         value to retrieve is indicated by *flags*, that contains the
>> + *         index of the core to look up, masked with
>> + *         **BPF_F_INDEX_MASK**. Alternatively, *flags* can be set to
>> + *         **BPF_F_CURRENT_CPU** to indicate that the value for the
>> + *         current CPU core should be retrieved.
>> + *
>> + *         This helper behaves in a way close to
>> + *         **bpf_perf_event_read**\ () helper, save that instead of
>> + *         just returning the value observed, it fills the *buf*
>> + *         structure. This allows for additional data to be
>> retrieved: in
>> + *         particular, the enabled and running times (in *buf*\
>> + *         **->enabled** and *buf*\ **->running**, respectively) are
>> + *         copied.
>> + *
>> + *         These values are interesting, because hardware PMU
>> (Performance
>> + *         Monitoring Unit) counters are limited resources. When
>> there are
>> + *         more PMU based perf events opened than available counters,
>> + *         kernel will multiplex these events so each event gets certain
>> + *         percentage (but not all) of the PMU time. In case that
>> + *         multiplexing happens, the number of samples or counter value
>> + *         will not reflect the case compared to when no multiplexing
>> + *         occurs. This makes comparison between different runs
>> difficult.
>> + *         Typically, the counter value should be normalized before
>> + *         comparing to other experiments. The usual normalization is
>> done
>> + *         as follows.
>> + *
>> + *         ::
>> + *
>> + *             normalized_counter = counter * t_enabled / t_running
>> + *
>> + *         Where t_enabled is the time enabled for event and
>> t_running is
>> + *         the time running for event since last normalization. The
>> + *         enabled and running times are accumulated since the perf
>> event
>> + *         open. To achieve scaling factor between two invocations of an
>> + *         eBPF program, users can can use CPU id as the key (which is
>> + *         typical for perf array usage model) to remember the previous
>> + *         value and do the calculation inside the eBPF program.
>> + *     Return
>> + *         0 on success, or a negative error in case of failure.
>> + *

[...]

Thanks Yonghong for the review!

I have a favor to ask of you. I got a bounce for Kaixu Xia's email
address, and I don't know what alternative email address I could use. I
CC-ed to have a review for helper bpf_perf_event_read() (in patch 6 of
this series), which is rather close to bpf_perf_event_read_value().
Would you mind having a look at that one too, please? The description is
not long.

Quentin
