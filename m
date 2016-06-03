From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: get_mempolicy(2) type mismatch
Date: Thu, 2 Jun 2016 21:34:24 -0500
Message-ID: <7415bda7-c018-0efa-5799-53666465f3c0@gmail.com>
References: <20160503005821.GC9613@cork> <20160503010428.GD9613@cork>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160503010428.GD9613@cork>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?J=c3=b6rn_Engel?= <joern-BHEL68pLQRGGvPXPguhicg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi J=F6rn,

On 05/02/2016 08:04 PM, J=F6rn Engel wrote:
> [ Removed linux-fsdevel - shouldn't have been on Cc: ]
>=20
> On Mon, May 02, 2016 at 05:58:21PM -0700, J=F6rn Engel wrote:
>> The manpage seems to have the wrong type for "addr".
>>
>> Manpage:
>>        int get_mempolicy(int *mode, unsigned long *nodemask,
>>                          unsigned long maxnode, unsigned long addr,
>>                          unsigned long flags);
>>
>> /usr/include/numaif.h:
>> extern long get_mempolicy(int *policy, const unsigned long *nmask,
>>                         unsigned long maxnode, void *addr, int flags=
);
>=20
> Found another problem.
>=20
> "is always rounded to a multiple of sizeof(unsigned long)"
>=20
> I suspect the rounding should be done to a multiple of BITS_PER_LONG,=
 or
> "sizeof(unsigned long) * 8".

It looks to me like you are right, but with reports like this, it's
really helpful if you provide me some context on why you drew the
conclusion. That makes things much easier to check.

=46or example, you could cite pieces of code such as the following in
mm/mempolicy.c::COMPAT_SYSCALL_DEFINE5(get_mempolicy):

        nr_bits =3D min_t(unsigned long, maxnode-1, MAX_NUMNODES);
        alloc_size =3D ALIGN(nr_bits, BITS_PER_LONG) / 8;

> J=F6rn, wondering how many others actually care about NUMA

Intersection of the set of people who care about both
NUMA and docs is evidently small... Thanks for taking care.

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
