From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: should "man feature_test_macros" mention _LARGEFILE_SOURCE?
Date: Thu, 20 Mar 2014 08:53:36 +0100
Message-ID: <532A9E80.9090103@gmail.com>
References: <alpine.LFD.2.11.1403181544010.5574@localhost> <4257256.dYt9XWSnPY@vapier> <53299DAF.20201@gmail.com> <10667348.a89NUKrILg@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10667348.a89NUKrILg@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/19/2014 08:15 PM, Mike Frysinger wrote:
> On Wed 19 Mar 2014 14:37:51 Michael Kerrisk wrote:
>> On 03/19/2014 03:48 AM, Mike Frysinger wrote:
>>> On Tue 18 Mar 2014 15:46:43 Robert P. J. Day wrote:
>>>>   just noticed under /usr/include on my fedora rawhide system the
>>>>
>>>> following:
>>>>
>>>> /usr/include/bits/environments.h:# define __ILP32_OFFBIG_CFLAGS	"-=
m32
>>>> -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64"
>>>> /usr/include/python3.3m/pyconfig-64.h:#define _LARGEFILE_SOURCE 1
>>>> /usr/include/features.h:   _LARGEFILE_SOURCE	Some more functions f=
or
>>>
>>> correct
>>>
>>>> standard I/O. /usr/include/features.h:#  undef _LARGEFILE_SOURCE
>>>> /usr/include/features.h:#  define _LARGEFILE_SOURCE	1
>>>> /usr/include/features.h:#ifdef _LARGEFILE_SOURCE
>>>> /usr/include/python2.7/pyconfig-64.h:#define _LARGEFILE_SOURCE 1
>>>>
>>>> but there's no mention of "_LARGEFILE_SOURCE" in "man
>>>> feature_test_macros". is that assumed to be implied by
>>>> _LARGEFILE64_SOURCE? it's not clear.
>>>
>>> nope, none of the three LFS flags imply each other, nor should they=
=2E=20
>>> they're related, but orthogonal by design.
>>>
>>> i could have sworn i saw a description of them in POSIX, but i can'=
t find
>>> it now.  the GNU C library manual covers it though:
>>> https://www.gnu.org/software/libc/manual/html_node/Feature-Test-Mac=
ros.htm
>>> l
>>>
>>> here's a terse summary off the top of my head:
>>>
>>> _LARGEFILE_SOURCE: expose prototypes for new funcs which POSIX got =
wrong
>>> originally.  e.g. fseek & ftell utilize "long", so fseeko & ftello =
were
>>> added which use "off_t".
>>
>> Thanks, Mike. I'd forgotten those details.
>>
>> So, as far as I can see, _LARGEFILE_SOURCE is largely of (ancient)
>> historical interest, so I don't think I'll bother adding it to the F=
TM(7)
>> page.
>=20
> would be nice to document it ... i tend to get more confused when som=
ething is=20
> left out entirely even if it was done on purpose.  especially since i=
t'd give=20
> us the opportunity to discourage people from using it and drive peopl=
e towards=20
> the One True Way when it comes to LFS flags.

=46air enough. I added the following:

       _LARGEFILE_SOURCE
              This macro was historically used to expose certain func=E2=
=80=90
              tions   (specifically   fseeko(3)  and  ftello(3))  that
              address  limitations  of  earlier  APIs   (feek(3)   and
              ftell(3))  that  use  long  int  for file offsets.  This
              macro is implicitly defined if _XOPEN_SOURCE is  defined
              with a value greater than or equal to 500.  New programs
              should not employ this macro; defining _XOPEN_SOURCE  as
              just  described  or  defining _FILE_OFFSET_BITS with the
              value 64 is the preferred mechanism to achieve the  same
              result.

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
