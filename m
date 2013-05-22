From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: More man pages now rendered at man7.or
Date: Thu, 23 May 2013 00:29:50 +0200
Message-ID: <20130522222950.GB28756@glenfiddich.mraw.org>
References: <519CC690.9040005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <519CC690.9040005-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, debian-doc-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

On Wed, May 22, 2013 at 03:22:24PM +0200, Michael Kerrisk wrote:
> As detailed in this blog post [1], I've expanded the set of man pages
> rendered in HTML at http://man7.org/linux/man-pages/ to include pages
> in addition to those provided by the man-pages project. This change
> has several purposes.

> One main purpose is to provide a up-to-date and regularly updated) HTML
> renderings of these man pages. (Most online man page renderings are
> out-of-date to some extent--in some cases, extremely out of date.) The other
> main purpose is to provide information on where to report bugs in each man
> page. To this end, each HTML rendering includes a COLOPHON that describes the
> origin of the page, notes the date when it was extracted, and provides
> information on where to report bugs in the page. (The man-pages project has
> already done this since December 2007, with the result that many more man
> page bugs are nowadays reported.)

A big thanks for that.
(How) Do you plan to deal with translations ?

perkamon-fr, the project which translates man-pages to french, provides them
at:
http://perkamon.traduc.org/
 
> I'm open to adding further projects to the rendered set, if they seem
> relevant. If you think there is a project that should be added, take a look
> at this blog post [3].

Actually, I would me interested in the code used to generate your side.

In Debian, we have http://manpages.debian.net/ whose rendering could be
improved a lot.

It currently shows the manpages of *ALL* packages in Debian, for all languages.

Exemple:
http://manpages.debian.net/cgi-bin/man.cgi?query=git&apropos=0&sektion=0&manpath=Debian+6.0+squeeze&format=html&locale=en

-- 
Simon Paillard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
