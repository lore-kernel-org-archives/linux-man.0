From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: Facilitate sending patch
Date: Sat, 7 Mar 2015 15:39:37 +0100
Message-ID: <20150307143937.GA23839@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

If it is possible to customize the file .git/config of the main
repository, it would be nice to add the following lines to make life
easier for (occasional) contributors:

[format]
   to =3D mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
   cc =3D linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
   subjectprefix =3D PATCH
   numbered =3D auto

Emails will be automatically added and [patch] prefix will be correct
even if the user has modified its overall configuration.

Regards,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
