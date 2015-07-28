From: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH man] ebpf.2: various updates to address some fixmes
Date: Tue, 28 Jul 2015 11:01:20 -0700
Message-ID: <55B7C370.1050708@plumgrid.com>
References: <a8aa1bd1ddb4cd90a26887f2ce68d79c1e1e4c1f.1438097188.git.daniel@iogearbox.net>
 <55B7BB08.9070608@plumgrid.com> <55B7BD6E.4080205@iogearbox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B7BD6E.4080205-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 7/28/15 10:35 AM, Daniel Borkmann wrote:
> On 07/28/2015 07:25 PM, Alexei Starovoitov wrote:
>> On 7/28/15 8:29 AM, Daniel Borkmann wrote:
>>> +.BR __sync_fetch_and_add()
>>> +can be used on map values in case the map has a value_size of
>>> sizeof(long).
>>> +This is quite often useful for aggregation and accounting of events.
>>
>> The above is a bit not clear, since both u32 and u64 can be used
>> as atomic counters.
>
> Right, it's unclear indeed. Perhaps the sizeof(long) should be dropped and
> it should say instead "the map has a value_size of 4 or 8 bytes".

that also probably not ideal, since value_size == sizeof(struct elemval)
struct elemval {
   u64 packet_rx;
   u64 byte_rx;
   u32 another_counter;
   ...
   u32 some_useful_field;
};
so the program can keep multiple counters in each map element.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
