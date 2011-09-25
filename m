From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] readlink.2: Document using st_size to allocate the buffer
Date: Sun, 25 Sep 2011 06:55:38 +0200
Message-ID: <CAKgNAkjAPaHpAK5GarukDqoR68cDrU_LQx9eM9fEixL+t3Zg6g@mail.gmail.com>
References: <20110421031957.GA12346@gaara.hadrons.org> <CAKgNAkj0FjVtJrJgaifSQ-xy+4GQm3GNmjoOndxMfGeXa+titQ@mail.gmail.com>
 <20110925040535.GA10073@gaara.hadrons.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110925040535.GA10073-v62vTE6/wQGgM1MOaoewpti2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Guillem

On Sun, Sep 25, 2011 at 6:05 AM, Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org> wr=
ote:
> Hi!
>
> On Tue, 2011-09-20 at 08:51:41 +0200, Michael Kerrisk wrote:
>> I made some edits to your patch, and placed the added explanatory te=
xt
>> in NOTES, rather than DESCRIPTION. Modified patch below.
>>
>> The change will be in 3.34.
>
> Thanks! Looks good.
>
>> diff --git a/man2/readlink.2 b/man2/readlink.2
>> index c9f6d92..051a870 100644
>> --- a/man2/readlink.2
>> +++ b/man2/readlink.2
>> @@ -1,4 +1,5 @@
>> =C2=A0.\" Copyright (c) 1983, 1991 The Regents of the University of =
California.
>> +.\" Adn Copyright (C) 2011 Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
>
> Small typo: Adn =E2=86=92 And.
>
>> + =C2=A0 =C2=A0r =3D readlink(argv[1], linkname, sb.st_size + 1);
>> +
>> + =C2=A0 =C2=A0if (r < 0) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0perror("lstat");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EXIT_FAILURE);
>> + =C2=A0 =C2=A0}
>> +
>> + =C2=A0 =C2=A0if (r !=3D sb.st_size) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, "symlink increased in s=
ize "
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0"between lstat() and readlink()\\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EXIT_FAILURE);
>> + =C2=A0 =C2=A0}
>
> You might want to change the check condition to =E2=80=9Cr > sb.st_si=
ze=E2=80=9D to
> match the new error string.

Thanks for checking that. Fixed now in git.

Cheers,

Michael
--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
