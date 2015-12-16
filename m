From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: The time(2) man page conflicts with glibc
Date: Wed, 16 Dec 2015 15:07:46 +0100
Message-ID: <56717032.7000007@gmail.com>
References: <CAMe9rOoJLk8VzyJKmkOvbmBxhCj4mVA2huYtHJsdxpatbkgJ1g@mail.gmail.com>	<mvmegen94qs.fsf@hawking.suse.de>	<CAMe9rOr_Ydg5Nr7aV8vS0vYEFehSwFBuxrMAnCFXyyVoTF4vJQ@mail.gmail.com>	<5671696B.3070203@gmail.com> <CAMe9rOqsxCEia7OWqzJ-HzZWCra5BTyYqt4japjZTw0pY=fugw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMe9rOqsxCEia7OWqzJ-HzZWCra5BTyYqt4japjZTw0pY=fugw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12/16/2015 02:53 PM, H.J. Lu wrote:
> On Wed, Dec 16, 2015 at 5:38 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 12/15/2015 03:17 PM, H.J. Lu wrote:
>>> On Tue, Dec 15, 2015 at 6:16 AM, Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org> wr=
ote:
>>>> In which way does it conflict?
>>>
>>> On error, ((time_t) -1) is returned, and errno is set appropriately=
=2E
>>
>>
>> So, how would the following text be for the man page?
>>
>>     ERRORS
>>        EFAULT t  points  outside your accessible address space.  On =
sys=E2=80=90
>>               tems where the C library time() wrapper  function  inv=
okes
>>               an  implementation  provided by the vdso(7) (so that t=
here
>>               is no trap  into  the  kernel),  an  invalid  address =
 may
>>               instead trigger a SIGSEGV signal.
>>
>=20
> time never sets errno.  You can't tell if it returns error when time
> in libc.a is used.

Yes, but the raw system call can give us EFAULT. That needs to be
documented.

By the way, what's the reason that one can't tell if it returns=20
an error when time() in libc.a is used?

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
