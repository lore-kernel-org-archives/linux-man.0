From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: New random(7) page for review
Date: Sat, 12 Nov 2016 13:25:11 +0100
Message-ID: <cb25213c-a70d-cbf1-6a42-959dcdc1f202@gmail.com>
References: <1461574090.32558.45.camel@redhat.com>
 <1470052099.2926.6.camel@redhat.com> <1476952646.2522.10.camel@redhat.com>
 <b07fb334-149d-cf65-74f3-1d1951e5981b@gmail.com>
 <1478768067.2642.23.camel@redhat.com>
 <e5c1f87c-aad0-b526-a346-74348a36c2a3@gmail.com>
 <1478778837.2642.26.camel@redhat.com>
 <05152136-6943-8ada-3d65-51ef4ce9c1b1@gmail.com>
 <4a8c573c-0c19-29d0-248e-74c088968806@gmail.com>
 <d5eca965-c8b9-51e5-6acb-172e47f85ba0@supelec.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------8C27D6C5D9081D335F74E2CD"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d5eca965-c8b9-51e5-6acb-172e47f85ba0-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, =?UTF-8?Q?Thomas_H=c3=bchn?= <t@2uo.de>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------8C27D6C5D9081D335F74E2CD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hello all,

Following on from our discussions about the random(4)
page, and a suggestion from Laurent, I've created
a random(7) page that provides a short overview of
the APIs for obtaining randomness, and some comparisons
and recommendations for using those APIs. A good part of
the text is relocated from the existing getrandom(2) and
random(4) pages. I also incorporated a table that was
proposed by Laurent that compares the APIs on a number
of points.

The rendered version of the page is below. The source is
attached (and already pushed to Git.) 

Does anyone see any further tweaks that might be required?

Cheers,

Michael


RANDOM(7)              Linux Programmer's Manual             RANDOM(7)

NAME
    random - overview of interfaces for obtaining randomness

DESCRIPTION
    The kernel provides the following interfaces to the kernel's cryp‐
    tographically secure pseudorandom number generator (CSPRNG):

    *  The /dev/urandom and /dev/random  devices,  both  described  in
       random(4).   These  devices  have  been  present on Linux since
       early times.

    *  The getrandom(2) system call, available since Linux 3.17.  This
       system  call  provides  access  either  to  the  same source as
       /dev/urandom (called the urandom source in this page) or to the
       same  source  as  /dev/random (called the random source in this
       page).  The default is the urandom source; the random source is
       selected by specifying the GRND_RANDOM flag to the system call.

Initialization of the entropy pool
    The  kernel collects bits of entropy from the environment.  When a
    sufficient number of random bits has been collected,  the  urandom
    entropy pool is considered to be initialized.

Choice of random device
    Unless you are doing long-term key generation (and most likely not
    even then), you probably shouldn't be using getrandom(2) with  the
    GRND_RANDOM flag or the /dev/random device.

    Instead,  use  either getrandom(2) without the GRND_RANDOM flag or
    the /dev/urandom device.  The cryptographic  algorithms  used  for
    the urandom source are quite conservative, and so should be suffi‐
    cient for all purposes.

    The disadvantage of GRND_RANDOM and reads from /dev/random is that
    the  operation can block.  Furthermore, dealing with the partially
    fulfilled requests that can occur when using GRND_RANDOM  or  when
    reading from /dev/random increases code complexity.

Usage recommendations
    The kernel random-number generator relies on entropy gathered from
    device drivers and other sources of environmental  noise.   It  is
    designed  to  produce a small amount of high-quality seed material
    to seed a cryptographically secure pseudorandom  number  generator
    (CSPRNG).   It  is designed for security, not speed, and is poorly
    suited to generating large amounts of cryptographic  random  data.
    Users  should  be  economical  in the amount of seed material that
    they consume  via  getrandom(2),  /dev/urandom,  and  /dev/random.
    Consuming  unnecessarily large quantities of data via these inter‐
    faces will have a negative impact on other  consumers  of  random‐
    ness.

    These interfaces should not be used to provide large quantities of
    data for Monte  Carlo  simulations  or  other  programs/algorithms
    which  are  doing  probabilistic  sampling.  Indeed, such usage is
    unnecessary (and will be slow).  Instead, use these interfaces  to
    provide  a  small amount of data used to seed a user-space pseudo‐
    random number generator for use by such applications.

