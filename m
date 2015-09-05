From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Seccomp questions for updates to seccomp(2) man page
Date: Sat, 05 Sep 2015 09:01:41 +0200
Message-ID: <55EA9355.8090501@gmail.com>
References: <CAKgNAkj8Yboqeq4nB+DbM2K76w3eiwnaUVCoSRzv=r-YGHy5uQ@mail.gmail.com> <CAGXu5j+__DYvHE36B3SfRAv6t+CP6WRvoAcVSusUXP_J7zO17w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGXu5j+__DYvHE36B3SfRAv6t+CP6WRvoAcVSusUXP_J7zO17w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Will Drewry <wad-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>, Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Kees,

On 08/27/2015 06:32 AM, Kees Cook wrote:
> On Wed, Aug 26, 2015 at 6:42 PM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello Kees, Will,
>>
>> In recent times I've been asked a couple of questions about seccomp(=
),
>> and it seems like it would be worthwhile to include these topics in
>> the seccomp(2) man page. Would you be able to help out with some
>> answers?
>>
>> =3D=3D=3D Use of the instruction pointer in seccomp filters =3D=3D=3D
>>
>> The seccomp_data describing the system call includes the process's
>> instruction pointer value. What use can be made of this information?
>=20
> Will may have some other history to add here, but it seemed like it
> was a handy thing to add, as it's a dynamic value attached to the
> execution environment. I'm actually not aware of any programs that
> build filters with reference to it.
>=20
>> My best guess is that you can use this information in conjunction wi=
th
>> /proc/PID/maps to introspect the process layout and thus construct
>> filters that conditionally operate based on which DSO is performing =
a
>> system call. Is that a reasonable use case? Are there others?
>=20
> That's reasonable. Filters limiting syscalls to certain memory ranges
> would likely also want to lock down mmap and mprotect calls, to stop
> anything malicious from trying to sneak into the protected range.

Thanks. I've added this text to the page:

       The  instruction_pointer  field  provides  the  address  of   th=
e
       machine-language  instruction  that  performed  the  system call=
=2E
       This  might  be  useful  in   conjunction   with   the   use   o=
f
       /proc/[pid]/maps  to  perform  checks based on which region (map=
=E2=80=90
       ping) of the program made the system call.  (Probably, it is wis=
e
       to  lock down the mmap(2) and mprotect(2) system calls to preven=
t
       the program from subverting such checks.)


>> =3D=3D=3D Chained seccomp filters and SECCOMP_RET_KILL =3D=3D=3D
>>
>> The man page describes the behavior when multiple filter are install=
ed
>>
>>        If  multiple  filters  exist, they are all executed, in rever=
se
>>        order of their addition to the  filter  tree  (i.e.,  the  mo=
st
>>        recently installed filter is executed first).  The return val=
ue
>>        for the evaluation of a given system  call  is  the  first-se=
en
>>        SECCOMP_RET_ACTION  value of highest precedence (along with i=
ts
>>        accompanying data) returned by execution of all of the filter=
s.
>>
>> The question is: suppose one of the early filters returns
>> SECCOMP_RET_KILL (which is the highest priority action), what is the
>> purpose of executing the remaining filters. My best guess is that th=
is
>> about preventing the user from discovering which filter rule causes
>> the sandboxed program to fail. Is this correct, or is there another
>> reason?
>=20
> It's just because it would be an optimization that would only speed u=
p
> the RET_KILL case, but it's the uncommon one and the one that doesn't
> benefit meaningfully from such a change (you need to kill the process
> really quickly?). We would speed up killing a program at the (albeit
> tiny) expense to all other filtered programs. Best to keep the filter
> execution logic clear, simple, and as fast as possible for all
> filters.

Ahh -- that makes sense. Perhaps it is excessive, but I've noted this
in the page, since I've run across people puzzled by this behavior,
and I recall myself being puzzled about it when I noticed it as well:

       (Note  that  all filters will be called even if one of the
       earlier filters returns SECCOMP_RET_KILL.  This is done to
       simplify the kernel code and to provide a tiny speed-up in
       the execution of sets of filters by avoiding a  check  for
       this uncommon case.)

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
