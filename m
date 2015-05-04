From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: get_phys_pages.3 review
Date: Mon, 04 May 2015 20:24:50 +0200
Message-ID: <5547B972.9050502@gmail.com>
References: <55468DF3.3070908@tuffbizz.com> <554728F2.6050406@gmail.com> <55476D0B.8070301@gmx.com> <5547798D.2070507@gmail.com> <55477B04.7030001@tuffbizz.com> <5547A843.901@tuffbizz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5547A843.901-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: William Woodruff <william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi William,

On 05/04/2015 07:11 PM, William Woodruff wrote:
> Just following up on my previous message, here's the updated
> page. If you think it's ready for addition, I'll submit the patch for
> it tonight.

I think you can submit the page, but see one comment below.

> .\" Copyright (c) 2015 William Woodruff (william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org)
> .\"
> .\" %%%LICENSE_START(VERBATIM)
> .\" Permission is granted to make and distribute verbatim copies of t=
his
> .\" manual provided the copyright notice and this permission notice a=
re
> .\" preserved on all copies.
> .\"
> .\" Permission is granted to copy and distribute modified versions of=
 this
> .\" manual under the conditions for verbatim copying, provided that t=
he
> .\" entire resulting derived work is distributed under the terms of a
> .\" permission notice identical to this one.
> .\"
> .\" Since the Linux kernel and libraries are constantly changing, thi=
s
> .\" manual page may be incorrect or out-of-date.  The author(s) assum=
e no
> .\" responsibility for errors or omissions, or for damages resulting =
from
> .\" the use of the information contained herein.  The author(s) may n=
ot
> .\" have taken the same level of care in the production of this manua=
l,
> .\" which is licensed free of charge, as they might when working
> .\" professionally.
> .\"
> .\" Formatted or processed versions of this manual, if unaccompanied =
by
> .\" the source, must acknowledge the copyright and authors of this wo=
rk.
> .\" %%%LICENSE_END
> .\"
> .TH GET_PHYS_PAGES 3  2015-03-02 "GNU" "Linux Programmer's Manual"
> .SH NAME
> get_phys_pages, get_avphys_pages \- get total and available physical
> page counts
> .SH SYNOPSIS
> .nf
> .B "#include <sys/sysinfo.h>"
> .sp
> .B long int get_phys_pages(void);
> .B long int get_av_phys_pages(void);
> .SH DESCRIPTION
> The function
> .BR get_phys_pages ()
> returns the total number of physical pages of memory available on the
> system.
>=20
> The function
> .BR get_avphys_pages ()
> returns the number of available physical pages of memory available on=
 the
> system.

One too many "available" in that last sentence.

Thanks,

Michael


> .SH RETURN VALUE
> On success, these functions return a nonnegative value as given in
> DESCRIPTION.
> On failure, they return \-1 and set
> .I errno
> to indicate the cause of the error.
> .SH ERRORS
> .TP
> .B ENOSYS
> The system could not provide the required information
> (possibly because the
> .I /proc
> filesystem was not mounted).
> .SH CONFORMING TO
> These functions are GNU extensions.
> .SH NOTES
> These functions obtain the required information by scanning the
> .I MemTotal
> and
> .I MemFree
> fields of
> .IR /proc/meminfo .
>=20
> The following
> .BR sysconf (3)
> calls provide a portable means of obtaining the same information as t=
he
> functions described on this page.
>=20
> .nf
>     total_pages =3D sysconf(_SC_PHYS_PAGES);    /* total pages */
>     avl_pages =3D sysconf(_SC_AVPHYS_PAGES);    /* available pages */
> .fi
> .SH EXAMPLE
> The following example shows how
> .BR get_phys_pages ()
> and
> .BR get_avphys_pages ()
> can be used.
>=20
> .nf
> #include <stdio.h>
> #include <stdlib.h>
> #include <sys/sysinfo.h>
>=20
> int
> main(int argc, char *argv[])
> {
>     printf("This system has %ld pages of physical memory and "
>             "%ld pages of physical memory available.\\n",
>             get_phys_pages(), get_avphys_pages());
>     exit(EXIT_SUCCESS);
> }
> .fi
> .SH SEE ALSO
> .BR sysconf (3)
>=20
>=20
> Best,
> William
>=20
> On 05/04/2015 09:58 AM, William Woodruff wrote:
>> Hi Michael, William,
>>
>> On 05/04/2015 09:52 AM, Michael Kerrisk (man-pages) wrote:
>>> Hi William,
>>>
>>> On 05/04/2015 02:58 PM, J William Piggott wrote:
>>>> On 05/04/2015 04:08 AM, Michael Kerrisk (man-pages) wrote:
>>>>> Hello William,
>>>>>
>>>>> On 05/03/2015 11:06 PM, William Woodruff wrote:
>>>>
>>>>
>>>>>> returns the total number of physical pages of memory available o=
n the
>>>>>> system.
>>>>>> .sp
>>>>>
>>>>> No need for .sp here. Just use a blank line for the para break.
>>>>
>>>> This is Groff specific behavior. From roff(7):
>>>>  =C2=B7      Never include empty or blank lines in a roff document=
=2E
>>>
>>> I'm not sure whether that text applies or not. But in any case,
>>> we've got hundreds of pages that happily use blank lines.
>>> If you mist, you can instead use ".PP", but ".sp" seems
>>> wrong to me.
>>
>> I'll follow your advice here. I've seen the rule about never using
>> blank lines in groff, but if other pages do it, I'll assume the beha=
vior
>> is reasonable.
>>
>> Best,
>> William Woodruff
>>
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
