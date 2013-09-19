From: John Spencer <maillist-musl-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>
Subject: Re: POSIX.1-2013 man pages for review
Date: Thu, 19 Sep 2013 10:44:40 +0200
Message-ID: <523AB978.2080607@barfooze.de>
References: <523AAEEE.5090602@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050607080609010301060405"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <523AAEEE.5090602-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Josey <ajosey-7882/jkIBncuagvECLh61g@public.gmane.org>, Felix Janda <felix.janda-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, John Spencer <maillist-musl-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Matthew Dempsky <matthew-bfSpyvURsAhAfugRpC6u6w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------050607080609010301060405
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michael, Felix,

On 09/19/2013 09:59 AM, Michael Kerrisk (man-pages) wrote:
>
> Thanks to some work by Felix Janda, we now have a set of
> scripts that convert the source format that we received from
> IEEE/TOG to the man pages using the "man" macros. Felix has
> done some excellent work, and I've spent quite some time
> reviewing the results. However, before definitively releasing

great work, thanks !


> these pages, I would like to have further review of the pages,
> and I am soliciting that review with this mail
>
> The main purposes of this review are to:
> * detect any problems injected by the conversion process
>    (e.g., spurious text added or deleted)
> * find any formatting issues with the resulting pages.


i've run a test script[0] using my own manpage viewer[1]
and attached the results. it seems that ~10% of the manpages use some
special groff features. i'd rather see these removed/replaced with 
something nroff-compatible.

[0] https://github.com/rofl0r/hardcore-utils/blob/master/tests/mantest.sh
[1] https://github.com/rofl0r/hardcore-utils/blob/master/man.c

--JS

--------------050607080609010301060405
Content-Type: text/x-log;
 name="man.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="man.log"

=== status report  ===
total manpages	: 1143
buggy manpages	: 137
total failures	: 406
unique failures	: 12

bug list:
    122 **** Unknown formatter command: .ne
    106 **** Unknown formatter command: .TS
    106 **** Unknown formatter command: .TE
     24 **** Unknown formatter command: .ce
     14 **** Unknown formatter command: .EQ
     14 **** Unknown formatter command: .EN
     11 **** Unknown formatter command: .nr
      3 **** Unknown formatter command: .T&
      2 **** Unknown formatter command: .tr
      2 **** Unknown formatter command: .in
      1 **** Unknown formatter command: .Im

