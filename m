From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 39652] connect (2) under IPv6 has an incomplete list of
 returnable error numbers
Date: Wed, 25 Jun 2014 20:03:16 +0000
Message-ID: <bug-39652-11311-oaQNcZSoe2@https.bugzilla.kernel.org/>
References: <bug-39652-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-39652-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D39652

--- Comment #2 from Tim Chappell <kernel-3dJX9IkHV5SkwWA8rprFa0EOCMrvLtNR@public.gmane.org> ---
Nick,

Thanks for the reply. I've just tested this with version 3.53 of the ma=
n pages
and it now seems correct, apart from:

1. EHOSTUNREACH - this is still missing as a potential reason. I believ=
e it
should be added and the causes are ICMPv6 type 1 code 3 (Address unreac=
hable -
I've verified this to be the case) or ICMPv6 type 3 (Time exceeded =E2=80=
=93 I haven't
verified this case - please check source code).

2. There's also no mention of:

EMSGSIZE or EPROTO - did you check these? I haven't rechecked the sourc=
e since
I originally raised the issue.

Best wishes,

Tim.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
