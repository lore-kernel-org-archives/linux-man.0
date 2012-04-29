From: Simon Paillard <simon.paillard-RGJHTEmuthQGuQl/6FzYuenJ6Cvpl5oe@public.gmane.org>
Subject: Re: missing git tag 3.39 d2f920ab4
Date: Sun, 29 Apr 2012 21:03:14 +0200
Message-ID: <20120429190314.GH31953@glenfiddich.mraw.org>
References: <20120429002044.GF31953@glenfiddich.mraw.org>
 <CAKgNAkjhBtSqynxHvKqSuHObK7YOh+LuREphYrdZBCz5p_eV_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkjhBtSqynxHvKqSuHObK7YOh+LuREphYrdZBCz5p_eV_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Apr 30, 2012 at 06:57:32AM +1200, Michael Kerrisk (man-pages) wrote:
> On Sun, Apr 29, 2012 at 12:20 PM, Simon Paillard wrote:
> > Minor but it seems 3.39 tag is missing in git, for commit:
> > d2f920ab461da9d8 Ready for 3.39
> 
> There's a tag on d2f920ab461da9d836bfc2d63b52108339efa3ba
> Is that not what you're looking for? (I did mess up the tagging on
> 3.39, but I think things are fixed now.)

Here:
$ git describe d2f920ab461da9d836bfc2d63b52108339efa3ba
man-pages-3.38-67-gd2f920a

http://git.kernel.org/?p=docs/man-pages/man-pages.git;a=shortlog doesn't show
the tag either, and "git tag -l" doesn't show me the tag.

http://git.kernel.org/?p=docs/man-pages/man-pages.git;a=tags show the tab
object exists however..

-- 
Simon Paillard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
