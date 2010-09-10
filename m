From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] armscii-8.7, cp1251.7, iso_8859-3.7, iso_8859-5.7,
 iso_8859-6.7, iso_8859-8.7, iso_8859-10.7, iso_8859-11.7, iso_8859-13.7,
 iso_8859-14.7, koi8-u.7: Fix decimal values in encoding tables
Date: Fri, 10 Sep 2010 07:53:04 +0200
Message-ID: <AANLkTint3HS3-OyZr=99EkxvQEBPxr6sdOR42Rs3G4fK@mail.gmail.com>
References: <7b3bdec71001181345j72878787re36cd36b5911c1d4@mail.gmail.com> <AANLkTikRqfakpkU1VbqGAzI0VsClvWGZ0dGaJqq4jc2g@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTikRqfakpkU1VbqGAzI0VsClvWGZ0dGaJqq4jc2g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Jul 2, 2010 at 9:00 AM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 2010/1/18 I wrote:
> [...]
>> Octal and hexadecimal values are right, but there are some off-by on=
e
>> errors in decimal values. =A0Correct values are printed by this comm=
and:
>>
>> =A0perl -pi -e 'if (s/^([0-7]+)\t([0-9]+)\t([0-9a-fA-F]+)//)
>> =A0 =A0{printf "%03o\t%d\t%s", hex($3), hex($3), $3;};' man7/*.7

Applied (finally) as per https://bugzilla.kernel.org/show_bug.cgi?id=3D=
17541

Thanks,

Michael


>> ---
>> =A0man7/armscii-8.7 =A0 | =A0 70 +++++++++++++++++++++++++----------=
---------------
>> =A0man7/cp1251.7 =A0 =A0 =A0| =A0 72 ++++++++++++++++++++++++++-----=
---------------------
>> =A0man7/iso_8859-10.7 | =A0 72 ++++++++++++++++++++++++++-----------=
---------------
>> =A0man7/iso_8859-11.7 | =A0 58 +++++++++++++++++++++----------------=
-----
>> =A0man7/iso_8859-13.7 | =A0 72 ++++++++++++++++++++++++++-----------=
---------------
>> =A0man7/iso_8859-14.7 | =A0 72 ++++++++++++++++++++++++++-----------=
---------------
>> =A0man7/iso_8859-3.7 =A0| =A0 68 ++++++++++++++++++++++++-----------=
-------------
>> =A0man7/iso_8859-5.7 =A0| =A0 72 ++++++++++++++++++++++++++---------=
-----------------
>> =A0man7/iso_8859-6.7 =A0| =A0 38 +++++++++++++-------------
>> =A0man7/iso_8859-8.7 =A0| =A0 60 +++++++++++++++++++++--------------=
-------
>> =A0man7/koi8-u.7 =A0 =A0 =A0| =A0 72 ++++++++++++++++++++++++++-----=
---------------------
>> =A011 files changed, 363 insertions(+), 363 deletions(-)
> [...]
>
> Hi,
>
> Please consider applying this patch, it fixes off-by-one errors in
> tables of various charsets.
>
> Denis
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
