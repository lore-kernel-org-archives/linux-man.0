From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] open,linkat: Update AT_EMPTY_PATH and O_PATH documentation
Date: Sat, 10 May 2014 19:45:36 +0200
Message-ID: <CAKgNAkiD8=xggWY8eeW20CoHR6ryHsSWkUnSTfP7LWQ2hgXp4g@mail.gmail.com>
References: <818bf4803d4c8d20fa78a485bc57f8240a4f89b8.1376074657.git.luto@amacapital.net>
 <536B522A.9050906@gmail.com> <CALCETrWc-=z8zd9=gy8Dt2r9x391Mu6BXTzzAwkCLrXxo6Erxw@mail.gmail.com>
 <536C6619.1060608@gmail.com> <CALCETrXdXXeAVNmOu7wrUZpMbKdRo0cgn5S6AtgAEotf+v1nYw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALCETrXdXXeAVNmOu7wrUZpMbKdRo0cgn5S6AtgAEotf+v1nYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, May 10, 2014 at 2:59 AM, Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org> =
wrote:
> On Thu, May 8, 2014 at 10:22 PM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 05/08/2014 10:34 PM, Andy Lutomirski wrote:
>>> On Thu, May 8, 2014 at 2:45 AM, Michael Kerrisk (man-pages)
>>> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> On 08/09/2013 08:58 PM, Andy Lutomirski wrote:
>>>>> The current text reflects the general worry in the kernel about
>>>>> recipients of O_PATH fds being able to hardlink the referenced fi=
les.
>>>>> It turns out that it was possible to link these files regardless =
of
>>>>> any possible security concerns.
>>>>>
>>>>> Linux 3.11 removes the capability chech in AT_EMPTY_PATH.  I expe=
ct
>>>>> that this functionality will be generally useful, so let's docume=
nt it
>>>>> better.
>>>>
>>>> Andy,
>>>>
>>>> Again, long after the fact, sorry. But, I've applied this now (wit=
h
>>>> your spelling "chech" fixed in the change log, as you mentioned in=
 the
>>>> follow-on mail).
>>>>
>>>> Nicely constructed patch by the way: I liked the way that the addi=
tions
>>>> to the linkat() text explained why capability check (and thus the =
man
>>>> page text describing the need for that check) was removed.
>>>
>>> Thanks.  Unfortunately, this was reverted in
>>> f0cc6ffb8ce8961db587e5072168cac0cbc25f05 due to never-quite-explain=
ed
>>> security issues. :(
>>
>> Ahhh--okay. But still, some parts of your patch are useful, are they=
 not? I mean:
>>
>> +This will
>> +generally not work if the file has a link count of zero (files
>> +created with
>> +.BR O_TMPFILE
>> +and without
>> +.BR O_EXCL
>> +are an exception).
>>
>> and
>>
>> +If procfs is mounted,
>> +this can be used as an alternative to AT_EMPTY_PATH,
>>
>> are still correct, right?
>>
>> I've tweaked the relevant parts of link(2). Do the following pieces =
now look
>> okay to you:
>>
>>        AT_EMPTY_PATH (since Linux 2.6.39)
>>               If oldpath is an empty string, create a link to the fi=
le
>>               referenced by olddirfd (which  may  have  been  obtain=
ed
>>               using  the open(2) O_PATH flag).  In this case, olddir=
fd
>>               can refer to any type of file,  not  just  a  director=
y.
>>               This  will  generally  not  work  if the file has a li=
nk
>>               count of zero (files created with O_TMPFILE and  witho=
ut
>>               O_EXCL  are  an  exception).   The  caller must have t=
he
>>               CAP_DAC_READ_SEARCH capability  in  order  to  use  th=
is
>>               flag.   This  flag is Linux-specific; define _GNU_SOUR=
CE
>>               to obtain its definition.
>>
>>        AT_SYMLINK_FOLLOW (since Linux 2.6.18)
>>               By default, linkat(), does not dereference oldpath if =
it
>>               is  a  symbolic  link  (like  link()).  The flag AT_SY=
M=E2=80=90
>>               LINK_FOLLOW can be specified in flags to  cause  oldpa=
th
>>               to  be dereferenced if it is a symbolic link.  If proc=
fs
>>               is mounted, this  can  be  used  as  an  alternative  =
to
>>               AT_EMPTY_PATH, like this:
>>
>>                   linkat(AT_FDCWD, "/proc/self/fd/<fd>", newdirfd,
>>                          newname, AT_SYMLINK_FOLLOW);
>>
>> ?
>
> Yes, looks good.

Okay -- thanks, Andy.

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
