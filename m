From: Colin Walters <walters-gPq2gbYjIk8dnm+yROfE0A@public.gmane.org>
Subject: Re: + prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision
 .patch added to -mm tree
Date: Mon, 22 Aug 2011 20:30:41 -0400
Message-ID: <CADkLE3U-2Mmq5r=G+tHzz3QZbA78vAFkOPdEO7+uBc-C9MbB8A@mail.gmail.com>
References: <201108162011.p7GKBcY0023134@imap1.linux-foundation.org>
	<20110817115543.GA8745@redhat.com>
	<20110817130531.GA12204@redhat.com>
	<CAPXgP10A4rcQLht--h1d3PJE=oOrm=MSjGXTUSKVF+ssnkt_gw@mail.gmail.com>
	<20110817143728.7abc955b@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110817143728.7abc955b-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Cc: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Aug 17, 2011 at 9:37 AM, Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org> wrote:
>
> Now I can see why you want to know when processes exit and do it without
> tampering with the process, but it seems to me that's simply a question
> of us lacking a way to do this nicely, whether inotify/dnotify/etc
> on /proc, some kind of 'also signal me' property or some kind of process
> event interface.

Yes please!  The fact that in Unix one can only get notifications of a
process exiting when one is the parent is just lame, and SIGCHLD (like
all signals) sucks.  Lennart was tossing around a "childfd" namespace
proposal...
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
