From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mlockall(MCL_FUTURE) implies MAP_POPULATE
Date: Thu, 17 Dec 2015 08:06:21 +0100
Message-ID: <56725EED.80502@gmail.com>
References: <20151028010510.GF21688@Sligo.logfs.org> <CAFs=pgb+LatY8WKV+sZsvgUGMtzVsSxwX0FTKx3u5Nuj1AiOYg@mail.gmail.com> <20151216185006.GA31243@Sligo.logfs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151216185006.GA31243-cauy6bAtduhuHSXMRYw1Og@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern-BHEL68pLQRGGvPXPguhicg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/16/2015 07:50 PM, J=C3=B6rn Engel wrote:
> On Wed, Dec 16, 2015 at 07:44:16PM +0100, Michael Kerrisk (man7.org) =
wrote:
>> On 28 October 2015 at 02:05, J=C3=B6rn Engel <joern-BHEL68pLQRGGvPXPguhicg@public.gmane.org>=
 wrote:
>>> Hello Michael!
>>>
>>> Just came across this.  When reading the manpage MLOCK(2), I assume=
 that
>>> mlockall(MCL_FUTURE) does _not_ imply MAP_POPULATE.  But when readi=
ng
>>> the code, I see that it does.
>>>
>>> This little detail can be rather crucial for RT-people, so it might=
 be
>>> worth spelling it out explicitly in the manpage.
>>
>> But, this detail doesn't seem so surprising to me. MCL_FUTURE =3D=3D=
 new
>> pages that are mapped will be locked. Of course they must be populat=
ed
>> into memory when the mapping is created. Or: to put it another way,
>> maybe it would help if you explain why you find the behavior
>> surprising. That might give me a clue about what should be fixed in
>> the man page.
>>
>> But, please take this thread to mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, and cc
>> linux-man-u79uwXL29TaiAVqoAR/hOA@public.gmane.org
>=20
> Done. :)
>=20
> I guess it is a judgement call now.  One fool (me) made the wrong
> assumption and had to a) get into an argument with a coworker and b)
> check the code to realize the mistake.  If fools like me are common, =
it
> might be worth making this point explicit.  If I am the oddball, it
> would be wasting file size and reading time for everyone else.

So, I just realized that a recent change to the API, plus its
associated documentation in the mlock(2) pages actually probably
lessens the chance of this mistake. The next release of man-pages
will include documentation of MCL_ONFAULT:

       MCL_CURRENT Lock  all pages which are currently mapped into the
                   address space of the process.

       MCL_FUTURE  Lock all pages which will become  mapped  into  the
                   address  space of the process in the future.  These
                   could be, for instance, new  pages  required  by  a
                   growing heap and stack as well as new memory-mapped
                   files or shared memory regions.

       MCL_ONFAULT (since Linux 4.4)
                   Used  together  with  MCL_CURRENT,  MCL_FUTURE,  or
                   both.   Mark  all  current  (with  MCL_CURRENT)  or
                   future (with MCL_FUTURE)  mappings  to  lock  pages
                   when  they are faulted in.  When used with MCL_CUR=E2=
=80=90
                   RENT, all present pages are locked, but  mlockall()
                   will  not  fault  in  non-present pages.  When used
                   with MCL_FUTURE, all future mappings will be marked
                   to  lock  pages  when they are faulted in, but they
                   will not be populated by the lock when the  mapping
                   is  created.   MCL_ONFAULT must be used with either
                   MCL_CURRENT or MCL_FUTURE or both.

Do you think that text helps?

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
