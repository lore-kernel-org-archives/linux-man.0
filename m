From: chrubis-AlSwsSmVLrQ@public.gmane.org
Subject: Re: [PATCH] man: Add io_setup.3 and io_destroy.3
Date: Thu, 28 Mar 2013 10:35:01 +0100
Message-ID: <20130328093501.GA5788@rei.suse.cz>
References: <20130326170626.GA11360@rei.suse.cz>
 <CAKgNAkgUN7y8j2Gp8sG6hvHMJ=YBV3FGWg=EYj5X1Fg+njNysA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkgUN7y8j2Gp8sG6hvHMJ=YBV3FGWg=EYj5X1Fg+njNysA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!
> > This patch adds two missing manual pages.
> >
> > I've tried to format them in accordance with
> > Linux man-pages project. If these are acked
> > I'll reformat the rest of the io_* system call
> > wrappers man pages to match.
> 
> So, here's what I'm not clear on. AFAIK, the io_setup() wrapper (and
> the other io_*() wrappers) is provided in libaio, right? And libaio is
> a completely separate package from glibc, right?
> 
> The man-pages project documents the Linux syscall and glibc APIs, so
> if my understanding above is correct, then these io_*(3) pages belong
> in the libaio package, not in in man-pages. Could you or Jeff clarify?

You are 100% right and we both got it the first time you said this. I've
simply CCed you so that you can have a quick look at the pages and say
if they have all the information they should have before they got
included into libaio.

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
