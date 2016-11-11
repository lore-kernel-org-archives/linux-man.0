From: Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>
Subject: Re: [patch] getrandom.2, random.4: Consolidate and improve discussion
 on usage of randomness
Date: Fri, 11 Nov 2016 13:08:42 +0100
Message-ID: <c542ad59-869f-ea9e-c2a4-cf077182cf0c@lgeorget.eu>
References: <CACsCw1MM+eH2zpSajyaT42jHPzrjuxcWpxPA7qqVTBR=uzaLYA@mail.gmail.com>
 <55B65DAC.6010906@lgeorget.eu>
 <2fc34759-5d2b-4192-9611-b499e23efdf8@gmail.com>
 <1478767372.2642.15.camel@redhat.com>
 <fa60e32a-1364-d0be-245f-d8ead6d04713@gmail.com>
 <1478788558.3579.47.camel@redhat.com>
 <66494ef9-80d1-e437-252a-4a15e1f497db@lgeorget.eu>
 <02c2fa67-ce72-010b-e1ac-ae52c1bc6cf2@gmail.com>
 <1478850099.2484.7.camel@redhat.com>
 <CAKgNAkgb=OEvtRNJaDLO8e3_UaVC-zCQJq8GV1c9fU416RqhLg@mail.gmail.com>
 <48e730fc-4eeb-189e-92b4-eaa2720d3eda@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <48e730fc-4eeb-189e-92b4-eaa2720d3eda-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Ivan Babrou <ibobrik-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, matt-6J8q6J5oQjkQrrorzV6ljw@public.gmane.org, Luke Bratch <luke-g3IQT7+C+D7QXOPxS62xeg@public.gmane.org>, Onkar Mahajan <on2014nm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

>> I'm reluctant to duplicate text in two places. I think that that
>> duplication os prt of the reason why we have the current mess.
> 
> So, maybe all this discussion about which interface to choose, expected
> usage, etc. should go to a random.7 man page? This would be the logical
> location to detail the differences about the three interfaces. What do
> you think?

To follow up on this, what do you think of the following patch? I do not
propose it for inclusion as is but more as a kind of RFC. Would it be useful
to have this kind of table to sum up in one place the differences between
getrandom(), /dev/random and /dev/urandom?

Note that this is my first attempt to make tables in man pages so I have no
idea if I did things right or not.

Cheers,
Laurent

---
 man2/getrandom.2 | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/man2/getrandom.2 b/man2/getrandom.2
index 32c55bd..b337415 100644
--- a/man2/getrandom.2
+++ b/man2/getrandom.2
@@ -313,6 +313,81 @@ And indeed, such usage is unnecessary (and will be slow):
 instead, use these interfaces to provide a small amount of
 data used to seed a user-space pseudo-random number generator
 for use by such applications.
+
+.\"
+.SS Comparison between getrandom, /dev/urandom and /dev/random
+
+.TS
+allbox;
+lb lb lb lb.
+Interface	Pool	Blocking behavior	Behavior in early boot time
+T{
+.I /dev/random
+T}	Blocking pool	T{
+Blocks when the entropy estimate is too low until there is enough entropy again
+T}	T{
+Blocks until enough entropy is gathered
+T}
+T{
+.I /dev/urandom
+T}	T{
+Cryptographically-secure Random Number Generator (CRNG) output
+T}	T{
+Does not block once the CRNG is ready
+T}	T{
+Returns output from uninitialized CRNG (possibly low entropy and not suitable for cryptography)
+T}
+T{
+.BR getrandom ()
+T}	T{
+Same as
+.I /dev/urandom
+T}	T{
+Does not block once the pool is ready
+T}	T{
+Blocks until the pool is ready
+T}
+T{
+.BR getrandom ()
+with
+.B GRND_RANDOM
+T}	T{
+Same as
+.I /dev/random
+T}	T{
+Blocks when the entropy estimate is too low until there is enough entropy again
+T}	T{
+Blocks until the pool is ready
+T}
+T{
+.BR getrandom ()
+with
+.B GRND_NONBLOCK
+T}	T{
+Same as
+.I /dev/urandom
+T}	T{
+Does not block
+T}	T{
+Returns -EAGAIN if the pool is not ready
+T}
+T{
+.BR getrandom ()
+with
+.B GRND_RANDOM
+and
+.B GRND_NONBLOCK
+T}	T{
+Same as
+.I /dev/random
+T}	T{
+Returns -EAGAIN if not enough entropy is available
+T}	T{
+Returns -EAGAIN if the pool is not ready
+T}
+.TE
+
+
 .\"
 .SS Generating cryptographic keys
 The amount of seed material required to generate a cryptographic key
-- 
2.10.1
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
