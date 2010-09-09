From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 18132] ipv6(7) describes IP_PKTINFO, but should be
 IP_RECVPKTINFO instead
Date: Thu, 9 Sep 2010 06:47:51 GMT
Message-ID: <201009090647.o896lp4C011989@demeter1.kernel.org>
References: <bug-18132-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-18132-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D18132





--- Comment #1 from Cameron Kerr <cameron-IvVilBYyKXnB6jxDxCEJHA@public.gmane.org>  2010-09-09 0=
6:47:45 ---
RFC3542 explains this newer API, so I guess the bugs section of the ipv=
6 manual
page needs to be updated also. Particularly, the "2.2 kernel" makes it =
seem
very out-dated; should it say "since the 2.2 kernel"?

BUGS
       The  IPv6  extended  API as in RFC 2292 is currently only partly=
 imple=E2=80=90
       mented; although the 2.2 kernel has near complete support for re=
ceiving
       options,  the  macros  for generating IPv6 options are missing i=
n glibc
       2.1.


RFC3542 Section 4.2, "UDP and Raw Socket Implications", gives a descrip=
tion of
the IPV6_RECVxxx options and the rationale for the "sticky" options.


It would seem that strace is also outdated in this respect.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
