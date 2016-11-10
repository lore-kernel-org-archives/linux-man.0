From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] getrandom.2, random.4: Consolidate and improve discussion on
 usage of randomness
Date: Thu, 10 Nov 2016 15:23:11 +0100
Message-ID: <fa60e32a-1364-d0be-245f-d8ead6d04713@gmail.com>
References: <CACsCw1MM+eH2zpSajyaT42jHPzrjuxcWpxPA7qqVTBR=uzaLYA@mail.gmail.com>
 <55B65DAC.6010906@lgeorget.eu>
 <2fc34759-5d2b-4192-9611-b499e23efdf8@gmail.com>
 <1478767372.2642.15.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478767372.2642.15.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org, c@tunnel53.net, ibobrik-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, matt-6J8q6J5oQjkQrrorzV6ljw@public.gmane.org, luke-g3IQT7+C+D7QXOPxS62xeg@public.gmane.org, on2014nm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

[was: Re: Status for bug 71211? [random(4): clarify utility and volume]]

Hello Nikos,

On 11/10/2016 09:42 AM, Nikos Mavrogiannopoulos wrote:
> On Wed, 2016-11-09 at 16:27 +0100, Michael Kerrisk (man-pages) wrote:
>> Nikos,
>>
>> This was an earlier mail from Laurent Georget. I bring
>> you into this thread in case there's any of Laurent's comments
>> that may be helpful as inspiration for your patch.
>>
>> See also https://bugzilla.kernel.org/show_bug.cgi?id=71211
> 
> I think that's a nice comment. The text referred to applies to old
> kernels not new ones (especially not after the recent rewrite), and I
> think it documents and opinion rather than a fact. I am inclined to
> simply drop the referred paragraph. Any better suggestions?

Dropping the paragraph appears too strong too me. Surely we want 
to maintain a recommendation not to consume too much data from
/dev/urandom?

Part of the problem is I think that recommendations
on how to consume randomness are spread across two places.
What do folk think of the patch below?

Cheers,

Michael


    getrandom.2, random.4: Consolidate and improve discussion on usage of randomness
    
    Currently, recommendations on how to consumer randomness are
    spread across both getrandom(2) and random(4) and the general
    opinion seems to be that the text in getrandom(2) does a
    somewhat better job. Consolidate the discussion to a single
    page (getrandom(2)) and address some of the concerns
    expressed about the existing text in random(4).
    
    Signed-off-by: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

diff --git a/man2/getrandom.2 b/man2/getrandom.2
index db3a0f6..32c55bd 100644
--- a/man2/getrandom.2
+++ b/man2/getrandom.2
@@ -41,20 +41,6 @@ with up to
 random bytes.
 These bytes can be used to seed user-space random number generators
 or for cryptographic purposes.
-.PP
-.BR getrandom ()
-relies on entropy gathered from device drivers and other sources of
-environmental noise.
-Unnecessarily reading large quantities of data will have a negative impact
-on other users of the
-.I /dev/random
-and
-.I /dev/urandom
-devices.
-Therefore,
-.BR getrandom ()
-should not be used for Monte Carlo simulations or other
-programs/algorithms which are doing probabilistic sampling.
 
 By default,
 .BR getrandom ()
@@ -277,19 +263,75 @@ a return of fewer bytes than requested should never happen,
 but the careful programmer will check for this anyway!
 .SS Choice of random device
 Unless you are doing long-term key generation (and perhaps not even
-then), you probably shouldn't be using
-.B GRND_RANDOM.
-The cryptographic algorithms used for
-.I /dev/urandom
+then), you probably shouldn't be using the
+.BR getrandom ()
+.BR GRND_RANDOM
+flag or the
+.IR /dev/random
+device.
+
+Instead, use
+.IR /dev/urandom ;
+the cryptographic algorithms used for
+.IR /dev/urandom ;
 are quite conservative, and so should be sufficient for all purposes.
+
 The disadvantage of
 .B GRND_RANDOM
-is that it can block.
+and reads from
+.I dev/random
+is that the operation can block.
 Furthermore, dealing with the partially fulfilled
-.BR getrandom ()
 requests that can occur when using
 .B GRND_RANDOM
+or when reading from
+.I /dev/random
 increases code complexity.
+.\"
+.SS Usage recommendations
+The kernel random-number generator
+relies on entropy gathered from device drivers and other sources of
+environmental noise.
+It is designed to produce a small
+amount of high-quality seed material to seed a
+cryptographic pseudo-random number generator (CPRNG).
+It is designed for security, not speed, and is poorly
+suited to generating large amounts of cryptographic random data.
+Users should be very economical in the amount of seed
+material that they consume via
+.BR getrandom (),
+.IR /dev/urandom ,
+and
+.IR /dev/random .
+Consuming unnecessarily large quantities of data via these interfaces
+will have a negative impact on other consumers of randomness.
+
+These interfaces should not be used to provide large quantities
+of data for Monte Carlo simulations or other
+programs/algorithms which are doing probabilistic sampling.
+And indeed, such usage is unnecessary (and will be slow):
+instead, use these interfaces to provide a small amount of
+data used to seed a user-space pseudo-random number generator
+for use by such applications.
+.\"
+.SS Generating cryptographic keys
+The amount of seed material required to generate a cryptographic key
+equals the effective key size of the key.
+For example, a 3072-bit RSA
+or Diffie-Hellman private key has an effective key size of 128 bits
+(it requires about 2^128 operations to break) so a key generator
+needs only 128 bits (16 bytes) of seed material from
+.IR /dev/random .
+
+While some safety margin above that minimum is reasonable, as a guard
+against flaws in the CPRNG algorithm, no cryptographic primitive
+available today can hope to promise more than 256 bits of security,
+so if any program reads more than 256 bits (32 bytes) from the kernel
+random pool per invocation, or per reasonable reseed interval (not less
+than one minute), that should be taken as a sign that its cryptography is
+.I not
+skillfully implemented.
+.\"
 .SS Emulating OpenBSD's getentropy()
 The
 .BR getentropy ()
diff --git a/man4/random.4 b/man4/random.4
index 736cbde..a027ab8 100644
--- a/man4/random.4
+++ b/man4/random.4
@@ -138,35 +138,9 @@ may block, users will usually want to open it in nonblocking mode
 and provide some sort of user notification if the desired
 entropy is not immediately available.
 
-The kernel random-number generator is designed to produce a small
-amount of high-quality seed material to seed a
-cryptographic pseudo-random number generator (CPRNG).
-It is designed for security, not speed, and is poorly
-suited to generating large amounts of random data.
-Users should be very economical in the amount of seed
-material that they read from
-.IR /dev/urandom
-(and
-.IR /dev/random );
-unnecessarily reading large quantities of data from this device will have
-a negative impact on other users of the device.
-
-The amount of seed material required to generate a cryptographic key
-equals the effective key size of the key.
-For example, a 3072-bit RSA
-or Diffie-Hellman private key has an effective key size of 128 bits
-(it requires about 2^128 operations to break) so a key generator
-needs only 128 bits (16 bytes) of seed material from
-.IR /dev/random .
