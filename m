From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Fedora downstream man-pages patches
Date: Wed, 16 Jul 2008 16:08:11 +0200
Message-ID: <cfd18e0f0807160708x50a116f5s459107516b34787d@mail.gmail.com>
References: <cfd18e0f0807101149j6d3d9652u36bd8a5c2b3c1348@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0807101149j6d3d9652u36bd8a5c2b3c1348-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Ivana,

Ping!

Cheers,

Michael


---------- Forwarded message ----------
From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Date: Thu, Jul 10, 2008 at 8:49 PM
Subject: Fedora downstream man-pages patches
To: Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alain PORTAL <aportal-CD6X2pywdrkGaKE8qFNMvg@public.gmane.org>


Hi Ivana,

I reviewed some pieces of the downstream man-pages patch in Fedora.
Some comments below.

Quoting "man-pages.spec":

> %define posix_version 2003
> %define posix_release a
>
> Summary: Man (manual) pages from the Linux Documentation Project
> Name: man-pages
> Version: 3.00
> Release: 1%{?dist}
> License: GPLv2+, GLP, BSD, MIT, Copyright only, IEEE
> Group: Documentation
> URL: http://www.kernel.org/pub/linux/docs/manpages/
>
> Source0: http://www.kernel.org/pub/linux/docs/manpages/man-pages-%{version}.tar.bz2
> # POSIX man pages
> Source1:
http://www.kernel.org/pub/linux/docs/man-pages/man-pages-posix/man-pages-posix-%{posix_version}-%{posix_release}.tar.bz2
> Source2: man-pages_add-01.tar.bz2
> Source3: man-pages-extralocale.tar.bz2
> Source4: man-pages_syscalls.tar.bz2
> # IBM-supplied man pages for suid binaries:
> Source5: man-suid-bins.tar.bz2
>
> Patch1: man-pages-1.51-iconv.patch
> Patch28: man-pages-2.46-nscd.patch
> Patch36: man-pages-2.63-unimplemented.patch
> Patch37: man-pages-2.51-mmap.patch

This patch says:

==
--- man-pages-2.51/man2/mmap.2.pom      2007-05-12 01:07:02.000000000 +0200
+++ man-pages-2.51/man2/mmap.2  2007-05-31 14:33:32.000000000 +0200
@@ -197,6 +197,9 @@
 as a hint: place the mapping at exactly that address.
 .I start
 must be a multiple of the page size.
+In all other cases
+.I start
+address is rounded up to the next page size boundary.
 If the memory region specified by
 .I start
 and
==

But this is redundant.  Already, elsewhere on the page is the text:

                                         If addr is  not  NULL,
      then  the  kernel takes it as a hint about where to place
      the mapping; on Linux, the mapping will be created at the
      next  higher  page boundary.  The address of the new map-
      ping is returned as the result of the call.

> Patch41: man-pages-2.43-rt_spm.patch
> Patch44: man-pages-2.43-fadvise.patch
> Patch45: man-pages-2.48-passwd.patch
> Patch46: man-pages-2.51-nscd-conf.patch
> Patch48: man-pages-2.51-sched_setaffinity.patch

I applied the previous patch upstream, for 3.04.

> Patch49: man-pages-2.63-getent.patch
> Patch50: man-pages-2.63-iconv.patch
> Patch51: man-pages-2.75-crypt.patch

I've applied some of this for 3.04, but I've also raised some questions
against http://bugzilla.redhat.com/show_bug.cgi?id=428280 . I would
appreciate your response on those questions.

> Patch52: man-pages-2.76-prctl.patch

The need for the preceding patch will soon disappear, since, in 3.04 or 3.05,
I will add something in upstream to cover PR_GET_SECCOMP and PR_SET_SECCOMP.

> Patch53: man-pages-2.78-stream.patch
> Patch54: man-pages-2.80-malloc_h.patch

I've covered the preceding patch in a separate mail to you.

