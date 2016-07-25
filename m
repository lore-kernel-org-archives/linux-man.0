From: "Lars Issing Sauer" <lsa-ZaLajylon1w@public.gmane.org>
Subject: bug in MAN page for data command
Date: Mon, 25 Jul 2016 17:21:21 +0200
Message-ID: <EAA6368FF9FFEC4A9FBC37D3F3C13A93010F4D90@prod-mail.logos.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-class: urn:content-classes:message
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?iso-8859-1?Q?Casper_Thor=F8_Vium_Pedersen?= <CTP-ZaLajylon1w@public.gmane.org>, Jeppe Andreasen <JEA-ZaLajylon1w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

I found that the MAN for "date" has wrong representation of "month" and=
 "minutes".

Command: date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]

According to the description "%M" is minutes and "%m" is month... but t=
he command takes "%M" as month and "%m" as minutes ;)

http://man7.org/linux/man-pages/man1/date.1.html


Best regards
=A0
Lars Sauer
Development Engineer, M.Sc. EE
E-mail: lsa-ZaLajylon1w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
