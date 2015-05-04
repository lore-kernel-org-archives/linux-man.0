From: William Woodruff <william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
Subject: Re: get_phys_pages.3 review
Date: Mon, 04 May 2015 13:11:31 -0400
Message-ID: <5547A843.901@tuffbizz.com>
References: <55468DF3.3070908@tuffbizz.com> <554728F2.6050406@gmail.com> <55476D0B.8070301@gmx.com> <5547798D.2070507@gmail.com> <55477B04.7030001@tuffbizz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55477B04.7030001-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Just following up on my previous message, here's the updated
page. If you think it's ready for addition, I'll submit the patch for
it tonight.

=2E\" Copyright (c) 2015 William Woodruff (william-d4iiUcZhRQBWk0Htik3J/w@public.gmane.org)
=2E\"
=2E\" %%%LICENSE_START(VERBATIM)
=2E\" Permission is granted to make and distribute verbatim copies of t=
his
=2E\" manual provided the copyright notice and this permission notice a=
re
=2E\" preserved on all copies.
=2E\"
=2E\" Permission is granted to copy and distribute modified versions of=
 this
=2E\" manual under the conditions for verbatim copying, provided that t=
he
=2E\" entire resulting derived work is distributed under the terms of a
=2E\" permission notice identical to this one.
=2E\"
=2E\" Since the Linux kernel and libraries are constantly changing, thi=
s
=2E\" manual page may be incorrect or out-of-date.  The author(s) assum=
e no
=2E\" responsibility for errors or omissions, or for damages resulting =
from
=2E\" the use of the information contained herein.  The author(s) may n=
ot
=2E\" have taken the same level of care in the production of this manua=
l,
=2E\" which is licensed free of charge, as they might when working
=2E\" professionally.
=2E\"
=2E\" Formatted or processed versions of this manual, if unaccompanied =
by
=2E\" the source, must acknowledge the copyright and authors of this wo=
rk.
=2E\" %%%LICENSE_END
=2E\"
=2ETH GET_PHYS_PAGES 3  2015-03-02 "GNU" "Linux Programmer's Manual"
=2ESH NAME
get_phys_pages, get_avphys_pages \- get total and available physical
page counts
=2ESH SYNOPSIS
=2Enf
=2EB "#include <sys/sysinfo.h>"
=2Esp
=2EB long int get_phys_pages(void);
=2EB long int get_av_phys_pages(void);
=2ESH DESCRIPTION
The function
=2EBR get_phys_pages ()
returns the total number of physical pages of memory available on the
system.

The function
=2EBR get_avphys_pages ()
returns the number of available physical pages of memory available on t=
he
system.
=2ESH RETURN VALUE
On success, these functions return a nonnegative value as given in
DESCRIPTION.
On failure, they return \-1 and set
=2EI errno
to indicate the cause of the error.
=2ESH ERRORS
=2ETP
=2EB ENOSYS
The system could not provide the required information
(possibly because the
=2EI /proc
filesystem was not mounted).
=2ESH CONFORMING TO
These functions are GNU extensions.
=2ESH NOTES
These functions obtain the required information by scanning the
=2EI MemTotal
and
=2EI MemFree
fields of
=2EIR /proc/meminfo .

The following
=2EBR sysconf (3)
calls provide a portable means of obtaining the same information as the
functions described on this page.

=2Enf
    total_pages =3D sysconf(_SC_PHYS_PAGES);    /* total pages */
    avl_pages =3D sysconf(_SC_AVPHYS_PAGES);    /* available pages */
=2Efi
=2ESH EXAMPLE
The following example shows how
=2EBR get_phys_pages ()
and
=2EBR get_avphys_pages ()
can be used.

=2Enf
#include <stdio.h>
#include <stdlib.h>
#include <sys/sysinfo.h>

int
main(int argc, char *argv[])
{
    printf("This system has %ld pages of physical memory and "
            "%ld pages of physical memory available.\\n",
            get_phys_pages(), get_avphys_pages());
    exit(EXIT_SUCCESS);
}
=2Efi
=2ESH SEE ALSO
=2EBR sysconf (3)


Best,
William

On 05/04/2015 09:58 AM, William Woodruff wrote:
> Hi Michael, William,
>=20
> On 05/04/2015 09:52 AM, Michael Kerrisk (man-pages) wrote:
>> Hi William,
>>
>> On 05/04/2015 02:58 PM, J William Piggott wrote:
>>> On 05/04/2015 04:08 AM, Michael Kerrisk (man-pages) wrote:
>>>> Hello William,
>>>>
>>>> On 05/03/2015 11:06 PM, William Woodruff wrote:
>>>
>>>
>>>>> returns the total number of physical pages of memory available on=
 the
>>>>> system.
>>>>> .sp
>>>>
>>>> No need for .sp here. Just use a blank line for the para break.
>>>
>>> This is Groff specific behavior. From roff(7):
>>>  =C2=B7      Never include empty or blank lines in a roff document.
>>
>> I'm not sure whether that text applies or not. But in any case,
>> we've got hundreds of pages that happily use blank lines.
>> If you mist, you can instead use ".PP", but ".sp" seems
>> wrong to me.
>=20
> I'll follow your advice here. I've seen the rule about never using
> blank lines in groff, but if other pages do it, I'll assume the behav=
ior
> is reasonable.
>=20
> Best,
> William Woodruff
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
