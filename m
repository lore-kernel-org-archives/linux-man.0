From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] armscii-8.7, cp1251.7, iso_8859-3.7, iso_8859-5.7,
	iso_8859-6.7, iso_8859-8.7, iso_8859-10.7, iso_8859-11.7, iso_8859-13.7,
	iso_8859-14.7, koi8-u.7: Fix decimal values in encoding tables
Date: Fri, 2 Jul 2010 09:00:30 +0200
Message-ID: <AANLkTikRqfakpkU1VbqGAzI0VsClvWGZ0dGaJqq4jc2g@mail.gmail.com>
References: <7b3bdec71001181345j72878787re36cd36b5911c1d4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=00504502e1217f579b048a6224ee
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7b3bdec71001181345j72878787re36cd36b5911c1d4-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--00504502e1217f579b048a6224ee
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2010/1/18 I wrote:
[...]
> Octal and hexadecimal values are right, but there are some off-by one
> errors in decimal values. =C2=A0Correct values are printed by this comman=
d:
>
> =C2=A0perl -pi -e 'if (s/^([0-7]+)\t([0-9]+)\t([0-9a-fA-F]+)//)
> =C2=A0 =C2=A0{printf "%03o\t%d\t%s", hex($3), hex($3), $3;};' man7/*.7
> ---
> =C2=A0man7/armscii-8.7 =C2=A0 | =C2=A0 70 +++++++++++++++++++++++++------=
-------------------
> =C2=A0man7/cp1251.7 =C2=A0 =C2=A0 =C2=A0| =C2=A0 72 +++++++++++++++++++++=
+++++--------------------------
> =C2=A0man7/iso_8859-10.7 | =C2=A0 72 ++++++++++++++++++++++++++----------=
----------------
> =C2=A0man7/iso_8859-11.7 | =C2=A0 58 +++++++++++++++++++++---------------=
------
> =C2=A0man7/iso_8859-13.7 | =C2=A0 72 ++++++++++++++++++++++++++----------=
----------------
> =C2=A0man7/iso_8859-14.7 | =C2=A0 72 ++++++++++++++++++++++++++----------=
----------------
> =C2=A0man7/iso_8859-3.7 =C2=A0| =C2=A0 68 ++++++++++++++++++++++++-------=
-----------------
> =C2=A0man7/iso_8859-5.7 =C2=A0| =C2=A0 72 ++++++++++++++++++++++++++-----=
---------------------
> =C2=A0man7/iso_8859-6.7 =C2=A0| =C2=A0 38 +++++++++++++-------------
> =C2=A0man7/iso_8859-8.7 =C2=A0| =C2=A0 60 +++++++++++++++++++++----------=
-----------
> =C2=A0man7/koi8-u.7 =C2=A0 =C2=A0 =C2=A0| =C2=A0 72 +++++++++++++++++++++=
+++++--------------------------
> =C2=A011 files changed, 363 insertions(+), 363 deletions(-)
[...]

Hi,

Please consider applying this patch, it fixes off-by-one errors in
tables of various charsets.

Denis

--00504502e1217f579b048a6224ee
Content-Type: application/x-bzip2;
	name="0001-armscii-8.7-cp1251.7-iso_8859-10.7-iso_8859-11.7-iso.patch.bz2"
Content-Disposition: attachment;
	filename="0001-armscii-8.7-cp1251.7-iso_8859-10.7-iso_8859-11.7-iso.patch.bz2"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gb4ofs3b1

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
--00504502e1217f579b048a6224ee--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