Comparison between getrandom, /dev/urandom, and /dev/random
    The following table summarizes the behavior of the various  inter‐
    faces  that  can be used to obtain randomness.  GRND_NONBLOCK is a
    flag that can be used to control the blocking behavior of  getran‐
    dom(2).

    ┌──────────────┬──────────────┬──────────────────┬────────────────────┐
    │Interface     │ Pool         │ Blocking         │ Behavior in early  │
    │              │              │ behavior         │ boot time          │
    ├──────────────┼──────────────┼──────────────────┼────────────────────┤
    │/dev/random   │ Blocking     │ If entropy too   │ Blocks until       │
    │              │ pool         │ low, block until │ enough entropy     │
    │              │              │ there is enough  │ gathered           │
    │              │              │ entropy again    │                    │
    ├──────────────┼──────────────┼──────────────────┼────────────────────┤
    │/dev/urandom  │ CSPRNG out‐  │ Never blocks     │ Returns output     │
    │              │ put          │                  │ from uninitialized │
    │              │              │                  │ CSPRNG (may be low │
    │              │              │                  │ entropy and        │
    │              │              │                  │ unsuitable for     │
    │              │              │                  │ cryptography)      │
    ├──────────────┼──────────────┼──────────────────┼────────────────────┤
    │getrandom()   │ Same as      │ Does not block   │ Blocks until pool  │
    │              │ /dev/urandom │ once pool ready  │ ready              │
    ├──────────────┼──────────────┼──────────────────┼────────────────────┤
    │getrandom()   │ Same as      │ If entropy too   │ Blocks until pool  │
    │GRND_RANDOM   │ /dev/random  │ low, block until │ ready              │
    │              │              │ there is enough  │                    │
    │              │              │ entropy again    │                    │
    ├──────────────┼──────────────┼──────────────────┼────────────────────┤
    │getrandom()   │ Same as      │ Does not block   │ EAGAIN if pool not │
    │GRND_NONBLOCK │ /dev/urandom │                  │ ready              │
    ├──────────────┼──────────────┼──────────────────┼────────────────────┤
    │getrandom()   │ Same as      │ EAGAIN if not    │ EAGAIN if pool not │
    │GRND_RANDOM + │ /dev/random  │ enough entropy   │ ready              │
    │GRND_NONBLOCK │              │ available        │                    │
    └──────────────┴──────────────┴──────────────────┴────────────────────┘
Generating cryptographic keys
    The  amount  of seed material required to generate a cryptographic
    key equals the effective key size of  the  key.   For  example,  a
    3072-bit  RSA  or  Diffie-Hellman private key has an effective key
    size of 128 bits (it requires about 2^128 operations to break)  so
    a  key  generator  needs only 128 bits (16 bytes) of seed material
    from /dev/random.

    While some safety margin above that minimum is  reasonable,  as  a
    guard  against  flaws  in  the  CSPRNG algorithm, no cryptographic
    primitive available today can hope to promise more than  256  bits
    of security, so if any program reads more than 256 bits (32 bytes)
    from the kernel random pool  per  invocation,  or  per  reasonable
    reseed  interval  (not less than one minute), that should be taken
    as a sign that its cryptography is not skillfully implemented.

SEE ALSO
    getrandom(2), random(4), urandom(4), signal(7)



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

--------------8C27D6C5D9081D335F74E2CD
Content-Type: application/x-troff-man;
 name="random.7"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="random.7"

.\" Copyright (C) 2008, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>,
.\" and Copyright (C) 2008, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>
.\" and Copyright (C) 2016, Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
.\" and Copyright (C) 2016, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
.\"
.\" %%%LICENSE_START(VERBATIM)
.\" Permission is granted to make and distribute verbatim copies of this
.\" manual provided the copyright notice and this permission notice are
.\" preserved on all copies.
.\"
.\" Permission is granted to copy and distribute modified versions of
.\" this manual under the conditions for verbatim copying, provided that
.\" the entire resulting derived work is distributed under the terms of
.\" a permission notice identical to this one.
.\"
.\" Since the Linux kernel and libraries are constantly changing, this
.\" manual page may be incorrect or out-of-date.  The author(s) assume.
.\" no responsibility for errors or omissions, or for damages resulting.
.\" from the use of the information contained herein.  The author(s) may.
.\" not have taken the same level of care in the production of this.
.\" manual, which is licensed free of charge, as they might when working.
.\" professionally.
.\"
.\" Formatted or processed versions of this manual, if unaccompanied by
.\" the source, must acknowledge the copyright and authors of this work.
.\" %%%LICENSE_END
.\"
.TH RANDOM 7 2016-11-11 "Linux" "Linux Programmer's Manual"
.SH NAME
random \- overview of interfaces for obtaining randomness
.SH DESCRIPTION
The kernel provides the following interfaces to the kernel's
cryptographically secure pseudorandom number generator (CSPRNG):
.IP * 3
The
.I /dev/urandom
and
.I /dev/random
devices, both described in
.BR random (4).
These devices have been present on Linux since early times.
.IP *
The
.BR getrandom (2)
system call, available since Linux 3.17.
This system call provides access either to the same source as
.I /dev/urandom
(called the
.I urandom
source in this page)
or to the same source as
.I /dev/random
(called the
.I random
source in this page).
The default is the
.I urandom
source; the 
.I random
source is selected by specifying the
.BR GRND_RANDOM
flag to the system call.
.\"
.SS Initialization of the entropy pool
The kernel collects bits of entropy from the environment.
When a sufficient number of random bits has been collected, the
.I urandom
entropy pool is considered to be initialized.
.SS Choice of random device
Unless you are doing long-term key generation (and most likely not even
then), you probably shouldn't be using
.BR getrandom (2)
with the
.BR GRND_RANDOM
flag or the
.IR /dev/random
device.

