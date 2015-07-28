From: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Subject: Re: [PATCH man] ebpf.2: various updates to address some fixmes
Date: Tue, 28 Jul 2015 19:35:42 +0200
Message-ID: <55B7BD6E.4080205@iogearbox.net>
References: <a8aa1bd1ddb4cd90a26887f2ce68d79c1e1e4c1f.1438097188.git.daniel@iogearbox.net> <55B7BB08.9070608@plumgrid.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B7BB08.9070608-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/28/2015 07:25 PM, Alexei Starovoitov wrote:
> On 7/28/15 8:29 AM, Daniel Borkmann wrote:
>> +.BR __sync_fetch_and_add()
>> +can be used on map values in case the map has a value_size of sizeof(long).
>> +This is quite often useful for aggregation and accounting of events.
>
> The above is a bit not clear, since both u32 and u64 can be used
> as atomic counters.

Right, it's unclear indeed. Perhaps the sizeof(long) should be dropped and
it should say instead "the map has a value_size of 4 or 8 bytes".

Thanks,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
