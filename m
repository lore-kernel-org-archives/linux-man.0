From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Removal of casts
Date: Fri, 3 Aug 2012 10:24:40 +0200
Message-ID: <CAKgNAkjT5-OkPAUNcY-t3Kenjp-PJCnD7F4GW-1rtzi8dQr_DA@mail.gmail.com>
References: <alpine.LNX.2.01.1102112331590.5820@obet.zrqbmnf.qr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LNX.2.01.1102112331590.5820-SHaQjdQMGhDmsUXKMKRlFA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC += linux-man@]

Hello Jan,

There are many ideas in this mail, and it might have been a little
easier to split them out into pieces. I'll reply to some of them here.

On Fri, Feb 11, 2011 at 11:56 PM, Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org> wrote:
>
>
> I have a few manpage updates further below.
>
>
> Other things still looming:
>
> rtime.3 calls ctime((time_t *)&time1.tv_sec), but this is fatal, since
> time1.tv_sec is of type uint32_t while time_t can be of different size
> (and in fact, is so on glibc-x86_64).

Ye. I applied this patch:

--- a/man3/rtime.3
+++ b/man3/rtime.3
@@ -111,8 +111,10 @@ main(void)
     ret = rtime(&name, &time1, use_tcp ? NULL : &timeout);
     if (ret < 0)
         perror("rtime error");
-    else
-        printf("%s\\n", ctime((time_t *) &time1.tv_sec));
+    else {
+       time_t t = time1.tv_sec;
+        printf("%s\\n", ctime(&t));
+    }

     exit(EXIT_SUCCESS);
 }


