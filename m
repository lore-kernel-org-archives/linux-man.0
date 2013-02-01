From: Thomas Jarosch <thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org>
Subject: Re: [man-pages PATCH] Add note about calling fclose(NULL)
Date: Fri, 01 Feb 2013 10:43:21 +0100
Message-ID: <2211833.tieGgo36jp@storm>
References: <1695270.M7m4ekngnN@storm> <201301291344.29011.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201301291344.29011.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Tuesday, 29. January 2013 13:44:28 you wrote:
> On Tuesday 29 January 2013 11:24:43 Thomas Jarosch wrote:
> > --- a/man3/fclose.3
> > +++ b/man3/fclose.3
> > @@ -97,6 +97,10 @@ on disk the kernel buffers must be flushed too, for
> > example, with .BR sync (2)
> > 
> >  or
> >  .BR fsync (2).
> > 
> > +Also it's undefined behavior to call
> > +.BR fclose ()
> > +with a NULL pointer.
> > +
> > 
> >  .SH "SEE ALSO"
> >  .BR close (2),
> >  .BR fcloseall (3),
> 
> i wonder if it'd be better placed in the DESCRIPTION section

I first added it there and then thought it's too prominent.
The "NOTES" section seemed like a better place.

Let's see if it gets accepted at all.

Thomas

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
