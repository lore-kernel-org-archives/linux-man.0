From: "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>
Subject: Re: Documentation for CLONE_NEWPID
Date: Wed, 26 Nov 2008 11:08:51 -0600
Message-ID: <20081126170851.GA24943@hallyn.com>
References: <4923810B.7010201@gmail.com> <20081123222023.GB12687@hallyn.com> <cfd18e0f0811250709x4e2cc5cdhafb9ccf494890442@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0811250709x4e2cc5cdhafb9ccf494890442-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Pavel Emelyanov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sukadev Bhattiprolu <sukadev-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Nadia Derbey <Nadia.Derbey-6ktuUTfB/bM@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Quoting Michael Kerrisk (mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org):
> Hi Serge,
> > I assume you've considered the pros and cons of mentioning
> > signal semantics with respect to init tasks of child pid namespaces,
> > and decided it's not worth mentioning yet as the semantics are not
> > yet finalized?
> >
> > The goal is to treat the process as a system-wide init with respect
> > to signals coming from its own namespace, and treat it as an ordinary
> > task for signals coming from its ancestor namespaces.  But as you've
> > probably read, the implementation may result in some unfortunate
> > side-effects regarding blocked signals etc.
> 
> No I haven't considered this at all.  Could you provide some pointers
> to relevant discussions on this?

The discussions are going on right now on lkml (see for instance
http://lkml.org/lkml/2008/11/15/124).  But I think Nadia has already
written something up.  Nadia, could you send what you have to
Michael?

thanks,
-serge
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
