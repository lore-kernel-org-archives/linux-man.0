From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: New random(7) page for review
Date: Tue, 15 Nov 2016 07:19:41 +0100
Message-ID: <97ac8ec9-5527-fd0f-dce1-21ef6037ad2f@gmail.com>
References: <1461574090.32558.45.camel@redhat.com>
 <1470052099.2926.6.camel@redhat.com> <1476952646.2522.10.camel@redhat.com>
 <b07fb334-149d-cf65-74f3-1d1951e5981b@gmail.com>
 <1478768067.2642.23.camel@redhat.com>
 <e5c1f87c-aad0-b526-a346-74348a36c2a3@gmail.com>
 <1478778837.2642.26.camel@redhat.com>
 <05152136-6943-8ada-3d65-51ef4ce9c1b1@gmail.com>
 <4a8c573c-0c19-29d0-248e-74c088968806@gmail.com>
 <d5eca965-c8b9-51e5-6acb-172e47f85ba0@supelec.fr>
 <cb25213c-a70d-cbf1-6a42-959dcdc1f202@gmail.com>
 <54e6e40c-b840-c773-e739-7faed9664411@lgeorget.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54e6e40c-b840-c773-e739-7faed9664411-AyimVQWTEHzsq35pWSNszA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, =?UTF-8?Q?Thomas_H=c3=bchn?= <t@2uo.de>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.orgt@2uo.de
List-Id: linux-man@vger.kernel.org

Hi Laurent,

On 11/12/2016 03:03 PM, Laurent Georget wrote:
> Hello,
> 
> Le 12/11/2016 à 13:25, Michael Kerrisk (man-pages) a écrit :
>> [...]
>>
>> Does anyone see any further tweaks that might be required?
>>
> 
> I put my comments directly in the rendered text below.
> 
>>
>>
>> RANDOM(7)              Linux Programmer's Manual             RANDOM(7)
>>
>> NAME
>>     random - overview of interfaces for obtaining randomness
>>
>> DESCRIPTION
>>     The kernel provides the following interfaces to the kernel's cryp‐
>>     tographically secure pseudorandom number generator (CSPRNG):
>>
>>     *  The /dev/urandom and /dev/random  devices,  both  described  in
>>        random(4).   These  devices  have  been  present on Linux since
>>        early times.
>>
>>     *  The getrandom(2) system call, available since Linux 3.17.  This
>>        system  call  provides  access  either  to  the  same source as
>>        /dev/urandom (called the urandom source in this page) or to the
>>        same  source  as  /dev/random (called the random source in this
>>        page).  The default is the urandom source; the random source is
>>        selected by specifying the GRND_RANDOM flag to the system call.
>>
> 
> We could highlight here that /dev/urandom and /dev/random exist in many
> UNIX-like systems while getrandom(2) is Linux-specific. This can be
> important for developers writing cross-platform code.

Agreed. I added some words to address this.

>> Initialization of the entropy pool
>>     The  kernel collects bits of entropy from the environment.  When a
>>     sufficient number of random bits has been collected,  the  urandom
>>     entropy pool is considered to be initialized.
>>
> 
> the *random* entropy pool? Or maybe just the entropy pool?

Yes. Changed to just "entropy pool"

>> Choice of random device
>>     Unless you are doing long-term key generation (and most likely not
>>     even then), you probably shouldn't be using getrandom(2) with  the
>>     GRND_RANDOM flag or the /dev/random device.
>>
>>     Instead,  use  either getrandom(2) without the GRND_RANDOM flag or
>>     the /dev/urandom device.  The cryptographic  algorithms  used  for
>>     the urandom source are quite conservative, and so should be suffi‐
>>     cient for all purposes.
>>
>>     The disadvantage of GRND_RANDOM and reads from /dev/random is that
>>     the  operation can block.  Furthermore, dealing with the partially
>>     fulfilled requests that can occur when using GRND_RANDOM  or  when
>>     reading from /dev/random increases code complexity.
>>
> 
> This is not a precision that was present in the previous version of the
> pages but we should write here "The disadvantage of GRND_RANDOM and reads
> from /dev/random is that the  operation can block *for an indefinite
> amount of time*".

Yes. Added.

