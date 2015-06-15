From: Felix Neumann <felix.neumann-0PLPjs5DLsA@public.gmane.org>
Subject: Error in man cal
Date: Tue, 16 Jun 2015 00:04:38 +0200
Message-ID: <CA+w_OVcn2u5dZH0XQUA2BnabkfLn_WWp1c4iFn+F_2bKYSj5mQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

in the man page for cal there's a small error in section "bugs":

       cal program uses the 3rd of September 1752 as the date of the
       Gregorian calendar reformation -- that is when it happened in Gr=
eat
       Britain and its colonies (including what is now the USA).  Ten d=
ays
       following that date were eliminated by this reformation, so the
       calendar for that month is rather unusual.  The actual historica=
l
       dates at which the calendar reform happened in all the different
       countries (locales) are ignored.

It should read "Eleven days following" instead of "Ten days
following", as the jump is from September 3rd to 14th. (cf. output of
cal 9 1752).

I checked the man page on
http://man7.org/linux/man-pages/man1/cal.1.html as well as my CentOS 6
installation.

I apologize for not submitting in the preferred format for patches,
that's my first report.

Best regards

=46elix

--=20
Bornheimer Stra=C3=9Fe 120 / 53119 Bonn//
(01522) 869 27 41//
http://fxneumann.de / GPG-Schl=C3=BCssel: 0x9CA91B2A
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
