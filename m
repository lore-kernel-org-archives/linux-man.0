From: Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more accurate view on /dev/urandom
Date: Fri, 21 Oct 2016 16:55:56 +0200
Message-ID: <1502078.WKIDrC7fJt@tauon.atsec.com>
References: <1461574090.32558.45.camel@redhat.com> <2402524.TIv9Kdt40z@tauon.atsec.com> <1477060710.3888.14.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477060710.3888.14.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Am Freitag, 21. Oktober 2016, 16:38:30 CEST schrieb Nikos Mavrogiannopoulos:

Hi Nikos,

> On Fri, 2016-10-21 at 16:07 +0200, Stephan Mueller wrote:
> > > > -When read, the \fI/dev/random\fP device will return random bytes
> > > > -only within the estimated number of bits of noise in the entropy
> > > > -pool.
> > > > -\fI/dev/random\fP should be suitable for uses that need very
> > > > -high quality randomness such as one-time pad or key generation.
> > > > +When read, the \fI/dev/urandom\fP device return random bytes
> > > > using a
> > > > pseudorandom +number generator seeded from the entropy pool. That
> > 
> > Starting with 4.8, there is no nonblocking_pool any more. Please
> > refer to the ChaCha20 DRNG.
> 
> Hi Stephan,
>  I am not sure the suggestion above is clear to me. The text above (nor
> the rest of the manpage) doesn't mention details about non-
> blocking/blocking pools. I intentionally left such details out as they
> do not provide information to a reader who is not familiar with the
> actual implementation behind it. The CHACHA20 DRNG is another detail
> that I wouldn't like the manpage to mention since it is a technical
> detail and may even change in the future (e.g., to a faster stream
> cipher).

Thanks for the clarification. It just occurred to me due to the use of the 
term "entropy pool". IMHO we cannot speak about such pool any more for the 
component behind /dev/urandom as this now is a real DRNG.

But if you feel that these are too many details, please disregard my comments. 
Then, I see your changes are good.
> 
> Nevertheless, I find this suggestion orthogonal to my text above. There
> may be another update of the manpage to add these details (even though
> I wouldn't really like it).
> 
> > > +.LP
> > > 
> > > > +The \fI/dev/random\fP device is a legacy interface which dates
> > > > back to
> > > > +a time where the cryptographic primitives used in the
> > > > implementation
> > > > +were not widely trusted. It will return random bytes
> > > > +only within the estimated number of bits of fresh noise in the
> > > > entropy
> > > > +pool, blocking if necessary.
> > > > +\fI/dev/random\fP is suitable for applications that need very
> > > > +high quality randomness, and can afford indeterminate delays.
> > 
> > Would it be possible to add something around getrandom stating that
> > it blocks 
> > until initially 128 bits of entropy are measured before it unblocks
> > and 
> > behaves like /dev/urandom? Maybe it makes even sense to add a
> > recommendation 
> > to use getrandom in favor of /dev/urandom?
> 
> Note that this is the manpage on /dev/urandom and /dev/random only.
> getrandom() has a separate manpage which lists (or should list) such
> information. Said that, indeed this suggestion is right, but I think
> this recommendation is mildly already there (the quotes may hide it). It is
> on the 3rd paragraph: "When used during early boot time,       this device
> may return data prior to the entropy pool being initialized.  If this is of
> concern       in your application, use getrandom(2) or /dev/random
> instead."

Ok, I see. If you feel that my suggestion is already covered to the extent 
needed, I would be fine with the original patch here too.

Ciao
Stephan
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
