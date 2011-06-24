From: =?utf-8?q?K=C5=99i=C5=A1tof_=C5=BDelechovski?=
	<giecrilj-n4IAqcmFnHAX1+iMCFCb4w@public.gmane.org>
Subject: man(7): NAME sample incomplete?
Date: Fri, 24 Jun 2011 22:10:29 +0200
Message-ID: <201106242210.32411.giecrilj@stegny.2a.pl>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

* The code sample given for the NAME section is incomplete because the =
actual content sample is not given. =20
* Additionally, the description assumes that the item described is a co=
mmand, which need not be the case. =20
* The command makewhatis is not present on my system; the documented to=
ol to create the whatis database is called mandb.
* The reference to man(7) in man-pages(7) with respect to the NAME sect=
ion should be replaced by lexgrog(1), since it is the authoritative pag=
e for whatis. =20
* The description on .SH NAME in man(7) should either copy the relevant=
 paragraph of lexgrog(1) or refer to it.

Please fix,
Chris

Is:=20

       The only mandatory heading is NAME, which should be the first se=
ction and be fol=E2=80=90
       lowed on the next line by a one line description of the program:

              .SH NAME

       It is extremely important that this format is followed, and that=
 there is a back=E2=80=90
      slash before the single dash which follows the command name.  Thi=
s syntax is used
      by  the  makewhatis(8) program to create a database of short comm=
and descriptions
       for the whatis(1) and apropos(1) commands.

Let:

       The only mandatory heading is NAME, which should be the first se=
ction and be fol=E2=80=90
       lowed on the next line by a one line description of the program:

              .SH NAME
              item \- description

       It is extremely important that this format is followed, and that=
 there is a back=E2=80=90
      slash before the single dash which follows the item name.  This s=
yntax is used
      by  the mandb(8) program to create a database of short command de=
scriptions
       for the whatis(1) and apropos(1) commands.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
