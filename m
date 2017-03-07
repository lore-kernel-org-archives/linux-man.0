From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: syscall(2)
Date: Tue, 7 Mar 2017 17:51:47 -0500
Message-ID: <20170307225147.GN28432@vapier>
References: <CABLBYvTBKvQXSmiGx3LOUoFHZDGAMmNCofcuHTiKW51kS2bh4g@mail.gmail.com>
 <CAKgNAkg1iRisrd18WHn64j1NWAs2T0hrsc7dRoZs4XPV_22uhA@mail.gmail.com>
 <20170306190803.GJ28432@vapier>
 <58BEA1F3.2070502@bfs.de>
 <CABLBYvRKpgpg9cHMksP3v0StizrZKKYO0ih4E90vc7dti4cgfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="g0njxxOb8Ykox0cX"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CABLBYvRKpgpg9cHMksP3v0StizrZKKYO0ih4E90vc7dti4cgfw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Victor Khimenko <khim-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: wharms-fPG8STNUNVg@public.gmane.org, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--g0njxxOb8Ykox0cX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07 Mar 2017 22:51, Victor Khimenko wrote:
> On Tue, Mar 7, 2017 at 1:05 PM, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:
> > Am 06.03.2017 20:08, schrieb Mike Frysinger:
> >> On 06 Mar 2017 12:01, Michael Kerrisk (man-pages) wrote:
> >>> [Extending the CC for some other input. Changhee Han added the text
> >>> that you are asking about; Mike F has done a lot of other work on the
> >>> page. Perhaps they can comment.]
> >>>
> >>> On 5 March 2017 at 09:08, Victor Khimenko <khim-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> >>>> syscall(2) example includes the following snippet which explains how=
 to
> >>>> call readahead on ARM:
> >>>>
> >>>>        syscall(SYS_readahead, fd, 0,
> >>>>                    (unsigned int) (offset >> 32),
> >>>>                    (unsigned int) (offset & 0xFFFFFFFF),
> >>>>                    count);
> >>>>
> >>>> But ARM EABI specifies that "A double-word sized type is passed in t=
wo
> >>>> consecutive registers (e.g., r0 and r1, or r2 and r3). The content of
> >>>> the registers is as if the value had been loaded from memory represe=
ntation
> >>>> with a single LDM instruction."
> >>>>
> >>>> This would imply that arguments are swapped around in the man page, =
no?
> >>>
> >>> So, I'm taking it that you mean the call should look like this:
> >>>
> >>>        syscall(SYS_readahead, fd, 0,
> >>>                    (unsigned int) (offset & 0xFFFFFFFF),
> >>>                    (unsigned int) (offset >> 32),
> >>>                   count);
> >>>
> >>> Is that what you mean?
> >>>
> >>>> I've tried to experiement and with ftruncate, at least, it works like
> >>>> this...
> >>>
> >>> Sounds plausible. I'm hoping that Mike or Changhee Han might comment.
> >>
> >> it depends on the endianness.  the man page shows BE, and Victor's
> >> suggestion changes it to LE.  we probably need to explain that and
> >> not just swap the args in the example.
> >> -mike
> >
> >
> > I think that the point is: "invokes the system call whose assembly lang=
uage interface"
> >
> > And a lot of new programmes have no experience with assembler these day=
s. So the example
> > should go into more details an explain how this is mapped into register=
s.
> > e.g. ARM/EABI
> >           syscall(SYS_readahead,                    // r7
> >                    fd,                              // r0
> >                     0,                              // r1
> >                    (unsigned int) (offset >> 32),   // r2
> >                    (unsigned int) (offset & 0xFFFFFFFF), // r3
> >                    count);                         //r4
> >
> > Then the next lines make more sense for the reader:
> > "       Since  the  offset  argument is 64 bits, and the first argument=
 (fd) is
> >        passed in r0, the caller must manually split and align the 64-bi=
t value
> >        so  that it is passed in the r2/r3 register pair.  That means in=
serting
> >        a dummy value into r1 (the second argument of 0)."
> >
> > then adding something like pitfalls:
> > The programmer needs to be aware of the endianess of is cpu. Big Endian=
 CPU will
> > need to swap arguments.
> >
> > @khim-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
> > what do you think ?
>=20
> Well, as long as explanation is correct - I'm happy. Would probably
> good idea to convert example to Little Endian and mention that "Big
> Endian CPU would swap r2 and r3 arguments".
>=20
> Nowadays most platforms (including most ARM platforms) are Little
> Endian thus it looks a bit weird to have Big Endian ARM as canonical
> example!
>=20
> Heck, preadv/pwritev use low/high even on Big Endian platform!
>=20
> See https://lwn.net/Articles/311630/
>=20
> That's how I become involved with all that mess: I've tried to
> understand the difference between __llseek, pread64 and preadv
> syscalls. __llseek uses "hi, lo" arguments order, preadv uses "lo, hi"
> and pread64... that's where I've started trying to decypher syscall(2)
> man page...

i think your concerns boil down to "the Linux syscall ABI is ugly and
inconsistent".  it is.  some syscalls split 64-bit args naturally, but
some don't.

ARM EABI plumbs the readahead syscall directly to userspace.  that means
the 64-bit value is split according to its low level C ABI.  same for
pread and pread64.  ARM OABI didn't include the padding.

llseek on the other hand takes care of assembling the two 32-bit values
itself in C.

that's why the syscall(2) page contains this caveat:
	However, when using syscall() to make a system call, the caller
	might need to handle architecture-dependent details;
	^^^^^

we can mention the endian issue, but we don't want this page to grow
into details for every syscall.  that's a much larger project that we
discussed at the last LPC.
-mike

--g0njxxOb8Ykox0cX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEuQK1JxMl+JKsJRrUQWM7n+g39YEFAli/OYMACgkQQWM7n+g3
9YEc3RAAqYIduJXCfA0JSRel7/hmqpcQKLOG56RHHVsYP0Mp3Ocpkh1u7Ko6V7I4
1SbZHdCilqvqF115sM7w3nTNVMEYIw/eZrR53HwBznInB33nnxmC0dMYecOFYWRz
pQsxAe6cL7gWdFQsHc4lGQxVgU6WG9U1Hofri7WXE0OJOZFrk008qx9rFrZPmjgV
hP7L5mpFyi/M1u7UskaLzr5qM7oNvT8RcxpxbUSINR1exvlpvISZtLNkbKYVBOZK
h0II41sW/YT4TKdXNZd8kK0IgNCpbTvSD1pELCtGy5jmb/AFFSNYooqoBQD1j5JP
Z2ti17Gn8FrW4TWuSJw9z2umhqrJMkb/dgJqvLa2yJhXxHkxrhctc+AxFshMbTIB
36Pnia5ekZYW5s+IO5eiFWaV8bkS6E7ZcnQDKc9v1yaBZkOgST5VpNyNPcozSzyu
qIpb9lh0Mi8Ts0RCNIMaP9j6RizPzdon2/HzRq3ZE1QP60bEdvHJhouyPCukq9dQ
5P87qh3awNLJO9sUPK3i10dVhBNowzM6ClM8guIOHrFSQfsxgB/koDqwr9tuLLRi
SVnWAl3UrW9BfMBBpgxUa6zSJLcCE49WaY+GMlYze/FpGzneNEmf/4hcACTAvCLB
Udt4gBuygnDZyoFDbkCKxpy1/Rs0FrcYRX9lXnK5RNNrcvEX5Pg=
=pwc+
-----END PGP SIGNATURE-----

--g0njxxOb8Ykox0cX--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
