From: Craig Gallek <kraigatgoog-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] socket.7: Document some BPF-related socket options
Date: Tue, 1 Mar 2016 10:51:20 -0500
Message-ID: <CAEfhGixaxUxon++cTNrs3SrgXa11NpAAgok-_LB-A=JW29wQOw@mail.gmail.com>
References: <1456767399-7533-1-git-send-email-kraigatgoog@gmail.com>
	<56D56901.5070307@gmail.com>
	<87k2lm7bks.fsf@zoro.exoscale.ch>
	<56D56F24.3090605@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D56F24.3090605-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Vincent Bernat <bernat-PWwKhitvBKI@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Mar 1, 2016 at 5:29 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 03/01/2016 11:10 AM, Vincent Bernat wrote:
>>  =E2=9D=A6  1 mars 2016 11:03 +0100, "Michael Kerrisk (man-pages)" <=
mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> :
>               Once   the   SO_LOCK_FILTER  option  has  been  enabled=
,
>               attempts to change or remove the filter  attached  to  =
a
>               socket,  or  to  disable  the SO_LOCK_FILTER option wil=
l
>               fail with the error EPERM.
>
> I think the second paragraph should probably drop mention of privileg=
es,
> right? In fact, maybe just drop the paragraph altogether?
Thanks Michael, all of your changes in the git tree look good to me. I
parsed the one-way nature of LOCK_FILTER completely backwards from the
commit message.  It's describing BSD's root-modify behavior, not the
implementation in Linux.  I think I like this last paragraph as you
have it to explicitly call out this as intended behavior.

Thanks again,
Craig
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
