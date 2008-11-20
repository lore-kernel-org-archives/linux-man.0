From: Daniel Lezcano <dlezcano-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org>
Subject: Re: Current state of Network Namespaces (NETNS, CLONE_NEWNET)?
Date: Thu, 20 Nov 2008 08:54:36 +0100
Message-ID: <492517BC.3050205@fr.ibm.com>
References: <492489D1.5080502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <492489D1.5080502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Pavel Emelyanov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Stephen Hemminger <shemminger-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Patrick McHardy <kaber-dcUjhNyLwpNeoWH0uzbU5w@public.gmane.org>, den-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk wrote:
> Sorry for the shotgun mail, but in the end,  it's
> not clear who can best answer my question(s).
> 
> I'm currently trying to add documentation of all of
> the undocumented CLONE_* flags.  One of these is
> CLONE_NEWNET, and I could use (quite a lot of) help.  
> 
> My questions:
> 
> What is the current state of the network namespace 
> implementation?  Is it complete?  

It is not complete but mostly usable for ipv4 and ipv6.

There is a network namespace status I filled at:

http://lxc.sourceforge.net/network/status.php

It should be up-to-date.

> What objects are considered part of the network 
> namespace, and therefore distinct for a new network 
> namespace?

The network namespace brings isolation from the layer-2 to upper layers.

> Is there any documentation for network namespaces 
> already?

http://lxc.sourceforge.net/network.php
http://lxc.sourceforge.net/doc/sigops/appcr.pdf

> Are there any test programs for network namespaces?

http://sourceforge.net/projects/lxc/

follow the README page. It is still in development but mainly usable  - 
any feedbacks are welcome :)

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
