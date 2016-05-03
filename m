From: =?iso-8859-1?Q?J=F6rn?= Engel <joern-BHEL68pLQRGGvPXPguhicg@public.gmane.org>
Subject: Re: get_mempolicy(2) type mismatch
Date: Mon, 2 May 2016 18:04:28 -0700
Message-ID: <20160503010428.GD9613@cork>
References: <20160503005821.GC9613@cork>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160503005821.GC9613@cork>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

[ Removed linux-fsdevel - shouldn't have been on Cc: ]

On Mon, May 02, 2016 at 05:58:21PM -0700, J=F6rn Engel wrote:
> The manpage seems to have the wrong type for "addr".
>=20
> Manpage:
>        int get_mempolicy(int *mode, unsigned long *nodemask,
>                          unsigned long maxnode, unsigned long addr,
>                          unsigned long flags);
>=20
> /usr/include/numaif.h:
> extern long get_mempolicy(int *policy, const unsigned long *nmask,
>                         unsigned long maxnode, void *addr, int flags)=
;

=46ound another problem.

"is always rounded to a multiple of sizeof(unsigned long)"

I suspect the rounding should be done to a multiple of BITS_PER_LONG, o=
r
"sizeof(unsigned long) * 8".

J=F6rn, wondering how many others actually care about NUMA

--
Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it.
-- Brian W. Kernighan
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
