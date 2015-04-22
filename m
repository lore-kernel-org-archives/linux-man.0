From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <agruen-mXXj517/zsQ@public.gmane.org>
Subject: Re: [Acl-devel] Moving attr(5) man page to man-pages
Date: Wed, 22 Apr 2015 14:16:15 +0200
Message-ID: <CAHpGcMLQPmz3-Wh3oRbx=pqdJDr6GHmRqbfR3vEedfZajFZ1nQ@mail.gmail.com>
References: <5537620E.3000601@gmail.com>
	<CAHpGcM+OcP1=z6KmcfqQX2L7TcFyQuQaNHphMim77zNQ_5TqYQ@mail.gmail.com>
	<55378CD2.7060408@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55378CD2.7060408-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, acl-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

2015-04-22 13:58 GMT+02:00 Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>>> I've made a number of edits to the page. Some of these were just
>>> to bring the page closer to man-pages style,
>>
>> The \(em dashes don't render in terminals very well.
>
> What's the problem? (Many existing pages use \(em dashes
> so this change was just for consistency.)

It's just ugly; there isn't a big difference between a hyphen and an em-dash.

>> In addition, I would remove the list of file systems with extended
>> attribute support; they are supported pretty much everywhere to some
>> degree at least, even on  tmpfs.
>
> Fair enough. I see your patch does that.
>
>> I'm attaching a patch that also includes a few other minor changes.
>
> Thanks! Applied.
>
> By the way, the piece
>
>     The list of attribute names that can be returned is also
>     limited to 64 kB.
>
> Is a limitation that affects listxattr(2), right? Maybe I should add
> a sentence on that point to that page.

Yes, thanks.

> Also, what does this mean is someone (tries to) create(s) more than
> 64 kB of attribute names on a file? Do you get an error on setxattr(),
> or is it the case that some names are unretrievable?
>
> Hmm... some light testing (using XFS) suggests that one can create
> more than 64 kB of attribute names, but then listxattr() fails
> with E2BIG. That seems like a sad corner case :-(.

That's what will happen, yes. I don't have a good idea how to fix this.

Andreas
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
