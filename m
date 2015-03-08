From: =?utf-8?B?U3TDqXBoYW5l?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: host.conf.5: spoof deprecated ?
Date: Sun, 8 Mar 2015 14:05:10 +0100
Message-ID: <20150308130510.GA3004@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 773443-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

** COPY OF GLIBC BUGZILLA #18091 FOR INFORMATION **
https://sourceware.org/bugzilla/show_bug.cgi?id=3D18091

-----------------------------------------------------

Hello,

A Debian user reported that [1]:

> spoof* keywords (nospoof, spoofalert, spoof) are here from 1996,
> they are still valid keywords but do not have any effect apparently,
> no libraries or tools use them
>=20
> it is misleading to see references to resolv+ and rlogin, the keyword=
s
> are just ignored these days; the only meaning they have is that they
> are
> allowed by host.conf syntax

The glibc source code seems to confirm that the keywords nospoof,
spoofalert and spoof are accepted but without effects. I could find
nothing in the changelog. Could you please confirm that they are
obsolete? I could correct the man page accordingly.

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D773443

Regards,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
