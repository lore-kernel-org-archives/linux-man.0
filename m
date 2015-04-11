From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: stat(2)
Date: Sat, 11 Apr 2015 08:04:15 +0200
Message-ID: <5528B95F.7010008@gmail.com>
References: <CAGc9Evd5yJ0jvMbwiQ2e0Obcj01srNxo2G3zUpub+4zfYATjBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9Evd5yJ0jvMbwiQ2e0Obcj01srNxo2G3zUpub+4zfYATjBw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jonny,

On 04/02/2015 06:59 PM, Jonny Grant wrote:
> Hello
>=20
> I see:
> http://man7.org/linux/man-pages/man3/lseek64.3.html
> Grammar feedback, "the glibc", prefix word "the" is not needed.

=46ixed. Thanks.

> http://man7.org/linux/man-pages/man2/fstat64.2.html
> Has page heading stat(2),=20

The doc for stat/fstat/lstat is combined into a single page...

> and does not contain any information about fstat64()
> Any ideas?

See below.

> I saw this one looks as expected:
> http://man7.org/linux/man-pages/man3/lseek64.3.html

Actually, that page is a bit of an aberration that appeared=20
before my time as maintainer.

> I saw this page has similar problem:
> http://man7.org/linux/man-pages/man2/stat64.2.html
>=20
> No mention of stat64()

That's not precisely true. See the "C library/kernel ABI differences" a=
t=20
http://man7.org/linux/man-pages/man2/stat.2.html#NOTES. Note also
the sentence "Similar remarks apply for fstat() and lstat()."

That said, the details are thin, and I've written  some text to explain
things in a little more detail:

   C library/kernel ABI differences
       Over time, increases in the size of the stat structure  have  le=
d
       to   three   successive  versions  of  stat():  sys_stat()  (slo=
t
       __NR_oldstat), sys_newstat() (slot __NR_stat),  and  sys_stat64(=
)
       (slot  __NR_stat64)  on 32-bit platforms such as i386.  The firs=
t
       two versions were already present in Linux 1.0 (albeit with  dif=
=E2=80=90
       ferent  names); the last was added in Linux 2.4.  Similar remark=
s
       apply for fstat() and lstat().

       The kernel-internal versions of the stat structure dealt with  b=
y
       the different versions are, respectively:

              __old_kernel_stat
                     The  original structure, with rather narrow fields=
,
                     and no padding.

              stat   Larger st_ino field and padding  added  to  variou=
s
                     parts  of  the structure to allow for future expan=
=E2=80=90
                     sion.

              stat64 Even larger st_ino field, larger st_uid and  st_gi=
d
                     fields  to  accommodate  the Linux-2.4 expansion o=
f
                     UIDs  and  GIDs  to  32  bits,  and  various  othe=
r
                     enlarged  fields  and further padding in the struc=
=E2=80=90
                     ture.  (Various padding bytes were eventually  con=
=E2=80=90
                     sumed  in  Linux  2.6,  with  the  advent of 32-bi=
t
                     device IDs and nanosecond components for the  time=
=E2=80=90
                     stamp fields.)

       The glibc stat() wrapper function hides these details from appli=
=E2=80=90
       cations, invoking the most recent version of the system call pro=
=E2=80=90
       vided  by  the  kernel, and repacking the returned information i=
f
       required for old binaries.

       On modern 64-bit systems, life is  simpler:  there  is  a  singl=
e
       stat()  system  call  and  the kernel deals with a stat structur=
e
       that contains fields of a sufficient size.

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
