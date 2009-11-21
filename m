From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: Re: [PATCH] strcpy.3: Remove reference to non-existent strpcpy(3)
Date: Sat, 21 Nov 2009 21:16:07 +0000 (GMT)
Message-ID: <alpine.NEB.2.01.0911212052050.25031@jrf.vwaro.pbz>
References: <1258826146-4474-1-git-send-email-mark@pogo.org.uk> <20091121205012.GF3708@machine.or.cz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091121205012.GF3708-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, 21 Nov 2009, Petr Baudis wrote:

> On Sat, Nov 21, 2009 at 05:55:46PM +0000, Mark Hills wrote:
> > There is no man page or function by this name.
> > 
> > Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
> > ---
> >  man3/strcpy.3 |    1 -
> >  1 files changed, 0 insertions(+), 1 deletions(-)
> > 
> > diff --git a/man3/strcpy.3 b/man3/strcpy.3
> > index 9d47e37..c79efb1 100644
> > --- a/man3/strcpy.3
> > +++ b/man3/strcpy.3
> > @@ -137,6 +137,5 @@ in ways that may make the impossible possible.
> >  .BR memcpy (3),
> >  .BR memmove (3),
> >  .BR strdup (3),
> > -.BR strpcpy (3),
> >  .BR wcscpy (3),
> >  .BR wcsncpy (3)
> 
> In fact, this should be fixed by making it a reference to stpcpy().

... which is the function I was looking for when I stumbled across the 
missing strpcpy() reference. Thanks for finding it for me :-)

I grep'd for any other misleading references to strpcpy() and can't see 
any, so I'll follow up with a revised (tiny) patch, and an extra reference 
in string(3).

-- 
Mark
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
