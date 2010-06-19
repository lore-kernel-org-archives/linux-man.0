From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: elf.5: EI_BRAND is not exist in Linux
Date: Sat, 19 Jun 2010 14:49:44 +0200
Message-ID: <AANLkTikGiluL6-yrgERQ1vZvbXNJvR3uEBPhed4T_thE@mail.gmail.com>
References: <20100107133046.7d380dcb@keeper.home.local> <cfd18e0f1002022208j7e78def6ycee31e0c818b9351@mail.gmail.com>
	<201002030204.36675.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201002030204.36675.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Yuri, Mike,

On Wed, Feb 3, 2010 at 9:04 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrot=
e:
> On Wednesday 03 February 2010 01:08:03 Michael Kerrisk wrote:
>> On Thu, Jan 7, 2010 at 11:30 AM, Yuri Kozlov wrote:
>> > From elf.5:
>> > =A0e_ident =A0 =A0 This array of bytes specifies to interpret the =
file, ...
>> > =A0 =A0EI_BRAND =A0 =A0Start of architecture identification.
>> >
>> > Value for EI_BRAND is not defined in the linux/elf.h (and gabi too=
).
>> > Maybe add some comment, that is for *BSD only?
>>
>> You've done a patch or two to the elf.5 page in the past. Are you ab=
le
>> to comment on the below? I confirmed Yuri's statement: EI_BRAND isn'=
t
>> in glibc 2.11 source.
>
> not being the glibc source isnt terribly important imo (since there a=
re a lot
> of things glibc's elf.h doesnt define), but the fact it isnt in the g=
abi as
> Yuri notes seems pretty important:
> http://www.sco.com/developers/gabi/latest/ch4.eheader.html
>
> whether it be marked as non-standard (and then we research what rando=
m OSes
> actually define it) or simply drop it, either makes sense to me. =A0t=
he latter
> is obviously less work :).
> -mike

Okay -- I simply removed the test, as shown in the patch below. Okay?

Cheers,

Michael

--- a/man5/elf.5
+++ b/man5/elf.5
@@ -347,9 +347,12 @@ The value for
 .B EI_PAD
 will change in
 the future if currently unused bytes are given meanings.
-.TP
-.BR EI_BRAND
-Start of architecture identification.
+.\" As reported by Yuri Kozlov  and confirmed by Mike Frysinger, EI_BR=
AND is
+.\" not in GABI (http://www.sco.com/developers/gabi/latest/ch4.eheader=
=2Ehtml)
+.\" It looks to be a BSDism
+.\" .TP
+.\" .BR EI_BRAND
+.\" Start of architecture identification.
 .TP
 .BR EI_NIDENT
 The size of the
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