=== detail ===
page			total	unique
/root/man/man3p/posix_trace_close.3p	3	3
/root/man/man3p/regcomp.3p	2	4
/root/man/man3p/nl_langinfo.3p	1	1
/root/man/man3p/semop.3p	3	3
/root/man/man3p/ilogb.3p	2	2
/root/man/man3p/endutxent.3p	2	2
/root/man/man3p/wctype.3p	2	2
/root/man/man3p/open.3p	1	1
/root/man/man3p/posix_madvise.3p	1	1
/root/man/man3p/semctl.3p	1	1
/root/man/man3p/glob.3p	2	2
/root/man/man3p/freopen.3p	2	2
/root/man/man3p/localeconv.3p	2	4
/root/man/man3p/shmctl.3p	1	1
/root/man/man3p/fopen.3p	2	2
/root/man/man3p/pthread_cond_timedwait.3p	1	1
/root/man/man3p/strftime.3p	2	2
/root/man/man3p/posix_trace_getnext_event.3p	1	1
/root/man/man3p/drand48.3p	3	4
/root/man/man3p/sigaction.3p	3	3
/root/man/man3p/realpath.3p	1	1
/root/man/man3p/posix_spawn_file_actions_addclose.3p	1	1
/root/man/man3p/fma.3p	1	1
/root/man/man3p/fork.3p	1	1
/root/man/man3p/dirname.3p	2	2
/root/man/man3p/msync.3p	2	2
/root/man/man3p/putmsg.3p	1	2
/root/man/man3p/futimens.3p	1	1
/root/man/man3p/getdate.3p	2	4
/root/man/man3p/log1p.3p	1	1
/root/man/man3p/timer_create.3p	1	1
/root/man/man3p/getsockname.3p	1	1
/root/man/man3p/sysconf.3p	2	4
/root/man/man3p/tgamma.3p	1	1
/root/man/man3p/scalbln.3p	1	1
/root/man/man3p/pthread_key_create.3p	1	1
/root/man/man3p/mq_open.3p	1	1
/root/man/man3p/socket.3p	1	1
/root/man/man3p/lgamma.3p	2	2
/root/man/man3p/system.3p	1	1
/root/man/man3p/posix_trace_create.3p	2	8
/root/man/man3p/printf.3p	3	3
/root/man/man3p/sigtimedwait.3p	1	1
/root/man/man3p/getpriority.3p	1	1
/root/man/man3p/chmod.3p	2	4
/root/man/man3p/fwscanf.3p	1	1
/root/man/man3p/pthread_mutex_lock.3p	2	2
/root/man/man3p/sendto.3p	1	2
/root/man/man3p/tzset.3p	2	2
/root/man/man3p/sqrt.3p	2	2
/root/man/man3p/readlink.3p	1	1
/root/man/man3p/fputc.3p	1	1
/root/man/man3p/write.3p	1	1
/root/man/man3p/posix_spawn_file_actions_destroy.3p	1	1
/root/man/man3p/getc_unlocked.3p	1	1
/root/man/man3p/fstatvfs.3p	1	1
/root/man/man3p/gai_strerror.3p	2	2
/root/man/man3p/mmap.3p	3	5
/root/man/man3p/erf.3p	3	3
/root/man/man3p/wordexp.3p	3	3
/root/man/man3p/fdopendir.3p	1	1
/root/man/man3p/msgsnd.3p	1	1
/root/man/man3p/truncate.3p	1	1
/root/man/man3p/mknod.3p	3	5
/root/man/man3p/ioctl.3p	1	2
/root/man/man3p/pthread_mutex_destroy.3p	1	1
/root/man/man3p/fstatat.3p	1	1
/root/man/man3p/fcntl.3p	1	1
/root/man/man3p/getpeername.3p	1	1
/root/man/man3p/sendmsg.3p	1	1
/root/man/man3p/lockf.3p	2	2
/root/man/man3p/fscanf.3p	1	1
/root/man/man3p/atanh.3p	1	1
/root/man/man3p/utime.3p	1	1
/root/man/man3p/tan.3p	1	1
/root/man/man3p/fattach.3p	1	1
/root/man/man3p/fpathconf.3p	3	3
/root/man/man3p/fgetwc.3p	1	1
/root/man/man3p/fwprintf.3p	1	4
/root/man/man1p/write.1p	1	1
/root/man/man1p/sccs.1p	1	1
/root/man/man1p/val.1p	2	2
/root/man/man1p/ctags.1p	1	2
/root/man/man1p/nl.1p	2	2
/root/man/man1p/expr.1p	3	5
/root/man/man1p/pax.1p	7	31
/root/man/man1p/ex.1p	3	10
/root/man/man1p/lex.1p	4	12
/root/man/man1p/ps.1p	4	7
/root/man/man1p/dirname.1p	2	2
/root/man/man1p/touch.1p	2	2
/root/man/man1p/c99.1p	4	13
/root/man/man1p/yacc.1p	4	5
/root/man/man1p/mailx.1p	1	2
/root/man/man1p/dd.1p	2	3
/root/man/man1p/find.1p	1	2
/root/man/man1p/qsub.1p	4	4
/root/man/man1p/awk.1p	4	14
/root/man/man1p/file.1p	4	5
/root/man/man1p/tail.1p	2	2
/root/man/man1p/bc.1p	3	5
/root/man/man1p/gencat.1p	2	2
/root/man/man1p/ed.1p	2	4
/root/man/man1p/get.1p	3	4
/root/man/man1p/tr.1p	2	2
/root/man/man1p/prs.1p	2	2
/root/man/man1p/ls.1p	1	1
/root/man/man1p/printf.1p	3	3
/root/man/man1p/qhold.1p	1	1
/root/man/man1p/chmod.1p	2	4
/root/man/man1p/vi.1p	1	3
/root/man/man1p/od.1p	4	4
/root/man/man1p/stty.1p	4	7
/root/man/man1p/sort.1p	2	2
/root/man/man1p/uuencode.1p	4	4
/root/man/man1p/ar.1p	1	1
/root/man/man1p/sed.1p	1	8
/root/man/man0p/tar.h.0p	2	6
/root/man/man0p/complex.h.0p	2	2
/root/man/man0p/tgmath.h.0p	2	6
/root/man/man0p/cpio.h.0p	2	2
/root/man/man0p/float.h.0p	3	15
/root/man/man0p/langinfo.h.0p	2	2
/root/man/man0p/pthread.h.0p	2	2
/root/man/man0p/fcntl.h.0p	1	1
/root/man/man0p/fmtmsg.h.0p	2	2
/root/man/man0p/inttypes.h.0p	2	8
/root/man/man0p/sys_stat.h.0p	3	3
/root/man/man0p/math.h.0p	2	2
/root/man/man0p/time.h.0p	1	1
/root/man/man0p/termios.h.0p	2	4
/root/man/man0p/signal.h.0p	3	9
/root/man/man0p/netinet_in.h.0p	1	1
/root/man/man0p/unistd.h.0p	1	3
/root/man/man0p/stdint.h.0p	3	3
/root/man/man0p/spawn.h.0p	1	1
/root/man/man0p/stdio.h.0p	1	1

--------------050607080609010301060405--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
