From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iconv.1: New page for iconv(1)
Date: Thu, 12 Jun 2014 20:44:13 +0200
Message-ID: <CAKgNAkgc4ASriZyv7bhjBJ-H17KYX0b4Pwb8175y++pCD1ZXbg@mail.gmail.com>
References: <5396C41B.2040707@redhat.com> <53975C76.7060302@gmail.com>
 <53980EC4.2030508@redhat.com> <53982A56.2000509@gmail.com>
 <539859E9.8040306@redhat.com> <CAKgNAkj=Y6P+C4SYegOejWJwGJQE96Jr6=Hej9PQFRiDXLzTDQ@mail.gmail.com>
 <53986452.2030308@redhat.com> <5398AAE7.3090307@gmail.com> <5399E60D.8010607@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5399E60D.8010607-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Marko,

On Thu, Jun 12, 2014 at 7:40 PM, Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> w=
rote:
> Hi,
>
> On 2014-06-11 22:15, Michael Kerrisk (man-pages) wrote:
>> On 06/11/2014 04:14 PM, Marko Myllynen wrote:
>>> On 2014-06-11 17:03, Michael Kerrisk (man-pages) wrote:
>>>> On Wed, Jun 11, 2014 at 3:30 PM, Marko Myllynen <myllynen@redhat.c=
om> wrote:
>>>>> On 2014-06-11 13:07, Michael Kerrisk (man-pages) wrote:
>>>>>> On 06/11/2014 10:09 AM, Marko Myllynen wrote:
>>>>>>> On 2014-06-10 22:28, Michael Kerrisk (man-pages) wrote:
>>>>>>>> On 06/10/2014 10:38 AM, Marko Myllynen wrote:
>>
>> So, how does the following look to you:
>
> it looks very good, thanks for this!
>
>> ENVIRONMENT
>>        Internally, the iconv program uses the iconv(3) function  whi=
ch
>>        in   turn   uses   gconv  modules  (dynamically  loaded  shar=
ed
>>        libraries) to convert to and  from  a  character  set.   Befo=
re
>>        calling  iconv(3), the iconv program must first allocate a co=
n=E2=80=90
>>        version descriptor using iconv_open(3).  The operation  of  t=
he
>>        latter  function is influenced by the setting of the GCONV_PA=
TH
>>        environment variable:
>>
>>        *  If GCONV_PATH is not set,  iconv_open(3)  loads  the  syst=
em
>>           gconv  cache  file created by iconvconfig(8) and then, bas=
ed
>>           on the configuration, loads the gconv modules needed to pe=
r=E2=80=90
>>           form the conversion.
>>
>>        *  If GCONV_PATH is defined (as a colon-separated list of pat=
h=E2=80=90
>>           names), the system gconv module configuration cache  is  n=
ot
>>           used.   Instead,  iconv_open(3) first tries to load the co=
n=E2=80=90
>>           figuration files from one of the directories in  GCONV_PAT=
H,
>>           followed  by  the system configuration file.  If a directo=
ry
>>           does not contain a  gconv  module  configuration  file,  a=
ny
>>           gconv  modules that it may contain are ignored.  If a dire=
c=E2=80=90
>>           tory contains a gconv module configuration file  and  it  =
is
>>           determined  that  a  module  needed  for  this conversion =
is
>>           available in the directory, then the needed module is load=
ed
>>           from  that  directory,  the  order being such that the fir=
st
>>           suitable module found in GCONV_PATH is  used.   This  allo=
ws
>>           users to use custom modules and even replace system-provid=
ed
>>           modules by providing such modules in GCONV_PATH directorie=
s.
>>
>>        iconv supports any character  set  for  which  a  correspondi=
ng
>>        gconv configuration and module are provided.
>>
>> I have two doubts about the above text:
>>
>> * What is "the system configuration file"?
>
> It is listed in the FILES section, does that clarify enough?

I wondered about that. But the term "system configuration file" does
not appear in FILES. Is it "Usual default gconv module configuration"?
If so, that's not so obvious because the terms differ.

>> * The last sentence (left over from your earlier text) seems out
>> of place. Is it needed? If it is, I think we need a better place
>> for it.
>
> I think the same thing is already said (albeit slightly less explicit=
ly)
> above it so I don't think it's needed anymore.

Okay -- I removed the sentence.

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
