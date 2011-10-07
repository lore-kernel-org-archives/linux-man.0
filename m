From: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] close.2: Mention a need of shutdown before closing
 socket
Date: Fri, 7 Oct 2011 09:09:01 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1110070906440.7183@dhcp-27-109.brq.redhat.com>
References: <1314620800-15587-1-git-send-email-lczerner@redhat.com> <CAKgNAkjDZufWp-H7NeSRT40FGBRCkMuisesbGcdJnD94OZucUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-356438268-1317971344=:7183"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjDZufWp-H7NeSRT40FGBRCkMuisesbGcdJnD94OZucUA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-356438268-1317971344=:7183
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

On Fri, 7 Oct 2011, Michael Kerrisk wrote:

> Lukas,
> 
> On Mon, Aug 29, 2011 at 2:26 PM, Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > When dealing with sockets, we have to be sure that there is no recv
> > still blocking on it on another thread, otherwise it might block forever,
> > since no more messages will be send via the socket. We should advice to
> > use shutdown before closing socket.
> 
> I'm looking into this now. The picture may be more complex than this.
> Tell me, so you have a Solaris system available for testing?
> 
> Thanks,

Hi Michael,

Thanks for looking into this. Unfortunately I do not have any Solaris system
for testing, that was a customer report. His complaint was mainly not because
the behaviour on Linux differs, but because this was not documented anywhere.

Thanks!
-Lukas

> 
> Michael
> 
> 
> > Signed-off-by: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> >  man2/close.2 |    7 +++++++
> >  1 files changed, 7 insertions(+), 0 deletions(-)
> >
> > diff --git a/man2/close.2 b/man2/close.2
> > index a2a2961..02472f3 100644
> > --- a/man2/close.2
> > +++ b/man2/close.2
> > @@ -114,6 +114,13 @@ other threads in the same process.
> >  Since a file descriptor may be reused,
> >  there are some obscure race conditions
> >  that may cause unintended side effects.
> > +.PP
> > +When dealing with sockets, you have to be sure that there is no
> > +.BR recv (2)
> > +still blocking on it on another thread, otherwise it might block forever,
> > +since no more messages will be send via the socket. Be sure to use
> > +.BR shutdown (2)
> > +to shut down all parts the connection before closing the socket.
> >  .\" Date: Tue, 4 Sep 2007 13:57:35 +0200
> >  .\" From: Fredrik Noring <noring-zgYzP9v7iJcdnm+yROfE0A@public.gmane.org>
> >  .\" One such race involves signals and ERESTARTSYS. If a file descriptor
> > --
> > 1.7.4.4
> >
> >
> 
> 
> 
> 

-- 
--8323328-356438268-1317971344=:7183--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
