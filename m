From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: proc(5): /proc/[number]/cmdline explanation update
Date: Thu, 14 Feb 2008 19:54:20 +0100
Message-ID: <47B48E5C.2080108@gmail.com>
References: <1202278450.3897.32.camel@sebastian.kern.oss.ntt.co.jp>	 <47B0780D.2090501@gmail.com> <1202795266.22621.16.camel@sebastian.kern.oss.ntt.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1202795266.22621.16.camel-xpvPi5bcW5X5OjGIXfuPlhrrLbDL3r4M6qtp775pBPw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Fernando_Luis_V=E1zquez_Cao?= <fernando-gVGce1chcLdL9jVzuh4AOg@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



=46ernando Luis V=E1zquez Cao wrote:
> Hi Michael,
>=20
> It seems the old description applies to all 2.0, 2.2, and 2.3 kernels=
 up
> to and including 2.3.26. After that the behavior changed as explained=
 in
> my patch.

Thanks.  Patch applied for man-pages-2.79.

Cheers,

Michael

> Fernando
>=20
> On Mon, 2008-02-11 at 17:30 +0100, Michael Kerrisk wrote:
>> Fernando,
>>
>> Do you know when (which kernel version) this change in behavior occu=
rred?
>>
>> Cheers,
>>
>> Michael
>>
>> Fernando Luis V=E1zquez Cao wrote:
>>> It used to be true that the command line arguments were not accessi=
ble
>>> when the process had been swapped out. In ancient kernels (circa 2.=
0.*)
>>> the problem was that the kernel relied on get_phys_addr to access t=
he
>>> user space buffer, which stopped working as soon as the process was
>>> swapped out. Recent kernels use get_user_pages for the same purpose=
 and
>>> thus they should not have that limitation.
>>>
>>> Signed-off-by: Fernando Luis Vazquez Cao <fernando-gVGce1chcLdL9jVzuh4AOg@public.gmane.org>
>>> ---
>>>
>>> --- proc.5.orig	2008-02-06 14:11:58.000000000 +0900
>>> +++ proc.5	2008-02-06 14:56:22.000000000 +0900
>>> @@ -87,12 +87,11 @@ plus one \fIunsigned long\fP value for e
>>>  The last entry contains two zeros.
>>>  .TP
>>>  .I /proc/[number]/cmdline
>>> -This holds the complete command line for the process, unless the w=
hole
>>> -process has been swapped out or the process is a zombie.
>>> -In either of these latter cases, there is nothing in this file:
>>> -that is, a read on this file will return 0 characters.
>>> -The command line arguments appear in this file as a set of
>>> -null-separated strings, with a further null byte after the last st=
ring.
>>> +This holds the complete command line for the process, unless the p=
rocess is a
>>> +zombie. In the latter case, there is nothing in this file: that is=
, a read on
>>> +this file will return 0 characters. The command line arguments app=
ear in this
>>> +file as a set of null-separated strings, with a further null byte =
after the
>>> +last string.
>>>  .TP
>>>  .I /proc/[number]/cwd
>>>  This is a symbolic link to the current working directory of the pr=
ocess.
>>>
>>>
>>>
>=20
>=20

--=20
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
