From: Theodore Tso <tytso-3s7WtUTddSA@public.gmane.org>
Subject: Re: MS_I_VERSION added in 2.6.25
Date: Fri, 26 Jun 2009 14:45:22 -0400
Message-ID: <20090626184522.GF7182@mit.edu>
References: <cfd18e0f0906252346v53594fb5u2b2bd630b12ded8e@mail.gmail.com> <20090626171144.GA2282@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090626171144.GA2282-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jean-noel.cordenner-6ktuUTfB/bM@public.gmane.org, cmm-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, mk <michael.kerrisk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Jun 26, 2009 at 01:11:44PM -0400, Christoph Hellwig wrote:
> On Fri, Jun 26, 2009 at 08:46:34AM +0200, Michael Kerrisk wrote:
> > Hi,
> > 
> > Linux 2.6.25 added the MS_I_VERSION flag for inode versioning. Some
> > text on this should be added to the mount(2) man page. Could someone
> > of you provide a short description of
> > 
> > * What inode versions are used for
> 
> I don't think it should be documented.  It should never have been a
> user-visible option to start with and I'm eventually going to fix that.
> 
> The correct way to do this would be a feature flag in the superblock.

Agreed, the intention was this was something which NFSv4 would request
of the filesystem, by flipping a bit.  I don't see a good reason why a
user would ever want to explicit request 64-bit version numbers, since
they're not even visible to userspace.

						- Ted
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
