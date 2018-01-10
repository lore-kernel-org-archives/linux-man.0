From: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: cgroups(7): documenting cgroups v2 delegation
Date: Wed, 10 Jan 2018 14:14:18 -0800
Message-ID: <20180110221418.GF3460072@devbig577.frc2.facebook.com>
References: <1ce0a885-94fb-7480-7180-7b873c95b1bb@gmail.com>
 <20180108141450.GP3668920@devbig577.frc2.facebook.com>
 <6c9fdaee-739f-164d-d04e-fb3a7319db90@gmail.com>
 <20180109210722.GS3668920@devbig577.frc2.facebook.com>
 <672cd179-31be-e03a-f9ff-ce59b76e23e2@gmail.com>
 <20180110142640.GB3668920@devbig577.frc2.facebook.com>
 <655118da-6d58-8f02-7367-77c10a3c16ea@gmail.com>
 <20180110193907.GC3460072@devbig577.frc2.facebook.com>
 <fdfc4c27-f87c-fab8-894c-f9f21374bab2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fdfc4c27-f87c-fab8-894c-f9f21374bab2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, cgroups-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roman Gushchin <guro-b10kYP2dOMg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello, Michael.

On Wed, Jan 10, 2018 at 11:01:11PM +0100, Michael Kerrisk (man-pages) wrote:
> >>>> Can you please confirm that it's only necessary to delegate this file
> >>>> if we are delegating a threaded subtree?
> >>>
> >>> Replied on the other thread.  The file isn't delegatable as far as I
> >>> can tell.
> >>
> >> So, following on from the discussion in the other thread, my
> >> question above still stands.
> > 
> > Oh, I frankly haven't thought about delegating a threaded subtree.
> 
> I'm still confused. cgroup-v2.txt documents the possibility. You
> wrote that text. We just had a conversation in another thread about the
> fact that cgroup.threads is delegatable. You must have thought at 
> least a little about this?

Oh, I'm probably mixing up two things.

1. When delegating, cgroup.threads should be delegated.  Doing that
   selectively doesn't achieve anything meaningful.

2. I haven't thought much about delegating a sub-protion of a threaded
   subtree.  Everything works the same way.  I just can't think of a
   use case.

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