> Buildroot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
> Autoreq: false
> BuildArch: noarch
>
> %description
> A large collection of man pages (documentation) from the Linux
> Documentation Project (LDP).
>
> %prep
> %setup -q -n %{name}-%{version} -a 1 -a 2 -a 3 -a 4 -a 5
>
> mv  man-pages-posix-%{posix_version}-%{posix_release}/* ./
> rmdir man-pages-posix-%{posix_version}-%{posix_release}
>
> %patch1 -p1
> %patch28 -p1
> %patch36 -p1
> %patch37 -p1
> %patch41 -p1
> %patch44 -p1
> %patch45 -p1
> %patch46 -p1
> %patch48 -p1
> %patch49 -p1
> %patch50 -p1
> %patch51 -p1
> %patch52 -p1
> %patch53 -p1
> %patch54 -p1
>
> ### And now remove those we are not going to use:
>
> # These are parts of fileutils
> rm -fv man1/{chgrp,chmod,chown,cp,dd,df,dircolors,du,install}.1
> rm -fv man1/{ln,ls,mkdir,mkfifo,mknod,mv,rm,rmdir,touch}.1
> rm -fv man1/{dir,vdir}.1

The use of "rm -f" in the .spec file seems questionable, since
it seems to have prevented you discovering the following, which
occurred a year ago, in man-pages-2.50:

=====
[2.50 Changes:]

Most Section 1 man pages are removed
   mtk (with help from Mike Frysinger, Laird Shaw, Andreas Halter)
       Once upon time Andries added a number of Section 1 manual pages
       to man-pages.  However, since that time, those pages have not
       seen much maintenance, and are not in fact distributed in most
       distributions.  Instead most distributions supply the
       coreutils versions of these pages, which are currently
       maintained.  In addition, man-pages provides the 1p pages,
       which document the portable subset of functionality of these
       commands.  Since the man1 pages are mostly unneeded, and
       out of date, I'm removing them.  The following pages disappear:

           chgrp.1
           chmod.1
           chown.1
           cp.1
           dd.1
           df.1
           diff.1
           dir.1
           dircolors.1
           du.1
           install.1
           ln.1
           ls.1
           mkdir.1
           mkfifo.1
           mknod.1
           mv.1
           rm.1
           rmdir.1
           touch.1
           vdir.1
=====


> # Part of diffutils
> rm -fv man1/diff.1

See above.

> # Part of quota
> rm -fv man2/quotactl.2
>
> ## Part of modutils - now the man pages should be here
> #rm -fv man2/get_kernel_syms.2
> #rm -fv man2/{create,query}_module.2
>
> # Part of console-tools
> rm -fv man4/console.4
>
> # Part of shadow-utils
> rm -fv man3/getspnam.3

You should reconsider this.

I'd say that the getspnam.3 in man-pages is rather better than the
shadow.3 page in shadow-utils.

> # part of nfs-utils
> rm -fv man5/exports.5
> rm -fv man5/nfs.5
>
> # Part of bind-utils
> #rm -fv man5/resolv.conf.5 # kept anyway, as it makes sense to have available
>
> # Obsolete
> rm -f man3/infnan.3
>
> # Part of mount
> rm -fv man5/fstab.5
>
> # Only briefly part of a devel version of glibc
> rm -f man3/getipnodeby{name,addr}.3 man3/freehostent.3
>
> # Part of libcap

Soon, this will no longer be true, since ownership of the pages has moved
from libcap to man-pages (which is where all syscall man pages should be).

> rm -fv man2/cap{get,set}.2
>
> #Compress/Uncompress man pages
> rm -f man1p/{,un}compress.1p

Why are you removing POSIX pages?

For quite some time now, all POSIX pages that I distribute have carried
this disclaimer:

  PROLOG
      This  manual  page is part of the POSIX Programmer's Man-
      ual.  The Linux implementation of this interface may dif-
      fer  (consult  the  corresponding  Linux  manual page for
      details of Linux behavior), or the interface may  not  be
      implemented on Linux.

There should be no need to delete POSIX pages.  Maintaining them provides
users with easy access to the POSIX specification, which can be useful!

> #Part of util-linux
> rm -f man1p/renice.1p

See above.

> # Part of libattr-devel
> rm -f man2/{,f,l}{get,list,remove,set}xattr.2*

I'm not sure why Fedora's libattr-devel has these system call
man pages.  The canonical home for the pages is man-pages.
The version of the pages in Fedora's libattr-devel look to be
outdated.  I'd suggest asking the Fedora maintainer of
libattr-devel to remove these pages (I *think* they don't
come from an upstream libattr-devel package...)

>
> # Part of numactl

This is no longer true in Fedora, AFAICS.  Again, it looks
like you have been bitten by "rm -f".

The canonical home for these pages became man-pages, quite
a while back.

> rm -f man2/{mbind,set_mempolicy}.2
>
> # Problem with db x db4 - man pages
> rm -f man3/{btree,dbopen,hash,mpool,recno}.3
>
> # Remove rpcinfo page
> rm -f man8/rpcinfo.8
>
> # Deprecated
> rm -f man2/pciconfig_{write,read,iobase}.2
>
> find . -name "*sudo*" | xargs --no-run-if-empty rm
>
> # We do not have sccs
> rm -f man1p/{admin,delta,get,prs,rmdel,sact,sccs,unget,val,what}.1p

Again, best not to delete POSIX page, IMO.

> # part of squid
> rm -f man8/ncsa_auth.8

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
