From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: missing git tag 3.39 d2f920ab4
Date: Mon, 30 Apr 2012 08:07:37 +1200
Message-ID: <CAKgNAkjH-fS7GgS-+-huO-Yb4Q81+4B=-JjoK8ewgYhAJm=jnA@mail.gmail.com>
References: <20120429002044.GF31953@glenfiddich.mraw.org> <CAKgNAkjhBtSqynxHvKqSuHObK7YOh+LuREphYrdZBCz5p_eV_A@mail.gmail.com>
 <20120429190314.GH31953@glenfiddich.mraw.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120429190314.GH31953-8MNqHwMchPhGJ/Ie3qa20WD2FQJk+8+b@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <simon.paillard-RGJHTEmuthQGuQl/6FzYuenJ6Cvpl5oe@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Apr 30, 2012 at 7:03 AM, Simon Paillard
<simon.paillard-RGJHTEmuthQGuQl/6FzYuenJ6Cvpl5oe@public.gmane.org> wrote:
> On Mon, Apr 30, 2012 at 06:57:32AM +1200, Michael Kerrisk (man-pages) wrote:
>> On Sun, Apr 29, 2012 at 12:20 PM, Simon Paillard wrote:
>> > Minor but it seems 3.39 tag is missing in git, for commit:
>> > d2f920ab461da9d8 Ready for 3.39
>>
>> There's a tag on d2f920ab461da9d836bfc2d63b52108339efa3ba
>> Is that not what you're looking for? (I did mess up the tagging on
>> 3.39, but I think things are fixed now.)
>
> Here:
> $ git describe d2f920ab461da9d836bfc2d63b52108339efa3ba
> man-pages-3.38-67-gd2f920a
>
> http://git.kernel.org/?p=docs/man-pages/man-pages.git;a=shortlog doesn't show
> the tag either, and "git tag -l" doesn't show me the tag.
>
> http://git.kernel.org/?p=docs/man-pages/man-pages.git;a=tags show the tab
> object exists however..

Fixed now, I believe.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
