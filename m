From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: Re: Status for bug 71211? [random(4): clarify utility and volume]
Date: Tue, 28 Jul 2015 08:45:10 +0200
Message-ID: <55B724F6.6030903@supelec.fr>
References: <CACsCw1MM+eH2zpSajyaT42jHPzrjuxcWpxPA7qqVTBR=uzaLYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACsCw1MM+eH2zpSajyaT42jHPzrjuxcWpxPA7qqVTBR=uzaLYA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

the text of this man page has been the subject of endless controversies
for ages. CSPRNGs are confusing and the page unfortunately adds a
little to the confusion. The newer getrandom(2) page is better, and I
(personally, this doesn't engage Michael nor any other author) think
that the random(4) page should be rewritten in the same spirit.
(getrandom is a system call used to get a random number, by default,
it's more or less equivalent than reading from /dev/urandom if you call
it without flags and for less than 256 bytes).

Compare this in random(4)

> The kernel random-number generator is designed to produce a small
> amount of high-quality seed material to seed a cryptographic pseudo-
> random number generator (CPRNG). It is designed for security, not
> speed, and is poorly suited to generating large amounts of random
> data. Users should be very economical in the amount of seed material
> that they read from /dev/urandom (and /dev/random); unnecessarily
> reading large quantities of data from this device will have a
> negative impact on other users of the device.

with this in getrandom(2)

> *getrandom*() relies on entropy gathered from device drivers and othe=
r
> sources of environmental noise.  Unnecessarily reading large
> quantities of data will have a negative impact on other users of the
> //dev/random/ and //dev/urandom/ devices.  Therefore, *getrandom*() s=
hould
> not be used for Monte Carlo simulations or other programs/algorithms
> which are doing probabilistic sampling.

This says exactly the same thing, but getrandom(2) is less misleading.
=46irst note that the man page for random says that /dev/urandom is
"poorly suited to generating large amounts of random data", not
"poorly suited to generating large amounts of *cryptographic* random da=
ta".
Basically, you can use /dev/urandom for all cryptographic purposes,
because you never need so many bits at once when doing cryptography.
Even generating several 16-bytes (128-bits) UIDs per minute if you need
them to be cryptographically secure (you may want to think about this
requirement, is it strict?) is not that much. A Monte-Carlo simulation
requires, say (I don't know exactly let's make a rough guess) around
several MB of random numbers per minute. That's 4 or 5 orders of
magnitude higher than your UIDs use case. This would be a wrong
usage of /dev/urandom for two reasons:
- it would be awfully slow
- you don't need cryptographically secure random numbers, so there's
no need to deplete the entropy pool.

Next, compare this in random(4):

> If  you    are  unsure  about  whether  you  should  use  /dev/random=
  or
> /dev/urandom,  then  probably you want to use the latter.  As a gener=
al
> rule, /dev/urandom should be  used  for    everything  except  long-l=
ived
> GPG/SSL/SSH keys.

with this in getrandom(2):

> Unless  you  are     doing    long-term key generation (and perhaps n=
ot even
> then), you probably shouldn't be using GRND_RANDOM.  The     cryptogr=
aphic
> algorithms  used for /dev/urandom are quite conservative, and so shou=
ld
> be sufficient for all purposes.    The  disadvantage  of  GRND_RANDOM=
  is
> that  it     can block.  Furthermore, dealing with the partially fulf=
illed
> getrandom() requests that can occur when     using    GRND_RANDOM  in=
creases
> code complexity.

Again, the two man pages say the same. getrandom(2) is more nuanced,
though.

To answer your question about how much you can ask /dev/urandom for:

in random(4) :

> if any program reads more than 256 bits (32 bytes) from the kernel   =
 random
> pool  per  invocation, or per reasonable reseed interval (not less th=
an
> one minute), that should be taken as a sign that its  cryptography  i=
s
> not skillfully implemented.

In getrandom(2):

> Calling getrandom() to read /dev/urandom for small values  (<=3D 256 =
bytes)
> of buflen is the preferred mode of usage.

=46urthermore, it's impossible to read more than 32MB from /dev/urandom
at once.

So, actually, the random(4) page is very conservative about the reading
limit.

My final conclusion: as long as you use /dev/urandom for cryptographic
purposes only, you should be ok, because you will never need *a lot* of
random data anyway in any sensible program. For non-cryptographic usage=
,
seed a user-space PRNG with a few bytes from /dev/urandom (or something
else like time(NULL) or a known constant) and you will be good.

Laurent



Le 26/07/2015 22:20, Carl Winb=C3=A4ck a =C3=A9crit :
> Hello Michael & Co,
>
> I would like to bring your attention to bug report 71211, =E2=80=9Dra=
ndom(4):
> clarify utility and volume=E2=80=9D.
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D71211
>
> This report was filed over a year ago but still hasn=E2=80=99t receiv=
ed any response.
>
> Michael, do you have the time to take a look?
>
> Perhaps you, or someone else on the linux-man list, are familiar with
> CSPRNGs and have some ideas on how to reword this man page?
>
> Unfortunately I=E2=80=99m not at all an expert in this area, so I=E2=80=
=99m afraid I
> don=E2=80=99t have any specific suggestions regarding how to change t=
his man
> page. But I still think it would be helpful to the Linux community if
> it could be improved, and as a result, hopefully cause less confusion
> regarding getting random numbers on Linux.
>
>
> Looking forward to hear your thoughts on this.
>
> Best regards,
> Carl Winb=C3=A4ck
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
