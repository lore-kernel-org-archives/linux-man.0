From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] gethostbyname.3: NSS plugins searched first.
Date: Mon, 04 May 2015 22:14:43 +0200
Message-ID: <5547D333.8050602@gmail.com>
References: <554113E3.4040105@redhat.com> <5541ECAE.6080108@gmail.com> <5542DE76.7030201@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5542DE76.7030201-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 05/01/2015 04:01 AM, Carlos O'Donell wrote:
> On 04/30/2015 04:49 AM, Michael Kerrisk (man-pages) wrote:
>> [CC +=3D St=C3=A9phane, since he's been working on related pages rec=
ently]
>>
>> Hi Carlos,
>>
>> On 04/29/2015 07:24 PM, Carlos O'Donell wrote:
>>> The gethostbyname man page should first and foremost list that
>>> the source of the data comes from the NSS plugins. I accept
>>> that the man page is intentionally trying to be vague because
>>> these things are not guaranteed anywhere, the truth is far
>>> more mundane and "default" here IMO applies to a normal glibc
>>> installation on Linux, and the fallback is always a localhost
>>> nameserver.
>>>
>>> I suggest the following changes, but feel free to reword as
>>> you see fit.
>>
>> Thanks. Applied, with a few formatting teaks.
>>
>> One question below.
>>
>>> Patch against master.
>>>
>>> Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>>
>>> diff --git a/man3/gethostbyname.3 b/man3/gethostbyname.3
>>> index 7875f88..59c7bb1 100644
>>> --- a/man3/gethostbyname.3
>>> +++ b/man3/gethostbyname.3
>>> @@ -224,18 +224,20 @@ The domain name queries carried out by
>>>  .BR gethostbyname ()
>>>  and
>>>  .BR gethostbyaddr ()
>>> -use a combination of any or all of the name server
>>> +use a combination of any or all of Name Service Switch
>>> +.BR nsswitch.conf(5)
>>> +configured sources, name servers in \fI/etc/resolv.conf\fP
>>> +.BR resolv.conf(5),
>>> +a local name server
>>>  .BR named (8),
>>>  a broken out line from \fI/etc/hosts\fP, and the Network
>>>  Information Service (NIS or YP), depending upon the contents of th=
e
>>>  \fIorder\fP line in
>>>  .IR /etc/host.conf .
>>
>> Your patch didn't change the last few lines, but you may be able to
>> help... Is the reference to "order" and /etc/host.conf on this page =
not
>> obsolete by now. Looking at host.conf(5), one sees,=20
>=20
> No, order *is* obsolete.
>=20
>>   Historical
>>        The  nsswitch.conf(5) file is the modern way of controlling t=
he
>>        order of host lookups.
>>
>>        In glibc 2.4 and earlier, the following keyword is recognized=
:
>>
>>        order  This keyword specifies how host lookups are to  be  pe=
r=E2=80=90
>>               formed.   It  should  be  followed by one or more look=
up
>>               methods, separated by commas.  Valid methods  are  bin=
d,
>>               hosts, and nis.
>>
>> So, it looks like some fix is required here also. Right?
>=20
> Yes. I didn't know how we wanted to talk about this particular topic.
> The use of "order" is obsolete as of 2.5.
>=20
> The following is a sketch of how I'd rewrite this to be more correct,
> I'm out of time for today, but if you want to fix the formatting and
> check it in that would be awesome.

Applied, with a minor formatting tweak. Thanks, Carlos!

Cheers,

Michael



> diff --git a/man3/gethostbyname.3 b/man3/gethostbyname.3
> index 96f8cd6..5ce1e17 100644
> --- a/man3/gethostbyname.3
> +++ b/man3/gethostbyname.3
> @@ -224,23 +224,26 @@ The domain name queries carried out by
>  .BR gethostbyname ()
>  and
>  .BR gethostbyaddr ()
> -use a combination of any or all of the Name Service Switch
> +rely on the Name Service Switch
>  .RB ( nsswitch.conf (5))
> -configured sources, name servers in \fI/etc/resolv.conf\fP
> -.RB ( resolv.conf (5)),
> -a local name server
> -.RB ( named (8)),
> -a broken-out line from
> -.IR /etc/hosts
> -.RB ( hosts (5)),
> -and the Network
> -Information Service (NIS or YP), depending on the contents of the
> -\fIorder\fP line in
> -.IR /etc/host.conf .
> +configured sources or a local name server
> +.RB ( named (8)).
>  The default action is to query the Name Service Switch
>  .RB ( nsswitch.conf(5))
> -configured sources, followed by a local name server
> +configured sources, failing that, a local name server
>  .RB ( named (8)).
> +
> +.SS Historical
> +The
> +.BR nsswitch.conf (5)
> +file is the modern way of controlling the order of host lookups.
> +.PP
> +In glibc 2.4 and earlier, the
> +.I order
> +keyword was used to control the order of host lookups as defined in
> +.IR /etc/host.conf
> +.RB ( host.conf(5)).
> +
>  .PP
>  The \fIhostent\fP structure is defined in \fI<netdb.h>\fP as follows=
:
>  .sp
> ---
>=20
> Cheers,
> Carlos.
>=20
>=20
>=20
>=20
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
