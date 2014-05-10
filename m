From: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Subject: Re: [PATCH] open,linkat: Update AT_EMPTY_PATH and O_PATH documentation
Date: Fri, 9 May 2014 17:59:43 -0700
Message-ID: <CALCETrXdXXeAVNmOu7wrUZpMbKdRo0cgn5S6AtgAEotf+v1nYw@mail.gmail.com>
References: <818bf4803d4c8d20fa78a485bc57f8240a4f89b8.1376074657.git.luto@amacapital.net>
 <536B522A.9050906@gmail.com> <CALCETrWc-=z8zd9=gy8Dt2r9x391Mu6BXTzzAwkCLrXxo6Erxw@mail.gmail.com>
 <536C6619.1060608@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536C6619.1060608-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, May 8, 2014 at 10:22 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 05/08/2014 10:34 PM, Andy Lutomirski wrote:
>> On Thu, May 8, 2014 at 2:45 AM, Michael Kerrisk (man-pages)
>> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 08/09/2013 08:58 PM, Andy Lutomirski wrote:
>>>> The current text reflects the general worry in the kernel about
>>>> recipients of O_PATH fds being able to hardlink the referenced fil=
es.
>>>> It turns out that it was possible to link these files regardless o=
f
>>>> any possible security concerns.
>>>>
>>>> Linux 3.11 removes the capability chech in AT_EMPTY_PATH.  I expec=
t
>>>> that this functionality will be generally useful, so let's documen=
t it
>>>> better.
>>>
>>> Andy,
>>>
>>> Again, long after the fact, sorry. But, I've applied this now (with
>>> your spelling "chech" fixed in the change log, as you mentioned in =
the
>>> follow-on mail).
>>>
>>> Nicely constructed patch by the way: I liked the way that the addit=
ions
>>> to the linkat() text explained why capability check (and thus the m=
an
>>> page text describing the need for that check) was removed.
>>
>> Thanks.  Unfortunately, this was reverted in
>> f0cc6ffb8ce8961db587e5072168cac0cbc25f05 due to never-quite-explaine=
d
>> security issues. :(
>
> Ahhh--okay. But still, some parts of your patch are useful, are they =
not? I mean:
>
> +This will
> +generally not work if the file has a link count of zero (files
> +created with
> +.BR O_TMPFILE
> +and without
> +.BR O_EXCL
> +are an exception).
>
> and
>
> +If procfs is mounted,
> +this can be used as an alternative to AT_EMPTY_PATH,
>
> are still correct, right?
>
> I've tweaked the relevant parts of link(2). Do the following pieces n=
ow look
> okay to you:
>
>        AT_EMPTY_PATH (since Linux 2.6.39)
>               If oldpath is an empty string, create a link to the fil=
e
>               referenced by olddirfd (which  may  have  been  obtaine=
d
>               using  the open(2) O_PATH flag).  In this case, olddirf=
d
>               can refer to any type of file,  not  just  a  directory=
=2E
>               This  will  generally  not  work  if the file has a lin=
k
>               count of zero (files created with O_TMPFILE and  withou=
t
>               O_EXCL  are  an  exception).   The  caller must have th=
e
>               CAP_DAC_READ_SEARCH capability  in  order  to  use  thi=
s
>               flag.   This  flag is Linux-specific; define _GNU_SOURC=
E
>               to obtain its definition.
>
>        AT_SYMLINK_FOLLOW (since Linux 2.6.18)
>               By default, linkat(), does not dereference oldpath if i=
t
>               is  a  symbolic  link  (like  link()).  The flag AT_SYM=
=E2=80=90
>               LINK_FOLLOW can be specified in flags to  cause  oldpat=
h
>               to  be dereferenced if it is a symbolic link.  If procf=
s
>               is mounted, this  can  be  used  as  an  alternative  t=
o
>               AT_EMPTY_PATH, like this:
>
>                   linkat(AT_FDCWD, "/proc/self/fd/<fd>", newdirfd,
>                          newname, AT_SYMLINK_FOLLOW);
>
> ?

Yes, looks good.

Thanks,
Andy
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
