From: Omar Sandoval <osandov-nWWhXC5lh1RBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] mount.2: document MS_REC and shared subtree flags
Date: Thu, 12 May 2016 10:58:48 -0700
Message-ID: <20160512175848.GA19948@vader>
References: <8896f51c3802ade59b398058c1d22c9830f9ae09.1463037379.git.osandov@fb.com>
 <57344070.3020603@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57344070.3020603-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Omar Sandoval <osandov-b10kYP2dOMg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, May 12, 2016 at 10:36:00AM +0200, Florian Weimer wrote:
> On 05/12/2016 09:17 AM, Omar Sandoval wrote:
> > +.BR MS_PRIVATE " (since Linux 2.6.15)"
> > +Set the mount propagation on this mountpoint to private. Mounts will not
> > +propagate to or from replicated subtrees.
> > +When used, this must be the only flag in
> > +.IR mountflags .
> 
> Is the last sentence actually true?  Further down, your patch mentions
> combining MS_PRIVATE with other flags.
> 
> Thanks,
> Florian

Yeah, you're right, I documented that it can be combined with MS_REC,
and looking closer, it can also be combined with MS_SILENT. Even more
confusing is that there's a bunch of flags that we'll end up ignoring:

	flags &= ~(MS_NOSUID | MS_NOEXEC | MS_NODEV | MS_ACTIVE | MS_BORN |
		   MS_NOATIME | MS_NODIRATIME | MS_RELATIME| MS_KERNMOUNT |
		   MS_STRICTATIME);

So any of those flags are ignored, MS_REC and MS_SILENT are valid, and
anything else is an error. I'll try to come up with an explanation that
makes sense, but it's a bit of a mess.

-- 
Omar
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
