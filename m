From: Filippo Santovito <filippo.santovito-06ZeP6ie+xM@public.gmane.org>
Subject: error in shmctl(2) man page
Date: Wed, 30 Jul 2008 18:49:07 +0200
Message-ID: <200807301849.07626.filippo.santovito@email.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

hi,
in shmctl(2) man page the ipc_perm struct contains a key field=20
while /usr/include/bits/ipc.h (included in /usr/include/sys/ipc.h) ipc_=
perm=20
has a __key field.
which is the error? the h header or the man page?
thank you for your attention.
=20
--=20
=46ilippo Santovito
BeLinux
+39 348 3771408
http://www.belinux.it
info-C4B3bgRHLjOonA0d6jMUrA@public.gmane.org

Ai sensi del D.lgs n.196 del 30.06.03 (Codice Privacy) questo messaggio=
 di=20
posta elettronica =C3=A8 da considerarsi strettamente riservato ai dest=
inatari=20
specificati. Se il messaggio =C3=A8 ricevuto per errore, si prega di av=
visare il=20
mittente e di cancellarlo dal proprio sistema.
This message, for the D.lgs n.196 / 30.06.03 (Privacy Code), is to be=20
considered specifically addressed to the recipient(s). Should you recei=
ve it=20
by mistake, please notify the sender and delete it from your system.
=20
=20
 --
 Email.it, the professional e-mail, gratis per te: http://www.email.it/=
f
=20
 Sponsor:
 Carta Eureka realizza i tuoi sogni! Fido fino a 3.000 eruo, rate a par=
tire da 20 euro e canone gratis il 1=B0 anno. Scoprila!
 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?midx76&d0-7
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
