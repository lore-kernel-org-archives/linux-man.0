From: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Current state of Network Namespaces (NETNS, CLONE_NEWNET)?
Date: Thu, 20 Nov 2008 05:50:19 +0300
Message-ID: <20081120025019.GA2220@x200.localdomain>
References: <492489D1.5080502@gmail.com> <m1d4grfa8w.fsf@frodo.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <m1d4grfa8w.fsf-B27657KtZYmhTnVgQlOflh2eb7JE58TQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Pavel Emelyanov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Stephen Hemminger <shemminger-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Patrick McHardy <kaber-dcUjhNyLwpNeoWH0uzbU5w@public.gmane.org>, den-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org, Daniel Lezcano <dlezcano-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Nov 19, 2008 at 05:37:35PM -0800, Eric W. Biederman wrote:
> Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
> 
> > Sorry for the shotgun mail, but in the end,  it's
> > not clear who can best answer my question(s).
> >
> > I'm currently trying to add documentation of all of
> > the undocumented CLONE_* flags.  One of these is
> > CLONE_NEWNET, and I could use (quite a lot of) help.  
> >
> > My questions:
> >
> > What is the current state of the network namespace 
> > implementation?  Is it complete?  
> 
> No.  It is fairly close though and there is general agreement
> on what it is.
> 
> ipv4 and ipv6 are mostly complete and useable.
> ip tables support is in progress.

iptables will be mostly complete in 2.6.28.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
