From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Status for bug 71211? [random(4): clarify utility and volume]
Date: Wed, 9 Nov 2016 16:27:38 +0100
Message-ID: <2fc34759-5d2b-4192-9611-b499e23efdf8@gmail.com>
References: <CACsCw1MM+eH2zpSajyaT42jHPzrjuxcWpxPA7qqVTBR=uzaLYA@mail.gmail.com>
 <55B65DAC.6010906@lgeorget.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B65DAC.6010906-AyimVQWTEHzsq35pWSNszA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Nikos,

This was an earlier mail from Laurent Georget. I bring
you into this thread in case there's any of Laurent's comments
that may be helpful as inspiration for your patch.

See also https://bugzilla.kernel.org/show_bug.cgi?id=71211

Cheers,

Michael

On 07/27/2015 06:34 PM, Laurent Georget wrote:
> 
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
> 
> Hello,
> 
> the text of this man page has been the subject of endless controversies
> for ages. CSPRNGs are confusing and the page unfortunately adds a
> little to the confusion. The newer getrandom(2) page is better, and I
> (personally, this doesn't engage Michael nor any other author) think
> that the random(4) page should be rewritten in the same spirit.
> (getrandom is a system call used to get a random number, by default,
> it's more or less equivalent than reading from /dev/urandom if you call
> it without flags and for less than 256 bytes).
> 
> Compare this in random(4)
> 
>> The kernel random-number generator is designed to produce a small
>> amount of high-quality seed material to seed a cryptographic pseudo-
>> random number generator (CPRNG). It is designed for security, not
>> speed, and is poorly suited to generating large amounts of random
>> data. Users should be very economical in the amount of seed material
>> that they read from /dev/urandom (and /dev/random); unnecessarily
>> reading large quantities of data from this device will have a
>> negative impact on other users of the device.
> with this in getrandom(2)
> 
>> *getrandom*() relies on entropy gathered from device drivers and other
>> sources of environmental noise.  Unnecessarily reading large
>> quantities of data will have a negative impact on other users of the
>> //dev/random/ and //dev/urandom/ devices.  Therefore, *getrandom*() should
>> not be used for Monte Carlo simulations or other programs/algorithms
>> which are doing probabilistic sampling.
> This says exactly the same thing, but getrandom(2) is less misleading.
> First note that the man page for random says that /dev/urandom is
> "poorly suited to generating large amounts of random data", not
> "poorly suited to generating large amounts of *cryptographic* random data".
> Basically, you can use /dev/urandom for all cryptographic purposes,
> because you never need so many bits at once when doing cryptography.
> Even generating several 16-bytes (128-bits) UIDs per minute if you need
> them to be cryptographically secure (you may want to think about this
> requirement, is it strict?) is not that much. A Monte-Carlo simulation
> requires, say (I don't know exactly let's make a rough guess) around
> several MB of random numbers per minute. That's 4 or 5 orders of
> magnitude higher than your UIDs use case. This would be a wrong
> usage of /dev/urandom for two reasons:
> - - it would be awfully slow
> - - you don't need cryptographically secure random numbers, so there's
> no need to deplete the entropy pool.
> Next, compare this in random(4):
> 
>> If  you    are  unsure  about  whether  you  should  use  /dev/random  or
>> /dev/urandom,  then  probably you want to use the latter.  As a general
>> rule, /dev/urandom should be  used  for    everything  except  long-lived
>> GPG/SSL/SSH keys.
> with this in getrandom(2):
> 
>> Unless  you  are     doing    long-term key generation (and perhaps not even
>> then), you probably shouldn't be using GRND_RANDOM.  The     cryptographic
>> algorithms  used for /dev/urandom are quite conservative, and so should
>> be sufficient for all purposes.    The  disadvantage  of  GRND_RANDOM  is
>> that  it     can block.  Furthermore, dealing with the partially fulfilled
>> getrandom() requests that can occur when     using    GRND_RANDOM  increases
>> code complexity.
> Again, the two man pages say the same. getrandom(2) is more nuanced,
> though.
> 
> To answer your question about how much you can ask /dev/urandom for :
> 
> in random(4) :
> 
>> if any program reads more than 256 bits (32 bytes) from the kernel    random
>> pool  per  invocation, or per reasonable reseed interval (not less than
>> one minute), that should be taken as a sign that its  cryptography  is
>> not skillfully implemented.
> In getrandom(2):
> 
>> Calling getrandom() to read /dev/urandom for small values  (<= 256 bytes)
>> of buflen is the preferred mode of usage.
> Furthermore, it's impossible to read more than 32MB from /dev/urandom
> per invocation.
> 
> So, actually, the random(4) page is very conservative about the reading
> limit.
> 
> My final conclusion: as long as you use /dev/urandom for cryptographic
> purposes only, you should be ok, because you will never need *a lot* of
> random data anyway in any sensible program. For non-cryptographic usage,
> seed a user-space PRNG with a few bytes from /dev/urandom and you will
> be good.
> 
> Laurent
> 
> 
> 
> Le 26/07/2015 22:20, Carl Winbäck a écrit :
>> Hello Michael & Co,
>>
>> I would like to bring your attention to bug report 71211, ”random(4):
>> clarify utility and volume”.
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=71211
>>
>> This report was filed over a year ago but still hasn’t received any response.
>>
>> Michael, do you have the time to take a look?
>>
>> Perhaps you, or someone else on the linux-man list, are familiar with
>> CSPRNGs and have some ideas on how to reword this man page?
>>
>> Unfortunately I’m not at all an expert in this area, so I’m afraid I
>> don’t have any specific suggestions regarding how to change this man
>> page. But I still think it would be helpful to the Linux community if
>> it could be improved, and as a result, hopefully cause less confusion
>> regarding getting random numbers on Linux.
>>
>>
>> Looking forward to hear your thoughts on this.
>>
>> Best regards,
>> Carl Winbäck
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-man" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2
> 
> iF4EAREIAAYFAlW2XawACgkQRTidSplJch4jJQD/d4LOrShlXmQx5RClVCdj7sKL
> 6n7SQhlCIjfqvi86JDcA/28cCtYZ8HKL1RgWkgEjGmWoIH6ZA+AKJjgnmugk1wFj
> =ff9U
> -----END PGP SIGNATURE-----
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
