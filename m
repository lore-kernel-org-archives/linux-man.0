From: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] close.2: Mention a need of shutdown before closing
 socket
Date: Wed, 7 Sep 2011 17:54:07 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1109071753440.4579@dhcp-27-109.brq.redhat.com>
References: <1314620800-15587-1-git-send-email-lczerner@redhat.com> <alpine.LFD.2.00.1109011043050.3665@dhcp-27-109.brq.redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1109011043050.3665-D5fXUWdM4RC5eBp5B7zZTR/sF2h8X+2i0E9HWUfgJXw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, 1 Sep 2011, Lukas Czerner wrote:

> On Mon, 29 Aug 2011, Lukas Czerner wrote:
> 
> > When dealing with sockets, we have to be sure that there is no recv
> > still blocking on it on another thread, otherwise it might block forever,
> > since no more messages will be send via the socket. We should advice to
> > use shutdown before closing socket.
> 
> Hello guys,
> 
> I am not subscribed to this ML, but do you have any comments on this one
> ? Could you take it in ?
> 
> Thanks!
> -Lukas

Still no response ?

-Lukas

> 
> > 
> > Signed-off-by: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> >  man2/close.2 |    7 +++++++
> >  1 files changed, 7 insertions(+), 0 deletions(-)
> > 
> > diff --git a/man2/close.2 b/man2/close.2
> > index a2a2961..02472f3 100644
> > --- a/man2/close.2
> > +++ b/man2/close.2
> > @@ -114,6 +114,13 @@ other threads in the same process.
> >  Since a file descriptor may be reused,
> >  there are some obscure race conditions
> >  that may cause unintended side effects.
> > +.PP
> > +When dealing with sockets, you have to be sure that there is no
> > +.BR recv (2)
> > +still blocking on it on another thread, otherwise it might block forever,
> > +since no more messages will be send via the socket. Be sure to use
> > +.BR shutdown (2)
> > +to shut down all parts the connection before closing the socket.
> >  .\" Date: Tue, 4 Sep 2007 13:57:35 +0200
> >  .\" From: Fredrik Noring <noring-zgYzP9v7iJcdnm+yROfE0A@public.gmane.org>
> >  .\" One such race involves signals and ERESTARTSYS. If a file descriptor
> > 
> 
> 

-- 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
