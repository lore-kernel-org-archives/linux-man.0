From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] correct description for TCP_MAXSEG on morden kernel
Date: Thu, 26 Apr 2012 13:06:30 +1200
Message-ID: <CAKgNAkjKynZxQsqGqosniYEvfbaAg8S+dD+=q0Ra2ViQgD73Hg@mail.gmail.com>
References: <20070428100549.GA10466@router.lepton.home> <CAKgNAki2r-W6t0Z8uPPgVLmU4V5hF6zefM9jhn31Pka4nS7F6Q@mail.gmail.com>
 <CALqoU4yLwGg_=+mjHtpBs-9jQqv06kW2GYb6bbynWhbx8WNbtA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALqoU4yLwGg_=+mjHtpBs-9jQqv06kW2GYb6bbynWhbx8WNbtA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lepton <ytht.net-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi lepton,

On Wed, Apr 25, 2012 at 9:46 PM, lepton <ytht.net-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Michael,
>
> I think you have to revert this patch or revise it.
>
> There is a patch in linux 2.6.27 to fix this issue in kernel side, so
>
> The original statement is true for =C2=A0linux <=3D 2.2 and linux >=3D=
 2.6.27 now.
>
> This is the correspoding kernel patch for fix this.
>
> https://lkml.org/lkml/2009/6/30/499

Thanks for catching that! So, looking at the diffs, this change
actually went into mainline in 2.6.28 (it went into the .27 *stable
branch*...). So, it seems to me the patch should now rather be:

=3D=3D=3D=3D=3D
--- a/man7/tcp.7
+++ b/man7/tcp.7
@@ -888,7 +888,8 @@ This option should not be used in code intended to
be portable.
 .B TCP_MAXSEG
 .\" Present in Linux 1.0
 The maximum segment size for outgoing TCP packets.
-If this option is set before connection establishment, it also
+In Linux 2.2 and earlier, and in Linux 2.6.28 and later,
+if this option is set before connection establishment, it also
 changes the MSS value announced to the other end in the initial packet=
=2E
 Values greater than the (eventual) interface MTU have no effect.
 TCP will also impose
=3D=3D=3D=3D=3D

Right?

Cheers,

Michael


> =E5=9C=A8 2012=E5=B9=B44=E6=9C=8823=E6=97=A5 =E4=B8=8B=E5=8D=885:18=EF=
=BC=8CMichael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =E5=86=99=E9=
=81=93=EF=BC=9A
>> On Sat, Apr 28, 2007 at 10:05 PM, lepton <ytht.net-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Hi,
>>> =C2=A0In tcp.7, about TCP_MAXSEG, it reads "If this option
>>> is set before connection establishment, it also changes
>>> the MSS value announced to the other end in the initial
>>> packet."
>>> =C2=A0It is correct for kernel version 2.2, but it is not
>>> =C2=A0correct for modern kernel such as 2.4 and 2.6.
>>> On a linux box with a modern kernel, the setting for
>>> TCP_MAXSEG won't change the MSS value announced to the
>>> other end.
>>> =C2=A0The following patch fix this.
>>> =C2=A0Thanks.
>>>
>>> diff -pru man-pages-2.44/man7/tcp.7 man-pages-2.44-lepton/man7/tcp.=
7
>>> --- man-pages-2.44/man7/tcp.7 =C2=A0 2006-09-07 15:28:56.000000000 =
+0800
>>> +++ man-pages-2.44-lepton/man7/tcp.7 =C2=A0 =C2=A02007-04-28 18:03:=
18.000000000 +0800
>>> @@ -645,7 +645,8 @@ This option should not be used in code i
>>> =C2=A0portable.
>>> =C2=A0.TP
>>> =C2=A0.B TCP_MAXSEG
>>> -The maximum segment size for outgoing TCP packets. =C2=A0If this
>>> +The maximum segment size for outgoing TCP packets. =C2=A0For
>>> +some linux kernel version such as 2.2.x, if this
>>> =C2=A0option is set before connection establishment, it also
>>> =C2=A0changes the MSS value announced to the other end in the
>>> =C2=A0initial packet. =C2=A0Values greater than the (eventual)
>>
>> Thanks.I applied the patch below for man-pages-3.40.
>>
>> Cheers,
>>
>> Michael
>>
>> --- a/man7/tcp.7
>> +++ b/man7/tcp.7
>> @@ -888,7 +888,8 @@ This option should not be used in code intended =
to
>> be portable.
>> =C2=A0.B TCP_MAXSEG
>> =C2=A0.\" Present in Linux 1.0
>> =C2=A0The maximum segment size for outgoing TCP packets.
>> -If this option is set before connection establishment, it also
>> +In Linux 2.2 and earlier,
>> +if this option is set before connection establishment, it also
>> =C2=A0changes the MSS value announced to the other end in the initia=
l packet.
>> =C2=A0Values greater than the (eventual) interface MTU have no effec=
t.
>> =C2=A0TCP will also impose
>> lines 1-23/23 (END)
>>
>>
>>
>> --
>> Michael Kerrisk
>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>> Author of "The Linux Programming Interface"; http://man7.org/tlpi/



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
