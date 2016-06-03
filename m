From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: get_mempolicy(2) type mismatch
Date: Thu, 2 Jun 2016 21:19:32 -0500
Message-ID: <d8350bd1-943f-37d6-4f1e-3571e8801380@gmail.com>
References: <20160503005821.GC9613@cork>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20160503005821.GC9613@cork>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: mtk.manpages@gmail.com, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On 05/02/2016 07:58 PM, J=F6rn Engel wrote:
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
>=20
> J=F6rn

Hmmm -- it seems that the numactl package headers differ from the=20
kernel headers (where the man page is accurate). But, it seems like=20
the man page should reflect what's in the user-space header file, so=20
I fixed it to be=20

    void *addr

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
