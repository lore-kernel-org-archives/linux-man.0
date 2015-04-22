From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Acl-devel] Moving attr(5) man page to man-pages
Date: Wed, 22 Apr 2015 13:58:10 +0200
Message-ID: <55378CD2.7060408@gmail.com>
References: <5537620E.3000601@gmail.com> <CAHpGcM+OcP1=z6KmcfqQX2L7TcFyQuQaNHphMim77zNQ_5TqYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHpGcM+OcP1=z6KmcfqQX2L7TcFyQuQaNHphMim77zNQ_5TqYQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Andreas_Gr=FCnbacher?= <agruen-mXXj517/zsQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, acl-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andreas,

On 04/22/2015 12:42 PM, Andreas Gr=FCnbacher wrote:
> Michael,
>=20
> 2015-04-22 10:55 GMT+02:00 Michael Kerrisk (man-pages) <mtk.manpages@=
gmail.com>:
>> Hi Andreas,
>> I'll move this page into Section 7, since that's where overview
>> type pages such as this are normally placed in man-pages, but
>> I'll also create a link in Section 5, so that acl(5) references
>> will continue to work.
>=20
> okay.
>=20
>> I've made a number of edits to the page. Some of these were just
>> to bring the page closer to man-pages style,
>=20
> The \(em dashes don't render in terminals very well.

What's the problem? (Many existing pages use \(em dashes
so this change was just for consistency.)

>> but others were to amend incorrect technical details and add new
>> details. I'd be pleased if you checked over these commits
>=20
> Thanks, that all looks good.

Thanks for checking.

> In addition, I would remove the list of file systems with extended
> attribute support; they are supported pretty much everywhere to some
> degree at least, even on  tmpfs.

=46air enough. I see your patch does that.

> I'm attaching a patch that also includes a few other minor changes.

Thanks! Applied.

By the way, the piece=20

    The list of attribute names that can be returned is also=20
    limited to 64 kB.

Is a limitation that affects listxattr(2), right? Maybe I should add=20
a sentence on that point to that page.

Also, what does this mean is someone (tries to) create(s) more than
64 kB of attribute names on a file? Do you get an error on setxattr(),=20
or is it the case that some names are unretrievable?

Hmm... some light testing (using XFS) suggests that one can create=20
more than 64 kB of attribute names, but then listxattr() fails=20
with E2BIG. That seems like a sad corner case :-(.

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
