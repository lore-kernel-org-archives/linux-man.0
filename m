From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iconv.1: New page for iconv(1)
Date: Wed, 11 Jun 2014 16:03:03 +0200
Message-ID: <CAKgNAkj=Y6P+C4SYegOejWJwGJQE96Jr6=Hej9PQFRiDXLzTDQ@mail.gmail.com>
References: <5396C41B.2040707@redhat.com> <53975C76.7060302@gmail.com>
 <53980EC4.2030508@redhat.com> <53982A56.2000509@gmail.com> <539859E9.8040306@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <539859E9.8040306-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

HI Marko,

On Wed, Jun 11, 2014 at 3:30 PM, Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> On 2014-06-11 13:07, Michael Kerrisk (man-pages) wrote:
>> On 06/11/2014 10:09 AM, Marko Myllynen wrote:
>>> On 2014-06-10 22:28, Michael Kerrisk (man-pages) wrote:
>>>> On 06/10/2014 10:38 AM, Marko Myllynen wrote:
>>>>>
>>>>> while updating the locale pages I noticed there was no iconv(1) page
>>>>> in upstream so I wrote one, please see below.
>>>>
>>>> Thanks for doing this. Could I ask you to look at the comments below, and send
>>>> a revised version, please.
>>>
>>> ok, please see below, hopefully the explanation are now clearer
>>> without going into too low level details.
>>
>> Yes, thanks, a lot better. I have applied this, but have a question, below.
>>
>>> +.SH ENVIRONMENT
>>> +Internally, the
>>> +.B iconv
>>> +program uses the
>>> +.BR iconv (3)
>>> +function which in turn uses
>>> +.I gconv
>>> +modules to convert to and from a character set.
>>> +.B iconv
>>> +supports any character set for which a
>>> +corresponding gconv configuration and module are provided for.
>>> +By default, the system provided gconv configuration and modules
>>> +are used, but
>>> +.B GCONV_PATH
>>> +can be defined as a list of pathnames, separated by colons (\(aq:\(aq),
>>> +for gconv configuration and module search path,
>>> +to be searched prior to the system provided configuration and modules.
>>
>> That last sentence is long and hard to parse. What exactly is GCONV_PATH?
>> Is it a list of configuration paths? module search paths? I am
>> left uncertain after reading that sentence.
>
> yeah, I think I was trying to make a long story too short.
>
> When a program, such as iconv(1), uses iconv(3) (the function), it first
> needs to allocate a conversion descriptor with iconv_open(3) and during
> the iconv_open() call glibc, if GCONV_PATH is not set, loads the system
> gconv cache file created by iconvconfig(8) and based on the
> configuration then loads the needed gconv modules for conversion (an
> example of a gconv module is CP1252.so). If GCONV_PATH is set, glibc
> first tries to load the configuration files from the paths in GCONV_PATH
> followed by the system configuration file. If a directory does not
> contain a gconv module configuration file, possible gconv modules in it
> are ignored. If a directory contains a gconv module configuration file
> and it is determined that a needed module for this conversion is
> available in the directory, then the needed module is loaded from there,
> the order being so that the first suitable module found in GCONV_PATH is
> used. This allows users to use custom modules and even replace system
> provided modules by providing such modules in GCONV_PATH directories.

It sounds like you mean the above paragraph should be added to the
page. Is that correct?

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
