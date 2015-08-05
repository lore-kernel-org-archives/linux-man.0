From: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Subject: Re: [PATCH man v4] bpf.2: various updates/follow-ups to address some
 fixmes
Date: Wed, 05 Aug 2015 22:33:18 +0200
Message-ID: <55C2730E.1090807@iogearbox.net>
References: <e56dadb710e4beec76c02823933c232e19af025b.1438208478.git.daniel@iogearbox.net> <55C26D97.6090408@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55C26D97.6090408-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/05/2015 10:09 PM, Michael Kerrisk (man-pages) wrote:
...
>> +There's one special map type which is a program array.
>> +This map stores file descriptors to other eBPF programs.
>> +Thus, when a lookup in that map is performed, the program flow is
>> +redirected in-place to the beginning of the new eBPF program without
>
> I changed "of the new" to "of another". Okay.

Okay, thanks.

>> +returning back.
>> +The level of nesting has a fixed limit of 32, so that infinite loops cannot
>
> Where is that limit of 32 defined, by the way?

Currently, an implementation detail in the kernel, so not exposed under uapi.
It's MAX_TAIL_CALL_CNT in include/linux/bpf.h.

>> +be crafted.
>> +During runtime, the program file descriptors stored in that map can be modified,
>> +so program functionality can be altered based on specific requirements.
>> +All programs stored in such a map have been loaded into the kernel via
>> +.BR bpf ()
>> +as well.
>> +In case a lookup has failed, the current program continues its execution.
>
> What are the possible causes of failure? It may be worth saying something about
> this in the man page.

That the map slot doesn't contain a program file descriptor, that the
used lookup index/key is out of bounds, or that we've exceeded the maximum
nesting (MAX_TAIL_CALL_CNT).

> (For future patches, please start new sentences on new lines.)

Okay, I guess I still have to get used to it, sorry.

>> +A program array map is a special kind of array map, whose map values only
>> +contain valid file descriptors to other eBPF programs. Thus both the
>> +key_size and value_size must be exactly four bytes.
>> +This map is used in conjunction with the
>> +.BR bpf_tail_call()
>> +helper.
>
> Is this caller already in mainline? I could not find it in the current rc?

It's since commit 04fd61ab36ec ("bpf: allow bpf programs to tail-call other
bpf programs").

>> +and therefore replace its own program flow with the one from the program
>> +at the given program array slot if present. This can be regarded as kind
>> +of a jump table to a different eBPF program. The invoked program will then
>> +reuse the same stack.
>
> Are there any implications of the fact that it uses the same stack
> that should be mentioned in the man page?

Due to the stack reuse better performance.

>> When a jump into the new program has been performed,
>> +it won't return to the old one anymore.
>> +
>> +If no eBPF program is found at the given index of the program array,
>
> I find this language a little unclear. The array does not contain eBPF
> programs, but rather file descriptors. So, what does "not found" here
> really mean? (I added a FIXME.)

Ok, it's a bit more complicated to explain I guess. So from user space
side, a lookup on that map type is not allowed. When user space adds a
new file descriptor into the prog map, the kernel internally translates
that to the actual program holds reference, etc. The tail call helper is
mapped into a eBPF instruction, so no real helper call here. That instruction
will then have a register setting as if we'd have a function call, so it
has the lookup key and uses it directly to find the array slot. From
there, it has access to the actual underlying program. "Not found" means
conditions mentioned as earlier above.

Thanks,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
