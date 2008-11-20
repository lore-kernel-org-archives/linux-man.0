From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: Re: Current state of Network Namespaces (NETNS, CLONE_NEWNET)?
Date: Wed, 19 Nov 2008 17:37:35 -0800
Message-ID: <m1d4grfa8w.fsf@frodo.ebiederm.org>
References: <492489D1.5080502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <492489D1.5080502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Michael Kerrisk's message of "Wed,
	19 Nov 2008 16:49:05 -0500")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Pavel Emelyanov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Stephen Hemminger <shemminger-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Patrick McHardy <kaber-dcUjhNyLwpNeoWH0uzbU5w@public.gmane.org>, den-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org, Daniel Lezcano <dlezcano-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

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

No.  It is fairly close though and there is general agreement
on what it is.

ipv4 and ipv6 are mostly complete and useable.
ip tables support is in progress.
sysfs support is in progress.

decnet and other protocols are possible but there is not currently
any active work in that direction.

> What objects are considered part of the network 
> namespace, and therefore distinct for a new network 
> namespace?

A network namespace is to user space a new logical
instance of the kernel networking stack.

The full kernel networking stack is available in the
initial network namespace.  A subset of the kernel
networking stack is available in other network namespaces
depending upon how much code has been converted.

Network devices live in exactly one network namespace.

> Is there any documentation for network namespaces 
> already?

Not much.  Nor should it need much unique documentation.

Currently the truly unique command is:
ip link set <netdev> netns <pid>

Which moves a network device from one network namespace to another.

There are the veth pair network devices.
Designed so you can put one end in one network namespace and another
end in another network namespace.

There is the macvlan driver that can be sued to create multiple mac addresses
for your ethernet devices allowing native speed inside of a network namespace
on a machine with only one NIC.

There is the fact that /proc/net is now network namespace unique
There is the interesting games we play with /proc/sys/ so we have per network
namespace sysctls.

Other unique network namespace work under discussion.
- Unix domain sockets across network namespaces.
  Is doable but we haven't considered all of the technical details.
- The ongoing discussion about how we provide a more managable interface
  to network namespaces for people doing the whole linux-vrf thing.

Eric

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
