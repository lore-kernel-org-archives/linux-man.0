From: Felix Janda <felix.janda-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: POSIX.1-2013 man pages for review
Date: Fri, 20 Sep 2013 19:54:10 +0200
Message-ID: <20130920175410.GA1092@gauss>
References: <523AAEEE.5090602@gmail.com>
 <523AB978.2080607@barfooze.de>
 <CAKgNAki+jTS9rkORvcPNxWcStNjnNTnt_jqBYcfoaYm7d4GxqQ@mail.gmail.com>
 <523C48EF.5080309@barfooze.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <523C48EF.5080309-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Spencer <maillist-musl-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Josey <ajosey-7882/jkIBncuagvECLh61g@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Matthew Dempsky <matthew-bfSpyvURsAhAfugRpC6u6w@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

John Spencer wrote:
> Hello Michael, Felix,
> 
> On 09/19/2013 01:00 PM, Michael Kerrisk (man-pages) wrote:
> >> i've run a test script[0] using my own manpage viewer[1]
> >> and attached the results. it seems that ~10% of the manpages use some
> >> special groff features. i'd rather see these removed/replaced with something
> >> nroff-compatible.
> >
> > I just want to check where you're coming from John. You're working on
> > musl, right? Does musl not use the work from the man-pages project? I
> > ask, because some of the pieces that your script doesn't like are also
> > used in the man-pages project. See below.
> 
> musl itself does not use the man-pages project currently, as the 
> majority of manpages are very glibc specific. so the posix manpages 
> project is _imo_ currently a much better documentation for the 
> interfaces provided by musl.

On the other hand the section 2 man pages from linux-manpages documenting
Linux specific behavior of system calls might be useful, no?

> i can't remember the exact outcome of the previous discussion on the 
> musl mailing list, ("Linux manpages (was Re: [musl] Request for 
> volunteers)"), but afaik it is unlikely that the man-pages project will 
> be updated as discussed in that thread before musl 1.0 is out.
> 
> however, my interest in having the POSIX manpages use portable nroff 
> syntax comes from my endeavor to build a non-bloated musl-based linux 
> system, which will, at least in the basic configuration, feature the 
> below nroff-only manpage viewer, since groff is incredibly bloated (over 
> 4 MB of compressed source code! - in comparison my man.c compiles to a 
> 60 KB statically linked binary) and written in C++ so it's definitely 
> contrary to my goals. (not to talk about that some of the groff features 
> like the tbl preprocessor are just horribly misguided and completely 
> unidiomatic, introducing a completely new language namespace)
> 
> as such i'd love to see the POSIX manpages project actually deliver 
> portable manpages, instead of assuming that the full-blown GNU userspace 
> stack is available.

Could you give a definition of this portable nroff syntax?

> >
> >> [0] https://github.com/rofl0r/hardcore-utils/blob/master/tests/mantest.sh
> >> [1] https://github.com/rofl0r/hardcore-utils/blob/master/man.c
> >
> > Looking at your log:
> >
> >> === status report  ===
> >> total manpages        : 1143
> >> buggy manpages        : 137
> >> total failures        : 406
> >> unique failures       : 12
> >>
> >> bug list:
> >>      122 **** Unknown formatter command: .ne
> >
> > Not sure about this one. From groff(7):
> >
> >         .ne       Need a one-line vertical space.
> >         .ne N     Need N vertical space (default scaling indicator v).
> >
> > I'm not sure about the circumstances where these are being applied. Felix?
> >
> >>      106 **** Unknown formatter command: .TS
> >>      106 **** Unknown formatter command: .TE
> >
> > These two are heavily used for tables in the man-pages project itself.
> > What's the problem/alternative?
> 
> the problem is A) that it requires groff's tbl preprocessor, which in 
> turn requires the full groff install, and B) that the tag cannot simply 
> be ignored becaused the content embedded into those tags follows a 
> completely random new syntax - example:
> http://www.podgrid.org/linux-bible/linux-bible-page607.html
> 
> the alternative is to apply the tbl preprocessor before shipping the 
> manpages and instead include the preprocessed output (cleaned up from 
> groffisms as well)