Instead, use either
.BR getrandom (2)
without the
.B GRND_RANDOM
flag or the
.IR /dev/urandom
device.
The cryptographic algorithms used for the
.IR urandom
source are quite conservative, and so should be sufficient for all purposes.

The disadvantage of
.B GRND_RANDOM
and reads from
.I /dev/random
is that the operation can block.
Furthermore, dealing with the partially fulfilled
requests that can occur when using
.B GRND_RANDOM
or when reading from
.I /dev/random
increases code complexity.
.\"
.SS Usage recommendations
The kernel random-number generator
relies on entropy gathered from device drivers and other sources of
environmental noise.
It is designed to produce a small
amount of high-quality seed material to seed a
cryptographically secure pseudorandom number generator (CSPRNG).
It is designed for security, not speed, and is poorly
suited to generating large amounts of cryptographic random data.
Users should be economical in the amount of seed
material that they consume via
.BR getrandom (2),
.IR /dev/urandom ,
and
.IR /dev/random .
Consuming unnecessarily large quantities of data via these interfaces
will have a negative impact on other consumers of randomness.

These interfaces should not be used to provide large quantities
of data for Monte Carlo simulations or other
programs/algorithms which are doing probabilistic sampling.
Indeed, such usage is unnecessary (and will be slow).
Instead, use these interfaces to provide a small amount of
data used to seed a user-space pseudorandom number generator
for use by such applications.
.\"
.SS Comparison between getrandom, /dev/urandom, and /dev/random
The following table summarizes the behavior of the various
interfaces that can be used to obtain randomness.
.B GRND_NONBLOCK
is a flag that can be used to control the blocking behavior of
.BR getrandom (2).
.ad l
.TS
allbox;
lbw13 lbw12 lbw16 lbw18
l l l l.
Interface	Pool	T{
Blocking
\%behavior
T}	T{
Behavior in early boot time
T}
T{
.I /dev/random
T}	T{
Blocking pool
T}	T{
If entropy too low, block until there is enough entropy again
T}	T{
Blocks until enough entropy gathered
T}
T{
.I /dev/urandom
T}	T{
CSPRNG output
T}	T{
Never blocks
T}	T{
Returns output from uninitialized CSPRNG (may be low entropy and unsuitable for cryptography)
T}
T{
.BR getrandom ()
T}	T{
Same as
.I /dev/urandom
T}	T{
Does not block once pool ready
T}	T{
Blocks until pool ready
T}
T{
.BR getrandom ()
.B GRND_RANDOM
T}	T{
Same as
.I /dev/random
T}	T{
If entropy too low, block until there is enough entropy again
T}	T{
Blocks until pool ready
T}
T{
.BR getrandom ()
.B GRND_NONBLOCK
T}	T{
Same as
.I /dev/urandom
T}	T{
Does not block
T}	T{
.B EAGAIN
if pool not ready
T}
T{
.BR getrandom ()
.B GRND_RANDOM
+
.B GRND_NONBLOCK
T}	T{
Same as
.I /dev/random
T}	T{
.B EAGAIN
if not enough entropy available
T}	T{
.B EAGAIN
if pool not ready
T}
.TE
.ad
.\"
.SS Generating cryptographic keys
The amount of seed material required to generate a cryptographic key
equals the effective key size of the key.
For example, a 3072-bit RSA
or Diffie-Hellman private key has an effective key size of 128 bits
(it requires about 2^128 operations to break) so a key generator
needs only 128 bits (16 bytes) of seed material from
.IR /dev/random .

While some safety margin above that minimum is reasonable, as a guard
against flaws in the CSPRNG algorithm, no cryptographic primitive
available today can hope to promise more than 256 bits of security,
so if any program reads more than 256 bits (32 bytes) from the kernel
random pool per invocation, or per reasonable reseed interval (not less
than one minute), that should be taken as a sign that its cryptography is
.I not
skillfully implemented.
.\"
.SH SEE ALSO
.BR getrandom (2),
.BR random (4),
.BR urandom (4),
.BR signal (7)

--------------8C27D6C5D9081D335F74E2CD--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
