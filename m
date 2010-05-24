From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [Bug libc/11459] New: ftw doesn't work like documented (may be a
	documentation bug)
Date: Mon, 24 May 2010 19:41:49 +0200
Message-ID: <AANLkTim05fJpMXD1owEON-70WwxDUkxIvYIgkn7EfBEf@mail.gmail.com>
References: <20100403201146.28880.qmail@sourceware.org> <20100331172608.11459.madcoder@debian.org>
	<20100406090358.GP11893@laphroaig.corp>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100406090358.GP11893-FHnHQIk6zPswS4c7l5MyDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Pierre,

On Tue, Apr 6, 2010 at 11:03 AM, Pierre Habouzit <madcoder-zi3NMfd+bKEdnm+yROfE0A@public.gmane.org> =
wrote:
> See below a bug reported against the glibc. =A0Since the glibc mainta=
iner
> dodged that one, I assume the bug indeed is in the documentation of
> ftw(3). My manpages are the 3.24-1 Debian package.

Yes. The man page is clearly incorrect. Thanks for reporting this.

> IMHO the patch is:
>
> =A0-fpath is the pathname of the entry relative to dirpath.
> =A0+fpath is the pathname of the entry relative to the current workin=
g directory.
>
> POSIX is very vague about what "fpath" should be btw.

(Agreed. It could be more precise.)

I believe the correct text should be this:

       fpath   is  the  pathname  of  the  entry,  and  is
       expressed either as  a  pathname  relative  to  the
       calling  process's current working directory at the
       time of the call to ftw(), if dirpath was expressed
       as a relative pathname, or as an absolute pathname,
       if dirpath was expressed as an  absolute  pathname.

I have updated the man page accordingly, but would welcome
review/checking of this text.

Cheers,

Michael



> On Wed, Mar 31, 2010 at 05:26:09PM -0000, madcoder at debian dot org =
wrote:
>> The man page states:
>>
>> =A0 =A0 =A0 =A0int ftw(const char *dirpath,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int (*fn) (const char *fpath, const s=
truct stat *sb,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int typeflag),
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int nopenfd);
>>
>> =A0 =A0 =A0 =A0[...]
>>
>> =A0 =A0 =A0 =A0fpath is the =A0pathname =A0of =A0the =A0entry =A0rel=
ative to dirpath.
>>
>> Though it appears that it is the pathname of the entry relative to t=
he current
>> working directory.
>>
>> FWIW this may be a documentation bug since the similar fts interface=
 clearly
>> states that the similar fts_accpath is relative to the current worki=
ng
>> directory.
>>
>> --
>> =A0 =A0 =A0 =A0 =A0 =A0Summary: ftw doesn't work like documented (ma=
y be a documentation
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bug)
>> =A0 =A0 =A0 =A0 =A0 =A0Product: glibc
>> =A0 =A0 =A0 =A0 =A0 =A0Version: unspecified
>> =A0 =A0 =A0 =A0 =A0 =A0 Status: NEW
>> =A0 =A0 =A0 =A0 =A0 Severity: normal
>> =A0 =A0 =A0 =A0 =A0 Priority: P2
>> =A0 =A0 =A0 =A0 =A0Component: libc
>> =A0 =A0 =A0 =A0 AssignedTo: drepper at redhat dot com
>> =A0 =A0 =A0 =A0 ReportedBy: madcoder at debian dot org
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 CC: glibc-bugs at sources dot redhat=
 dot com
>>
>>
>> http://sourceware.org/bugzilla/show_bug.cgi?id=3D11459
>>
>> ------- You are receiving this mail because: -------
>> You reported the bug, or are watching the reporter.
>
> On Sat, Apr 03, 2010 at 08:11:46PM -0000, drepper at redhat dot com w=
rote:
>>
>> ------- Additional Comments From drepper at redhat dot com =A02010-0=
4-03 20:11 -------
>> The man pages do not come with glibc and are in no way authoritative=
=2E =A0You have
>> to report this elsewhere.
>>
>> --
>> =A0 =A0 =A0 =A0 =A0 =A0What =A0 =A0|Removed =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 |Added
>> --------------------------------------------------------------------=
--------
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0Status|NEW =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 |RESOLVED
>> =A0 =A0 =A0 =A0 =A0Resolution| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0|INVALID
>>
>>
>> http://sourceware.org/bugzilla/show_bug.cgi?id=3D11459
>>
>> ------- You are receiving this mail because: -------
>> You reported the bug, or are watching the reporter.
>
>
> --
> =B7O=B7 =A0Pierre Habouzit
> =B7=B7O =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0madcoder-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
> OOO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0http://www.madism.org
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