I'm not sure if your man can handle the output of tbl. Attached is the
output when run against one of the tables in pax. It looks rather
hopeless. Also the fictional script cleaning up the GNU tbl output is
likely going to be dependent on a specific tbl version.

For eqn it seems much more likely to me that one can produce output
which makes your man implementation happy. The equations are already
hacked to make them better suitable for nroff.

> as for the other groff specific formatter commands, i am refering to 
> Felix' response: all of them can either be left away or in case of tbl 
> and eqn the preprocessed source used instead.

.ce remained open. Is there an alternative or could you just implement
that?

Felix

--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="pax.1p"
Content-Transfer-Encoding: quoted-printable

=2Eif !\n(.g .ab GNU tbl requires GNU troff.
=2Eif !dTS .ds TS
=2Eif !dTE .ds TE
=2Elf 1 pax.1p
=2Ece 1
\fBTable: Octet-Oriented cpio Archive Entry\fP
=2ETS
=2Enr 3c \n(.C
=2Ecp 0
=2Enr 3lps \n[.s]
=2Ede 3init
=2Eft \n[.f]
=2Eps \n[.s]
=2Evs \n[.v]u
=2Ein \n[.i]u
=2Ell \n[.l]u
=2Els \n[.L]
=2Ead \n[.j]
=2Eie \n[.u] .fi
=2Eel .nf
=2Ece \n[.ce]
=2E.
=2Enr 3ind \n[.i]
=2Enr 3fnt \n[.f]
=2Enr 3sz \n[.s]
=2Enr 3fll \n[.u]
=2Enr T. 0
=2Enr 3crow 0-1
=2Enr 3passed 0-1
=2Enr 3sflag 0
=2Eds 3trans
=2Eds 3quote
=2Enr 3brule 1
=2Enr 3supbot 0
=2Eeo
=2Ede 3rmk
=2Emk \$1
=2Eif !'\n(.z'' \!.3rmk "\$1"
=2E.
=2Ede 3rvpt
=2Evpt \$1
=2Eif !'\n(.z'' \!.3rvpt "\$1"
=2E.
=2Ede 3keep
=2Eif '\n[.z]'' \{.ds 3quote \\
=2Eds 3trans \!
=2Edi 3section
=2Enr 3sflag 1
=2Ein 0
=2E\}
=2E.
=2Ede 3release
=2Eif \n[3sflag] \{.di
=2Ein \n[3ind]u
=2Enr 3dn \n[dn]
=2Eds 3quote
=2Eds 3trans
=2Enr 3sflag 0
=2Eif \n[.t]<=3D\n[dn] \{.nr T. 1
=2ET#
=2Enr 3supbot 1
=2Esp \n[.t]u
=2Enr 3supbot 0
=2Emk #T
=2E\}
=2Eif \n[.t]<=3D\n[3dn] .tm warning: page \n%: table text block will not fi=
t on one page
=2Enf
=2Els 1
=2E3section
=2Els
=2Erm 3section
=2E\}
=2E.
=2Enr 3tflag 0
=2Ede 3tkeep
=2Eif '\n[.z]'' \{.di 3table
=2Enr 3tflag 1
=2E\}
=2E.
=2Ede 3trelease
=2Eif \n[3tflag] \{.br
=2Edi
=2Enr 3dn \n[dn]
=2Ene \n[dn]u+\n[.V]u
=2Eie \n[.t]<=3D\n[3dn] .tm error: page \n%: table will not fit on one page=
; use .TS H/.TH with a supporting macro package
=2Eel \{.in 0
=2Els 1
=2Enf
=2E3table
=2E\}
=2Erm 3table
=2E\}
=2E.
=2Eec
=2Ece 0
=2Enf
=2Enr 3sep 1n
=2Enr 3w0 \n(.H
=2Enr 3aw0 0
=2Enr 3lnw0 0
=2Enr 3rnw0 0
=2Enr 3w1 \n(.H
=2Enr 3aw1 0
=2Enr 3lnw1 0
=2Enr 3rnw1 0
=2Enr 3w2 \n(.H
=2Enr 3aw2 0
=2Enr 3lnw2 0
=2Enr 3rnw2 0
=2Elf 7 pax.1p
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[B]Header Field Name\f[\n[3fnt]]\[tbl]
=2Elf 7
=2Enr 3w1 \n[3w1]>?\w\[tbl]\f[B]Length (in Octets)\f[\n[3fnt]]\[tbl]
=2Elf 7
=2Enr 3w2 \n[3w2]>?\w\[tbl]\f[B]Interpreted as\f[\n[3fnt]]\[tbl]
=2Elf 9
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[I]c_magic\f[\n[3fnt]]\[tbl]
=2Elf 9
=2Enr 3tbw1,1 0\w\[tbl]6\[tbl]
=2Enr 3lnw1 \n[3lnw1]>?\n[3tbw1,1]
=2Elf 9
=2Enr 3w2 \n[3w2]>?\w\[tbl]Octal number\[tbl]
=2Elf 10
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[I]c_dev\f[\n[3fnt]]\[tbl]
=2Elf 10
=2Enr 3tbw2,1 0\w\[tbl]6\[tbl]
=2Enr 3lnw1 \n[3lnw1]>?\n[3tbw2,1]
=2Elf 10
=2Enr 3w2 \n[3w2]>?\w\[tbl]Octal number\[tbl]
=2Elf 11
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[I]c_ino\f[\n[3fnt]]\[tbl]
=2Elf 11
=2Enr 3tbw3,1 0\w\[tbl]6\[tbl]
=2Enr 3lnw1 \n[3lnw1]>?\n[3tbw3,1]
=2Elf 11
=2Enr 3w2 \n[3w2]>?\w\[tbl]Octal number\[tbl]
=2Elf 12
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[I]c_mode\f[\n[3fnt]]\[tbl]
=2Elf 12
=2Enr 3tbw4,1 0\w\[tbl]6\[tbl]
=2Enr 3lnw1 \n[3lnw1]>?\n[3tbw4,1]
=2Elf 12
=2Enr 3w2 \n[3w2]>?\w\[tbl]Octal number\[tbl]
=2Elf 13
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[I]c_uid\f[\n[3fnt]]\[tbl]
=2Elf 13
=2Enr 3tbw5,1 0\w\[tbl]6\[tbl]
=2Enr 3lnw1 \n[3lnw1]>?\n[3tbw5,1]
=2Elf 13
=2Enr 3w2 \n[3w2]>?\w\[tbl]Octal number\[tbl]
=2Elf 14
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[I]c_gid\f[\n[3fnt]]\[tbl]
=2Elf 14
=2Enr 3tbw6,1 0\w\[tbl]6\[tbl]
=2Enr 3lnw1 \n[3lnw1]>?\n[3tbw6,1]
=2Elf 14
=2Enr 3w2 \n[3w2]>?\w\[tbl]Octal number\[tbl]
=2Elf 15
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[I]c_nlink\f[\n[3fnt]]\[tbl]
=2Elf 15
=2Enr 3tbw7,1 0\w\[tbl]6\[tbl]
=2Enr 3lnw1 \n[3lnw1]>?\n[3tbw7,1]
=2Elf 15
=2Enr 3w2 \n[3w2]>?\w\[tbl]Octal number\[tbl]
=2Elf 16
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[I]c_rdev\f[\n[3fnt]]\[tbl]
=2Elf 16
=2Enr 3tbw8,1 0\w\[tbl]6\[tbl]
=2Enr 3lnw1 \n[3lnw1]>?\n[3tbw8,1]
=2Elf 16
=2Enr 3w2 \n[3w2]>?\w\[tbl]Octal number\[tbl]
=2Elf 17
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[I]c_mtime\f[\n[3fnt]]\[tbl]
=2Elf 17
=2Enr 3tbw9,1 0\w\[tbl]11\[tbl]
=2Enr 3lnw1 \n[3lnw1]>?\n[3tbw9,1]
=2Elf 17
=2Enr 3w2 \n[3w2]>?\w\[tbl]Octal number\[tbl]
=2Elf 18
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[I]c_namesize\f[\n[3fnt]]\[tbl]
=2Elf 18
=2Enr 3tbw10,1 0\w\[tbl]6\[tbl]
=2Enr 3lnw1 \n[3lnw1]>?\n[3tbw10,1]
=2Elf 18
=2Enr 3w2 \n[3w2]>?\w\[tbl]Octal number\[tbl]
=2Elf 19
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[I]c_filesize\f[\n[3fnt]]\[tbl]
=2Elf 19
=2Enr 3tbw11,1 0\w\[tbl]11\[tbl]
=2Enr 3lnw1 \n[3lnw1]>?\n[3tbw11,1]
=2Elf 19
=2Enr 3w2 \n[3w2]>?\w\[tbl]Octal number\[tbl]
=2Elf 24
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[B]Filename Field Name\f[\n[3fnt]]\[tbl]
=2Elf 24
=2Enr 3w1 \n[3w1]>?\w\[tbl]\f[B]Length\f[\n[3fnt]]\[tbl]
=2Elf 24
=2Enr 3w2 \n[3w2]>?\w\[tbl]\f[B]Interpreted as\f[\n[3fnt]]\[tbl]
=2Elf 26
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[I]c_name\f[\n[3fnt]]\[tbl]
=2Elf 26
=2Enr 3w1 \n[3w1]>?\w\[tbl]\f[I]c_namesize\f[\n[3fnt]]\[tbl]
=2Elf 26
=2Enr 3w2 \n[3w2]>?\w\[tbl]Pathname string\[tbl]
=2Elf 31
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[B]File Data Field Name\f[\n[3fnt]]\[tbl]
=2Elf 31
=2Enr 3w1 \n[3w1]>?\w\[tbl]\f[B]Length\f[\n[3fnt]]\[tbl]
=2Elf 31
=2Enr 3w2 \n[3w2]>?\w\[tbl]\f[B]Interpreted as\f[\n[3fnt]]\[tbl]
=2Elf 33
=2Enr 3w0 \n[3w0]>?\w\[tbl]\f[I]c_filedata\f[\n[3fnt]]\[tbl]
=2Elf 33
=2Enr 3w1 \n[3w1]>?\w\[tbl]\f[I]c_filesize\f[\n[3fnt]]\[tbl]
=2Elf 33
=2Enr 3w2 \n[3w2]>?\w\[tbl]Data\[tbl]
=2Enr 3w0 \n[3w0]>?(\n[3lnw0]+\n[3rnw0])
=2Eif \n[3aw0] .nr 3w0 \n[3w0]>?(\n[3aw0]+2n)
=2Enr 3w1 \n[3w1]>?(\n[3lnw1]+\n[3rnw1])
=2Eif \n[3aw1] .nr 3w1 \n[3w1]>?(\n[3aw1]+2n)
=2Enr 3w2 \n[3w2]>?(\n[3lnw2]+\n[3rnw2])
=2Eif \n[3aw2] .nr 3w2 \n[3w2]>?(\n[3aw2]+2n)
=2Enr 3expand \n[.l]-\n[.i]-\n[3w0]-\n[3w1]-\n[3w2]-8n
=2Eif \n[3expand]<0 \{.lf 7
=2Etm1 "warning: file `\n[.F]', around line \n[.c]:
=2Etm1 "  table wider than line width
=2Enr 3expand 0
=2E\}
=2Enr 3cd0 0
=2Enr 3cl0 1*\n[3sep]
=2Enr 3ce0 \n[3cl0]+\n[3w0]
=2Enr 3cl1 \n[3ce0]+(3*\n[3sep])
=2Enr 3cd1 \n[3ce0]+\n[3cl1]/2
=2Enr 3ce1 \n[3cl1]+\n[3w1]
=2Enr 3cl2 \n[3ce1]+(3*\n[3sep])
=2Enr 3cd2 \n[3ce1]+\n[3cl2]/2
=2Enr 3ce2 \n[3cl2]+\n[3w2]
=2Enr 3cd3 \n[3ce2]+(1*\n[3sep])
=2Enr TW \n[3cd3]
=2Ein +(u;\n[.l]-\n[.i]-\n[TW]/2>?-\n[.i])
=2Enr 3ind \n[.i]
=2Eeo
=2Ede T#
=2Eif !\n[3supbot] \{.3rvpt 0
=2Emk 3vert
=2Eif \n[T.]&\n[3brule] \{.vs 2p>?\n[.V]u
=2Els 1
\v'.25m'\s[\n[3lps]]\h'|\n[3cd0]u'\D'l |\n[3cd3]u 0'\s0
=2Els
=2Evs
=2E\}
=2Els 1
=2Eif \n[3crow]>=3D14&(\n[3crow]<14) \{.if 14<=3D\n[3passed] .nr 3rt14 \n[#=
T]
=2Esp -1
\v'.25m'\h'\n[3cd2]u'\s[\n[3lps]]\D'l 0 |\n[3rt14]u-1v'\s0
=2E\}
=2Eif \n[3crow]>=3D14&(\n[3crow]<14) \{.if 14<=3D\n[3passed] .nr 3rt14 \n[#=
T]
=2Esp -1
\v'.25m'\h'\n[3cd1]u'\s[\n[3lps]]\D'l 0 |\n[3rt14]u-1v'\s0
=2E\}
=2Eif \n[3crow]>=3D0&(\n[3crow]<12) \{.if 0<=3D\n[3passed] .nr 3rt0 \n[#T]
=2Esp -1
\v'.25m'\h'\n[3cd2]u'\s[\n[3lps]]\D'l 0 |\n[3rt0]u-1v'\s0
=2E\}
=2Eif \n[3crow]>=3D0&(\n[3crow]<12) \{.if 0<=3D\n[3passed] .nr 3rt0 \n[#T]
=2Esp -1
\v'.25m'\h'\n[3cd1]u'\s[\n[3lps]]\D'l 0 |\n[3rt0]u-1v'\s0
=2E\}
=2Eif \n[3crow]>=3D0 \{.if 0<=3D\n[3passed] .nr 3rt0 \n[#T]
=2Esp -1
\v'.25m'\h'\n[3cd3]u'\s[\n[3lps]]\D'l 0 |\n[3rt0]u-1v'\s0
=2E\}
=2Eif \n[3crow]>=3D0 \{.if 0<=3D\n[3passed] .nr 3rt0 \n[#T]
=2Esp -1
\v'.25m'\h'\n[3cd0]u'\s[\n[3lps]]\D'l 0 |\n[3rt0]u-1v'\s0
=2E\}
=2Els
=2Enr 3passed \n[3crow]
=2Esp |\n[3vert]u
=2E3rvpt 1
=2E\}
=2E.
=2Eec
=2Efc =02=03
=2E3tkeep
=2Evs 2p>?\n[.V]u
=2Els 1
\v'.25m'\s[\n[3lps]]\h'|\n[3cd0]u'\D'l |\n[3cd3]u 0'\s0
=2Els
=2Evs
=2E3keep
=2E3rmk 3rt0
\*[3trans].nr 3crow 0
=2E3keep
=2Emk 3rs0
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce1]u \n[3ce2]u
=2Elf 7
\&\h'|\n[3cl0]u'=02=03\f[B]Header Field Name\f[\n[3fnt]]=03=02\h'|\n[3cl1]u=
'=02=03\f[B]Length (in Octets)\f[\n[3fnt]]=03=02\h'|\n[3cl2]u'=02=03\f[B]In=
terpreted as\f[\n[3fnt]]=03=02
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs0]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2Evs 2p>?\n[.V]u
=2Els 1
\v'.25m'\s[\n[3lps]]\h'|\n[3cd0]u'\D'l |\n[3cd3]u 0'\s0
=2Els
=2Evs
\*[3trans].nr 3brule 0
=2E3release
=2E3keep
=2E3rmk 3rt1
\*[3trans].nr 3crow 1
=2E3keep
=2Emk 3rs1
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce2]u
=2Elf 9
\&\h'|\n[3cl0]u'\f[I]c_magic\f[\n[3fnt]]\h'|(\n[3w1]u-\n[3lnw1]u-\n[3rnw1]u=
/2u+\n[3lnw1]u+\n[3cl1]u-\n[3tbw1,1]u)'6\h'|\n[3cl2]u'Octal number
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs1]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2E3release
=2E3keep
=2E3rmk 3rt2
\*[3trans].nr 3crow 2
=2E3keep
=2Emk 3rs2
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce2]u
=2Elf 10
\&\h'|\n[3cl0]u'\f[I]c_dev\f[\n[3fnt]]\h'|(\n[3w1]u-\n[3lnw1]u-\n[3rnw1]u/2=
u+\n[3lnw1]u+\n[3cl1]u-\n[3tbw2,1]u)'6\h'|\n[3cl2]u'Octal number
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs2]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2E3release
=2E3keep
=2E3rmk 3rt3
\*[3trans].nr 3crow 3
=2E3keep
=2Emk 3rs3
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce2]u
=2Elf 11
\&\h'|\n[3cl0]u'\f[I]c_ino\f[\n[3fnt]]\h'|(\n[3w1]u-\n[3lnw1]u-\n[3rnw1]u/2=
u+\n[3lnw1]u+\n[3cl1]u-\n[3tbw3,1]u)'6\h'|\n[3cl2]u'Octal number
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs3]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2E3release
=2E3keep
=2E3rmk 3rt4
\*[3trans].nr 3crow 4
=2E3keep
=2Emk 3rs4
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce2]u
=2Elf 12
\&\h'|\n[3cl0]u'\f[I]c_mode\f[\n[3fnt]]\h'|(\n[3w1]u-\n[3lnw1]u-\n[3rnw1]u/=
2u+\n[3lnw1]u+\n[3cl1]u-\n[3tbw4,1]u)'6\h'|\n[3cl2]u'Octal number
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs4]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2E3release
=2E3keep
=2E3rmk 3rt5
\*[3trans].nr 3crow 5
=2E3keep
=2Emk 3rs5
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce2]u
=2Elf 13
\&\h'|\n[3cl0]u'\f[I]c_uid\f[\n[3fnt]]\h'|(\n[3w1]u-\n[3lnw1]u-\n[3rnw1]u/2=
u+\n[3lnw1]u+\n[3cl1]u-\n[3tbw5,1]u)'6\h'|\n[3cl2]u'Octal number
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs5]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2E3release
=2E3keep
=2E3rmk 3rt6
\*[3trans].nr 3crow 6
=2E3keep
=2Emk 3rs6
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce2]u
=2Elf 14
\&\h'|\n[3cl0]u'\f[I]c_gid\f[\n[3fnt]]\h'|(\n[3w1]u-\n[3lnw1]u-\n[3rnw1]u/2=
u+\n[3lnw1]u+\n[3cl1]u-\n[3tbw6,1]u)'6\h'|\n[3cl2]u'Octal number
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs6]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2E3release
=2E3keep
=2E3rmk 3rt7
\*[3trans].nr 3crow 7
=2E3keep
=2Emk 3rs7
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce2]u
=2Elf 15
\&\h'|\n[3cl0]u'\f[I]c_nlink\f[\n[3fnt]]\h'|(\n[3w1]u-\n[3lnw1]u-\n[3rnw1]u=
/2u+\n[3lnw1]u+\n[3cl1]u-\n[3tbw7,1]u)'6\h'|\n[3cl2]u'Octal number
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs7]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2E3release
=2E3keep
=2E3rmk 3rt8
\*[3trans].nr 3crow 8
=2E3keep
=2Emk 3rs8
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce2]u
=2Elf 16
\&\h'|\n[3cl0]u'\f[I]c_rdev\f[\n[3fnt]]\h'|(\n[3w1]u-\n[3lnw1]u-\n[3rnw1]u/=
2u+\n[3lnw1]u+\n[3cl1]u-\n[3tbw8,1]u)'6\h'|\n[3cl2]u'Octal number
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs8]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2E3release
=2E3keep
=2E3rmk 3rt9
\*[3trans].nr 3crow 9
=2E3keep
=2Emk 3rs9
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce2]u
=2Elf 17
\&\h'|\n[3cl0]u'\f[I]c_mtime\f[\n[3fnt]]\h'|(\n[3w1]u-\n[3lnw1]u-\n[3rnw1]u=
/2u+\n[3lnw1]u+\n[3cl1]u-\n[3tbw9,1]u)'11\h'|\n[3cl2]u'Octal number
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs9]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2E3release
=2E3keep
=2E3rmk 3rt10
\*[3trans].nr 3crow 10
=2E3keep
=2Emk 3rs10
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce2]u
=2Elf 18
\&\h'|\n[3cl0]u'\f[I]c_namesize\f[\n[3fnt]]\h'|(\n[3w1]u-\n[3lnw1]u-\n[3rnw=
1]u/2u+\n[3lnw1]u+\n[3cl1]u-\n[3tbw10,1]u)'6\h'|\n[3cl2]u'Octal number
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs10]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2E3release
=2E3keep
=2E3rmk 3rt11
\*[3trans].nr 3crow 11
=2E3keep
=2Emk 3rs11
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce2]u
=2Elf 19
\&\h'|\n[3cl0]u'\f[I]c_filesize\f[\n[3fnt]]\h'|(\n[3w1]u-\n[3lnw1]u-\n[3rnw=
1]u/2u+\n[3lnw1]u+\n[3cl1]u-\n[3tbw11,1]u)'11\h'|\n[3cl2]u'Octal number
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs11]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2Evs 2p>?\n[.V]u
=2Els 1
\v'.25m'\s[\n[3lps]]\h'|\n[3cd0]u'\D'l |\n[3cd3]u 0'\s0
=2Els
=2Evs
\*[3trans].nr 3brule 0
=2E3release
=2E3keep
=2E3rmk 3rt12
=2Ecp \n(3c
=2Elf 21
=2ET&
=2Ecp 0
\*[3trans].nr 3crow 12
=2E3keep
=2Emk 3rs12
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce1]u \n[3ce2]u
=2Elf 24 pax.1p
\&\h'|\n[3cl0]u'=02=03\f[B]Filename Field Name\f[\n[3fnt]]=03=02\h'|\n[3cl1=
]u'=02=03\f[B]Length\f[\n[3fnt]]=03=02\h'|\n[3cl2]u'=02=03\f[B]Interpreted =
as\f[\n[3fnt]]=03=02
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs12]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2Evs 2p>?\n[.V]u
=2Els 1
\v'.25m'\s[\n[3lps]]\h'|\n[3cd0]u'\D'l |\n[3cd3]u 0'\s0
=2Els
=2Evs
\*[3trans].nr 3brule 0
=2E3rvpt 0
\*[3trans].if 0<=3D\*[3quote]\n[3passed] .nr 3rt0 \*[3quote]\n[#T]
\*[3trans].sp -1
\*[3trans]\v'.25m'\h'\n[3cd2]u'\s[\n[3lps]]\D'l 0 |\*[3quote]\n[3rt0]u-1v'\=
s0
\*[3trans].if 0<=3D\*[3quote]\n[3passed] .nr 3rt0 \*[3quote]\n[#T]
\*[3trans].sp -1
\*[3trans]\v'.25m'\h'\n[3cd1]u'\s[\n[3lps]]\D'l 0 |\*[3quote]\n[3rt0]u-1v'\=
s0
=2E3rvpt 1
=2E3release
=2E3keep
=2E3rmk 3rt13
\*[3trans].nr 3crow 13
=2E3keep
=2Emk 3rs13
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce1]u \n[3ce2]u
=2Elf 26
\&\h'|\n[3cl0]u'\f[I]c_name\f[\n[3fnt]]\h'|\n[3cl1]u'\f[I]c_namesize\f[\n[3=
fnt]]\h'|\n[3cl2]u'Pathname string
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs13]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2Evs 2p>?\n[.V]u
=2Els 1
\v'.25m'\s[\n[3lps]]\h'|\n[3cd0]u'\D'l |\n[3cd3]u 0'\s0
=2Els
=2Evs
\*[3trans].nr 3brule 0
=2E3release
=2E3keep
=2E3rmk 3rt14
=2Ecp \n(3c
=2Elf 28
=2ET&
=2Ecp 0
\*[3trans].nr 3crow 14
=2E3keep
=2Emk 3rs14
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce1]u \n[3ce2]u
=2Elf 31 pax.1p
\&\h'|\n[3cl0]u'=02=03\f[B]File Data Field Name\f[\n[3fnt]]=03=02\h'|\n[3cl=
1]u'=02=03\f[B]Length\f[\n[3fnt]]=03=02\h'|\n[3cl2]u'=02=03\f[B]Interpreted=
 as\f[\n[3fnt]]=03=02
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs14]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2Evs 2p>?\n[.V]u
=2Els 1
\v'.25m'\s[\n[3lps]]\h'|\n[3cd0]u'\D'l |\n[3cd3]u 0'\s0
=2Els
=2Evs
\*[3trans].nr 3brule 0
=2E3rvpt 0
\*[3trans].if 14<=3D\*[3quote]\n[3passed] .nr 3rt14 \*[3quote]\n[#T]
\*[3trans].sp -1
\*[3trans]\v'.25m'\h'\n[3cd2]u'\s[\n[3lps]]\D'l 0 |\*[3quote]\n[3rt14]u-1v'=
\s0
\*[3trans].if 14<=3D\*[3quote]\n[3passed] .nr 3rt14 \*[3quote]\n[#T]
\*[3trans].sp -1
\*[3trans]\v'.25m'\h'\n[3cd1]u'\s[\n[3lps]]\D'l 0 |\*[3quote]\n[3rt14]u-1v'=
\s0
=2E3rvpt 1
=2E3release
=2E3keep
=2E3rmk 3rt15
\*[3trans].nr 3crow 15
=2E3keep
=2Emk 3rs15
=2Emk 3bot
=2E3rvpt 0
=2Eta \n[3ce0]u \n[3ce1]u \n[3ce2]u
=2Elf 33
\&\h'|\n[3cl0]u'\f[I]c_filedata\f[\n[3fnt]]\h'|\n[3cl1]u'\f[I]c_filesize\f[=
\n[3fnt]]\h'|\n[3cl2]u'Data
=2Enr 3bot \n[3bot]>?\n[.d]
=2Esp |\n[3rs15]u
=2E3rvpt 1
=2Esp |\n[3bot]u
\*[3trans].nr 3brule 1
=2E3release
=2Emk 3rt16
=2Enr 3brule 1
=2Enr T. 1
=2ET#
=2E3trelease
=2E3init
=2Efc
=2Ecp \n(3c
=2Elf 34
=2ETE

--X1bOJ3K7DJ5YkBrT--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
