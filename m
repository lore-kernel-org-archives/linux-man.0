From: =?UTF-8?Q?Gr=C3=A9gory_Vander_Schueren?=
        <gregory.vanderschueren-g9H5/arvmg7k1uMJSBkQmQ@public.gmane.org>
Subject: [patch] send.2: Add EALREADY to ERRORS
Date: Tue, 24 Oct 2017 17:21:29 +0200
Message-ID: <CAKQVHKg1yNB5Zpo-sJwckMWiM+TTmggF71wpARWzEzpc0StUnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Found by looking at kernel source:
http://elixir.free-electrons.com/linux/v4.14-rc6/source/net/ipv4/tcp.c#L113=
4

--- man2/send.2 2017-10-24 17:13:12.503137552 +0200
+++ man2/send.2.fix     2017-10-17 17:14:32.260107294 +0200
@@ -353,6 +353,9 @@
 in
 .BR ip (7).
 .TP
+.B EALREADY
+Another Fast Open is in progress.
+.TP
 .B EBADF
 .I sockfd
 is not a valid open file descriptor.

Regards,
Gregory

(Sorry for duplicate, forgot to send as plaintext)

--=20
Gr=C3=A9gory Vander Schueren | R&D Engineer
gregory.vanderschueren-g9H5/arvmg7k1uMJSBkQmQ@public.gmane.org |
Tessares SA | Hybrid Access Solutions
www.tessares.net
6 Rue Louis de Geer, 1348 Louvain-la-Neuve, Belgium

--=20

------------------------------
DISCLAIMER.
This email and any files transmitted with it are confidential and intended=
=20
solely for the use of the individual or entity to whom they are addressed.=
=20
If you have received this email in error please notify the system manager.=
=20
This message contains confidential information and is intended only for the=
=20
individual named. If you are not the named addressee you should not=20
disseminate, distribute or copy this e-mail. Please notify the sender=20
immediately by e-mail if you have received this e-mail by mistake and=20
delete this e-mail from your system. If you are not the intended recipient=
=20
you are notified that disclosing, copying, distributing or taking any=20
action in reliance on the contents of this information is strictly=20
prohibited.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
