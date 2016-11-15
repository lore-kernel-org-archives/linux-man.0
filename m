From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Revised draft of random(7) man page for review
Date: Tue, 15 Nov 2016 07:56:09 +0100
Message-ID: <50af97ae-e65e-30f3-c5ec-6f2129711f39@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------F1F8FFB9E3AE7C13F7727352"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, Luke Bratch <luke-g3IQT7+C+D7QXOPxS62xeg@public.gmane.org>, Ivan Babrou <ibobrik-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, matt-6J8q6J5oQjkQrrorzV6ljw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Thomas_H=c3=bchn?= <t@2uo.de>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------F1F8FFB9E3AE7C13F7727352
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hello all,

Here's one more draft of the random(7) man page for review. I wanted to 
recirculate this one more time, because I came up with  couple of
questions (shown in FIXMEs below). 

Ted, I'd be especially happy if you could take a look at those questions, 
but I also welcome any input from others, as well as any further comments
on the remainder of the page.

Rendered version of the page is below; source is attached.

Cheers,

Michael


RANDOM(7)              Linux Programmer's Manual             RANDOM(7)

NAME
       random - overview of interfaces for obtaining randomness

DESCRIPTION
       The  kernel  provides  the following interfaces to the kernel's
       cryptographically   secure   pseudorandom   number    generator
       (CSPRNG):

       *  The  /dev/urandom and /dev/random devices, both described in
          random(4).  These devices have been present on  Linux  since
          early times, and are also available on many other systems.

       *  The Linux-specific getrandom(2) system call, available since
          Linux 3.17.  This system call provides access either to  the
          same  source  as  /dev/urandom (called the urandom source in
          this page) or to the same source as /dev/random (called  the
          random  source  in  this  page).  The default is the urandom
          source; the random source  is  selected  by  specifying  the
          GRND_RANDOM flag to the system call.

   Initialization of the entropy pool
       The kernel collects bits of entropy from the environment.  When
       a sufficient number of random  bits  has  been  collected,  the
       entropy pool is considered to be initialized.

   Choice of random device
       Unless  you are doing long-term key generation (and most likely
       not even then), you probably shouldn't be using the /dev/random
       device or getrandom(2) with the GRND_RANDOM flag.

       Instead,  use  either  the  /dev/urandom device or getrandom(2)
       without the GRND_RANDOM  flag.   The  cryptographic  algorithms
       used  for  the  urandom  source  are quite conservative, and so
       should be sufficient for all purposes.

       The disadvantage of GRND_RANDOM and reads from  /dev/random  is
       that  the operation can block for an indefinite period of time.
       Furthermore, dealing with the partially fulfilled requests that
       can occur when using GRND_RANDOM or when reading from /dev/ran‐
       dom increases code complexity.

   Usage recommendations
       The kernel random-number generator relies on  entropy  gathered
       from  device  drivers and other sources of environmental noise.
       It is designed to produce a small amount of  high-quality  seed
       material to seed a cryptographically secure pseudorandom number
       generator (CSPRNG).  It is designed for  security,  not  speed,
       and  is  poorly  suited  to generating large amounts of crypto‐
       graphic random data.  Users should be economical in the  amount
       of seed material that they consume via getrandom(2), /dev/uran‐
       dom, and /dev/random.


       ┌─────────────────────────────────────────────────────┐
       │FIXME                                                │
       ├─────────────────────────────────────────────────────┤
       │Is it really  necessary  to  avoid  consuming  large │
       │amounts from /dev/urandom? Various sources linked to │
       │by https://bugzilla.kernel.org/show_bug.cgi?id=71211 │
       │suggest it is not.                                   │
       │                                                     │
       │And: has the answer to the previous question changed │
       │across kernel versions?                              │
       └─────────────────────────────────────────────────────┘
       Consuming unnecessarily large  quantities  of  data  via  these
       interfaces  will  have  a negative impact on other consumers of
       randomness.


       ┌─────────────────────────────────────────────────────┐
       │FIXME                                                │
       ├─────────────────────────────────────────────────────┤
       │Above: we need to define "negative impact".  Is  the │
       │only  negative  impact  that  we may slow readers of │
       │/dev/random, since it will  block  until  sufficient │
       │entropy has once more accumulated?                   │
       │                                                     │
       │And: has the answer to the previous question changed │
       │across kernel versions?                              │
       └─────────────────────────────────────────────────────┘

       These interfaces should not be used to provide large quantities
       of  data  for  Monte  Carlo simulations or other programs/algo‐
       rithms which are doing probabilistic  sampling.   Indeed,  such
       usage  will  be slow, and is unnecessary, because such applica‐
       tions do  not  need  crytographically  secure  random  numbers.
       Instead, use these interfaces to provide a small amount of data
       used to seed a user-space pseudorandom number generator for use
       by such applications.

   Comparison between getrandom, /dev/urandom, and /dev/random
       The  following  table  summarizes  the  behavior of the various
       interfaces that can be used to  obtain  randomness.   GRND_NON‐
       BLOCK is a flag that can be used to control the blocking behav‐
       ior of getrandom(2).  The final column of the  table  considers
       the  case  that  can  occur in early boot time when the entropy
       pool is not yet initialized.

       ┌──────────────┬──────────────┬────────────────┬────────────────────┐
       │Interface     │ Pool         │ Blocking       │ Behavior when pool │
       │              │              │ behavior       │ is not yet ready   │
       ├──────────────┼──────────────┼────────────────┼────────────────────┤
       │/dev/random   │ Blocking     │ If entropy too │ Blocks until       │
       │              │ pool         │ low, blocks    │ enough entropy     │
       │              │              │ until there is │ gathered           │
       │              │              │ enough entropy │                    │
       │              │              │ again          │                    │
       ├──────────────┼──────────────┼────────────────┼────────────────────┤
       │/dev/urandom  │ CSPRNG out‐  │ Never blocks   │ Returns output     │
       │              │ put          │                │ from uninitialized │
       │              │              │                │ CSPRNG (may be low │
       │              │              │                │ entropy and        │
       │              │              │                │ unsuitable for     │
       │              │              │                │ cryptography)      │
       ├──────────────┼──────────────┼────────────────┼────────────────────┤
       │getrandom()   │ Same as      │ Does not block │ Blocks until pool  │
       │              │ /dev/urandom │ once is pool   │ ready              │
       │              │              │ ready          │                    │
       ├──────────────┼──────────────┼────────────────┼────────────────────┤
       │getrandom()   │ Same as      │ If entropy too │ Blocks until pool  │
       │GRND_RANDOM   │ /dev/random  │ low, blocks    │ ready              │
       │              │              │ until there is │                    │
       │              │              │ enough entropy │                    │
       │              │              │ again          │                    │
       ├──────────────┼──────────────┼────────────────┼────────────────────┤
       │getrandom()   │ Same as      │ Does not block │ EAGAIN             │
       │GRND_NONBLOCK │ /dev/urandom │ once is pool   │                    │
       │              │              │ ready          │                    │
       ├──────────────┼──────────────┼────────────────┼────────────────────┤
       │getrandom()   │ Same as      │ EAGAIN if not  │ EAGAIN             │
       │GRND_RANDOM + │ /dev/random  │ enough entropy │                    │
       │GRND_NONBLOCK │              │ available      │                    │
       └──────────────┴──────────────┴────────────────┴────────────────────┘
   Generating cryptographic keys
       The  amount  of  seed  material  required to generate a crypto‐
       graphic key equals the effective key  size  of  the  key.   For
       example,  a  3072-bit  RSA or Diffie-Hellman private key has an
       effective key size of 128 bits (it requires about 2^128  opera‐
       tions  to  break)  so  a  key generator needs only 128 bits (16
       bytes) of seed material from /dev/random.

       While some safety margin above that minimum is reasonable, as a
       guard  against  flaws in the CSPRNG algorithm, no cryptographic
       primitive available today can hope to  promise  more  than  256
       bits  of  security,  so if any program reads more than 256 bits
       (32 bytes) from the kernel random pool per invocation,  or  per
       reasonable  reseed  interval  (not  less than one minute), that
       should be taken as a sign that its cryptography is  not  skill‐
       fully implemented.

