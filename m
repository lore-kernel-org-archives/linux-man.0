From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch], mdoc(7): Fixing a warning and a table
Date: Sat, 9 Jun 2012 04:35:44 +1200
Message-ID: <CAKgNAkhs-6fiZj+d8hViCpcghFZjLSd_Udb0wPP54eYy3jxK1A@mail.gmail.com>
References: <20120511195430.GA28822@rhi.hi.is> <CAKgNAkjiK4=cDo712__HrS5M4U8AFiyXFYc1vk2c5e7vc=YNmA@mail.gmail.com>
 <20120607203122.GA2595@rhi.hi.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120607203122.GA2595-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Jun 8, 2012 at 8:31 AM, Bjarni Ingi Gislason <bjarniig-2945IVfuVpc@public.gmane.org=
s> wrote:
> On Thu, Jun 07, 2012 at 11:58:15PM +1200, Michael Kerrisk (man-pages)=
 wrote:
>> Bjarni,
>>
>> On Sat, May 12, 2012 at 7:54 AM, Bjarni Ingi Gislason
>> <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org> wrote:
>> > Package: man-pages
>> > Version: 3.40
>> > Severity: minor
>> > Tags: patch
>> >
>> > =A0From "groff -ww ..." (or "man --warnings=3Dw ..."):
>> >
>> > <groff: mdoc.7>:294: warning: tab character in unquoted macro argu=
ment
>> >
>> > =A0In one table the distance between columns is too small in the
>> > "ps" output. =A0(Bug in the groff "doc.tmac" macro?)
>>
>> Thanks. Applied for 3.42.
>>
>
> =A0My patch from that day is a crude one, as I did not know enough.
> The third one (from 14th May) is the correct (best) one.
>
> .Bl -column ".Fl bullet" -compact
> =A0etc.

Hi Bjarni,


What I applied is below. Okay?

Thanks,

Michael

--- a/man7/mdoc.7
+++ b/man7/mdoc.7
@@ -201,7 +201,7 @@ Create lists or columns.
 Options:
 .Bl -tag -width flag -compact
 .It Ar List-types
-.Bl -column xbullet -compact
+.Bl -column ".Fl bullet" -compact
 .It Fl bullet Ta "Bullet Item List"
 .It Fl item Ta "Unlabeled List"
 .It Fl enum Ta "Enumerated List"
@@ -291,7 +291,7 @@ Produces
 .ne 1i
 .Ss Manual Domain Macros
 .Bl -column "Name" "Parsed" Callable" -compact
-.It Em Name    Parsed  Callable        Description
+.It Em "Name   Parsed  Callable        Description"
 .It Li \&Ad Ta Yes Ta Yes Ta "Address. (This macro may be deprecated.)=
"
 .It Li \&An Ta Yes Ta Yes Ta "Author name."
 .It Li \&Ar Ta Yes Ta Yes Ta "Command-line argument."


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
