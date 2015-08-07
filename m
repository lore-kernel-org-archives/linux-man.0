From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH man v4] bpf.2: various updates/follow-ups to address some
 fixmes
Date: Fri, 07 Aug 2015 14:31:41 +0200
Message-ID: <55C4A52D.4030007@gmail.com>
References: <e56dadb710e4beec76c02823933c232e19af025b.1438208478.git.daniel@iogearbox.net> <55C26D97.6090408@gmail.com> <55C2730E.1090807@iogearbox.net> <55C47D11.3040903@gmail.com> <55C4809F.7020900@iogearbox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55C4809F.7020900-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Daniel,

[...]
>>>>> When a jump into the new program has been performed,
>>>>> +it won't return to the old one anymore.
>>>>> +
>>>>> +If no eBPF program is found at the given index of the program ar=
ray,
>>>>
>>>> I find this language a little unclear. The array does not contain =
eBPF
>>>> programs, but rather file descriptors. So, what does "not found" h=
ere
>>>> really mean? (I added a FIXME.)
>>>
>>> Ok, it's a bit more complicated to explain I guess. So from user sp=
ace
>>> side, a lookup on that map type is not allowed. When user space add=
s a
>>> new file descriptor into the prog map, the kernel internally transl=
ates
>>> that to the actual program holds reference, etc. The tail call help=
er is
>>> mapped into a eBPF instruction, so no real helper call here. That i=
nstruction
>>> will then have a register setting as if we'd have a function call, =
so it
>>> has the lookup key and uses it directly to find the array slot. Fro=
m
>>> there, it has access to the actual underlying program. "Not found" =
means
>>> conditions mentioned as earlier above.
>>
>> Okay I've changed that paragraph to now read:
>>
>>                If no eBPF program is found at the given index of the=
 pro=E2=80=90
>>                gram  array  (because the map slot doesn't contain a =
valid
>>                program file descriptor, the specified lookup index/k=
ey is
>>                out  of  bounds,  or the limit of 32 nested calls has=
 been
>>                exceed) execution continues with the current eBPF pro=
gram.
>>                This can be used as a fall-through for default cases.
>>
>> Okay?
>=20
> Works for me, thanks!

Thanks for checking.

> I'll drop you some more patches on remaining items, at the very lates=
t after
> LinuxCon NA & Plumbers.

Thanks. The page is already looking a lot better than the version that =
went
out with the last man-pages release.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
