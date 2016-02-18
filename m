From: =?utf-8?Q?St=C3=A9phane?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Subject: clearenv(3): implies that it's a security tool
Date: Thu, 18 Feb 2016 18:28:19 +0100 (CET)
Message-ID: <2022845728.87847295.1455816499626.JavaMail.root@zimbra51-e8.priv.proxad.net>
Reply-To: =?utf-8?Q?St=C3=A9phane?= Aulery <saulery-GANU6spQydw@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 679323-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, mdz-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

severity 679323 minor
stop
-----

Hello Matt,

I dig your bug reports about the clearenv() function.

Does the sentence below would do, please?


   Used by security-conscious application, with the reservation
   that the memory is not zeroed by the glibc implementation
   before release.


Regards,

--=20
St=C3=A9phane Aulery
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
