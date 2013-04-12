From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: vdso(7): new man page
Date: Thu, 11 Apr 2013 21:28:09 -0400
Message-ID: <201304112128.10355.vapier@gentoo.org>
References: <201304092317.01590.vapier@gentoo.org> <CALCETrXwfpH=dRZ82MqjWWL0oFohigcUHgLPnRPpnisOHYxKQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1407297.opPDKytsSU";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALCETrXwfpH=dRZ82MqjWWL0oFohigcUHgLPnRPpnisOHYxKQQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1407297.opPDKytsSU
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 11 April 2013 14:31:55 Andy Lutomirski wrote:
> On Tue, Apr 9, 2013 at 8:17 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> > so i've slapped this together.  i think the HISTORY section could use
> > more filling out, but that'd probably be more for funsies rather than
> > usefulness.
>=20
> This looks good to me.  It may be worth mentioning that programs must
> not assume anything about where the vDSO is mapped -- that may change
> from kernel to kernel or exec to exec, unless the particular
> architecture makes some guarantee.

good idea

> > .SS Example Background
> > Making syscalls themselves can incur significant penalty.
> > In x86 systems, you can trigger a software interrupt (int $0x80) to tell
> > the kernel you wish to make a syscall.
> > Internally, this means the call has to go through the normal interrupt
> > layers to save/restore context before it even gets a chance to start
> > processing the system call.
> > Wouldn't it be nicer if you could start processing the system call
> > immediately? With newer revisions of the x86 architecture, there is now
> > a syscall/sysenter instruction that does exactly that (jumps directly to
> > the system call entry). However, rather than require the C library to
> > figure out if this functionality is available itself, the vDSO includes
> > symbols that can be used. This is typically referred to using the term
> > "vsyscall".
>=20
> I find this a bit confusing.  The term "vsyscall" means something
> different on x86_64, and syscall and sysenter are different
> instructions.  How about this:
>=20
> Making syscalls can be slow.
> In x86 32-bit systems, you can trigger a software interrupt (int
> $0x80) to tell the
> kernel you wish to make a syscall.  This instruction is expensive: it
> goes through the full interrupt handling paths in microcode and in the
> kernel.  Newer processors have faster, incompatible ways to issue
> system calls, and the kernel abstracts these through an entry point in
> the vdso.  (The terminology can be confusing.  On x86_32, this
> function is called __kernel_vsyscall, but on x86_64, the term
> "vsyscall" refers to an obsolete way to ask the kernel what time it is
> or what cpu the caller is on.)

i've merged in your suggestions.  is the current (small) HISTORY section=20
correct then ?  you can find it at the bottom of the page.
=2Dmike

--nextPart1407297.opPDKytsSU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRZ2MqAAoJEEFjO5/oN/WB/kAQAK7r1ggNo/Uhe2H3glEdyBkA
HJuCcQnmVY7kUZOBZLYx8hxoUqiCypk/fcKCCfPn7u+paCMddG5cwxvxhbpEGJ9O
gfaTus8T521Jm4LQGrakOanoqjMvTHV1Zlwd9ZkHtFvEVzluMGxAE4vqkY2ypKwD
SEObf2FHtlEeSgyqfgCGdSeHOQhMmlYyKQQ38IkR+tIXgmv+19uhTG5YKrk/VBSp
88PKJS7mRR/yCHlPWDa47SmnrH8RWVHBxC7VhGf/dYD477afa+V9lhy7e3T2n+qm
zqdGwUL7oCWwKEsZt9/v6bUNUTS1g7CNT2BoQK745OKAyp2LafiKB982dPypBiYE
VXPk2YxqbgQuKeyC2ci0jYg+Sj20FpxdP4S6A6yaCleT1Ov6cP+p7YUOs45kM5ql
WeiEu1nHoZqV4C8iszn76pLZynlGjVu3txitbFh9BpLJcjaApjLA3bDUh7Tr+1S8
utoZO6lqLTCsvvPyl6my7AfR5K7kWFEL+OLXl5Ef9/YDL1hT3UTx0Oj16v50rY0D
hR1QAeWyh1GEp1uSlgONXjBcQD7+jwMTOEMWeBZjTEVtRPCsjonkVPGVW8XPe4QN
RP+paF8+Nq9GNpgEkS7raVzZDNMpk6uE7k/GQaaacg2NZZCBdznz4T9JeFZkjZDY
BZ5tNQSEj8mMqw6aL5Vt
=Smh4
-----END PGP SIGNATURE-----

--nextPart1407297.opPDKytsSU--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
