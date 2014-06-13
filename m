From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iconv.1: New page for iconv(1)
Date: Fri, 13 Jun 2014 13:45:51 +0200
Message-ID: <CAKgNAkjnw3zkgTa=mDtnny7rZH36efr5HpJiZ9SsXExXTA4Lmg@mail.gmail.com>
References: <5396C41B.2040707@redhat.com> <53975C76.7060302@gmail.com>
 <53980EC4.2030508@redhat.com> <53982A56.2000509@gmail.com>
 <539859E9.8040306@redhat.com> <CAKgNAkj=Y6P+C4SYegOejWJwGJQE96Jr6=Hej9PQFRiDXLzTDQ@mail.gmail.com>
 <53986452.2030308@redhat.com> <5398AAE7.3090307@gmail.com>
 <5399E60D.8010607@redhat.com> <CAKgNAkgc4ASriZyv7bhjBJ-H17KYX0b4Pwb8175y++pCD1ZXbg@mail.gmail.com>
 <539AC116.4050803@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <539AC116.4050803-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Jun 13, 2014 at 11:15 AM, Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> =
wrote:
> Hi,
>
> On 2014-06-12 21:44, Michael Kerrisk (man-pages) wrote:
>>>
>>>> ENVIRONMENT
>>>>        Internally, the iconv program uses the iconv(3) function  w=
hich
>>>>        in   turn   uses   gconv  modules  (dynamically  loaded  sh=
ared
>>>>        libraries) to convert to and  from  a  character  set.   Be=
fore
>>>>        calling  iconv(3), the iconv program must first allocate a =
con=E2=80=90
>>>>        version descriptor using iconv_open(3).  The operation  of =
 the
>>>>        latter  function is influenced by the setting of the GCONV_=
PATH
>>>>        environment variable:
>>>>
>>>>        *  If GCONV_PATH is not set,  iconv_open(3)  loads  the  sy=
stem
>>>>           gconv  cache  file created by iconvconfig(8) and then, b=
ased
>>>>           on the configuration, loads the gconv modules needed to =
per=E2=80=90
>>>>           form the conversion.
>>>>
>>>>        *  If GCONV_PATH is defined (as a colon-separated list of p=
ath=E2=80=90
>>>>           names), the system gconv module configuration cache  is =
 not
>>>>           used.   Instead,  iconv_open(3) first tries to load the =
con=E2=80=90
>>>>           figuration files from one of the directories in  GCONV_P=
ATH,
>>>>           followed  by  the system configuration file.  If a direc=
tory
>>>>           does not contain a  gconv  module  configuration  file, =
 any
>>>>           gconv  modules that it may contain are ignored.  If a di=
rec=E2=80=90
>>>>           tory contains a gconv module configuration file  and  it=
  is
>>>>           determined  that  a  module  needed  for  this conversio=
n is
>>>>           available in the directory, then the needed module is lo=
aded
>>>>           from  that  directory,  the  order being such that the f=
irst
>>>>           suitable module found in GCONV_PATH is  used.   This  al=
lows
>>>>           users to use custom modules and even replace system-prov=
ided
>>>>           modules by providing such modules in GCONV_PATH director=
ies.
>>>>
>>>>        iconv supports any character  set  for  which  a  correspon=
ding
>>>>        gconv configuration and module are provided.
>>>>
>>>> I have two doubts about the above text:
>>>>
>>>> * What is "the system configuration file"?
>>>
>>> It is listed in the FILES section, does that clarify enough?
>>
>> I wondered about that. But the term "system configuration file" does
>> not appear in FILES. Is it "Usual default gconv module configuration=
"?
>> If so, that's not so obvious because the terms differ.
>
> you're right, using "system default gconv module configuration" in bo=
th
> places should make it obvious.


Done. And I made a similar change in the FILES section of iconvconfig.8=
=2E

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