SEE ALSO
       getrandom(2), random(4), urandom(4), signal(7)

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

--------------F1F8FFB9E3AE7C13F7727352
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
These devices have been present on Linux since early times,
and are also available on many other systems.
.IP *
The Linux-specific
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
entropy pool is considered to be initialized.
.SS Choice of random device
Unless you are doing long-term key generation (and most likely not even
then), you probably shouldn't be using the
.IR /dev/random
device
or
.BR getrandom (2)
with the
.BR GRND_RANDOM
flag.

Instead, use either the
.IR /dev/urandom
device or
.BR getrandom (2)
without the
.B GRND_RANDOM
flag.
The cryptographic algorithms used for the
.IR urandom
source are quite conservative, and so should be sufficient for all purposes.

The disadvantage of
.B GRND_RANDOM
and reads from
.I /dev/random
is that the operation can block for an indefinite period of time.
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
.\" FIXME Is it really necessary to avoid consuming large amounts
.\" from /dev/urandom? Various sources linked to by
.\" https://bugzilla.kernel.org/show_bug.cgi?id=71211 suggest it is not.
.\"
.\" And: has the answer to the previous question changed across
.\" kernel versions?
Consuming unnecessarily large quantities of data via these interfaces
will have a negative impact on other consumers of randomness.
.\" FIXME Above: we need to define "negative impact". Is the only
.\" negative impact that we may slow readers of /dev/random, since it
.\" will block until sufficient entropy has once more accumulated?
.\"
.\" And: has the answer to the previous question changed across
.\" kernel versions?

These interfaces should not be used to provide large quantities
of data for Monte Carlo simulations or other
programs/algorithms which are doing probabilistic sampling.
Indeed, such usage will be slow, and is unnecessary,
because such applications do not need crytographically secure random numbers.
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
The final column of the table considers the case that can occur
in early boot time when the entropy pool is not yet initialized.
.ad l
.TS
allbox;
lbw13 lbw12 lbw14 lbw18
l l l l.
Interface	Pool	T{
Blocking
\%behavior
T}	T{
Behavior when pool is not yet ready
T}
T{
.I /dev/random
T}	T{
Blocking pool
T}	T{
If entropy too low, blocks until there is enough entropy again
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
Does not block once is pool ready
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
If entropy too low, blocks until there is enough entropy again
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
Does not block once is pool ready
T}	T{
.B EAGAIN
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

--------------F1F8FFB9E3AE7C13F7727352--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
