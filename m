From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 39652] New: connect (2) under IPv6 has an incomplete list of
 returnable error numbers
Date: Wed, 20 Jul 2011 17:55:00 GMT
Message-ID: <bug-39652-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D39652

           Summary: connect (2) under IPv6 has an incomplete list of
                    returnable error numbers
           Product: Documentation
           Version: unspecified
    Kernel Version: 2.6.37
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: kernel-3dJX9IkHV5SkwWA8rprFa0EOCMrvLtNR@public.gmane.org
        Regression: No


I believe this applies to many 2.6.xx kernel documentation sets.

The man-page for connect (2) has an incomplete list of potential error =
reasons
(indicated in errno) and their descriptive causes when attempting to co=
nnect to
a remote IPv6 server and the return value indicates an error (-1).

Observed by testing with 2.6.37:

ENETUNREACH =E2=80=93 reason should additionally include reference to t=
he receipt of an
ICMPv6 type 1 code 0 (no route to destination) response.

EACCES =E2=80=93 reason should additionally include reference to the re=
ceipt of an
ICMPv6 type 1 code 1 (Administratively prohibited) response.

EHOSTUNREACH =E2=80=93 this isn't documented as a potential reason at p=
resent, but I
believe it should be added and the causes are ICMPv6 type 1 code 3 (Add=
ress
unreachable - I've verified this to be the case) or ICMPv6 type 3 (Time
exceeded =E2=80=93 I haven't verified this case - please check source c=
ode).

ECONNREFUSED =E2=80=93 reason should additionally include reference to =
the receipt of
an ICMPv6 type 1 code 4 (Port unreachable) or TCP RST/ACK response.

Having looked through v2.6.31 source it appears that potentially the fo=
llowing
could also occur although I haven't verified this to be the case:

EMSGSIZE =E2=80=93 ICMPv6 type 2 =E2=80=93 ICMPv6 type 2 (Packet too bi=
g)
EPROTO =E2=80=93 ICMPv6 type 4 =E2=80=93 ICMPv6 type 4 (Parameter probl=
em)

Thanks.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
