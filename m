From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: clock_gettime.2: _COARSE clocks are not always faster...
Date: Mon, 18 Apr 2016 16:23:24 +0100
Message-ID: <5714FBEC.80209@gmail.com>
References: <87k2k67ml4.fsf@rasmusvillemoes.dk> <5714F972.6080603@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5714F972.6080603-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/18/2016 04:12 PM, Michael Kerrisk (man-pages) wrote:
> Hello Rasmus,
>=20
> On 04/09/2016 05:50 PM, Rasmus Villemoes wrote:
>> Hi Michael
>>
>> The other day, I was curious how the vdso was implemented on ppc, an=
d I
>> noted that neither ppc32 or ppc64 handle the _COARSE versions of
>> CLOCK_{REALTIME,MONOTONIC} in the vdso, so they fall back to an actu=
al
>> syscall. And sure enough, measuring CLOCK_MONOTONIC
>> vs. CLOCK_MONOTONIC_COARSE shows that the latter has three times as =
much
>> overhead as the former.
>>
>> Whether it's worth adding a note to the man page is up to you.
>=20
> I think it's useful to do so. For both *COARSE flags, I added:
>=20
> [[
> Requires per-architecture support, and probably also architecture sup=
port
> for this flag in the vdso(7).
> ]]

And in the PowerPC sections of vdso(7), I added:

       The CLOCK_REALTIME_COARSE and CLOCK_MONOTONIC_COARSE clocks are
       not   supported   by   the   __kernel_clock_getres  and  __ker=E2=
=80=90
       nel_clock_gettime interfaces; the kernel falls back to the real
       system call.

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
