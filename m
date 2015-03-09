From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] resolver.3: documents missing options used by _res structure
 defined in resolv.h and indicates defaults options
Date: Mon, 09 Mar 2015 10:49:55 +0100
Message-ID: <54FD6CC3.1000706@gmail.com>
References: <20090505194602.GA7897@cavendish.icomputing.pl> <1425761903-22748-1-git-send-email-saulery@free.fr> <54FC0642.6050800@gmail.com> <20150308120348.GB2050@free.fr> <54FD4AB6.3090102@gmail.com> <20150309075456.GA1253@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150309075456.GA1253-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, 527136-forwarded-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/09/2015 08:54 AM, St=C3=A9phane Aulery wrote:
> Le lundi 09 mars 2015 =C3=A0 08:24:38, Michael Kerrisk (man-pages) a =
=C3=A9crit :
>> Hello St=C3=A9phane,
>>
>> On 03/08/2015 01:03 PM, St=C3=A9phane Aulery wrote:
>>> Hi Michael,
>>>
>>> I made another patch with all your remarks.
>>
>> Did you send it already. (No hurry--it's just that I wonder if I mis=
sed it.)
>=20
> I was waiting your answers to the question bellow before.
>=20
>>>>> +.B RES_BLAST
>>>>> +When resolvers want to even out the load on their nameservers, f=
ollowing
>>>>> +them.=20
>>>>
>>>> I do not understand that last sentence. Could you clarify please.
>>>
>>> I must admit that it's not clear to me either. I think this means t=
hat
>>> server alias are swapped between each request. I have wrong? The wo=
rd
>>> "blast" leaves me skeptical.
>>>
>>> What I found in code source:
>>>
>>> >From resolv.h:
>>>
>>> #define RES_BLAST       0x00020000      /* blast all recursive serv=
ers */
>>>
>>> Form res_send.c
>>>
>>> /*
>>> * Some resolvers want to even out the load on their nameservers.
>>> * Note that RES_BLAST overrides RES_ROTATE.
>>> */
>>> if (__builtin_expect ((statp->options & RES_ROTATE) !=3D 0, 0) &&
>>>    (statp->options & RES_BLAST) =3D=3D 0) {
>>>       struct sockaddr_in6 *ina;
>>>       unsigned int map;
>>>
>>>       n =3D 0;
>>>       while (n < MAXNS && EXT(statp).nsmap[n] =3D=3D MAXNS)
>>>          n++;
>>>       if (n < MAXNS) {
>>>          ina =3D EXT(statp).nsaddrs[n];
>>>          map =3D EXT(statp).nsmap[n];
>>>          for (;;) {
>>>             ns =3D n + 1;
>>>             while (ns < MAXNS
>>>                && EXT(statp).nsmap[ns] =3D=3D MAXNS)
>>>                ns++;
>>>             if (ns =3D=3D MAXNS)
>>>                break;
>>>             EXT(statp).nsaddrs[n] =3D EXT(statp).nsaddrs[ns];
>>>             EXT(statp).nsmap[n] =3D EXT(statp).nsmap[ns];
>>>             n =3D ns;
>>>          }
>>>          EXT(statp).nsaddrs[n] =3D ina;
>>>          EXT(statp).nsmap[n] =3D map;
>>>       }
>>> }
>>
>> Okay -- I leave it to your discretion to choose what to do here.
>=20
> No please, I need your help.

Sorry -- the code is not clear to me, and I don't have the time=20
to investigate deeper.

Google turns up this detail from the O'Reilly DNS and BIND
book:

    "Blast" all recursive servers by sending queries to=20
    the simultaneously. Not implemented yet.

The first sentence makes sense. I'm not sure whether
the second is true for glibc or not. But, I just grepped
the entire C source code for Fedora 20, and found no users=20
of RES_BLAST, so indeed maybe it is not implemented.

Thanks,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
