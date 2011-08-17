From: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Subject: Re: +
 prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision .patch
 added to -mm tree
Date: Wed, 17 Aug 2011 14:37:28 +0100
Message-ID: <20110817143728.7abc955b@lxorguk.ukuu.org.uk>
References: <201108162011.p7GKBcY0023134@imap1.linux-foundation.org>
	<20110817115543.GA8745@redhat.com>
	<20110817130531.GA12204@redhat.com>
	<CAPXgP10A4rcQLht--h1d3PJE=oOrm=MSjGXTUSKVF+ssnkt_gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPXgP10A4rcQLht--h1d3PJE=oOrm=MSjGXTUSKVF+ssnkt_gw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Cc: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-man@vger.kernel.org

O> Why would it? Systemd can serialize its state and properly re-exec
> itself as many times as needed during its lifetime. Why would the
> kernel take something away from a process, which it explicitly asked
> for?

Because a re-exec is a change of context, in the same was as a re-exec
closes some file handles kills alarms, adjusts signals etc. Across an
suid boundary of course it gets even more important.

Why would the kernel allow a parent process, possibly with a different
security context, to muck with defined and guaranteed standards compliant
behaviour it may rely upon.

> Hmm, I don't see why that would be necessary. It's just one of our
> parents that aks for our signals.

I think it is fundamentally the wrong answer. The behaviour in question
is in every Unix since day one and apps rely upon it.

Now I can see why you want to know when processes exit and do it without
tampering with the process, but it seems to me that's simply a question
of us lacking a way to do this nicely, whether inotify/dnotify/etc
on /proc, some kind of 'also signal me' property or some kind of process
event interface.

Of those a signal based one seems the weakest because programmers and
signal often don't mix well because it is asychronous and also because it
wouldn't naturally allow multiple users (eg a process monitoring tool and
systemd to share)

For that matter your init process could farm them back out down a named
pipe or some other such interface and do the monitoring in userspace.

Alan
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
