From: Quentin Rameau <quinq-UlqG2OPX9a0ue8ZPuPpd/Q@public.gmane.org>
Subject: Re: [PATCH] mkstemp: fix _POSIX_C_SOURCE value for mkstemp()
Date: Thu, 21 Jul 2016 19:19:31 +0200
Message-ID: <20160721191931.305a456e@wee.quinq.eu.org>
References: <20160708000626.GA26576@alpha.fifth.space>
	<20160714093249.GA25778@alpha.fifth.space>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160714093249.GA25778-lvRy8M+iZ/WfwRssfSzb0bNAH6kLmebB@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

*ping*

> *ping*
> 
> Forgive me for being insistant, but as there has been no response to
> this thread, and with all the spam thas has been going on on the ml in
> the last few days, I'm thinking maybe you didn't see it pass.
> Or maybe you just don't find it acceptable, then a response would be
> appreciated anyway.
> Thanks for your time!
> 
> > Here are more informations to save you the time searching for it.
> > Introduced in f095bb7 (2010-01-09) in stdlib/stdlib.h line 609:
> > 
> > +#if defined __USE_MISC || defined __USE_XOPEN_EXTENDED \
> > +    || defined __USE_XOPEN2K8
> > [..]
> > extern int mkstemp (char *__template) __nonnull ((1)) __wur;
> > 
> > And in include/features.h (from glibc 2.12 e28c887):
> > 
> > #if (_POSIX_C_SOURCE - 0) >= 200112L
> > # define __USE_XOPEN2K		1
> > # undef __USE_ISOC95
> > # define __USE_ISOC95		1
> > # undef __USE_ISOC99
> > # define __USE_ISOC99		1
> > #endif
> > 
> > #if (_POSIX_C_SOURCE - 0) >= 200809L
> > # define __USE_XOPEN2K8		1
> > # undef  _ATFILE_SOURCE
> > # define _ATFILE_SOURCE	1
> > #endif
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-man" in the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html  
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man"
> in the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
