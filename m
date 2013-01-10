From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] module: add syscall to load module from fd
Date: Thu, 10 Jan 2013 01:55:53 +0100
Message-ID: <CAKgNAkijYdrEWRwtAmSJF2X7_u0DoXiXsfVmGYnn+X9z1sQpjQ@mail.gmail.com>
References: <1348179300-11653-1-git-send-email-keescook@chromium.org>
 <CAHO5Pa2fysDRS3sFSy785XBKApxydN0ONW5kAfVJNkrB+wOaBw@mail.gmail.com>
 <50749DE8.7010703@zytor.com> <CAKgNAkgLW+0aHwzoY6vxmeeK_K5w2RyhxW+jOaJDn274NVbajw@mail.gmail.com>
 <5074A0AB.8040207@zytor.com> <87d30o7iy6.fsf@rustcorp.com.au>
 <CAKgNAkh=99=x1=8Y=3odem-fXc9zEEbLvCc0WQku5Kyso4qHuQ@mail.gmail.com>
 <87ipa8o4mn.fsf@rustcorp.com.au> <CAKgNAkiVxUiqJ1pYNq3wW_yQxcyhqntUzcEWscFOhJ3GaVn1aQ@mail.gmail.com>
 <87sj97hs5e.fsf@rustcorp.com.au> <CAHO5Pa29_=3HNLG-qtULZ2fmkgPJ6JCZ0LTv9m=UowfvFufhMw@mail.gmail.com>
 <87fw2j5dlj.fsf@rustcorp.com.au> <CAKgNAkggu9+AuMRqTFeNy9sJVCMcZVRZx43t=svF=gm+P4DnuQ@mail.gmail.com>
 <CAMOw1v6Jk7adSeppunBe0GaW3w3MREU0_hW68_Fbh2599jctkg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMOw1v6Jk7adSeppunBe0GaW3w3MREU0_hW68_Fbh2599jctkg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>
Cc: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathon-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Jan 9, 2013 at 6:29 PM, Lucas De Marchi
<lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org> wrote:
> On Sun, Jan 6, 2013 at 4:59 PM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Rusty, (and Lucas, and Kees)
>>
>> On Thu, Jan 3, 2013 at 1:12 AM, Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org=
> wrote:
>>> Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>>> Hi Rusty,
>>>
>>> Hi Michael,
>>>
>>>> The description here is rather thin. Could you supply a sentence o=
r
>>>> two for each of MODULE_INIT_IGNORE_MODVERSIONS and
>>>> MODULE_INIT_IGNORE_VERMAGIC that would be suitable for the manual
>>>> page?
>>>>
>>>> Thanks,
>>>
>>> There are one or two safety checks built into a module, which are
>>> checked to match the kernel on module load.  The first is a "vermag=
ic"
>>> string containing the kernel version number and prominent features =
(such
>>> as CPU type).  If the module was built with CONFIG_MODVERSIONS set,=
 a
>>> version hash is recorded for each symbol the module uses based on t=
he
>>> types it refers to: in this case, the kernel version number within =
the
>>> "vermagic" string is ignored, as the symbol version hashes are assu=
med
>>> to be sufficiently reliable.
>>>
>>> Using the MODULE_INIT_IGNORE_VERMAGIC flag indicates that the verma=
gic
>>> is to be ignored, and the MODULE_INIT_IGNORE_MODVERSIONS flag indic=
ates
>>> that the version hashes are to be ignored.  If the kernel is built =
to
>>> permit such forced loading (ie. CONFIG_MODULE_FORCE_LOAD is set) th=
en
>>> loading will continue, otherwise it will fail with ENOEXEC as expec=
ted
>>> for malformed modules.
>>>
>>> Hope that is more usable?
>>
>> Yes, that helps. I did some reworking of that text. Hopefully, I did
>> not introduce any errors.
>>
>> Below is the text that is proposed to document finit_module() in the
>> man pages. I'd appreciate any review (Kees, Lucas, Rusty?)
>>
>> Thanks,
>>
>> Michael
>>
>>    finit_module()
>>        The finit_module() system call is like init_module(), but rea=
ds
>>        the module to be loaded from the file  descriptor  fd.   It  =
is
>>        useful  when  the authenticity of a kernel module can be dete=
r=E2=80=90
>>        mined from its location in the file system; in cases where th=
at
>>        is  possible,  the  overhead  of using cryptographically sign=
ed
>>        modules to determine  the  authenticity  of  a  module  can  =
be
>>        avoided.  The param_values argument is as for init_module().
>>
>>        The  flags  argument  modifies the operation of finit_module(=
).
>>        It is a bit mask value created by ORing together zero  or  mo=
re
>>        of the following flags:
>>
>>        MODULE_INIT_IGNORE_MODVERSIONS
>>               Ignore symbol version hashes.
>>
>>        MODULE_INIT_IGNORE_VERMAGIC
>>               Ignore kernel version magic.
>>
>>        There are some safety checks built into a module to ensure th=
at
>>        it matches the kernel against which it is loaded.  These chec=
ks
>>        are  recorded  when  the  module is built and verified when t=
he
>>        module is loaded.   First,  the  module  records  a  "vermagi=
c"
>>        string  containing the kernel version number and prominent fe=
a=E2=80=90
>>        tures (such as the CPU type).  Second, if the module was  bui=
lt
>>        with  the  CONFIG_MODVERSIONS  configuration  option enabled,=
 a
>>        version hash is recorded for each symbol the module uses.  Th=
is
>>        hash  is  based  on the types of the arguments and return val=
ue
>>        for the function named by the symbol.  In this case, the kern=
el
>>        version  number within the "vermagic" string is ignored, as t=
he
>>        symbol version hashes are assumed to be sufficiently reliable=
=2E
>>
>>        Using the MODULE_INIT_IGNORE_VERMAGIC flag indicates  that  t=
he
>>        "vermagic"   string   is   to   be   ignored,   and   the  MO=
D=E2=80=90
>>        ULE_INIT_IGNORE_MODVERSIONS flag indicates that the symbol ve=
r=E2=80=90
>>        sion  hashes are to be ignored.  If the kernel is built to pe=
r=E2=80=90
>>        mit  forced  loading   (i.e.,   configured   with   CONFIG_MO=
D=E2=80=90
>>        ULE_FORCE_LOAD),  then loading will continue, otherwise it wi=
ll
>>        fail with ENOEXEC as expected for malformed modules.
>> ...
>>    ERRORS
>> ...
>>        The following errors may additionally occur for finit_module(=
):
>>
>>        EBADF  The file referred to by fd is not opened for reading.
>>
>>        EFBIG  The file referred to by fd is too large.
>>
>>        EINVAL flags is invalid.
>>
>>        ENOEXEC
>>               fd does not refer to an open file.
>>
>>
>
>
> Looks good to me.

Thanks for looking it over, Lucas.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
