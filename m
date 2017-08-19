From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man-pages: Use a one-font macro for one argument instead
 of a two-fonts macro
Date: Sat, 19 Aug 2017 22:20:22 +0200
Message-ID: <5961e886-c54f-aaac-5db9-63694bd59d93@gmail.com>
References: <20170819183802.GA18053@rhi.hi.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170819183802.GA18053-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Bjarni,

On 08/19/2017 08:38 PM, Bjarni Ingi Gislason wrote:
> Used script:
> 
> #!/bin/bash
> 
> sed -i -e '/^[.]BR  *[^ ]*$/ s/^\.BR /\.B /' \
>   -e '/^[.]IR  *[^ ]*$/ s/^\.IR /\.I /' \
>   -e '/^[.] *BR  *"[^"]*"$/  s/^\.BR /\.B /' \
>   -e '/^[.] *IR  *"[^"]*"$/  s/^\.IR /\.I /' $*
> 
>   A few changes 'BI' to 'B' made manually.
> 
>   The patch is in the attachment.

Thanks for the patch, but I since these changes do not
affect the rendered output, I think the change isn't really
needed (and this just creates churn in the source).
So, I've not attempted to apply or replicate this patch.

Cheers,

Michael


> Signed-off-by: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
> ---
>  man1/iconv.1                         |   6 +-
>  man1/ldd.1                           |   4 +-
>  man1/locale.1                        |   4 +-
>  man1/localedef.1                     |   2 +-
>  man1/memusage.1                      |   6 +-
>  man1/memusagestat.1                  |   2 +-
>  man1/mtrace.1                        |   4 +-
>  man1/pldd.1                          |   4 +-
>  man1/sprof.1                         |  18 +-
>  man2/accept.2                        |   8 +-
>  man2/access.2                        |   4 +-
>  man2/add_key.2                       |  12 +-
>  man2/adjtimex.2                      |  44 +--
>  man2/bpf.2                           |  32 +-
>  man2/cacheflush.2                    |   4 +-
>  man2/capget.2                        |   2 +-
>  man2/chmod.2                         |   4 +-
>  man2/chown.2                         |  16 +-
>  man2/clock_nanosleep.2               |   8 +-
>  man2/clone.2                         |  50 +--
>  man2/connect.2                       |   2 +-
>  man2/copy_file_range.2               |   4 +-
>  man2/delete_module.2                 |  20 +-
>  man2/dup.2                           |  12 +-
>  man2/epoll_create.2                  |   2 +-
>  man2/epoll_ctl.2                     |  24 +-
>  man2/epoll_wait.2                    |   2 +-
>  man2/eventfd.2                       |  12 +-
>  man2/execve.2                        |  22 +-
>  man2/execveat.2                      |  22 +-
>  man2/fallocate.2                     |  52 ++--
>  man2/fanotify_mark.2                 |   6 +-
>  man2/fcntl.2                         | 114 +++----
>  man2/fork.2                          |   6 +-
>  man2/futex.2                         | 178 +++++------
>  man2/get_mempolicy.2                 |   2 +-
>  man2/get_robust_list.2               |   6 +-
>  man2/getdents.2                      |   2 +-
>  man2/getgroups.2                     |   6 +-
>  man2/gethostname.2                   |   2 +-
>  man2/getitimer.2                     |  20 +-
>  man2/getpid.2                        |   2 +-
>  man2/getpriority.2                   |   2 +-
>  man2/getrandom.2                     |  28 +-
>  man2/getrlimit.2                     |  20 +-
>  man2/getrusage.2                     |   2 +-
>  man2/getsockopt.2                    |   2 +-
>  man2/gettid.2                        |   4 +-
>  man2/getxattr.2                      |   2 +-
>  man2/init_module.2                   |   8 +-
>  man2/inotify_init.2                  |   4 +-
>  man2/io_getevents.2                  |   2 +-
>  man2/ioctl_console.2                 |   4 +-
>  man2/ioctl_fat.2                     |   6 +-
>  man2/ioctl_ficlonerange.2            |  18 +-
>  man2/ioctl_fideduperange.2           |  42 +--
>  man2/ioctl_getfsmap.2                |   2 +-
>  man2/ioctl_iflags.2                  |  10 +-
>  man2/ioctl_list.2                    |   2 +-
>  man2/ioctl_ns.2                      |  16 +-
>  man2/ioctl_tty.2                     |  18 +-
>  man2/ioctl_userfaultfd.2             |  48 +--
>  man2/kcmp.2                          |  28 +-
>  man2/kexec_load.2                    |  32 +-
>  man2/keyctl.2                        | 166 +++++-----
>  man2/link.2                          |  18 +-
>  man2/lseek.2                         |  20 +-
>  man2/madvise.2                       |  38 +--
>  man2/mbind.2                         |   4 +-
>  man2/memfd_create.2                  |  28 +-
>  man2/migrate_pages.2                 |   2 +-
>  man2/mkdir.2                         |   4 +-
>  man2/mlock.2                         |   6 +-
>  man2/mmap.2                          |  20 +-
>  man2/modify_ldt.2                    |   4 +-
>  man2/mount.2                         |  96 +++---
>  man2/mprotect.2                      |  26 +-
>  man2/msgget.2                        |   2 +-
>  man2/msgop.2                         |  12 +-
>  man2/msync.2                         |  12 +-
>  man2/nanosleep.2                     |  10 +-
>  man2/nice.2                          |   2 +-
>  man2/open.2                          |  70 ++---
>  man2/open_by_handle_at.2             |  68 ++---
>  man2/perf_event_open.2               |  66 ++--
>  man2/personality.2                   |  18 +-
>  man2/pipe.2                          |  18 +-
>  man2/poll.2                          |   4 +-
>  man2/posix_fadvise.2                 |   2 +-
>  man2/prctl.2                         | 164 +++++-----
>  man2/pread.2                         |   2 +-
>  man2/process_vm_readv.2              |  24 +-
>  man2/ptrace.2                        | 144 ++++-----
>  man2/quotactl.2                      |  22 +-
>  man2/read.2                          |   2 +-
>  man2/readlink.2                      |   8 +-
>  man2/readv.2                         |   2 +-
>  man2/reboot.2                        |  14 +-
>  man2/recvmmsg.2                      |   4 +-
>  man2/removexattr.2                   |   2 +-
>  man2/rename.2                        |  14 +-
>  man2/request_key.2                   |  36 +--
>  man2/restart_syscall.2               |   8 +-
>  man2/rt_sigqueueinfo.2               |   4 +-
>  man2/s390_pci_mmio_write.2           |  14 +-
>  man2/s390_runtime_instr.2            |  10 +-
>  man2/sched_get_priority_max.2        |   2 +-
>  man2/sched_rr_get_interval.2         |   2 +-
>  man2/sched_setaffinity.2             |   4 +-
>  man2/sched_setattr.2                 |  32 +-
>  man2/sched_setscheduler.2            |  16 +-
>  man2/seccomp.2                       | 138 ++++-----
>  man2/select.2                        |   8 +-
>  man2/semctl.2                        |   4 +-
>  man2/semget.2                        |   2 +-
>  man2/semop.2                         |   4 +-
>  man2/sendfile.2                      |   4 +-
>  man2/sendmmsg.2                      |   6 +-
>  man2/set_mempolicy.2                 |   2 +-
>  man2/set_thread_area.2               |   2 +-
>  man2/seteuid.2                       |   4 +-
>  man2/setfsgid.2                      |   2 +-
>  man2/setfsuid.2                      |   2 +-
>  man2/setns.2                         |  14 +-
>  man2/setsid.2                        |   2 +-
>  man2/setuid.2                        |   2 +-
>  man2/setxattr.2                      |   4 +-
>  man2/shmget.2                        |   6 +-
>  man2/shmop.2                         |   2 +-
>  man2/shutdown.2                      |   2 +-
>  man2/sigaction.2                     |  32 +-
>  man2/sigaltstack.2                   |   2 +-
>  man2/signal.2                        |   6 +-
>  man2/signalfd.2                      |  10 +-
>  man2/sigpending.2                    |   4 +-
>  man2/sigprocmask.2                   |  12 +-
>  man2/sigreturn.2                     |  10 +-
>  man2/sigsuspend.2                    |   6 +-
>  man2/sigwaitinfo.2                   |   8 +-
>  man2/socket.2                        |   2 +-
>  man2/socketpair.2                    |   4 +-
>  man2/spu_create.2                    |   6 +-
>  man2/spu_run.2                       |   8 +-
>  man2/stat.2                          |  22 +-
>  man2/statfs.2                        |   2 +-
>  man2/statx.2                         |  20 +-
>  man2/subpage_prot.2                  |   2 +-
>  man2/symlink.2                       |   6 +-
>  man2/syscall.2                       |   6 +-
>  man2/sysinfo.2                       |   4 +-
>  man2/syslog.2                        |  22 +-
>  man2/timer_create.2                  |  26 +-
>  man2/timer_settime.2                 |   6 +-
>  man2/timerfd_create.2                |  26 +-
>  man2/truncate.2                      |   2 +-
>  man2/umask.2                         |   2 +-
>  man2/umount.2                        |  12 +-
>  man2/unlink.2                        |   6 +-
>  man2/unshare.2                       |  52 ++--
>  man2/userfaultfd.2                   |  26 +-
>  man2/utimensat.2                     |  12 +-
>  man2/vfork.2                         |   2 +-
>  man2/vm86.2                          |   2 +-
>  man2/write.2                         |   2 +-
>  man3/__ppc_get_timebase.3            |   4 +-
>  man3/__ppc_set_ppr_med.3             |   6 +-
>  man3/acos.3                          |   2 +-
>  man3/aio_read.3                      |   4 +-
>  man3/aio_suspend.3                   |   2 +-
>  man3/aio_write.3                     |   4 +-
>  man3/alloca.3                        |   4 +-
>  man3/argz_add.3                      |   2 +-
>  man3/asin.3                          |   2 +-
>  man3/atan.3                          |   2 +-
>  man3/atan2.3                         |   2 +-
>  man3/atanh.3                         |   4 +-
>  man3/bindresvport.3                  |   2 +-
>  man3/carg.3                          |   6 +-
>  man3/catopen.3                       |   2 +-
>  man3/ceil.3                          |   4 +-
>  man3/clock.3                         |   2 +-
>  man3/cos.3                           |   2 +-
>  man3/cpow.3                          |   2 +-
>  man3/ctime.3                         |   2 +-
>  man3/des_crypt.3                     |  14 +-
>  man3/dl_iterate_phdr.3               |  10 +-
>  man3/dladdr.3                        |  20 +-
>  man3/dlinfo.3                        |  14 +-
>  man3/dlopen.3                        |  18 +-
>  man3/dlsym.3                         |   4 +-
>  man3/drand48.3                       |   2 +-
>  man3/duplocale.3                     |   2 +-
>  man3/end.3                           |   2 +-
>  man3/erfc.3                          |   2 +-
>  man3/errno.3                         |   4 +-
>  man3/euidaccess.3                    |   2 +-
>  man3/expm1.3                         |   2 +-
>  man3/fenv.3                          |   4 +-
>  man3/floor.3                         |   4 +-
>  man3/fmemopen.3                      |   6 +-
>  man3/fmod.3                          |   4 +-
>  man3/fopen.3                         |   2 +-
>  man3/fopencookie.3                   |   2 +-
>  man3/fpathconf.3                     |   2 +-
>  man3/fseeko.3                        |   4 +-
>  man3/fts.3                           |  96 +++---
>  man3/ftw.3                           |   4 +-
>  man3/get_nprocs_conf.3               |   4 +-
>  man3/getaddrinfo.3                   |  18 +-
>  man3/getaddrinfo_a.3                 |  10 +-
>  man3/getauxval.3                     |  58 ++--
>  man3/getcontext.3                    |   2 +-
>  man3/getdate.3                       |   4 +-
>  man3/getfsent.3                      |   4 +-
>  man3/getgrnam.3                      |   2 +-
>  man3/getgrouplist.3                  |   4 +-
>  man3/gethostbyname.3                 |   8 +-
>  man3/getifaddrs.3                    |   2 +-
>  man3/getmntent.3                     |   4 +-
>  man3/getnameinfo.3                   |   4 +-
>  man3/getopt.3                        |   6 +-
>  man3/getpwnam.3                      |   2 +-
>  man3/getrpcent.3                     |   4 +-
>  man3/glob.3                          |   2 +-
>  man3/hsearch.3                       |   2 +-
>  man3/hypot.3                         |   2 +-
>  man3/iconv_open.3                    |   4 +-
>  man3/if_nameindex.3                  |   2 +-
>  man3/ilogb.3                         |   4 +-
>  man3/inet.3                          |   2 +-
>  man3/inet_net_pton.3                 |   4 +-
>  man3/inet_pton.3                     |   2 +-
>  man3/isatty.3                        |   2 +-
>  man3/isfdtype.3                      |   2 +-
>  man3/isgreater.3                     |  14 +-
>  man3/lgamma.3                        |   2 +-
>  man3/lio_listio.3                    |  20 +-
>  man3/lockf.3                         |   4 +-
>  man3/lsearch.3                       |   2 +-
>  man3/malloc.3                        |  10 +-
>  man3/malloc_get_state.3              |   2 +-
>  man3/mallopt.3                       |  72 ++---
>  man3/mblen.3                         |   2 +-
>  man3/mbrlen.3                        |   6 +-
>  man3/mbrtowc.3                       |  14 +-
>  man3/mbsnrtowcs.3                    |   4 +-
>  man3/mbsrtowcs.3                     |   2 +-
>  man3/mbstowcs.3                      |   2 +-
>  man3/mbtowc.3                        |   8 +-
>  man3/mcheck.3                        |   4 +-
>  man3/memccpy.3                       |   2 +-
>  man3/memchr.3                        |   2 +-
>  man3/memmem.3                        |   2 +-
>  man3/mkstemp.3                       |   2 +-
>  man3/modf.3                          |   4 +-
>  man3/mq_open.3                       |   4 +-
>  man3/mtrace.3                        |   4 +-
>  man3/newlocale.3                     |  16 +-
>  man3/nextup.3                        |   4 +-
>  man3/nl_langinfo.3                   |   6 +-
>  man3/ntp_gettime.3                   |   2 +-
>  man3/open_memstream.3                |   4 +-
>  man3/posix_madvise.3                 |   2 +-
>  man3/posix_memalign.3                |   2 +-
>  man3/posix_spawn.3                   |  24 +-
>  man3/pow.3                           |   4 +-
>  man3/printf.3                        |   6 +-
>  man3/pthread_atfork.3                |   2 +-
>  man3/pthread_attr_init.3             |   2 +-
>  man3/pthread_attr_setaffinity_np.3   |   8 +-
>  man3/pthread_attr_setdetachstate.3   |   4 +-
>  man3/pthread_attr_setinheritsched.3  |   6 +-
>  man3/pthread_attr_setschedparam.3    |   4 +-
>  man3/pthread_attr_setschedpolicy.3   |   4 +-
>  man3/pthread_attr_setscope.3         |   6 +-
>  man3/pthread_attr_setstack.3         |  14 +-
>  man3/pthread_attr_setstacksize.3     |   4 +-
>  man3/pthread_cancel.3                |   6 +-
>  man3/pthread_cleanup_push.3          |   2 +-
>  man3/pthread_create.3                |  12 +-
>  man3/pthread_detach.3                |   2 +-
>  man3/pthread_exit.3                  |   2 +-
>  man3/pthread_getattr_default_np.3    |   6 +-
>  man3/pthread_getattr_np.3            |   4 +-
>  man3/pthread_join.3                  |   2 +-
>  man3/pthread_rwlockattr_setkind_np.3 |   8 +-
>  man3/pthread_self.3                  |   2 +-
>  man3/pthread_setaffinity_np.3        |   4 +-
>  man3/pthread_setconcurrency.3        |   4 +-
>  man3/pthread_setname_np.3            |   2 +-
>  man3/pthread_setschedparam.3         |   8 +-
>  man3/pthread_tryjoin_np.3            |   6 +-
>  man3/putgrent.3                      |   4 +-
>  man3/putwchar.3                      |   2 +-
>  man3/rand.3                          |   6 +-
>  man3/random_r.3                      |   8 +-
>  man3/rcmd.3                          |  20 +-
>  man3/readdir.3                       |  10 +-
>  man3/readdir_r.3                     |   6 +-
>  man3/realpath.3                      |   6 +-
>  man3/remainder.3                     |   6 +-
>  man3/remquo.3                        |   2 +-
>  man3/resolver.3                      |   8 +-
>  man3/rexec.3                         |  14 +-
>  man3/round.3                         |   4 +-
>  man3/rpc.3                           |  10 +-
>  man3/scalb.3                         |   2 +-
>  man3/scalbln.3                       |   2 +-
>  man3/scanf.3                         |   8 +-
>  man3/sem_open.3                      |   2 +-
>  man3/setenv.3                        |   4 +-
>  man3/setjmp.3                        |  12 +-
>  man3/setlogmask.3                    |   2 +-
>  man3/shm_open.3                      |   2 +-
>  man3/signbit.3                       |   4 +-
>  man3/sigwait.3                       |   2 +-
>  man3/sin.3                           |   2 +-
>  man3/sleep.3                         |   2 +-
>  man3/statvfs.3                       |   4 +-
>  man3/stdarg.3                        |   2 +-
>  man3/strcasecmp.3                    |   2 +-
>  man3/strcat.3                        |   8 +-
>  man3/strcmp.3                        |   2 +-
>  man3/strcpy.3                        |   4 +-
>  man3/strerror.3                      |   2 +-
>  man3/strfmon.3                       |   2 +-
>  man3/strfromd.3                      |   4 +-
>  man3/strftime.3                      |  12 +-
>  man3/strptime.3                      |   2 +-
>  man3/strtod.3                        |   4 +-
>  man3/strtok.3                        |   2 +-
>  man3/strtol.3                        |   2 +-
>  man3/strtoul.3                       |   2 +-
>  man3/syslog.3                        |   2 +-
>  man3/tan.3                           |   2 +-
>  man3/termios.3                       |   2 +-
>  man3/timegm.3                        |   2 +-
>  man3/toupper.3                       |   2 +-
>  man3/towctrans.3                     |   4 +-
>  man3/towlower.3                      |   4 +-
>  man3/towupper.3                      |   4 +-
>  man3/trunc.3                         |   2 +-
>  man3/tsearch.3                       |  26 +-
>  man3/ttyname.3                       |   2 +-
>  man3/ttyslot.3                       |   2 +-
>  man3/ungetwc.3                       |   4 +-
>  man3/uselocale.3                     |   2 +-
>  man3/wcpcpy.3                        |   2 +-
>  man3/wcpncpy.3                       |   4 +-
>  man3/wcscpy.3                        |   2 +-
>  man3/wcscspn.3                       |   2 +-
>  man3/wcsncmp.3                       |   2 +-
>  man3/wcsnrtombs.3                    |   2 +-
>  man3/wcsrtombs.3                     |   2 +-
>  man3/wcstombs.3                      |   4 +-
>  man3/wctrans.3                       |   2 +-
>  man3/wmemchr.3                       |   4 +-
>  man3/wmemcmp.3                       |   4 +-
>  man3/wprintf.3                       |   2 +-
>  man3/xdr.3                           |   4 +-
>  man3/y0.3                            |   4 +-
>  man4/fuse.4                          |  90 +++---
>  man4/initrd.4                        |  28 +-
>  man4/lirc.4                          |  82 ++---
>  man4/loop.4                          |   4 +-
>  man4/mem.4                           |   8 +-
>  man4/mouse.4                         |   2 +-
>  man4/null.4                          |  10 +-
>  man4/pts.4                           |   2 +-
>  man4/random.4                        |  22 +-
>  man4/sk98lin.4                       |   2 +-
>  man4/st.4                            |  26 +-
>  man4/vcs.4                           |   2 +-
>  man5/core.5                          |  10 +-
>  man5/elf.5                           | 570 +++++++++++++++++------------------
>  man5/gai.conf.5                      |   2 +-
>  man5/hosts.equiv.5                   |   2 +-
>  man5/locale.5                        |  24 +-
>  man5/nscd.conf.5                     |   6 +-
>  man5/nsswitch.conf.5                 |   2 +-
>  man5/passwd.5                        |   2 +-
>  man5/proc.5                          | 174 +++++------
>  man5/resolv.conf.5                   |  34 +--
>  man5/slabinfo.5                      |   6 +-
>  man5/termcap.5                       |   2 +-
>  man5/tmpfs.5                         |  10 +-
>  man5/utmp.5                          |   2 +-
>  man7/aio.7                           |   2 +-
>  man7/bootparam.7                     |  12 +-
>  man7/capabilities.7                  |  24 +-
>  man7/cgroup_namespaces.7             |  20 +-
>  man7/cgroups.7                       |  58 ++--
>  man7/cpuset.7                        |   6 +-
>  man7/credentials.7                   |  10 +-
>  man7/environ.7                       |  10 +-
>  man7/epoll.7                         |   2 +-
>  man7/fanotify.7                      |  10 +-
>  man7/feature_test_macros.7           |  62 ++--
>  man7/fifo.7                          |   2 +-
>  man7/futex.7                         |   2 +-
>  man7/icmp.7                          |   2 +-
>  man7/inode.7                         |  40 +--
>  man7/inotify.7                       |  40 +--
>  man7/ip.7                            |  22 +-
>  man7/keyrings.7                      |  20 +-
>  man7/libc.7                          |   2 +-
>  man7/locale.7                        |   2 +-
>  man7/man-pages.7                     |   6 +-
>  man7/math_error.7                    |   2 +-
>  man7/mount_namespaces.7              | 124 ++++----
>  man7/mq_overview.7                   |  16 +-
>  man7/namespaces.7                    |  22 +-
>  man7/netlink.7                       |  10 +-
>  man7/numa.7                          |   4 +-
>  man7/packet.7                        |  48 +--
>  man7/persistent-keyring.7            |  10 +-
>  man7/pid_namespaces.7                |  24 +-
>  man7/pipe.7                          |  16 +-
>  man7/pkeys.7                         |  10 +-
>  man7/pty.7                           |   2 +-
>  man7/random.7                        |  10 +-
>  man7/rtld-audit.7                    |  14 +-
>  man7/rtnetlink.7                     |   2 +-
>  man7/sched.7                         |  66 ++--
>  man7/sigevent.7                      |   6 +-
>  man7/signal.7                        |  14 +-
>  man7/sock_diag.7                     |  12 +-
>  man7/socket.7                        |  54 ++--
>  man7/spufs.7                         |  16 +-
>  man7/standards.7                     |   2 +-
>  man7/symlink.7                       |  10 +-
>  man7/tcp.7                           |  10 +-
>  man7/udp.7                           |   2 +-
>  man7/udplite.7                       |   4 +-
>  man7/unicode.7                       |   2 +-
>  man7/unix.7                          |  16 +-
>  man7/user_namespaces.7               |  82 ++---
>  man7/vdso.7                          |   2 +-
>  man7/xattr.7                         |   4 +-
>  man8/iconvconfig.8                   |   4 +-
>  man8/ld.so.8                         |  52 ++--
>  man8/ldconfig.8                      |   8 +-
>  man8/sln.8                           |   4 +-
>  443 files changed, 3087 insertions(+), 3087 deletions(-)
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
