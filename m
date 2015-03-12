From: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 man-pages] bpf.2: new page documenting bpf(2)
Date: Thu, 12 Mar 2015 08:51:42 -0700
Message-ID: <CAMEtUuz20LW+HkE-tcdnM9BSQGOO5zfCL5MfZMBbsOjPPbRTXA@mail.gmail.com>
References: <CAMEtUuxZrmqUvgBX5zNbEdExqPaNw0LUhFyGP=N9erVqeKwhSQ@mail.gmail.com>
 <5501B5BC.2010806@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5501B5BC.2010806-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Mar 12, 2015 at 8:50 AM, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
>
>
> Am 12.03.2015 16:20, schrieb Alexei Starovoitov:
>> On Thu, Mar 12, 2015 at 3:09 AM, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
>>>
>>>
>>>> +.SH DESCRIPTION
>>>> +.BR bpf()
>>>> +syscall is a multiplexor for a range of different operations on extended BPF
>>> syscall is a multiplexor for a range of different operations on extended
>>> Berkeley Packet Filter (eBPF).
>>>
>>> just introduce the abv. early as possible,
>>>
>>
>> I'd rather not. The universal feedback from everyone was
>> that eBPF name is ugly, awkward, hard to pronounce, hard to
>> remember, hard to spell, etc.
>> So I'm trying not to use it, if I can. Often when people
>> say 'bpf' they mean 'extended' one and
>> when they need to refer to old they say 'classic bpf'.
>
> it is not abut the (e) is about the BPF. you say "Berkeley Packet Filter"
> a few lines later. just move that in the first line where you are using BPF
> as abbreviation. It is good practice to have an explaination before using
> the abrev.

ahh. got it. ok. makes sense. will do.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
