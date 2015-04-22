From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 3/3] resolv.conf.5: document RES_SNGLKUPREOP
Date: Wed, 22 Apr 2015 11:10:13 +0200
Message-ID: <20150422091013.GA4051@free.fr>
References: <1429662071-23797-1-git-send-email-saulery@free.fr>
 <1429662071-23797-3-git-send-email-saulery@free.fr>
 <553765C2.6060807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <553765C2.6060807-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

Le mercredi 22 avril 2015 =C3=A0 11:11:30, Michael Kerrisk (man-pages) =
a =C3=A9crit :
> On 04/22/2015 02:21 AM, saulery-GANU6spQydw@public.gmane.org wrote:
> > From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> >=20
> > Fix Ubuntu bug #1110781:
> > https://bugs.launchpad.net/ubuntu/+source/manpages/+bug/1110781
>=20
> I need some help here. How is this patch fixing that bug.
> I need a short explanation of the connection for the changelog.

Yes, this bug have been partially resolved by commit:

https://git.kernel.org/cgit/docs/man-pages/man-pages.git/commit/man5/re=
solv.conf.5?id=3Daa87a3f3f8c74fc1f5cb614f6e63aea34fe1a459

and tagged fixe-upstream by Simon Paillard for this Debian bug=C2=A0#69=
9387.

Ubuntu bug #1110781 report is more comprehensive and passing I saw that
RES_SNGLKUPREOP was missed.

Cheers,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
