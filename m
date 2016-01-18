From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug
 104511]=?UTF-8?Q?=20Add=20=E2=80=9Clocale=20=2Dc=20charmap=E2=80=9D=20as=20an=20example=20to=20locale?=(1)
Date: Mon, 18 Jan 2016 10:42:32 +0000
Message-ID: <bug-104511-11311-QesIjS5fxu@https.bugzilla.kernel.org/>
References: <bug-104511-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-104511-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D104511

--- Comment #2 from Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> ---
(In reply to Marko Myllynen from comment #1)
> Hi Florian,
>=20
> The first example is:
>=20
>        $ locale
>        LANG=3Den_US.UTF-8
>        LC_CTYPE=3D"en_US.UTF-8"
>        ...
>=20
> And there the encoding listed matches the charset in use, do you thin=
k an
> additional example would still be warranted?

Yes, absolutely, because =E2=80=9Clocale -c charmap=E2=80=9D works even=
 if the charset is not
part of the locale name:

$ LC_ALL=3Dzh_CN locale -c charmap=20
LC_CTYPE
GB2312
$ LC_ALL=3Dlzh_TW locale -c charmap=20
LC_CTYPE
UTF-8
$ LC_ALL=3Dzh_HK locale -c charmap=20
LC_CTYPE
BIG5-HKSCS

I don't know of any other convenient way to obtain this information (sh=
ort of
writing a small C program which uses nl_langinfo(CODESET)).

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
