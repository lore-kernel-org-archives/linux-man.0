From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] open.2: Clarify which create mode bits are relevant
Date: Tue, 21 Apr 2015 15:58:36 +0200
Message-ID: <5536578C.2080502@gmail.com>
References: <fe89279fbad286454188b3146b311442cdb7401f.1428946673.git.andreas.gruenbacher@gmail.com>	<553644D4.2050905@gmail.com> <CAHpGcMLAphV8v0yPsuoiDjtG6Vqfy8wvrFTk23_mjZNAqjpwzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHpGcMLAphV8v0yPsuoiDjtG6Vqfy8wvrFTk23_mjZNAqjpwzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?QW5kcmVhcyBHcsO8bmJhY2hlcg==?= <andreas.gruenbacher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Andreas,

On 04/21/2015 03:02 PM, Andreas Gr=C3=BCnbacher wrote:
> Michael,
>=20
> thanks for your further improvements. I agree with most of them, some
> things didn't go so well though:
>=20
>=20
> Commit "stat.2: Tighten wording: use 'mode bit' rather than
> 'permission bit'" is bad:
>=20
> The stat man page distinguishes between the "file type component" and
> "file permissions component" of the mode; now this distinction is
> broken. Also, the second sentence now even makes less sense (not that
> it did make much sense before):

The thing is, POSIX goes into slightly finer granularity than that,=20
and that's why I made these changes (though it may be that further
tweaks are still required).

POSIX breaks down st_mode as follows:

* File type
* File mode, which consists of:
    (1) The permissions bits
    (2) The three bits S_ISVTX, S_ISUID, S_ISGID

Quoting POSIX:

[[
3.169 File Mode Bits
A file's file permission bits, set-user-ID-on-execution bit=20
(S_ISUID), set-group-ID-on-execution bit (S_ISGID), and, on
directories, the restricted deletion flag bit (S_ISVTX).

3.175 File Permission Bits
Information about a file that is used, along with other=20
information, to determine whether a process has read, write, or
execute/search permission to a file. The bits are divided into three
parts: owner, group, and other. Each part is used with the=20
corresponding file class of processes. These bits are contained in=20
the file mode.
]]

I.e., the file mode bits are a superset of the filer permission bits.

And then in the specification of open(), POSIX says:

    When bits other than the file permission bits are set,=20
    the effect is unspecified.

So, that's the impetus for my changes. And now I've added this text to =
stat(2):

       POSIX  refers  to the 12 st_mode bits corresponding to the mask
       07777 as the file mode bits and the least  significant  9  bits
       (00777) as the file permission bits.

With all of that said, does the changes to stat(2) (and other pages)
seem okay to you now?

> "According to POSIX.1-2001, lstat() on a symbolic link need return
> valid information only in the st_size field and the file-type
> component of the st_mode field of the stat structure.  POSIX.1-2008
> tightens the specification, requiring lstat() to return valid
> information in all fields except the mode bits in st_mode."
>=20
> My guess wuold be that POSIX.1-2008 actually requires valid permissio=
n
> bits as well.

But it doesn't. The file type in st_mode is required to be valid, but t=
he=20
(12) file _mode_ bits are not. POSIX says:

       For symbolic links, the st_mode member shall contain meaningful
       information  when used with the file type macros. The file mode
       bits in st_mode are unspecified.

> Commit "mkdir.2: Fix a small error added by Andreas's patch" is also =
bad:
>=20
> The mkdir(2) man page was describing the general behavior under
> DESCRIPTION and the Linux behavior under NOTES; it should still do so
> but now it doesn't anymore.

The problem I saw was that the page was somewhat contradictory. But I=20
see that you're right, that I mushed things somewhat in trying to fix
this. I've reworked the text now. Hopefully you find it better. Thanks
for spotting the mess up.

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
