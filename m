From: "George Spelvin" <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more accurate view on /dev/urandom
Date: 25 Apr 2016 11:46:05 -0400
Message-ID: <20160425154605.7445.qmail@ns.horizon.com>
References: <1461574090.32558.45.camel@redhat.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461574090.32558.45.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I like the bit about indeterminate delays.

Removing the examples of high quality randomness I'm less fond of;
the whole idea is to inform people who don't quite understand what the
general terms mean.  Good enough for one-time pads is a design goal
of /dev/random.

The whole language about "if not X. then a pseudorandom number generator
is used" is actually pretty confusing now that I read it.  It implies
some sort of mode switch which doen't exist.

The bit about early boot is actually not as much of an issue as you think.
Even /dev/urandom will stall early on boot until a minimum initial seed
(128 bits at present) has been acumulated.  (grep for "urandom_init_wait")

How about something more like (draft, not final edit):

 A read from the \fI/dev/urandom\fP device will not block
 waiting for more entropy.
+If the estimated fresh entropy is not sufficient, a \fI/dev/urandom\fP
+will produce output anyway, relying on the cryptographic primitives in
+the driver's pseudo-random number generator to ensure that the output,
+although correlated with previous output in an information theoretic
+sense (it exceeds the unicity distance), is secure for all practical
+purposes.
+
+(One exception: even \fI/dev/urandom\fP will block during early boot until
+a minimum initial seed is accumulated.
+This is currently 128 bits.
+The message "random: nonblocking pool is initialized" appears in the
+kernel logs when this is complete.)
+
+Although the CPRNG is quite robust, and no attack is available in the
+current unclassified literature, it is theoretically possible that such
+an attack exists.

I don't like the bit about "use /dev/random or getrandom(2)"; while
getrandom(2) should be mentioned in "see also", the equivalent is
"getrandom(..., GRND_RANDOM)".  It's the flag, no the syscall.

Either don't mention it here, or mention the flag.

I strongly dislike the deletion of the "as a general rule" advice.
Specific recommendations are very valuable.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
