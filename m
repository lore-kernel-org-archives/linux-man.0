From: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Subject: Re: +
 prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision .patch
 added to -mm tree
Date: Fri, 19 Aug 2011 02:48:31 +0200
Message-ID: <1313714913.29251.7.camel@mop>
References: <201108162011.p7GKBcY0023134@imap1.linux-foundation.org>
	 <20110817115543.GA8745@redhat.com>
	 <CAPXgP12rYf2HmmsJAuJw=nrtcjTRR1WzDhLNM47eKhKA1UTfJQ@mail.gmail.com>
	 <20110817134516.GA14136@redhat.com>
	 <20110818124353.GA2839@tango.0pointer.de>
	 <20110818142508.GA30959@redhat.com> <1313691091.1107.9.camel@mop>
	 <CA+55aFxGDbNOhNQJe_LpUMcJCGcW8qFFWzC9H0_KW26Xzb0cXw@mail.gmail.com>
	 <1313704516.15082.5.camel@mop>
	 <CA+55aFyFnMRMuWSSpytwvpk9u5YysMRfTRELyhGX9grWbGyi6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+55aFyFnMRMuWSSpytwvpk9u5YysMRfTRELyhGX9grWbGyi6Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lennart Poettering <mzxreary-uLTowLwuiw4b1SvskN2V4Q@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, 2011-08-18 at 15:22 -0700, Linus Torvalds wrote:
> On Thu, Aug 18, 2011 at 2:55 PM, Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org> wrote:
> >
> > It will be used for all new service managers. UNIX is a pain if you want
> > to watch your children regarding double-forking, if you are not init.
> 
> I'll believe that "all new service managers" when I see it. Until
> then, a new feature is just that - a new feature. Which nobody uses.

That feature will be used in Fedora 17 if we get that properly working.
Promised!

So far we have a pretty good track record in immediately using the stuff
we add to the kernel. People working on the other side usually complain
that we always require such new kernels. :)

> > If you want, we can make the forked processes inherit a flag if the
> > 'subreaper' should be looked up at all. Then we have almost zero
> > overhead if the feature isn't used. You think that's needed?
> 
> Yes, I do. Because with any current system, that "almost zero
> overhead" is just totally wasted effort entirely for zero gain. Which
> just makes me go "Eww".

Yeah, understood. I'll change it with the next round, and we can see how
to go from there.

Thanks,
Kay

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
