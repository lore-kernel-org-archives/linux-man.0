From: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more
 accurate view on /dev/urandom
Date: Fri, 21 Oct 2016 12:33:14 -0400
Message-ID: <20161021163314.cvhjgr4s7lfzdsve@thunk.org>
References: <1461574090.32558.45.camel@redhat.com>
 <1476952646.2522.10.camel@redhat.com>
 <8a5e82db-6f8a-2426-4a68-feab205bca57@gmail.com>
 <2402524.TIv9Kdt40z@tauon.atsec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2402524.TIv9Kdt40z-gNvIQDDl/k7Ia13z/PHSgg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Oct 21, 2016 at 04:07:05PM +0200, Stephan Mueller wrote:
> > > -When read, the \fI/dev/random\fP device will return random bytes
> > > -only within the estimated number of bits of noise in the entropy
> > > -pool.
> > > -\fI/dev/random\fP should be suitable for uses that need very
> > > -high quality randomness such as one-time pad or key generation.
> > > +When read, the \fI/dev/urandom\fP device return random bytes using a
> > > pseudorandom +number generator seeded from the entropy pool. That
> 
> Starting with 4.8, there is no nonblocking_pool any more. Please refer to the 
> ChaCha20 DRNG.

That's true, although I think the suggested text is fine.  It doesn't
reference the nonblocking_ool as near as I can tell.

> Would it be possible to add something around getrandom stating that it blocks 
> until initially 128 bits of entropy are measured before it unblocks and 
> behaves like /dev/urandom? Maybe it makes even sense to add a recommendation 
> to use getrandom in favor of /dev/urandom?

It would certainly be a good idea to suggest the use of getrandom(2),
and the fact that the only difference between getrandom(2) and
/dev/urandom is that getrandom(2) will block until it can safely
generate random numbers.  Unfortunately, there are far too many
programs (including udev and systemd!) that try to use /dev/urandom at
boot time, and making a change to /dev/urandom would break users.  If
any of these use cases are security sensitive, they should really
change it so that users aren't vulnerable to security attacks.  (The
use of systemd on IOT devices especially terrifies me in this regard.)

So anytihng we can do to at least nudge man page readers that they
shouldn't be trying to use any of these interfaces during the boot
sequence would be a Really Good Thing.

						- Ted
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
