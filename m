From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for boot.7
Date: Thu, 4 Nov 2010 07:26:38 +0100
Message-ID: <AANLkTim4+0aiA85Q5wEL1FUh+vZOUjfyq1gnESw8rSRD@mail.gmail.com>
References: <20100913210251.620e7a76@keeper.home.local> <AANLkTi=C=daUa0Gh8aRCHmPG2SVYs=eE7br3F+1uejC9@mail.gmail.com>
 <20101102185059.3fbf393c@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101102185059.3fbf393c-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Nov 2, 2010 at 4:50 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote:
> =F7 Sun, 19 Sep 2010 15:54:26 +0200
> Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =D0=C9=DB=C5=D4:
>
>> On Mon, Sep 13, 2010 at 7:02 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wr=
ote:
>> > Hello.
>> >
>> > --- man-pages-git/man7/boot.7 =9A 2010-03-26 17:46:41.000000000 +0=
300
>> > +++ /tmp/boot.7 2010-09-13 21:01:17.000000000 +0400
>> > @@ -127,8 +127,8 @@
>> > =9ANote:
>> > =9AThe following description applies to System V release 4 based s=
ystem,
>> > which currently covers most commercial Unix systems (Solaris, HP-U=
X,
>> > Irix, Tru64) -as well as the major Linux distributions (RedHat,
>> > Debian, Mandrake, -Suse, Caldera).
>> > +as well as the major Linux distributions (RedHat, Debian, Mandriv=
a,
>> > +Suse, Ubuntu).
>> > =9ASome systems (Slackware Linux, FreeBSD, OpenBSD)
>> > =9Ahave a somewhat different scheme of boot scripts.
>>
>> Applied for 3.27. Thanks Yuri.
>
> http://git.kernel.org/?p=3Ddocs/man-pages/man-pages.git;a=3Dblob;f=3D=
man7/boot.7;h=3Dc1f3e10ce3e5c5bdd461ad0e451e530b22f26279;hb=3D80786722b=
116f5002c28e9e0200044f825b236f6
>
> 3.29, "Mandrake" is still here.

=46ixed for 3.31. Thanks for catching that.

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
