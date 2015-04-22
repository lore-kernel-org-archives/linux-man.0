From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Acl-devel] Moving attr(5) man page to man-pages
Date: Wed, 22 Apr 2015 15:03:55 +0200
Message-ID: <55379C3B.4030100@gmail.com>
References: <5537620E.3000601@gmail.com>	<CAHpGcM+OcP1=z6KmcfqQX2L7TcFyQuQaNHphMim77zNQ_5TqYQ@mail.gmail.com>	<55378CD2.7060408@gmail.com> <CAHpGcMLQPmz3-Wh3oRbx=pqdJDr6GHmRqbfR3vEedfZajFZ1nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHpGcMLQPmz3-Wh3oRbx=pqdJDr6GHmRqbfR3vEedfZajFZ1nQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?QW5kcmVhcyBHcsO8bmJhY2hlcg==?= <agruen-mXXj517/zsQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, acl-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andreas,

On 04/22/2015 02:16 PM, Andreas Gr=C3=BCnbacher wrote:
> 2015-04-22 13:58 GMT+02:00 Michael Kerrisk (man-pages) <mtk.manpages@=
gmail.com>:
>>>> I've made a number of edits to the page. Some of these were just
>>>> to bring the page closer to man-pages style,
>>>
>>> The \(em dashes don't render in terminals very well.
>>
>> What's the problem? (Many existing pages use \(em dashes
>> so this change was just for consistency.)
>=20
> It's just ugly; there isn't a big difference between a hyphen and an =
em-dash.
>=20
>>> In addition, I would remove the list of file systems with extended
>>> attribute support; they are supported pretty much everywhere to som=
e
>>> degree at least, even on  tmpfs.
>>
>> Fair enough. I see your patch does that.
>>
>>> I'm attaching a patch that also includes a few other minor changes.
>>
>> Thanks! Applied.
>>
>> By the way, the piece
>>
>>     The list of attribute names that can be returned is also
>>     limited to 64 kB.
>>
>> Is a limitation that affects listxattr(2), right? Maybe I should add
>> a sentence on that point to that page.
>=20
> Yes, thanks.
>=20
>> Also, what does this mean is someone (tries to) create(s) more than
>> 64 kB of attribute names on a file? Do you get an error on setxattr(=
),
>> or is it the case that some names are unretrievable?
>>
>> Hmm... some light testing (using XFS) suggests that one can create
>> more than 64 kB of attribute names, but then listxattr() fails
>> with E2BIG. That seems like a sad corner case :-(.
>=20
> That's what will happen, yes. I don't have a good idea how to fix thi=
s.

:-(. Okay, I've documented that error in listxattr(2) and added
a BUGS section pointing out that corner case.

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
