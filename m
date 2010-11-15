From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: About thread-safety information in library functions' man-pages
Date: Mon, 15 Nov 2010 07:39:46 +0100
Message-ID: <AANLkTi=3MpbEeMksjqMtM81HjhCODVRR7Y9KDo=ivnSQ@mail.gmail.com>
References: <4C7C9EA6.90609@cn.fujitsu.com> <AANLkTimcJ4kSuB-vZSY2_CYDs12S0ODup9-Y9yj-uQrJ@mail.gmail.com>
 <4C8DEC85.8030007@cn.fujitsu.com> <AANLkTikVuuZ1N6C5T+GwbgQEH7EAxXPvqrmATZgcM-gE@mail.gmail.com>
 <4CE0D541.8030807@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4CE0D541.8030807-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: pasky-AlSwsSmVLrQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Peng.

On Mon, Nov 15, 2010 at 7:37 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wr=
ote:
> Hi Michael,
>
> Michael Kerrisk said the following on 2010-11-14 14:40:

[...]

>> Now, before we apply a vast number of patches, it might be good to
>> build a list of pages and the kinds of changes that would be needed
>> for each (look at the latest pthreads(7) page in git for some starti=
ng
>> points on functions that fall into the various categories; possibly
>> your research has revealed additional information about the actual
>> details in glibc). Could you come up with such lists? (They don't ne=
ed
>> to be complete or comprehensive, but it could be helpful to have a
>> picture of where we might start making changes.)
>>
>
> =A0Do you mean the attached list?

Thanks. That looks promising. Could you elaborate on the meanings of
the headings, and also explain how you came up with the lists?

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
