From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getrandom.2, random.4: Consolidate and improve discussion
 on usage of randomness
Date: Fri, 11 Nov 2016 11:47:32 +0100
Message-ID: <CAKgNAkgb=OEvtRNJaDLO8e3_UaVC-zCQJq8GV1c9fU416RqhLg@mail.gmail.com>
References: <CACsCw1MM+eH2zpSajyaT42jHPzrjuxcWpxPA7qqVTBR=uzaLYA@mail.gmail.com>
 <55B65DAC.6010906@lgeorget.eu> <2fc34759-5d2b-4192-9611-b499e23efdf8@gmail.com>
 <1478767372.2642.15.camel@redhat.com> <fa60e32a-1364-d0be-245f-d8ead6d04713@gmail.com>
 <1478788558.3579.47.camel@redhat.com> <66494ef9-80d1-e437-252a-4a15e1f497db@lgeorget.eu>
 <02c2fa67-ce72-010b-e1ac-ae52c1bc6cf2@gmail.com> <1478850099.2484.7.camel@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478850099.2484.7.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, =?UTF-8?Q?Carl_Winb=C3=A4ck?= <c@tunnel53.net>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Ivan Babrou <ibobrik-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, matt-6J8q6J5oQjkQrrorzV6ljw@public.gmane.org, Luke Bratch <luke-g3IQT7+C+D7QXOPxS62xeg@public.gmane.org>, Onkar Mahajan <on2014nm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Nikos,

On 11 November 2016 at 08:41, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wro=
te:
> On Thu, 2016-11-10 at 19:16 +0100, Michael Kerrisk (man-pages) wrote:
>> Nikos, Laurent,
>> So, I must admit that after your respective mails, I'm still not
>> clear. Do you think I should keep this patch, change it, or
>> discard it?
>
> It is a bit confusing to me. The sentences:
> "When  reading  from  /dev/urandom  (GRND_RANDOM  is  not set),
> getrandom()"
>
> and
>
> "The behavior when a call to getrandom() that is
> blocked  while  reading  from  /dev/urandom"
>
> seem to imply that getrandom() is a wrapper over /dev/urandom (i.e.,
> internally it opens the device reads etc). That's not the case the
> system call doesn't go through /dev/urandom, although the pools behind
> are the same.

I agree that this language is a bit confusing. But that language was
not introduced by my patch.

> maybe saying the /dev/urandom pool instead, but I find that even that
> could confuse someone.
>
> So while the text is better and more precise in other aspects than
> before I think it is a bit confusing the mix of getrandom() with
> /dev/urandom and /dev/random. Maybe copy the text back and separate the
> descriptions even if they are very similar at the moment?

I'm reluctant to duplicate text in two places. I think that that
duplication os prt of the reason why we have the current mess.

I'll instead try to fine tune the text to remove the implication that
getrandom() is reading from the devices. Take a look at the current
draft of the getrandom(2) page in the branch at
http://git.kernel.org/cgit/docs/man-pages/man-pages.git/log/?h=3Ddraft_rand=
om

The text is also rendered below, but may be a little less readable
without the formatting, since I user the terms "urandom pool" and
"random pool" with the words "urandom" and "random"
italicized/underlined.

Cheers,

Michael

NAME
       getrandom - obtain a series of random bytes

SYNOPSIS
       #include <linux/random.h>

       int getrandom(void *buf, size_t buflen, unsigned int flags);

DESCRIPTION
       The  getrandom()  system  call  fills the buffer pointed to by buf
       with up to buflen random bytes.  These bytes can be used  to  seed
       user-space random number generators or for cryptographic purposes.

       By default, getrandom() draws entropy from the urandom pool (i.e.,
       the same source as the /dev/urandom device).  This behavior can be
       changed via the flags argument.

       If the urandom pool has been initialized, reads of up to 256 bytes
       will always return as many bytes as  requested  and  will  not  be
       interrupted  by signals.  No such guarantees apply for larger buf=E2=
