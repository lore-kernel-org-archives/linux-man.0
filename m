From: =?UTF-8?Q?Martin_O=C5=A1mera?= <martin.osmera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: man-pages, Czech version, this letter is related only to the CZ
	version
Date: Sun, 23 Aug 2009 19:30:31 +0200
Message-ID: <733df8ef0908231030o72ee3a0dt7f85a942aaf5b25e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello there.
At first I'd like to mention that I really appreciate your work, but
from my point of view there is a significant flaw. May I ask you why
do you use ISO-8859-2 instead of UTF-8. This makes no sense at all.
=46or instance I have practically never seen any Czech man page with
czech specific characters correctly displayed. It always looks like
this: "
JM=C3=83NO
       passwd - seznam hesel u=C3=85=C2=BEivatel=C3=85=C2=AF

POPIS
       Passwd  je  =C3=84iteln=C3=83=C2=BD  textov=C3=83=C2=BD  soubor,=
  kter=C3=83=C2=BD  obsahuje
seznam =C3=83=C2=BA=C3=84t=C3=85=C2=AF syst=C3=83=C2=A9mu, obsahuj=C3=83=
c=C3=83 pro ka=C3=85=C2=BEd=C3=83=C2=BD =C3=83=C2=BA=C3=84et u=C3=85=C2=
=BEite=C3=84n=C3=83=C2=A9
       informace jako ID u=C3=85=C2=BEivatele, ID skupiny, domovsk=C3=83=
=C2=BD adres=C3=83=C2=A1=C3=85,
shell  apod.   =C3=84asto  tak=C3=83=C2=A9  obsahuje  za=C3=85=C2=A1ifr=
ovan=C3=83=C2=A1  hesla
       =C3=83=C2=BA=C3=84t=C3=85=C2=AF.  M=C3=84l by b=C3=83=C2=BDt =C3=
=84iteln=C3=83=C2=BD pro v=C3=85=C2=A1echny (mnoho utilit, jako
ls(1) jej pou=C3=85=C2=BE=C3=83vaj=C3=83 k namapov=C3=83=C2=A1n=C3=83 I=
D u=C3=85=C2=BEivatele na jm=C3=83=C2=A9no
       u=C3=85=C2=BEivatele), ale zapisovateln=C3=83=C2=BD jen pro supe=
ru=C3=85=C2=BEivatele.
"
Of course it can be easily changed by iconv. Do you plan to change
character encoding in some future version ?

Thank you!
Best regards,
Martin O=C5=A1mera.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
