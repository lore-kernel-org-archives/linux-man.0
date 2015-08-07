From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH man v4] bpf.2: various updates/follow-ups to address some
 fixmes
Date: Fri, 07 Aug 2015 11:40:33 +0200
Message-ID: <55C47D11.3040903@gmail.com>
References: <e56dadb710e4beec76c02823933c232e19af025b.1438208478.git.daniel@iogearbox.net> <55C26D97.6090408@gmail.com> <55C2730E.1090807@iogearbox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55C2730E.1090807-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Daniel,

Thanks for the follow up.

On 08/05/2015 10:33 PM, Daniel Borkmann wrote:
> On 08/05/2015 10:09 PM, Michael Kerrisk (man-pages) wrote:
> ...
>>> +returning back.
>>> +The level of nesting has a fixed limit of 32, so that infinite loo=
ps cannot
>>
>> Where is that limit of 32 defined, by the way?
>=20
> Currently, an implementation detail in the kernel, so not exposed und=
er uapi.
> It's MAX_TAIL_CALL_CNT in include/linux/bpf.h.

Thanks, I dropped a comment into the page source.

>>> +be crafted.
>>> +During runtime, the program file descriptors stored in that map ca=
n be modified,
>>> +so program functionality can be altered based on specific requirem=
ents.
>>> +All programs stored in such a map have been loaded into the kernel=
 via
>>> +.BR bpf ()
>>> +as well.
>>> +In case a lookup has failed, the current program continues its exe=
cution.
>>
>> What are the possible causes of failure? It may be worth saying some=
thing about
>> this in the man page.
>=20
> That the map slot doesn't contain a program file descriptor, that the
> used lookup index/key is out of bounds, or that we've exceeded the ma=
ximum
> nesting (MAX_TAIL_CALL_CNT).

Okay thanks. See below.

>> (For future patches, please start new sentences on new lines.)
>=20
> Okay, I guess I still have to get used to it, sorry.
>=20
>>> +A program array map is a special kind of array map, whose map valu=
es only
>>> +contain valid file descriptors to other eBPF programs. Thus both t=
he
>>> +key_size and value_size must be exactly four bytes.
>>> +This map is used in conjunction with the
>>> +.BR bpf_tail_call()
>>> +helper.
>>
>> Is this caller already in mainline? I could not find it in the curre=
nt rc?
>=20
> It's since commit 04fd61ab36ec ("bpf: allow bpf programs to tail-call=
 other
> bpf programs").

Got it. (I thought I was looking in the -rc before, but I was confused.=
)

>>> +and therefore replace its own program flow with the one from the p=
rogram
>>> +at the given program array slot if present. This can be regarded a=
s kind
>>> +of a jump table to a different eBPF program. The invoked program w=
ill then
>>> +reuse the same stack.
>>
>> Are there any implications of the fact that it uses the same stack
>> that should be mentioned in the man page?
>=20
> Due to the stack reuse better performance.

Okay.

>>> When a jump into the new program has been performed,
>>> +it won't return to the old one anymore.
>>> +
>>> +If no eBPF program is found at the given index of the program arra=
y,
>>
>> I find this language a little unclear. The array does not contain eB=
PF
>> programs, but rather file descriptors. So, what does "not found" her=
e
>> really mean? (I added a FIXME.)
>=20
> Ok, it's a bit more complicated to explain I guess. So from user spac=
e
> side, a lookup on that map type is not allowed. When user space adds =
a
> new file descriptor into the prog map, the kernel internally translat=
es
> that to the actual program holds reference, etc. The tail call helper=
 is
> mapped into a eBPF instruction, so no real helper call here. That ins=
truction
> will then have a register setting as if we'd have a function call, so=
 it
> has the lookup key and uses it directly to find the array slot. From
> there, it has access to the actual underlying program. "Not found" me=
ans
> conditions mentioned as earlier above.

Okay I've changed that paragraph to now read:

              If no eBPF program is found at the given index of the pro=
=E2=80=90
              gram  array  (because the map slot doesn't contain a vali=
d
              program file descriptor, the specified lookup index/key i=
s
              out  of  bounds,  or the limit of 32 nested calls has bee=
n
              exceed) execution continues with the current eBPF program=
=2E
              This can be used as a fall-through for default cases.

Okay?

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
