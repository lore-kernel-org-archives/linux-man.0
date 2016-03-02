From: Paul Eggert <eggert@cs.ucla.edu>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Wed, 2 Mar 2016 09:44:35 -0800
Message-ID: <56D72683.6010302@cs.ucla.edu>
References: <51B0B39F.4060202@redhat.com> <51B0BD36.3030202@redhat.com>
 <CAHGf_=r9Rz63pho+84ORk0a_oDyJSj-MCnZ56uPrT3L6sVEfeQ@mail.gmail.com>
 <20130607013024.GO29800@brightrain.aerifal.cx> <51B19203.3070307@redhat.com>
 <20130607144143.GQ29800@brightrain.aerifal.cx> <51B57E35.4080403@redhat.com>
 <51B65EA7.2020402@redhat.com> <20130611011324.GT29800@brightrain.aerifal.cx>
 <51B8702D.2060505@redhat.com>
 <20130813040038.GE21795@spoyarek.pnq.redhat.com>
 <520C88A6.9070501@redhat.com> <56D54DAD.1040306@gmail.com>
 <56D5CA79.9030204@redhat.com> <56D5F832.3070209@gmail.com>
 <56D5FB3D.5000306@redhat.com> <56D607BB.6080701@cs.ucla.edu>
 <56D614AA.7020500@redhat.com> <56D61A86.3050108@cs.ucla.edu>
 <56D620AA.40108@redhat.com> <56D624FE.1090702@cs.ucla.edu>
 <56D6294A.5040703@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050808060007080104060008"
Return-path: <libc-alpha-return-67766-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <56D6294A.5040703@redhat.com>
To: Florian Weimer <fweimer@redhat.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Siddhesh Poyarekar <siddhesh@redhat.com>
Cc: Rich Felker <dalias@aerifal.cx>, Carlos O'Donell <carlos@redhat.com>, KOSAKI Motohiro <kosaki.motohiro@gmail.com>, libc-alpha <libc-alpha@sourceware.org>, Roland McGrath <roland@hack.frob.com>, linux-man <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------050808060007080104060008
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Florian Weimer wrote:

> Just to be clear, you looked at the wrong struct dirent definition for
> GNU/Linux, there is a sysdeps override.

Yes, we'd need a similar fix in sysdeps/unix/sysv/linux/bits/dirent.h.

> Right now, most programs relying on sizeof (struct dirent) work well in
> almost all cases.  We really don't want to break that.  There appears to
> be an overlap between these programs and users of readdir_r, so once we
> remove that from the API, we should have better story for struct dirent
> declarators as well.

I see your point in worrying about GNU/Linux programs that use 'sizeof 
(struct dirent)', even though these programs are not portable and won't 
work on other POSIX platforms.

How about something like the attached (untested) patch, then? It keeps 
the structure the same size, while still using flexible arrays to 
indicate to analyzers that the array in question may be larger. It also 
adds a compile-time option (default off) to simply use flexible arrays 
without the backwards-compatibility hack. We could use that option in 
Gnulib.

--------------050808060007080104060008
Content-Type: text/x-patch;
 name="flexarray.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="flexarray.diff"

diff --git a/bits/dirent.h b/bits/dirent.h
index 7b79a53..69a7892 100644
--- a/bits/dirent.h
+++ b/bits/dirent.h
@@ -32,7 +32,7 @@ struct dirent
     unsigned char d_namlen;	/* Length of the file name.  */
 
     /* Only this member is in the POSIX standard.  */
-    char d_name[1];		/* File name (actually longer).  */
+    __flexarray (d_name, char, 1); /* File name.  */
   };
 
 #ifdef __USE_LARGEFILE64
@@ -42,8 +42,7 @@ struct dirent64
     unsigned short int d_reclen;
     unsigned char d_type;
     unsigned char d_namlen;
-
-    char d_name[1];
+    __flexarray (d_name, char, 1); /* File name.  */
   };
 #endif
 
diff --git a/include/features.h b/include/features.h
index 9514d35..ca162d3 100644
--- a/include/features.h
+++ b/include/features.h
@@ -45,6 +45,7 @@
    _THREAD_SAFE		Same as _REENTRANT, often used by other systems.
    _FORTIFY_SOURCE	If set to numeric value > 0 additional security
 			measures are defined, according to level.
+   _FLEXARRAY_SOURCE	Select flexible array data structures when applicable.
 
    The `-ansi' switch to the GNU C compiler, and standards conformance
    options such as `-std=c99', define __STRICT_ANSI__.  If none of
@@ -80,6 +81,7 @@
    __USE_GNU		Define GNU extensions.
    __USE_REENTRANT	Define reentrant/thread-safe *_r functions.
    __USE_FORTIFY_LEVEL	Additional security measures used, according to level.