=80=90
       fer sizes.  For example, if the call is interrupted  by  a  signal
       handler, it may return a partially filled buffer, or fail with the
       error EINTR.

       If the urandom pool has not yet been initialized, then getrandom()
       will block, unless GRND_NONBLOCK is specified in flags.

       The  flags argument is a bit mask that can contain zero or more of
       the following values ORed together:

       GRND_RANDOM
              If this bit is set, then random bytes are  drawn  from  the
              random  pool  (i.e.,  the  same  source  as the /dev/random
              device) instead of the urandom pool.  The  random  pool  is
              limited  based  on  the  entropy  that can be obtained from
              environmental noise.  If the number of available  bytes  in
              the  random pool is less than requested in buflen, the call
              returns just the available  random  bytes.   If  no  random
              bytes  are  available, the behavior depends on the presence
              of GRND_NONBLOCK in the flags argument.

       GRND_NONBLOCK
              By default, when reading from the random pool,  getrandom()
              blocks  if  no random bytes are available, and when reading
              from the urandom pool, it blocks if the  entropy  pool  has
              not  yet  been  initialized.   If the GRND_NONBLOCK flag is
              set, then getrandom() does not block in  these  cases,  but
              instead immediately returns -1 with errno set to EAGAIN.

RETURN VALUE
       On  success,  getrandom()  returns  the  number of bytes that were
       copied to the buffer buf.  This may be less  than  the  number  of
       bytes  requested via buflen if either GRND_RANDOM was specified in
       flags and insufficient entropy was present in the random  pool  or
       the system call was interrupted by a signal.

       On error, -1 is returned, and errno is set appropriately.

ERRORS
       EAGAIN The  requested  entropy  was not available, and getrandom()
              would have blocked if the GRND_NONBLOCK flag was not set.

       EFAULT The address referred to by buf is  outside  the  accessible
              address space.

       EINTR  The  call  was  interrupted  by  a  signal handler; see the
              description of how  interrupted  read(2)  calls  on  "slow"
              devices are handled with and without the SA_RESTART flag in
              the signal(7) man page.

       EINVAL An invalid flag was specified in flags.

VERSIONS
       getrandom() was introduced in version 3.17 of the Linux kernel.

CONFORMING TO
       This system call is Linux-specific.

NOTES
       Unlike /dev/random and /dev/random, getrandom() does  not  involve
       the  use  of pathnames or file descriptors.  Thus, getrandom() can
       be useful in cases where chroot(2) makes /dev pathnames invisible,
       and where an application (e.g., a daemon during start-up) closes a
       file descriptor for one of  these  files  that  was  opened  by  a
       library.

   Maximum number of bytes returned
       As of Linux 3.19 the following limits apply:

       *  When reading from the urandom pool, a maximum of 33554431 bytes
          is returned by a single call to getrandom()  on  systems  where
          int has a size of 32 bits.

       *  When  reading  from  the random pool, a maximum of 512 bytes is
          returned.

   Initialization of the entropy pool
       The kernel collects bits of entropy from the environment.  When  a
       sufficient  number  of random bits has been collected, the urandom
       entropy pool is considered to be initialized.  This state is  nor=E2=
=80=90
       mally reached early in the system bootstrap phase.

   Interruption by a signal handler
       When  reading  from  the  urandom  pool  (GRND_RANDOM is not set),
       getrandom() will block until the entropy pool has been initialized
       (unless  the  GRND_NONBLOCK  flag was specified).  If a request is
       made to read a large number of bytes (more than 256),  getrandom()
       will  block  until those bytes have been generated and transferred
       from kernel memory to buf.  When  reading  from  the  random  pool
       (GRND_RANDOM  is  set),  getrandom()  will block until some random
       bytes become available (unless the GRND_NONBLOCK flag  was  speci=E2=
=80=90
       fied).

       The  behavior  when  a  call  to getrandom() that is blocked while
       reading from the urandom pool is interrupted by a  signal  handler
       depends  on  the initialization state of the entropy buffer and on
       the request size, buflen.  If the entropy is not yet  initialized,
       then the call will fail with the EINTR error.  If the entropy pool
       has been initialized and the request size is large (buflen > 256),
       the  call either succeeds, returning a partially filled buffer, or
       fails with the error EINTR.  If the entropy pool has been initial=E2=
