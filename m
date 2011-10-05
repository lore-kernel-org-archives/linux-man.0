From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man(7): NAME sample incomplete?
Date: Wed, 5 Oct 2011 08:11:46 +0200
Message-ID: <CAKgNAkh6=ncZv57q5=HiLcVUQZLLThdsn3DQdAWO9w5T3rvXDw@mail.gmail.com>
References: <201106242210.32411.giecrilj@stegny.2a.pl>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201106242210.32411.giecrilj-n4IAqcmFnHAX1+iMCFCb4w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?S8WZacWhdG9mIMW9ZWxlY2hvdnNraQ==?= <giecrilj-n4IAqcmFnHAX1+iMCFCb4w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Chris,

On Fri, Jun 24, 2011 at 10:10 PM, K=C5=99i=C5=A1tof =C5=BDelechovski
<giecrilj-n4IAqcmFnHAX1+iMCFCb4w@public.gmane.org> wrote:
> * The code sample given for the NAME section is incomplete because th=
e actual content sample is not given.
> * Additionally, the description assumes that the item described is a =
command, which need not be the case.
> * The command makewhatis is not present on my system; the documented =
tool to create the whatis database is called mandb.
> * The reference to man(7) in man-pages(7) with respect to the NAME se=
ction should be replaced by lexgrog(1), since it is the authoritative p=
age for whatis.
> * The description on .SH NAME in man(7) should either copy the releva=
nt paragraph of lexgrog(1) or refer to it.
>
> Please fix,
> Chris
>
> Is:
>
> =C2=A0 =C2=A0 =C2=A0 The only mandatory heading is NAME, which should=
 be the first section and be fol=E2=80=90
> =C2=A0 =C2=A0 =C2=A0 lowed on the next line by a one line description=
 of the program:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.SH NAME
>
> =C2=A0 =C2=A0 =C2=A0 It is extremely important that this format is fo=
llowed, and that there is a back=E2=80=90
> =C2=A0 =C2=A0 =C2=A0slash before the single dash which follows the co=
mmand name. =C2=A0This syntax is used
> =C2=A0 =C2=A0 =C2=A0by =C2=A0the =C2=A0makewhatis(8) program to creat=
e a database of short command descriptions
> =C2=A0 =C2=A0 =C2=A0 for the whatis(1) and apropos(1) commands.
>
> Let:
>
> =C2=A0 =C2=A0 =C2=A0 The only mandatory heading is NAME, which should=
 be the first section and be fol=E2=80=90
> =C2=A0 =C2=A0 =C2=A0 lowed on the next line by a one line description=
 of the program:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.SH NAME
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0item \- description
>
> =C2=A0 =C2=A0 =C2=A0 It is extremely important that this format is fo=
llowed, and that there is a back=E2=80=90
> =C2=A0 =C2=A0 =C2=A0slash before the single dash which follows the it=
em name. =C2=A0This syntax is used
> =C2=A0 =C2=A0 =C2=A0by =C2=A0the mandb(8) program to create a databas=
e of short command descriptions
> =C2=A0 =C2=A0 =C2=A0 for the whatis(1) and apropos(1) commands.

Thanks for the detailed report. One thing that would have made it even
better is a patch, since trying to scan for diffs in the above text is
error-prone. I applied the patch below for man-pages-3.36.

Cheers,

Michael

--- a/man7/man.7
+++ b/man7/man.7
@@ -102,22 +102,26 @@ followed by the heading name.
 .\" then place the heading in double quotes.

 The only mandatory heading is NAME, which should be the first section =
and
-be followed on the next line by a one line description of the program:
+be followed on the next line by a one-line description of the program:
 .RS
 .sp
 \&.SH NAME
 .br
+item \\- description
 .sp
 .RE
 It is extremely important that this format is followed, and that there=
 is a
-backslash before the single dash which follows the command name.
+backslash before the single dash which follows the item name.
 This syntax is used by the
-.BR makewhatis (8)
-program to create a database of short command descriptions for the
+.BR mandb (8)
+program to create a database of short descriptions for the
 .BR whatis (1)
 and
 .BR apropos (1)
 commands.
+(See
+.BR lexgrog (1)
+for further details on the syntax of the NAME section.)
 .PP
 For a list of other sections that might appear in a manual page, see
 .BR man-pages (7).
@@ -551,6 +555,7 @@ is not implemented.
 .SH "SEE ALSO"
 .BR apropos (1),
 .BR groff (1),
+.BR lexgrog (1),
 .BR man (1),
 .BR man2html (1),
 .BR whatis (1),



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