+   __USE_FLEXARRAY	Use flexible arrays for data structures.
 
    The macros `__GNU_LIBRARY__', `__GLIBC__', and `__GLIBC_MINOR__' are
    defined by this file unconditionally.  `__GNU_LIBRARY__' is provided
@@ -117,6 +119,7 @@
 #undef	__USE_GNU
 #undef	__USE_REENTRANT
 #undef	__USE_FORTIFY_LEVEL
+#undef	__USE_FLEXARRAY
 #undef	__KERNEL_STRICT_NAMES
 
 /* Suppress kernel-name space pollution unless user expressedly asks
@@ -341,6 +344,10 @@
 # define __USE_FORTIFY_LEVEL 0
 #endif
 
+#ifdef _FLEXARRAY_SOURCE
+# define __USE_FLEXARRAY 1
+#endif
+
 /* Get definitions of __STDC_* predefined macros, if the compiler has
    not preincluded this header automatically.  */
 #include <stdc-predef.h>
diff --git a/misc/sys/cdefs.h b/misc/sys/cdefs.h
index 7fd4154..facfdc3 100644
--- a/misc/sys/cdefs.h
+++ b/misc/sys/cdefs.h
@@ -157,10 +157,29 @@
 #  else
 /* Some other non-C99 compiler.  Approximate with [1].  */
 #   define __flexarr	[1]
+#   define __flexarray(id, type, size) type id[size]
 #  endif
 # endif
 #endif
 
+/* Declare a structure member named ID, with type "array of TYPE", and
+   with actual size unspecified but with nominal size SIZE for the
+   benefit of traditional applications.  If the application is
+   compiled with _FLEXARRAY_SOURCE and if the compiler is C99 or
+   better, model this as a flexible array.  Otherwise, model it as a
+   fixed-size array of size SIZE (followed by a flexible array
+   afterwards, if C99, for the benefit of source-code analyzers that
+   can use this as a cue that the array is really varying-size).  The
+   fixed-size array is for compatibility with programs that unwisely
+   take the size of structures that contain flexible arrays, and which
+   rely on traditional glibc which uses fixed-size arrays.  */
+#ifndef __flexarray
+# ifdef __USE_FLEXARRAY
+#  define __flexarray(id, type, size) type id[]
+# else
+#  define __flexarray(id, type, size) type id[size]; type __flexarray __flexarr
+# endif
+#endif
 
 /* __asm__ ("xyz") is used throughout the headers to rename functions
    at the assembly language level.  This is wrapped by the __REDIRECT
diff --git a/sysdeps/nacl/bits/dirent.h b/sysdeps/nacl/bits/dirent.h
index d4eb7fe..2e38a58 100644
--- a/sysdeps/nacl/bits/dirent.h
+++ b/sysdeps/nacl/bits/dirent.h
@@ -30,7 +30,7 @@ struct dirent
     unsigned short int d_reclen; /* Length of the whole `struct dirent'.  */
 
     /* Only this member is in the POSIX standard.  */
-    char d_name[256];		/* We must not include limits.h! */
+    __flexarray (d_name, char, 256); /* We must not include limits.h! */
   };
 
 #ifdef __USE_LARGEFILE64
@@ -42,7 +42,7 @@ struct dirent64
     unsigned short int d_reclen; /* Length of the whole `struct dirent'.  */
 
     /* Only this member is in the POSIX standard.  */
-    char d_name[256];		/* We must not include limits.h! */
+    __flexarray (d_name, char, 256); /* We must not include limits.h! */
   };
 #endif
 
diff --git a/sysdeps/unix/sysv/linux/alpha/bits/dirent.h b/sysdeps/unix/sysv/linux/alpha/bits/dirent.h
index 98d297e..2470d0f 100644
--- a/sysdeps/unix/sysv/linux/alpha/bits/dirent.h
+++ b/sysdeps/unix/sysv/linux/alpha/bits/dirent.h
@@ -29,7 +29,7 @@ struct dirent
     __off_t d_off;
     unsigned short int d_reclen;
     unsigned char d_type;
-    char d_name[256];		/* We must not include limits.h! */
+    __flexarray (d_name, char, 256); /* We must not include limits.h! */
   };
 
 #ifdef __USE_LARGEFILE64
@@ -40,7 +40,7 @@ struct dirent64
     __off64_t d_off;
     unsigned short int d_reclen;
     unsigned char d_type;
-    char d_name[256];		/* We must not include limits.h! */
+    __flexarray (d_name, char, 256); /* We must not include limits.h! */
   };
 #endif
 
diff --git a/sysdeps/unix/sysv/linux/bits/dirent.h b/sysdeps/unix/sysv/linux/bits/dirent.h
index 31b1961..b7137e0 100644
--- a/sysdeps/unix/sysv/linux/bits/dirent.h
+++ b/sysdeps/unix/sysv/linux/bits/dirent.h
@@ -30,7 +30,7 @@ struct dirent
 #endif
     unsigned short int d_reclen;
     unsigned char d_type;
-    char d_name[256];		/* We must not include limits.h! */
+    __flexarray (d_name, char, 256); /* We must not include limits.h! */
   };
 
 #ifdef __USE_LARGEFILE64
@@ -40,7 +40,7 @@ struct dirent64
     __off64_t d_off;
     unsigned short int d_reclen;
     unsigned char d_type;
-    char d_name[256];		/* We must not include limits.h! */
+    __flexarray (d_name, char, 256); /* We must not include limits.h! */
   };
 #endif
 

--------------050808060007080104060008--