=80=90
       ized  and  the request size is small (buflen <=3D 256), then getran=
=E2=80=90
       dom() will not fail with EINTR.  Instead, it will  return  all  of
       the bytes that have been requested.

       When  reading  from the random pool, blocking requests of any size
       can be interrupted by a signal handler (the call  fails  with  the
       error EINTR).

       Using  getrandom()  to  read small buffers (<=3D 256 bytes) from the
       urandom pool is the preferred mode of usage.

       The special treatment of small values of buflen was  designed  for
       compatibility with OpenBSD's getentropy() system call.

       The  user  of  getrandom()  must always check the return value, to
       determine whether either an error occurred  or  fewer  bytes  than
       requested  were  returned.   In  the case where GRND_RANDOM is not
       specified and buflen is less than or equal to  256,  a  return  of
       fewer  bytes  than  requested should never happen, but the careful
       programmer will check for this anyway!

   Choice of random device
       Unless you are doing long-term key  generation  (and  perhaps  not
       even then), you probably shouldn't be using the GRND_RANDOM or the
       /dev/random device.

       Instead, use either getrandom() without the  GRND_RANDOM  flag  or
       the  /dev/urandom  device.   The cryptographic algorithms used for
       the urandom pool are quite conservative, and so should  be  suffi=E2=
=80=90
       cient for all purposes.

       The disadvantage of GRND_RANDOM and reads from /dev/random is that
       the operation can block.  Furthermore, dealing with the  partially
       fulfilled  requests  that can occur when using GRND_RANDOM or when
       reading from /dev/random increases code complexity.

   Usage recommendations
       The kernel random-number generator relies on entropy gathered from
       device  drivers  and  other sources of environmental noise.  It is
       designed to produce a small amount of high-quality  seed  material
       to seed a cryptographic pseudorandom number generator (CPRNG).  It
       is designed for security, not speed, and is poorly suited to  gen=E2=
=80=90
       erating  large amounts of cryptographic random data.  Users should
       be very economical in the amount of seed material that  they  con=E2=
=80=90
       sume  via  getrandom(),  /dev/urandom, and /dev/random.  Consuming
       unnecessarily large quantities of data via these  interfaces  will
       have a negative impact on other consumers of randomness.

       These interfaces should not be used to provide large quantities of
       data for Monte  Carlo  simulations  or  other  programs/algorithms
       which are doing probabilistic sampling.  And indeed, such usage is
       unnecessary (and will be slow): instead, use these  interfaces  to
       provide  a  small amount of data used to seed a user-space pseudo=E2=
=80=90
       random number generator for use by such applications.

   Generating cryptographic keys
       The amount of seed material required to generate  a  cryptographic
       key  equals  the  effective  key  size of the key.  For example, a
       3072-bit RSA or Diffie-Hellman private key has  an  effective  key
       size  of 128 bits (it requires about 2^128 operations to break) so
       a key generator needs only 128 bits (16 bytes)  of  seed  material
       from /dev/random.

       While  some  safety  margin above that minimum is reasonable, as a
       guard against flaws in the CPRNG algorithm, no cryptographic prim=E2=
=80=90
       itive  available  today  can hope to promise more than 256 bits of
       security, so if any program reads more than 256  bits  (32  bytes)
       from  the  kernel  random  pool  per invocation, or per reasonable
       reseed interval (not less than one minute), that should  be  taken
       as a sign that its cryptography is not skillfully implemented.

   Emulating OpenBSD's getentropy()
       The  getentropy() system call in OpenBSD can be emulated using the
       following function:

           int
           getentropy(void *buf, size_t buflen)
           {
               int ret;

               if (buflen > 256)
                   goto failure;
               ret =3D getrandom(buf, buflen, 0);
               if (ret < 0)
                   return ret;
               if (ret =3D=3D buflen)
                   return 0;
           failure:
               errno =3D EIO;
               return -1;
           }

BUGS
       As of Linux 3.19, the following bug exists:

       *  Depending on CPU load, getrandom() does not react to interrupts
          before reading all bytes requested.

SEE ALSO
       random(4), urandom(4), signal(7)

>
> regards,
> Nikos
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
