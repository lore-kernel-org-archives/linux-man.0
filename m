From: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: missing git tag 3.39 d2f920ab4
Date: Wed, 2 May 2012 00:34:42 +0200
Message-ID: <CAMqf4EHfQ9s3cqG6NmW0LBe7e0+FVQ399Qd3JTfS7nU2KuLjGg@mail.gmail.com>
References: <20120429002044.GF31953@glenfiddich.mraw.org> <CAKgNAkjhBtSqynxHvKqSuHObK7YOh+LuREphYrdZBCz5p_eV_A@mail.gmail.com>
 <20120429190314.GH31953@glenfiddich.mraw.org> <CAKgNAkjH-fS7GgS-+-huO-Yb4Q81+4B=-JjoK8ewgYhAJm=jnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjH-fS7GgS-+-huO-Yb4Q81+4B=-JjoK8ewgYhAJm=jnA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 2012/4/29 Michael Kerrisk (man-pages) wrote:
> On Mon, Apr 30, 2012 at 7:03 AM, Simon Paillard
> <simon.paillard-RGJHTEmuthQGuQl/6FzYuenJ6Cvpl5oe@public.gmane.org> wrote:
>> On Mon, Apr 30, 2012 at 06:57:32AM +1200, Michael Kerrisk (man-pages) wrote:
>>> On Sun, Apr 29, 2012 at 12:20 PM, Simon Paillard wrote:
>>> > Minor but it seems 3.39 tag is missing in git, for commit:
>>> > d2f920ab461da9d8 Ready for 3.39
>>>
>>> There's a tag on d2f920ab461da9d836bfc2d63b52108339efa3ba
>>> Is that not what you're looking for? (I did mess up the tagging on
>>> 3.39, but I think things are fixed now.)
>>
>> Here:
>> $ git describe d2f920ab461da9d836bfc2d63b52108339efa3ba
>> man-pages-3.38-67-gd2f920a
>>
>> http://git.kernel.org/?p=docs/man-pages/man-pages.git;a=shortlog doesn't show
>> the tag either, and "git tag -l" doesn't show me the tag.
>>
>> http://git.kernel.org/?p=docs/man-pages/man-pages.git;a=tags show the tab
>> object exists however..
>
> Fixed now, I believe.

Hello,

Not sure if it is related, but manual pages in current 3.39 tarballs
have no colophon.  This is strange, I downloaded a 3.39 tarball some
days ago, and this one was fine.

Denis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
