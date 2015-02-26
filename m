From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Re: [patch] user_namespaces.7: Fix two groff warnings for escape
 character ignored
Date: Thu, 26 Feb 2015 10:39:38 +0100
Message-ID: <20150226093938.GA3331@free.fr>
References: <1424939021-3059-1-git-send-email-saulery@free.fr>
 <54EEE236.1000500@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54EEE236.1000500-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

Le jeudi 26 f=C3=A9vrier 2015 =C3=A0 10:07:02, Michael Kerrisk (man-pag=
es) a =C3=A9crit :
>=20
> When do you see these warnings? (I'm not seeing them.)

I use the command bellow for "debugging" manpages :

   $ GROFF_ENCODING=3Dutf8 groff -b -ww -z -mandoc

Cheers,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
