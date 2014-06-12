From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] iconv.1: New page for iconv(1)
Date: Thu, 12 Jun 2014 20:40:29 +0300
Message-ID: <5399E60D.8010607@redhat.com>
References: <5396C41B.2040707@redhat.com> <53975C76.7060302@gmail.com> <53980EC4.2030508@redhat.com> <53982A56.2000509@gmail.com> <539859E9.8040306@redhat.com> <CAKgNAkj=Y6P+C4SYegOejWJwGJQE96Jr6=Hej9PQFRiDXLzTDQ@mail.gmail.com> <53986452.2030308@redhat.com> <5398AAE7.3090307@gmail.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5398AAE7.3090307-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

On 2014-06-11 22:15, Michael Kerrisk (man-pages) wrote:
> On 06/11/2014 04:14 PM, Marko Myllynen wrote:
>> On 2014-06-11 17:03, Michael Kerrisk (man-pages) wrote:
>>> On Wed, Jun 11, 2014 at 3:30 PM, Marko Myllynen <myllynen-H+wXaHxf7aJhl2p70BpVqQ@public.gmane.org=
m> wrote:
>>>> On 2014-06-11 13:07, Michael Kerrisk (man-pages) wrote:
>>>>> On 06/11/2014 10:09 AM, Marko Myllynen wrote:
>>>>>> On 2014-06-10 22:28, Michael Kerrisk (man-pages) wrote:
>>>>>>> On 06/10/2014 10:38 AM, Marko Myllynen wrote:
>=20
> So, how does the following look to you:

it looks very good, thanks for this!

> ENVIRONMENT
>        Internally, the iconv program uses the iconv(3) function  whic=
h
>        in   turn   uses   gconv  modules  (dynamically  loaded  share=
d
>        libraries) to convert to and  from  a  character  set.   Befor=
e
>        calling  iconv(3), the iconv program must first allocate a con=
=E2=80=90
>        version descriptor using iconv_open(3).  The operation  of  th=
e
>        latter  function is influenced by the setting of the GCONV_PAT=
H
>        environment variable:
>=20
>        *  If GCONV_PATH is not set,  iconv_open(3)  loads  the  syste=
m
>           gconv  cache  file created by iconvconfig(8) and then, base=
d
>           on the configuration, loads the gconv modules needed to per=
=E2=80=90
>           form the conversion.
>=20
>        *  If GCONV_PATH is defined (as a colon-separated list of path=
=E2=80=90
>           names), the system gconv module configuration cache  is  no=
t
>           used.   Instead,  iconv_open(3) first tries to load the con=
=E2=80=90
>           figuration files from one of the directories in  GCONV_PATH=
,
>           followed  by  the system configuration file.  If a director=
y
>           does not contain a  gconv  module  configuration  file,  an=
y
>           gconv  modules that it may contain are ignored.  If a direc=
=E2=80=90
>           tory contains a gconv module configuration file  and  it  i=
s
>           determined  that  a  module  needed  for  this conversion i=
s
>           available in the directory, then the needed module is loade=
d
>           from  that  directory,  the  order being such that the firs=
t
>           suitable module found in GCONV_PATH is  used.   This  allow=
s
>           users to use custom modules and even replace system-provide=
d
>           modules by providing such modules in GCONV_PATH directories=
=2E
>=20
>        iconv supports any character  set  for  which  a  correspondin=
g
>        gconv configuration and module are provided.
>=20
> I have two doubts about the above text:
>=20
> * What is "the system configuration file"?

It is listed in the FILES section, does that clarify enough?

> * The last sentence (left over from your earlier text) seems out
> of place. Is it needed? If it is, I think we need a better place
> for it.

I think the same thing is already said (albeit slightly less explicitly=
)
above it so I don't think it's needed anymore.

Thanks,

--=20
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
