From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] man2 : syscall.2 : document syscall calling conventions
Date: Tue, 2 Apr 2013 19:17:16 -0400
Message-ID: <201304021917.17659.vapier@gentoo.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <201304010632.41520.vapier@gentoo.org> <CAKgNAkgG2kdCC1tyZQkYU7O_nP7RB8VoCmx6eb8FcudU1s6RgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3068683.g4iKsJ0JL5";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgG2kdCC1tyZQkYU7O_nP7RB8VoCmx6eb8FcudU1s6RgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--nextPart3068683.g4iKsJ0JL5
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 02 April 2013 02:54:39 Michael Kerrisk (man-pages) wrote:
> On Mon, Apr 1, 2013 at 12:32 PM, Mike Frysinger wrote:
> > On Monday 01 April 2013 05:29:11 Michael Kerrisk (man-pages) wrote:
> >> On Mon, Apr 1, 2013 at 10:29 AM, Mike Frysinger wrote:
> >> > on a related topic, would it be useful to document the exact calling
> >> > convention for architecture system calls ?  from time to time, i need
> >> > to reference this, and i inevitably turn to a variety of sources to
> >> > dig up the answer (the kernel itself, or strace, or qemu, or glibc,
> >> > or uClibc, or lss, or other random places).  i would find it handy to
> >> > have all of these in a single location.
> >>=20
> >> Sounds like it would be useful to have that documented. Would you have
> >> a chance to write patches for that?
> >=20
> > should we do it in syscall(2) ?  or a dedicated man page ?
>=20
> It's a little hard to say until I see the shape of what comes. Can you
> provide a rough per-syscall example or two of what you expect to
> document? (Don't write too concrete a patch yet, until I can get a
> handle on what you intend.)

this renders nicely i think.  it shows most of the stuff i'm interested in.
might be useful to add a dedicated section covering the clobbers in the
future.
=2Dmike

=2D-- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -79,6 +79,35 @@ and an error code is stored in
 .BR syscall ()
 first appeared in
 4BSD.
+.SS Architecture calling conventions
+Every architecture has its own way of invoking & passing arguments to the
+kernel.
+Note that the instruction listed below might not be the fastest or best wa=
y to
+transition to the kernel, so you might have to refer to the VDSO.
+Also note that this doesn't cover the entire calling convention -- some
+architectures may indiscriminately clobber other registers not listed here.
+.if t \{\
+.ft CW
+\}
+.TS
+l l l l l l l l l l l.
+arch/ABI	insn	NR	ret	arg1	arg2	arg3	arg4	arg5	arg6	arg7
+_
+arm/OABI	swi NR;	-	a1	a1	a2	a3	a4	v1	v2	v3
+arm/EABI	swi 0x0;	r7	r1	r1	r2	r3	r4	r5	r6	r7
+bfin	excpt 0x0;	P0	R0	R0	R1	R2	R3	R4	R5	-
+i386	int $0x80;	eax	eax	ebx	ecx	edx	esi	edi	ebp	-
+ia64	break 0x100000;	r15	r10/r8	r11	r9	r10	r14	r15	r13	-
+.\" not sure about insn or NR
+.\" parisc	ble 0x100(%%sr2, %%r0);	-	r28	r26	r25	r24	r23	r22	r21	-
+sparc/32	t 0x10;	g1	o0	o0	o1	o2	o3	o4	o5	-
+sparc/64	t 0x6d;	g1	o0	o0	o1	o2	o3	o4	o5	-
+x86_64	syscall;	rax	rax	rdi	rsi	rdx	r10	r8	r9	-
+.TE
+.if t \{\
+.in
+.ft P
+\}
 .SS Architecture-specific requirements
 Each architecture ABI has its own requirements on how
 system call arguments are passed to the kernel.

--nextPart3068683.g4iKsJ0JL5
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRW2b9AAoJEEFjO5/oN/WB6+0P/0vX8VicifnP5cn4/5ivx1QE
ZHk6rWVlap+cYViXOjQfvzgG0FeuB75Qf5DqRMp4RZO1FgI6qNsI++ipfHDsl4yU
O33MJz7noXRfk1YpX2tfv8q5MROpTswwPs6srfoYYW7JYsYdeCONT97ADssJzDfr
CBVAeNRFOnvSTZscnjSaJU8kYklGGzitLsQf5ivdSBXvZXt8qoIL1KFT3QUlP86W
3tJyK+0eZ3TrGuvDXnKo8/qN0vRCjFm1oA0pCbkNQZojstQJk1n8QCRJpgSSNonz
6j1EF4/KOo+5mpMI+YwtrFs4PBI31C+5HNNIUdiuSPGLysqm1mg/vQ01tGyZuxW3
t5h+vkfWrptNh1lPqC8UVOcRsjZ2Zt2Fj+/ZYjrTltla3Q74e6TZusVqc3pBzkzv
hnPUFRdl8Oyt7Ed/dd78QX/tYXqqqXumHJ9u9YFb/ZTEkBJfxnfOfS+T/RM6e5xN
M0VOTfQvzFPEw1JsVgRomHRKv+lHYFepQXF10F5b9aR3f5F/yJor3JXYlbV02TNA
U4tilmRBpEQcXlK+9CLneJJT3VLQ0Hy/SGECpjAkb5thTuxkLRPIYsgckt1cywAT
KvJRVOUojYiyTJG31jelhxM/n2r4HLNVJYJb29Lb7tXh0nRrr1zSFtqA/Ajma0AO
7UKfzxE82w+IxoMw6nNK
=KoKn
-----END PGP SIGNATURE-----

--nextPart3068683.g4iKsJ0JL5--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
