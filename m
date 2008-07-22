From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Fedora downstream man-pages patches
Date: Tue, 22 Jul 2008 16:45:00 +0200
Message-ID: <cfd18e0f0807220745p70e6e37r574633dd0e4b139d@mail.gmail.com>
References: <cfd18e0f0807101149j6d3d9652u36bd8a5c2b3c1348@mail.gmail.com>
	 <4885E482.3080501@redhat.com>
	 <cfd18e0f0807220701j2159774bmd620acad4a982e56@mail.gmail.com>
	 <4885EEC3.3050107@redhat.com>
	 <cfd18e0f0807220741j25f0a909o6db0ffe88e8641eb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0807220741j25f0a909o6db0ffe88e8641eb-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

[Just noticed that your earlier response didn't include the list --
I'm restoring the CC, and resending my latest reply]

On Tue, Jul 22, 2008 at 4:41 PM, Michael Kerrisk
<mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> On Tue, Jul 22, 2008 at 4:29 PM, Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> Michael Kerrisk wrote:
>>>
>>> On Tue, Jul 22, 2008 at 3:45 PM, Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> wrote:
>>>
>>>>
>>>> Michael Kerrisk wrote:
>>>>
>>>> Now I'm upgrading to 3.04 -> so I have fixed part of problems you
>>>> mentioned
>>>>  (that "faster" ones) :),
>>>>
>>>
>>> Ivana,
>>>
>>> This does not really tell me what you did with all of those other
>>> fa"faster" ones.  Can you provide details?
>>>
>>> Cheers,
>>>
>>> Michael
>>>
>>
>> In all cases I found that you are right :). I remove more rm commands which
>> were useless now - so I go through all of them and remove them,
>> The changelog is attached.
>
> Thanks Ivana.  That makes things clearer.
>
> Feel free to peirodically (every few months) point me at the Fedora
> downstream patchset for review, so that we can tidy things up on both
> sides.
>
> Cheers,
>
> Michael
>
>> Ivana
>>
>>
>> Author: varekova
>>
>> Update of /cvs/pkgs/rpms/man-pages/devel
>> In directory cvs-int.fedora.redhat.com:/tmp/cvs-serv14723
>>
>> Modified Files:
>>        .cvsignore man-pages.spec sources
>> Removed Files:
>>        man-pages-2.51-mmap.patch
>>        man-pages-2.51-sched_setaffinity.patch
>>        man-pages-2.75-crypt.patch man-pages-2.76-prctl.patch
>> Log Message:
>> - update to 3.04
>> - remove mmap, sched_setaffinity, crypt and prctl patches
>> - remove -f from rm commands
>> - remove unnecessary/bogus rm commands
>>
>>
>>
>> Index: .cvsignore
>> ===================================================================
>> RCS file: /cvs/pkgs/rpms/man-pages/devel/.cvsignore,v
>> retrieving revision 1.51
>> retrieving revision 1.52
>> diff -u -r1.51 -r1.52
>> --- .cvsignore  18 Jun 2008 10:26:46 -0000      1.51
>> +++ .cvsignore  22 Jul 2008 13:43:59 -0000      1.52
>> @@ -1,6 +1,6 @@
>>  man-pages-extralocale.tar.bz2
>>  man-suid-bins.tar.bz2
>> -man-pages-3.00.tar.bz2
>>  man-pages-posix-2003-a.tar.bz2
>>  man-pages_syscalls.tar.bz2
>>  man-pages_add-01.tar.bz2
>> +man-pages-3.04.tar.bz2
>>
>>
>> Index: man-pages.spec
>> ===================================================================
>> RCS file: /cvs/pkgs/rpms/man-pages/devel/man-pages.spec,v
>> retrieving revision 1.100
>> retrieving revision 1.101
>> diff -u -r1.100 -r1.101
>> --- man-pages.spec      18 Jun 2008 10:26:46 -0000      1.100
>> +++ man-pages.spec      22 Jul 2008 13:43:59 -0000      1.101
>> @@ -3,7 +3,7 @@
>>
>>  Summary: Man (manual) pages from the Linux Documentation Project
>>  Name: man-pages
>> -Version: 3.00
>> +Version: 3.04
>>  Release: 1%{?dist}
>>  License: GPLv2+, GLP, BSD, MIT, Copyright only, IEEE
>>  Group: Documentation
>> @@ -21,16 +21,12 @@
>>  Patch1: man-pages-1.51-iconv.patch
>>  Patch28: man-pages-2.46-nscd.patch
>>  Patch36: man-pages-2.63-unimplemented.patch
>> -Patch37: man-pages-2.51-mmap.patch
>>  Patch41: man-pages-2.43-rt_spm.patch
>>  Patch44: man-pages-2.43-fadvise.patch
>>  Patch45: man-pages-2.48-passwd.patch
>>  Patch46: man-pages-2.51-nscd-conf.patch
>> -Patch48: man-pages-2.51-sched_setaffinity.patch
>>  Patch49: man-pages-2.63-getent.patch
>>  Patch50: man-pages-2.63-iconv.patch
>> -Patch51: man-pages-2.75-crypt.patch
>> -Patch52: man-pages-2.76-prctl.patch
>>  Patch53: man-pages-2.78-stream.patch
>>  Patch54: man-pages-2.80-malloc_h.patch
>>
>> @@ -51,89 +47,34 @@
>>  %patch1 -p1
>>  %patch28 -p1
>>  %patch36 -p1
>> -%patch37 -p1
>>  %patch41 -p1
>>  %patch44 -p1
>>  %patch45 -p1
>>  %patch46 -p1
>> -%patch48 -p1
>>  %patch49 -p1
>>  %patch50 -p1
>> -%patch51 -p1
>> -%patch52 -p1
>>  %patch53 -p1
>>  %patch54 -p1
>>
>>  ### And now remove those we are not going to use:
>>
>> -# These are parts of fileutils
>> -rm -fv man1/{chgrp,chmod,chown,cp,dd,df,dircolors,du,install}.1
>> -rm -fv man1/{ln,ls,mkdir,mkfifo,mknod,mv,rm,rmdir,touch}.1
>> -rm -fv man1/{dir,vdir}.1
>> -
>> -# Part of diffutils
>> -rm -fv man1/diff.1
>> -
>>  # Part of quota
>> -rm -fv man2/quotactl.2
>> -
>> -## Part of modutils - now the man pages should be here
>> -#rm -fv man2/get_kernel_syms.2
>> -#rm -fv man2/{create,query}_module.2
>> -
>> -# Part of console-tools
>> -rm -fv man4/console.4
>> -
>> -# Part of shadow-utils
>> -rm -fv man3/getspnam.3
>> -
>> -# part of nfs-utils
>> -rm -fv man5/exports.5
>> -rm -fv man5/nfs.5
>> -
>> -# Part of bind-utils
>> -#rm -fv man5/resolv.conf.5 # kept anyway, as it makes sense to have
>> available
>> -
>> -# Obsolete
>> -rm -f man3/infnan.3
>> -
>> -# Part of mount
>> -rm -fv man5/fstab.5
>> +rm -v man2/quotactl.2
>>
>>  # Only briefly part of a devel version of glibc
>> -rm -f man3/getipnodeby{name,addr}.3 man3/freehostent.3
>> -
>> -# Part of libcap
>> -rm -fv man2/cap{get,set}.2
>> -
>> -#Compress/Uncompress man pages
>> -rm -f man1p/{,un}compress.1p
>> -
>> -#Part of util-linux
>> -rm -f man1p/renice.1p
>> +rm -v man3/getipnodeby{name,addr}.3 man3/freehostent.3
>>
>>  # Part of libattr-devel
>> -rm -f man2/{,f,l}{get,list,remove,set}xattr.2*
>> -
>> -# Part of numactl
>> -rm -f man2/{mbind,set_mempolicy}.2
>> +rm -v man2/{,f,l}{get,list,remove,set}xattr.2
>>
>> -# Problem with db x db4 - man pages
>> -rm -f man3/{btree,dbopen,hash,mpool,recno}.3
>> +# Problem with db x db4 (#198597) - man pages are obsolete
>> +rm -v man3/{btree,dbopen,hash,mpool,recno}.3
>>
>> -# Remove rpcinfo page
>> -rm -f man8/rpcinfo.8
>> +# Remove rpcinfo page - obsolete
>> +rm -v man8/rpcinfo.8
>>
>>  # Deprecated
>> -rm -f man2/pciconfig_{write,read,iobase}.2
>> -
>> -find . -name "*sudo*" | xargs --no-run-if-empty rm
>> -
>> -# We do not have sccs
>> -rm -f man1p/{admin,delta,get,prs,rmdel,sact,sccs,unget,val,what}.1p
>> -
>> -# part of squid
>> -rm -f man8/ncsa_auth.8
>> +rm -v man2/pciconfig_{write,read,iobase}.2
>>
>>  %build
>>  : Nothing to build.
>> @@ -173,6 +114,12 @@
>>  %lang(en) %{_mandir}/en/man*
>>
>>  %changelog
>> +* Tue Jul 22 2008 Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> - 3.04-1
>> +- update to 3.04
>> +- remove mmap, sched_setaffinity, crypt and prctl patches
>> +- remove -f from rm commands
>> +- remove unnecessary/bogus rm commands
>> +
>>  * Wed Jun 18 2008 Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> - 3.00-1
>>  - update to 3.00
>>  - source files changes
>>
>>
>> Index: sources
>> ===================================================================
>> RCS file: /cvs/pkgs/rpms/man-pages/devel/sources,v
>> retrieving revision 1.50
>> retrieving revision 1.51
>> diff -u -r1.50 -r1.51
>> --- sources     18 Jun 2008 10:26:46 -0000      1.50
>> +++ sources     22 Jul 2008 13:43:59 -0000      1.51
>> @@ -1,6 +1,6 @@
>>  57f2e0500d177e05647990eae439a8ee  man-pages-extralocale.tar.bz2
>>  a9c6a14e5b34c18c3684a0b68322572f  man-suid-bins.tar.bz2
>> -e33a7c2e5ae9e5d3b3ed71568a740e30  man-pages-3.00.tar.bz2
>>  7c78aff03c0a6767ba483d34f19e4b09  man-pages-posix-2003-a.tar.bz2
>>  bf0d94a7faf6dc0db31325dbf576fd84  man-pages_syscalls.tar.bz2
>>  4ae755c6caaa035cb7737bf4a3ec7927  man-pages_add-01.tar.bz2
>> +fbe6e709f71d639dcd07a22d297d89f5  man-pages-3.04.tar.bz2
>>
>>
>> --- man-pages-2.51-mmap.patch DELETED ---
>>
>>
>> --- man-pages-2.51-sched_setaffinity.patch DELETED ---
>>
>>
>> --- man-pages-2.75-crypt.patch DELETED ---
>>
>>
>> --- man-pages-2.76-prctl.patch DELETED ---
>>
>>
>>
>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
> Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
