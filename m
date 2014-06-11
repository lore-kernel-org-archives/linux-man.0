From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iconv.1: New page for iconv(1)
Date: Wed, 11 Jun 2014 21:15:51 +0200
Message-ID: <5398AAE7.3090307@gmail.com>
References: <5396C41B.2040707@redhat.com> <53975C76.7060302@gmail.com> <53980EC4.2030508@redhat.com> <53982A56.2000509@gmail.com> <539859E9.8040306@redhat.com> <CAKgNAkj=Y6P+C4SYegOejWJwGJQE96Jr6=Hej9PQFRiDXLzTDQ@mail.gmail.com> <53986452.2030308@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53986452.2030308-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/11/2014 04:14 PM, Marko Myllynen wrote:
> Hi,
>=20
> On 2014-06-11 17:03, Michael Kerrisk (man-pages) wrote:
>> On Wed, Jun 11, 2014 at 3:30 PM, Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org=
> wrote:
>>> On 2014-06-11 13:07, Michael Kerrisk (man-pages) wrote:
>>>> On 06/11/2014 10:09 AM, Marko Myllynen wrote:
>>>>> On 2014-06-10 22:28, Michael Kerrisk (man-pages) wrote:
>>>>>> On 06/10/2014 10:38 AM, Marko Myllynen wrote:
>>>>>>>
>>>>>>> while updating the locale pages I noticed there was no iconv(1)=
 page
>>>>>>> in upstream so I wrote one, please see below.
>>>>>>
>>>>>> Thanks for doing this. Could I ask you to look at the comments b=
elow, and send
>>>>>> a revised version, please.
>>>>>
>>>>> ok, please see below, hopefully the explanation are now clearer
>>>>> without going into too low level details.
>>>>
>>>> Yes, thanks, a lot better. I have applied this, but have a questio=
n, below.
>>>>
>>>>> +.SH ENVIRONMENT
>>>>> +Internally, the
>>>>> +.B iconv
>>>>> +program uses the
>>>>> +.BR iconv (3)
>>>>> +function which in turn uses
>>>>> +.I gconv
>>>>> +modules to convert to and from a character set.
>>>>> +.B iconv
>>>>> +supports any character set for which a
>>>>> +corresponding gconv configuration and module are provided for.
>>>>> +By default, the system provided gconv configuration and modules
>>>>> +are used, but
>>>>> +.B GCONV_PATH
>>>>> +can be defined as a list of pathnames, separated by colons (\(aq=
:\(aq),
>>>>> +for gconv configuration and module search path,
>>>>> +to be searched prior to the system provided configuration and mo=
dules.
>>>>
>>>> That last sentence is long and hard to parse. What exactly is GCON=
V_PATH?
>>>> Is it a list of configuration paths? module search paths? I am
>>>> left uncertain after reading that sentence.
>>>
>>> yeah, I think I was trying to make a long story too short.
>>>
>>> When a program, such as iconv(1), uses iconv(3) (the function), it =
first
>>> needs to allocate a conversion descriptor with iconv_open(3) and du=
ring
>>> the iconv_open() call glibc, if GCONV_PATH is not set, loads the sy=
stem
>>> gconv cache file created by iconvconfig(8) and based on the
>>> configuration then loads the needed gconv modules for conversion (a=
n
>>> example of a gconv module is CP1252.so). If GCONV_PATH is set, glib=
c
>>> first tries to load the configuration files from the paths in GCONV=
_PATH
>>> followed by the system configuration file. If a directory does not
>>> contain a gconv module configuration file, possible gconv modules i=
n it
>>> are ignored. If a directory contains a gconv module configuration f=
ile
>>> and it is determined that a needed module for this conversion is
>>> available in the directory, then the needed module is loaded from t=
here,
>>> the order being so that the first suitable module found in GCONV_PA=
TH is
>>> used. This allows users to use custom modules and even replace syst=
em
>>> provided modules by providing such modules in GCONV_PATH directorie=
s.
>>
>> It sounds like you mean the above paragraph should be added to the
>> page. Is that correct?
>=20
> I was more like providing all the details and wasn't thinking to incl=
ude
> the paragraph at least as-is. But if you think it seems suitable to b=
e
> added, please go ahead. I'd personally prefer a more compact version =
but
> compacting the message without losing precision in this case seems a =
bit
> hard.

So, how does the following look to you:

ENVIRONMENT
       Internally, the iconv program uses the iconv(3) function  which
       in   turn   uses   gconv  modules  (dynamically  loaded  shared
       libraries) to convert to and  from  a  character  set.   Before
       calling  iconv(3), the iconv program must first allocate a con=E2=
=80=90
       version descriptor using iconv_open(3).  The operation  of  the
       latter  function is influenced by the setting of the GCONV_PATH
       environment variable:

       *  If GCONV_PATH is not set,  iconv_open(3)  loads  the  system
          gconv  cache  file created by iconvconfig(8) and then, based
          on the configuration, loads the gconv modules needed to per=E2=
=80=90
          form the conversion.

       *  If GCONV_PATH is defined (as a colon-separated list of path=E2=
=80=90
          names), the system gconv module configuration cache  is  not
          used.   Instead,  iconv_open(3) first tries to load the con=E2=
=80=90
          figuration files from one of the directories in  GCONV_PATH,
          followed  by  the system configuration file.  If a directory
          does not contain a  gconv  module  configuration  file,  any
          gconv  modules that it may contain are ignored.  If a direc=E2=
=80=90
          tory contains a gconv module configuration file  and  it  is
          determined  that  a  module  needed  for  this conversion is
          available in the directory, then the needed module is loaded
          from  that  directory,  the  order being such that the first
          suitable module found in GCONV_PATH is  used.   This  allows
          users to use custom modules and even replace system-provided
          modules by providing such modules in GCONV_PATH directories.

       iconv supports any character  set  for  which  a  corresponding
       gconv configuration and module are provided.

I have two doubts about the above text:

* What is "the system configuration file"?

* The last sentence (left over from your earlier text) seems out
of place. Is it needed? If it is, I think we need a better place
for it.=09

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
