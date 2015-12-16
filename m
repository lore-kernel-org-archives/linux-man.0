From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Add Prefer_MAP_32BIT_EXEC to map executable pages with
 MAP_32BIT
Date: Wed, 16 Dec 2015 15:02:04 +0100
Message-ID: <56716EDC.7020205@gmail.com>
References: <CAMe9rOo1OBOGruWMoLTx96wnkKUYPzBZ5HcOCFdGJEp+jTRzVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMe9rOo1OBOGruWMoLTx96wnkKUYPzBZ5HcOCFdGJEp+jTRzVA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jeff Law <law-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, Adhemerval Zanella <adhemerval.zanella-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12/15/2015 10:34 PM, H.J. Lu wrote:
> On Tue, Dec 15, 2015 at 1:06 PM, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> =
wrote:
>> On 12/15/2015 03:08 PM, H.J. Lu wrote:
>>> On Tue, Dec 15, 2015 at 10:38 AM, Carlos O'Donell <carlos-H+wXaHxf7aJhl2p70BpVqQ@public.gmane.org=
m> wrote:
>>>>> On 12/15/2015 01:27 PM, Carlos O'Donell wrote:
>>>>>>> +  cpu_features->feature[index_Prefer_MAP_32BIT_EXEC]
>>>>>>> +    |=3D get_prefer_map_32bit_exec ();
>>>>>>>
>>>>>>> You wouldn't need get_prefer_map_32bit_exec, since this is all =
part of
>>>>>>> the code, like dl-librecon.h, which parses the extra env var.
>>>>>
>>>>> To be clear:
>>>>>
>>>>> * Add new bit flag definitions for cpu_features.
>>>>> * Add a sysdeps/unix/sysv/linux/x86_64/dl-silvermont.h
>>>>>   * Fill in EXTRA_LD_ENVVARS or add new ones.
>>>>>   * Write to rtld's GLRO cpu_features the bit you need based
>>>>>     on __libc_enable_secure.
>>>>>
>>>>> That should simplify and concentrate the Silvermont fixes to
>>>>> just two files, making future maintenance and documentation
>>>>> easier.
>>>>>
>>>>>
>>> This is the updated patch.  I put EXTRA_LD_ENVVARS and
>>> EXTRA_UNSECURE_ENVVARS in x86_64/64/dl-librecon.h
>>> to be consistent with i386/dl-librecon.h.  If we ever need to
>>> update EXTRA_LD_ENVVARS/EXTRA_UNSECURE_ENVVARS
>>> in the future, we have a single file to change.
>>>
>>> Tested on x86-64.  OK for master?
>>>
>>> Thanks for all the feedbacks and suggestions.
>>
>> This looks much better and much cleaner. Looks good to me now. It al=
so
>> appears you have consesnsus with this last change.
>>
>> It needs a bug # please since you're fixing a user-visible performan=
ce
>> problem on Silvermont.
>=20
> I opened
>=20
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D19367
>=20
> and checked in my patch.
>=20
>> It appears to meet Zack's requirement to choose a security safe defa=
ult
>> at the expense of performance (I agree with that).
>>
>> I *strongly* urge you to immediately submit a patch to the linux man
>> pages project to document that as of 2.23 this new flag exists and
>> does what you describe it does.

(Thanks, Carlos.)

> Here is a patch for Linux man page.

Thanks, H.J. I applied the patch and tweaked your text somewhat.
Does the following look okay?

       LD_PREFER_MAP_32BIT_EXEC
              (x86-64 only)(glibc since 2.23)  According  to  the  Inte=
l
              Silvermont  software optimization guide, for 64-bit appli=
=E2=80=90
              cations, branch prediction performance can  be  negativel=
y
              impacted when the target of a branch is more than 4GB awa=
y
              from the branch.  If this environment variable is set  (t=
o
              any  value),  ld.so will first try to map executable page=
s
              using the mmap(2) MAP_32BIT flag, and fall back to mappin=
g
              without  that  flag  if that attempt fails.  NB: MAP_32BI=
T
              will map to the low 2GB (not 2GB) of  the  address  space=
=2E
              Because  MAP_32BIT reduces the address range available fo=
r
              address  space  layout   randomization   (ASLR),   LD_PRE=
=E2=80=90
              FER_MAP_32BIT_EXEC  is always disabled in secure-executio=
n
              mode.

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