> I don't think we can reach the extreme case where no bits of entropy are
> ever collected, but we can imagine a situation with two processes, one
> having hig priority and the other low priority, both reading from
> /dev/random. If the high priority process consumes entropy quicklier
> than it's collected, the low priority process won't wake up ever.
> This is how you get robots stuck on Mars!
> 
>> Usage recommendations
>>     The kernel random-number generator relies on entropy gathered from
>>     device drivers and other sources of environmental  noise.   It  is
>>     designed  to  produce a small amount of high-quality seed material
>>     to seed a cryptographically secure pseudorandom  number  generator
>>     (CSPRNG).   It  is designed for security, not speed, and is poorly
>>     suited to generating large amounts of cryptographic  random  data.
>>     Users  should  be  economical  in the amount of seed material that
>>     they consume  via  getrandom(2),  /dev/urandom,  and  /dev/random.
>>     Consuming  unnecessarily large quantities of data via these inter‐
>>     faces will have a negative impact on other  consumers  of  random‐
>>     ness.
>>
>>     These interfaces should not be used to provide large quantities of
>>     data for Monte  Carlo  simulations  or  other  programs/algorithms
>>     which  are  doing  probabilistic  sampling.  Indeed, such usage is
>>     unnecessary (and will be slow).  Instead, use these interfaces  to
>>     provide  a  small amount of data used to seed a user-space pseudo‐
>>     random number generator for use by such applications.
>>
>> Comparison between getrandom, /dev/urandom, and /dev/random
>>     The following table summarizes the behavior of the various  inter‐
>>     faces  that  can be used to obtain randomness.  GRND_NONBLOCK is a
>>     flag that can be used to control the blocking behavior of  getran‐
>>     dom(2).
>>
>>     ┌──────────────┬──────────────┬──────────────────┬────────────────────┐
>>     │Interface     │ Pool         │ Blocking         │ Behavior in early  │
>>     │              │              │ behavior         │ boot time          │
>>     ├──────────────┼──────────────┼──────────────────┼────────────────────┤
>>     │/dev/random   │ Blocking     │ If entropy too   │ Blocks until       │
>>     │              │ pool         │ low, block until │ enough entropy     │
>>     │              │              │ there is enough  │ gathered           │
>>     │              │              │ entropy again    │                    │
>>     ├──────────────┼──────────────┼──────────────────┼────────────────────┤
> 
> "If entropy too low, *blocks* until there is enough entropy again"

Fixed.

>>     ├──────────────┼──────────────┼──────────────────┼────────────────────┤
>>     │/dev/urandom  │ CSPRNG out‐  │ Never blocks     │ Returns output     │
>>     │              │ put          │                  │ from uninitialized │
>>     │              │              │                  │ CSPRNG (may be low │
>>     │              │              │                  │ entropy and        │
>>     │              │              │                  │ unsuitable for     │
>>     │              │              │                  │ cryptography)      │
>>     ├──────────────┼──────────────┼──────────────────┼────────────────────┤
>>     │getrandom()   │ Same as      │ Does not block   │ Blocks until pool  │
>>     │              │ /dev/urandom │ once pool ready  │ ready              │
>>     ├──────────────┼──────────────┼──────────────────┼────────────────────┤
>>     │getrandom()   │ Same as      │ If entropy too   │ Blocks until pool  │
>>     │GRND_RANDOM   │ /dev/random  │ low, block until │ ready              │
>>     │              │              │ there is enough  │                    │
>>     │              │              │ entropy again    │                    │
>>     ├──────────────┼──────────────┼──────────────────┼────────────────────┤
>>     │getrandom()   │ Same as      │ Does not block   │ EAGAIN if pool not │
>>     │GRND_NONBLOCK │ /dev/urandom │                  │ ready              │
>>     ├──────────────┼──────────────┼──────────────────┼────────────────────┤
>>     │getrandom()   │ Same as      │ EAGAIN if not    │ EAGAIN if pool not │
>>     │GRND_RANDOM + │ /dev/random  │ enough entropy   │ ready              │
>>     │GRND_NONBLOCK │              │ available        │                    │
>>     └──────────────┴──────────────┴──────────────────┴────────────────────┘
>> Generating cryptographic keys
>>     The  amount  of seed material required to generate a cryptographic
>>     key equals the effective key size of  the  key.   For  example,  a
>>     3072-bit  RSA  or  Diffie-Hellman private key has an effective key
>>     size of 128 bits (it requires about 2^128 operations to break)  so
>>     a  key  generator  needs only 128 bits (16 bytes) of seed material
>>     from /dev/random.
>>
>>     While some safety margin above that minimum is  reasonable,  as  a
>>     guard  against  flaws  in  the  CSPRNG algorithm, no cryptographic
>>     primitive available today can hope to promise more than  256  bits
>>     of security, so if any program reads more than 256 bits (32 bytes)
>>     from the kernel random pool  per  invocation,  or  per  reasonable
>>     reseed  interval  (not less than one minute), that should be taken
>>     as a sign that its cryptography is not skillfully implemented.
>>
>> SEE ALSO
>>     getrandom(2), random(4), urandom(4), signal(7)
>>
>>
> 
> Cheers,
> Laurent
> 
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
