From: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: +
	prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision
	.patch added to -mm tree
Date: Fri, 19 Aug 2011 16:58:15 +0200
Message-ID: <20110819145815.GA15420@redhat.com>
References: <20110817134516.GA14136@redhat.com> <20110818124353.GA2839@tango.0pointer.de> <20110818142508.GA30959@redhat.com> <1313691091.1107.9.camel@mop> <20110818184857.GA12094@redhat.com> <1313717521.991.4.camel@mop> <20110819122503.GA8411@redhat.com> <CAPXgP11KC2fTWBVYo6CBXe924YAyTGhx9=UTBDf4cP5Acuo0NA@mail.gmail.com> <20110819131339.GB8411@redhat.com> <1313763653.1119.12.camel@mop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1313763653.1119.12.camel@mop>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Cc: Lennart Poettering <mzxreary-uLTowLwuiw4b1SvskN2V4Q@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/19, Kay Sievers wrote:
>
> On Fri, 2011-08-19 at 15:13 +0200, Oleg Nesterov wrote:
> > On 08/19, Kay Sievers wrote:
>
> > But this has other (OK, minor) problems too, afaics. First of all, this
> > ->has_child_subreaper = T is not right when the caller exits. We should
> > not look for ->is_child_subreaper parent, our children should to find us.
> >
> > Right?
>
> The flags are still inherited. If the subreaper isn't there anymore, we
> will look it up and not find it. I think that's ok for the very unusual
> case that a service manager goes away and its children still run. We
> will just fall back to the usual PID 1 logic.

Yes, yes, I didn't mean this is really buggy. Just a bit "strange".
Anyway, this is fixed in v4 you sent.

> version 4:

Looks correct... But I don't trust myself. Especially after I missed
the problem with klthreads ;)

I'll try to re-read this patch carefully tomorrow with a fresh head.

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
