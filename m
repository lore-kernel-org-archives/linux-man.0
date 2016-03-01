From: Vincent Bernat <bernat-PWwKhitvBKI@public.gmane.org>
Subject: Re: [PATCH v2] socket.7: Document some BPF-related socket options
Date: Tue, 01 Mar 2016 17:36:55 +0100
Message-ID: <87povenoig.fsf@zoro.exoscale.ch>
References: <1456767399-7533-1-git-send-email-kraigatgoog@gmail.com>
	<56D56901.5070307@gmail.com> <87k2lm7bks.fsf@zoro.exoscale.ch>
	<56D56F24.3090605@gmail.com>
	<CAEfhGixaxUxon++cTNrs3SrgXa11NpAAgok-_LB-A=JW29wQOw@mail.gmail.com>
	<CAKgNAkgbJtFQqStHFYt20U+7XKvDyBKN0meJSrrs9xS_cWudDw@mail.gmail.com>
	<CAEfhGizA8h2jzdd82TYwmM04K2u6yRQ=5UCsNkAJyGE6F_Eoig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEfhGizA8h2jzdd82TYwmM04K2u6yRQ=5UCsNkAJyGE6F_Eoig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Craig Gallek's message of "Tue, 1 Mar 2016 11:31:06 -0500")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Craig Gallek <kraigatgoog-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

 =E2=9D=A6  1 mars 2016 11:31 -0500, Craig Gallek <kraigatgoog-Re5JQEeQqe8@public.gmane.org=
m>=C2=A0:

>> But, what about the second paragraph mentioned in my other mail. I
>> think we should just kill it. What do you think?
> Ah, that's an interesting question...  I believe the 'typical use
> case' paragraph is correct with removal of the 'privilege' qualifiers
> (and pretty much lifted from the commit message), but I'll defer to
> you as to whether or not it's appropriate for a man page.  There don'=
t
> appear to be other such examples in this specific page and anyone who
> is really interested in the motivation behind the implementation of a
> feature is better off looking at the code and commit messages
> anyway...

The typical use case is still about privileges since a fully privileged
process could just create a similar socket without the filter. It makes
little sense to create a socket, add a filter and lock it if you keep
your privileges.
--=20
Soap and education are not as sudden as a massacre, but they are more
deadly in the long run.
		-- Mark Twain
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
