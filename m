From: Craig Gallek <kraigatgoog-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] socket.7: Document some BPF-related socket options
Date: Tue, 1 Mar 2016 11:31:06 -0500
Message-ID: <CAEfhGizA8h2jzdd82TYwmM04K2u6yRQ=5UCsNkAJyGE6F_Eoig@mail.gmail.com>
References: <1456767399-7533-1-git-send-email-kraigatgoog@gmail.com>
	<56D56901.5070307@gmail.com>
	<87k2lm7bks.fsf@zoro.exoscale.ch>
	<56D56F24.3090605@gmail.com>
	<CAEfhGixaxUxon++cTNrs3SrgXa11NpAAgok-_LB-A=JW29wQOw@mail.gmail.com>
	<CAKgNAkgbJtFQqStHFYt20U+7XKvDyBKN0meJSrrs9xS_cWudDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkgbJtFQqStHFYt20U+7XKvDyBKN0meJSrrs9xS_cWudDw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Vincent Bernat <bernat-PWwKhitvBKI@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Mar 1, 2016 at 11:19 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Craig,
>
> On 1 March 2016 at 16:51, Craig Gallek <kraigatgoog-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Tue, Mar 1, 2016 at 5:29 AM, Michael Kerrisk (man-pages)
>> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 03/01/2016 11:10 AM, Vincent Bernat wrote:
>>>>  =E2=9D=A6  1 mars 2016 11:03 +0100, "Michael Kerrisk (man-pages)"=
 <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> :
>>>               Once   the   SO_LOCK_FILTER  option  has  been  enabl=
ed,
>>>               attempts to change or remove the filter  attached  to=
  a
>>>               socket,  or  to  disable  the SO_LOCK_FILTER option w=
ill
>>>               fail with the error EPERM.
>>>
>>> I think the second paragraph should probably drop mention of privil=
eges,
>>> right? In fact, maybe just drop the paragraph altogether?
>
>> Thanks Michael, all of your changes in the git tree look good to me.=
 I
>> parsed the one-way nature of LOCK_FILTER completely backwards from t=
he
>> commit message.
>
> Actually, so did I initially. Something in the wording there tripped
> us both up. But then when I looked in the code, I could find no check
> for capabilities. So I eventually went back and reparsed the commit
> message correctly :-).
>
>> It's describing BSD's root-modify behavior, not the
>> implementation in Linux.  I think I like this last paragraph as you
>> have it to explicitly call out this as intended behavior.
>
> Okay.
>
> But, what about the second paragraph mentioned in my other mail. I
> think we should just kill it. What do you think?
Ah, that's an interesting question...  I believe the 'typical use
case' paragraph is correct with removal of the 'privilege' qualifiers
(and pretty much lifted from the commit message), but I'll defer to
you as to whether or not it's appropriate for a man page.  There don't
appear to be other such examples in this specific page and anyone who
is really interested in the motivation behind the implementation of a
feature is better off looking at the code and commit messages
anyway...

> Cheers,
>
> Michael
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
