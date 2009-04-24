From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: man-pages-3.21 released
Date: Sat, 25 Apr 2009 04:31:45 +1200
Message-ID: <cfd18e0f0904240931m51784430n560203a8c372d989@mail.gmail.com>
References: <cfd18e0f0904202202l3f50bde9yd0085e0797a553e3@mail.gmail.com>
	 <20090421090528.GL21271@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090421090528.GL21271-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Petr,

2009/4/21 Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>:
> =A0Hullo,
>
> On Tue, Apr 21, 2009 at 05:02:25PM +1200, Michael Kerrisk wrote:
>> Gidday,
>>
>> The Linux man-pages maintainer proudly announces:
>>
>> =A0 =A0man-pages-3.21.tar.gz - man pages for Linux
>>
>> This release is now available for download at:
>>
>> =A0http://www.kernel.org/pub/linux/docs/man-pages
>> =A0or ftp://ftp.kernel.org/pub/linux/docs/man-pages
>
> =A0can you please push out your current tree?

Done.  Sorry -- I was on the move quite a bit, and then stuck behind a
rather restrictive firewall.

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Changes=
 in man-pages-3.21 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>>
>> Released: 2009-04-15, Los Gatos
>
> =A0Isn't this date wrong?

I don't think so.  Why do you?  (But, it's true that my announcement
went out a few days after I posted the tarball.)

>> Changes to individual pages
>> ---------------------------
>>
>> initrd.4
>> =A0 =A0Michael Kerrisk
>> =A0 =A0 =A0 =A0Various minor wording improvements
>>
>> initrd.4
>> =A0 =A0Frank Dana
>> =A0 =A0 =A0 =A0Add missing word in description
>>
>> feature_test_macros.7
>> =A0 =A0Michael Kerrisk
>> =A0 =A0 =A0 =A0Update for glibc 2.10 changes to <features.h>
>> =A0 =A0 =A0 =A0 =A0 =A0From glibc 2.10, <features.h> understands the=
 values 200809
>> =A0 =A0 =A0 =A0 =A0 =A0for _POSIX_C_SOURCE and 700 for _XOPEN_SOURCE=
, and makes
>> =A0 =A0 =A0 =A0 =A0 =A0corresponding changes to defaults for other f=
eature test macros.
>
> =A0So far I was guessing that man-pages are supposed only to have cha=
nges
> in latest released glibc version when they aren't in flux yet. Is the
> policy different? Or is it just a "common sense" policy that changes
> that are obviously fixed already are included?

It's "common sense" -- if I see something that is clearly destined for
a release soon, and I can easily document it, I will.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
