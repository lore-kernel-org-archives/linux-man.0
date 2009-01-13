From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [PATCH] sys_waitid: return -EFAULT for NULL
Date: Tue, 13 Jan 2009 15:24:57 -0800
Message-ID: <20090113152457.0d7685ad.akpm@linux-foundation.org>
References: <cfd18e0f0901131436ud2cf61bkf0e6b00f4b765bb5@mail.gmail.com>
	<cfd18e0f0901131438n232ba114n27ea2d7964d071de@mail.gmail.com>
	<20090113224759.7DFB7FC3DD@magilla.sf.frob.com>
	<20090113224941.36F19FC3DD@magilla.sf.frob.com>
	<cfd18e0f0901131514i2f7be7f1t2c6275c26dbb6874@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0901131514i2f7be7f1t2c6275c26dbb6874-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, 14 Jan 2009 12:14:20 +1300
"Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:

> On Wed, Jan 14, 2009 at 11:49 AM, Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > It's always been invalid to call waitid() with a NULL pointer.  It was an
> > oversight that it was allowed (and acts like a wait4() call instead).
> >
> > Signed-off-by: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> Modulo the observation that this change will break any Linux-specific
> application that violate POSIX.1's requirement that infop not be NULL
> (*), and rely on the existing Linux behavior for
> waitd(idtype,id,NULL,options):
> 

Well yes.  waitid() has been in there since 2.6.9.  I assume that it
has had this wait4-emulation mode for that amount of time as well?

> 
> (*) It seems unlikely that such applications exist, and we really
> should make this change for POSIX.1 conformance.

Well, we might get away with it.  But formally speaking, we should live
with our Linux-specific screwup.

If we _are_ going to make this change then we should merge it as far
back in -stable as we can, to reduce the risk that people will develop
applications on kernel version A only to have then behave differently
on version B.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