> ---
>
>>    /* Writing: cosine = (double (*)(double)) dlsym(handle, "cos");
>>       would seem more natural, but the C99 standard leaves
>>       casting from "void *" to a function pointer undefined.
>
> Which is ok, given dlopen isn't part of C99 anyway.
>
> A derivative standard of C, or an implementation thereof, like the
> gcc-POSIX pair, may choose to make it defined to explicitly make dlsym
> work within the given implementation.
>
>
>>*(void **) (&cosine) = dlsym(handle, "cos");
>>.\" But in fact "gcc -O2 -Wall" will complain about the preceding cast.
>
> And it does so rightfully. Now I don't claim to grasp strict-aliasing
> completely - I better just avoid it, and subsequently, constructs like
> *(void **)&x, because they, in themselves, are really unsafe. It's like
> writing
>
>         uint8_t x;
>         *(uint16_t *)&x = dlsym
>
> which is undefined behavior too. IMO,
>
>         cosine = dlsym(...)
>
> is the much lesser evil of the two (still considering only POSIX, not
> C99), because 1. you don't write beyond the end of the object, 2. it
> will also work when sizeof(funcptr) <= sizeof(void *), 3. cast is
> avoided, implicit truncation can take place.
>
> .oO(Having worked with DOS far and near stuff does pay off at times..)

Could you take this last piece to a separate mail thread please?

> ----
>
> The following changes since commit 4fa455f024eb453a2e8768d838d2fc016b56b291:
>
>   Changes.old: spfix (2010-12-05 16:10:07 +0100)
>
> are available in the git repository at:
>   git://dev.medozas.de/man-pages master

Lacking the patch, which disappeared because I was slow to react, I
did some inspection, and tried to find the cases you refer to below.
My results, and a patch, below.

> Jan Engelhardt (4):
>       all: remove redundant casts
>       pthread_getattr_np.3: add a required cast
>       hsearch.3: add a required cast
>       bsearch.3, rtime.3: add const qualifiers
>
>  man2/getdents.2           |    2 +-

Found, I think.

>  man2/select_tut.2         |    2 +-

Found, I think.

>  man3/argz_add.3           |    2 +-

Not found. If you meant the "(char *) 0" cast, I believe that's incorrect.

>  man3/atof.3               |    2 +-

Found.

>  man3/atoi.3               |    2 +-

Found.

>  man3/bsearch.3            |    6 +++---

Not found (you suggested to add "const" somewhere)

>  man3/hsearch.3            |    2 +-

Not found. You suggested "add a required cast".

>  man3/pthread_create.3     |    2 +-

Found, I think.

>  man3/pthread_getattr_np.3 |    2 +-

Not found. You said "add a required cast".

>  man3/pthread_sigmask.3    |    4 ++--

Found, I think.

>  man3/rtime.3              |   13 +++++++------

Found, I think.

>  man3/setbuf.3             |    2 +-

Found.

>  man3/tsearch.3            |    4 ++--

Found, I think.

>  man7/netlink.7            |    6 +++---

Found, I think. (3 instances, right?)

>  14 files changed, 26 insertions(+), 25 deletions(-)

I applied the patch below to remove the unneeded casts.

Cheers,

Michael

--- a/man2/getdents.2
+++ b/man2/getdents.2
@@ -24,7 +24,7 @@
 .\" Modified 22 July 1995 by Michael Chastain <mec-2HzYfV7nvfBaoFzlprW4MV6hYfS7NtTn@public.gmane.org>:
 .\"   Derived from 'readdir.2'.
 .\" Modified Tue Oct 22 08:11:14 EDT 1996 by Eric S. Raymond <esr-4uCgticg2UFBDgjK7y7TUQ@public.gmane.org>
-.TH GETDENTS 2  2012-07-13 "Linux" "Linux Programmer's Manual"
+.TH GETDENTS 2  2012-08-03 "Linux" "Linux Programmer's Manual"
 .SH NAME
 getdents \- get directory entries
 .SH SYNOPSIS
@@ -268,7 +268,7 @@ main(int argc, char *argv[])
                              (d_type == DT_BLK) ?  "block dev" :
                              (d_type == DT_CHR) ?  "char dev" : "???");
             printf("%4d %10lld  %s\\n", d\->d_reclen,
-                    (long long) d\->d_off, (char *) d->d_name);
+                    (long long) d\->d_off, d->d_name);
             bpos += d\->d_reclen;
         }
     }
diff --git a/man2/select_tut.2 b/man2/select_tut.2
index 17c74ac..d9fb610 100644
--- a/man2/select_tut.2
+++ b/man2/select_tut.2
@@ -27,7 +27,7 @@
 .\"             various other changes
 .\" 2008-01-26, mtk, substantial changes and rewrites
 .\"
-.TH SELECT_TUT 2 2010-06-10 "Linux" "Linux Programmer's Manual"
+.TH SELECT_TUT 2 2012-08-03 "Linux" "Linux Programmer's Manual"
 .SH NAME
 select, pselect, FD_CLR, FD_ISSET, FD_SET, FD_ZERO \-
 synchronous I/O multiplexing
@@ -561,7 +561,7 @@ listen_socket(int listen_port)
     }
     yes = 1;
     if (setsockopt(s, SOL_SOCKET, SO_REUSEADDR,
-            (char *) &yes, sizeof(yes)) == \-1) {
+            &yes, sizeof(yes)) == \-1) {
         perror("setsockopt");
         close(s);
         return \-1;
diff --git a/man3/atof.3 b/man3/atof.3
index f5f53ea..029f915 100644
--- a/man3/atof.3
+++ b/man3/atof.3
@@ -26,7 +26,7 @@
 .\"     386BSD man pages
 .\" Modified Mon Mar 29 22:39:24 1993, David Metcalfe
 .\" Modified Sat Jul 24 21:39:22 1993, Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
-.TH ATOF 3  1993-03-29 "GNU" "Linux Programmer's Manual"
+.TH ATOF 3  2012-08-03 "GNU" "Linux Programmer's Manual"
 .SH NAME
 atof \- convert a string to a double
 .SH SYNOPSIS
@@ -44,7 +44,7 @@ pointed to by \fInptr\fP to
 The behavior is the same as
 .sp
 .in +4n
-strtod(nptr, (char **) NULL);
+strtod(nptr, NULL);
 .in
 .sp
 except that
diff --git a/man3/atoi.3 b/man3/atoi.3
index 31c35ca..41a4c59 100644
--- a/man3/atoi.3
+++ b/man3/atoi.3
@@ -28,7 +28,7 @@
 .\" Modified Sat Jul 24 21:38:42 1993, Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
 .\" Modified Sun Dec 17 18:35:06 2000, Joseph S. Myers
 .\"
-.TH ATOI 3  2010-09-20 "GNU" "Linux Programmer's Manual"
+.TH ATOI 3  2012-08-03 "GNU" "Linux Programmer's Manual"
 .SH NAME
 atoi, atol, atoll, atoq \- convert a string to an integer
 .SH SYNOPSIS
@@ -68,7 +68,7 @@ pointed to by \fInptr\fP to
 The behavior is the same as
 .sp
 .in +4n
-strtol(nptr, (char **) NULL, 10);
+strtol(nptr, NULL, 10);
 .in
 .sp
 except that
diff --git a/man3/pthread_create.3 b/man3/pthread_create.3
index 66190bb..42df859 100644
--- a/man3/pthread_create.3
+++ b/man3/pthread_create.3
@@ -21,7 +21,7 @@
 .\" Formatted or processed versions of this manual, if unaccompanied by
 .\" the source, must acknowledge the copyright and authors of this work.
 .\"
-.TH PTHREAD_CREATE 3 2012-03-15 "Linux" "Linux Programmer's Manual"
+.TH PTHREAD_CREATE 3 2012-08-03 "Linux" "Linux Programmer's Manual"
 .SH NAME
 pthread_create \- create a new thread
 .SH SYNOPSIS
@@ -265,7 +265,7 @@ struct thread_info {    /* Used as argument to
thread_start() */
 static void *
 thread_start(void *arg)
 {
-    struct thread_info *tinfo = (struct thread_info *) arg;
+    struct thread_info *tinfo = arg;
     char *uargv, *p;

     printf("Thread %d: top of stack near %p; argv_string=%s\\n",
diff --git a/man3/pthread_sigmask.3 b/man3/pthread_sigmask.3
index ffdc6ca..de78dac 100644
--- a/man3/pthread_sigmask.3
+++ b/man3/pthread_sigmask.3
@@ -21,7 +21,7 @@
 .\" Formatted or processed versions of this manual, if unaccompanied by
 .\" the source, must acknowledge the copyright and authors of this work.
 .\"
-.TH PTHREAD_SIGMASK 3 2011-10-16 "Linux" "Linux Programmer's Manual"
+.TH PTHREAD_SIGMASK 3 2012-08-03 "Linux" "Linux Programmer's Manual"
 .SH NAME
 pthread_sigmask \- examine and change mask of blocked signals
 .SH SYNOPSIS
@@ -92,7 +92,7 @@ Signal handling thread got signal 10
 static void *
 sig_thread(void *arg)
 {
-    sigset_t *set = (sigset_t *) arg;
+    sigset_t *set = arg;
     int s, sig;

     for (;;) {
diff --git a/man3/rtime.3 b/man3/rtime.3
index e19429e..c37672a 100644
--- a/man3/rtime.3
+++ b/man3/rtime.3
@@ -5,7 +5,7 @@
 .\"
 .\" Slightly polished, aeb, 2003-04-06
 .\"
-.TH RTIME 3 2010-02-25 "GNU" "Linux Programmer's Manual"
+.TH RTIME 3 2012-08-03 "GNU" "Linux Programmer's Manual"
 .SH NAME
 rtime \- get time from a remote machine
 .SH SYNOPSIS
@@ -103,10 +103,10 @@ main(void)
     struct hostent *hent;
     int ret;

-    memset((char *) &name, 0, sizeof(name));
+    memset(&name, 0, sizeof(name));
     sethostent(1);
     hent = gethostbyname(servername);
-    memcpy((char *) &name.sin_addr, hent\->h_addr, hent\->h_length);
+    memcpy(&name.sin_addr, hent\->h_addr, hent\->h_length);

     ret = rtime(&name, &time1, use_tcp ? NULL : &timeout);
     if (ret < 0)
diff --git a/man3/setbuf.3 b/man3/setbuf.3
index b9d41a9..49fca4d 100644
--- a/man3/setbuf.3
+++ b/man3/setbuf.3
@@ -43,7 +43,7 @@
 .\" Correction,  2000-03-03, Andreas Jaeger <aj-l3A5Bk7waGM@public.gmane.org>
 .\" Added return value for setvbuf, aeb,
 .\"
-.TH SETBUF 3  2008-06-26 "Linux" "Linux Programmer's Manual"
+.TH SETBUF 3  2012-08-03 "Linux" "Linux Programmer's Manual"
 .SH NAME
 setbuf, setbuffer, setlinebuf, setvbuf \- stream buffering operations
 .SH SYNOPSIS
@@ -145,7 +145,7 @@ The
 function is exactly equivalent to the call:
 .PP
 .in +4n
-setvbuf(stream, (char *) NULL, _IOLBF, 0);
+setvbuf(stream, NULL, _IOLBF, 0);
 .in
 .SH "RETURN VALUE"
 The function
diff --git a/man3/tsearch.3 b/man3/tsearch.3
index bb96740..daedc88 100644
--- a/man3/tsearch.3
+++ b/man3/tsearch.3
@@ -21,7 +21,7 @@
 .\" Formatted or processed versions of this manual, if unaccompanied by
 .\" the source, must acknowledge the copyright and authors of this work.
 .\"
-.TH TSEARCH 3  2012-06-11 "GNU" "Linux Programmer's Manual"
+.TH TSEARCH 3  2012-08-03 "GNU" "Linux Programmer's Manual"
 .SH NAME
 tsearch, tfind, tdelete, twalk, tdestroy \- manage a binary tree
 .SH SYNOPSIS
@@ -273,7 +273,7 @@ main(void)

     srand(time(NULL));
     for (i = 0; i < 12; i++) {
-        ptr = (int *) xmalloc(sizeof(int));
+        ptr = xmalloc(sizeof(int));
         *ptr = rand() & 0xff;
         val = tsearch((void *) ptr, &root, compare);
         if (val == NULL)
diff --git a/man7/netlink.7 b/man7/netlink.7
index 2b60fe3..35016a2 100644
--- a/man7/netlink.7
+++ b/man7/netlink.7
@@ -417,10 +417,10 @@ in order to reliably track acknowledgements.
 .nf
 struct nlmsghdr *nh;    /* The nlmsghdr with payload to send. */
 struct sockaddr_nl sa;
-struct iovec iov = { (void *) nh, nh\->nlmsg_len };
+struct iovec iov = { nh, nh\->nlmsg_len };
 struct msghdr msg;

-msg = { (void *)&sa, sizeof(sa), &iov, 1, NULL, 0, 0 };
+msg = { &sa, sizeof(sa), &iov, 1, NULL, 0, 0 };
 memset(&sa, 0, sizeof(sa));
 sa.nl_family = AF_NETLINK;
 nh\->nlmsg_pid = 0;
@@ -443,7 +443,7 @@ struct sockaddr_nl sa;
 struct msghdr msg;
 struct nlmsghdr *nh;

-msg = { (void *)&sa, sizeof(sa), &iov, 1, NULL, 0, 0 };
+msg = { &sa, sizeof(sa), &iov, 1, NULL, 0, 0 };
 len = recvmsg(fd, &msg, 0);

 for (nh = (struct nlmsghdr *) buf; NLMSG_OK (nh, len);


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
