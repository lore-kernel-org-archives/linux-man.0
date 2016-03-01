From: "Michael Kerrisk (man-pages)" <mtk.lists-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Tue, 1 Mar 2016 09:07:09 +0100
Message-ID: <56D54DAD.1040306@gmail.com>
References: <51B0B39F.4060202@redhat.com> <51B0BD36.3030202@redhat.com>
 <CAHGf_=r9Rz63pho+84ORk0a_oDyJSj-MCnZ56uPrT3L6sVEfeQ@mail.gmail.com>
 <20130607013024.GO29800@brightrain.aerifal.cx> <51B19203.3070307@redhat.com>
 <20130607144143.GQ29800@brightrain.aerifal.cx> <51B57E35.4080403@redhat.com>
 <51B65EA7.2020402@redhat.com> <20130611011324.GT29800@brightrain.aerifal.cx>
 <51B8702D.2060505@redhat.com>
 <20130813040038.GE21795@spoyarek.pnq.redhat.com>
 <520C88A6.9070501@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <520C88A6.9070501-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (gmail)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Florian,

On 08/15/2013 09:52 AM, Florian Weimer wrote:
> On 08/13/2013 06:00 AM, Siddhesh Poyarekar wrote:
>>> +In POSIX.1-2008, @code{readdir} is not thread-safe.  In @theglibc{=
}
>>> +implementation, it is safe to call @code{readdir} concurrently on
>>> +different @var{dirstream}s (but multiple threads accessing the sam=
e
>>> +@var{dirstream} result in undefined behavior).  @code{readdir_r} i=
s a
>>
>> Minor nit - you could get rid of the round brackets and simply write
>> the line as:
>>
>> In @theglibc{} implementation, it is safe to call @code{readdir}
>> concurrently on different @var{dirstream}s, but multiple threads
>> accessing the same @var{dirstream} result in undefined behavior.
>=20
> Applied, thanks.
>=20
>>> +@item
>>> +POSIX-1.2008 does not guarantee that @code{readdir} is thread-safe=
,
>>> +even when access to the same @var{dirstream} is serialized.  But i=
n
>>> +current implementations (including @theglibc{}), it is safe to cal=
l
>>> +@code{readdir} concurrently on different @var{dirstream}s, so ther=
e is
>>> +no requirement to use @code{readdir_r} even in multi-threaded
>>> +programs.
>>> +
>>
>> This seems to gloss over the fact that one would need synchronizatio=
n
>> (or readdir_r) if readdir is called concurrently on the same
>> dirstream.  It seems like a bad idea to do this at all, but we
>> probably should add a note about it anyway.
>=20
> I ended up with this:
>=20
> +@item
> +POSIX-1.2008 does not guarantee that @code{readdir} is thread-safe,
> +even when access to the same @var{dirstream} is serialized.  But in
> +current implementations (including @theglibc{}), it is safe to call
> +@code{readdir} concurrently on different @var{dirstream}s, so there =
is
> +no need to use @code{readdir_r} in most multi-threaded programs.  In
> +the rare case that multiple threads need to read from the same
> +@var{dirstream}, it is still better to use @code{readdir} and extern=
al
> +synchronization.
>=20
> I'm attaching my current version.  It compiles, but tests are still r=
unning.
>=20
> I'll update the NEWS file with the bug number on the final commit.

I see that glibc 2.23 deprecates readdir_r(), which prompted me to catc=
h
up on this thread. I'd like to see the points you make documented in th=
e
readdir_r(3) man page also. Would you be willing to allow that text to
be reused / reworked for the page, under that page's existing "verbatim=
"
license (https://www.kernel.org/doc/man-pages/licenses.html#verbatim)?

The text I'd propose to add to the man page would be (new material
starting at =3D=3D=3D>):

  readdir_r()
       The readdir_r() function is a reentrant version  of  readdir().
       It  reads  the  next  directory entry from the directory stream
       dirp, and returns it in the caller-allocated buffer pointed  to
       by entry.  A pointer to the returned item is placed in *result;
       if the end of the directory stream was encountered,  then  NULL
       is instead returned in *result.

       Since  POSIX.1  does  not specify the size of the d_name field,
       and other nonstandard fields may precede that field within  the
       dirent  structure,  portable  applications that use readdir_r()
       could allocate the buffer whose address is passed in  entry  as
       follows:

           name_max =3D pathconf(dirpath, _PC_NAME_MAX);
           if (name_max =3D=3D -1)         /* Limit not defined, or err=
or */
               name_max =3D 255;         /* Take a guess */
           len =3D offsetof(struct dirent, d_name) + name_max + 1;
           entryp =3D malloc(len);

       (POSIX.1  requires  that  d_name  is the last field in a struct
       dirent.)

=3D=3D=3D>   However, the above approach has problems, and it is recomm=
ended
       that  applications  use readdir() instead of readdir_r().  Fur=E2=
=80=90
       thermore, since version  2.23,  glibc  deprecates  readdir_r().
       The reasons are as follows:

       *  On  systems where NAME_MAX is undefined, calling readdir_r()
          may be unsafe because the interface does not allow the call=E2=
=80=90
          er to specify the length of the buffer used for the returned
          directory entry.

       *  On some systems, readdir_r() can't  read  directory  entries
          with very long names.  When the glibc implementation encoun=E2=
=80=90
          ters such a name, readdir_r() fails with the error ENAMETOO=E2=
=80=90
          LONG after the final directory entry has been read.  On some
          other systems, readdir_r() may return a success status,  but
          the  returned d_name field may not be null terminated or may
          be truncated.

       *  In the current POSIX.1 specification  (POSIX.1-2008),  read=E2=
=80=90
          dir_r() is not required to be thread-safe.  However, in mod=E2=
=80=90
          ern implementations (including  the  glibc  implementation),
          concurrent  calls  to  readdir_r()  that  specify  different
          directory streams are thread-safe.  Therefore,  the  use  of
          readdir_r()  is  generally unnecessary in multithreaded pro=E2=
=80=90
          grams.  In cases where multiple threads must read  from  the
          same  directory  stream,  using readdir() with external syn=E2=
=80=90
          chronization is still preferable to the use of  readdir_r(),
          for the reasons given in the points above.

       *  It  is  expected  that a future version of POSIX.1 will make
          readdir_r() obsolete, and require that readdir() be  thread-
          safe  when  concurrently  employed  on  different  directory
          streams.

Cheers,

Michael

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
2013-08-15  Florian Weimer  <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

	[BZ #14699]
	CVE-2013-4237
	* sysdeps/posix/dirstream.h (struct __dirstream): Add errcode
	member.
	* sysdeps/posix/opendir.c (__alloc_dir): Initialize errcode
	member.
	* sysdeps/posix/rewinddir.c (rewinddir): Reset errcode member.
	* sysdeps/posix/readdir_r.c (__READDIR_R): Enforce NAME_MAX limit.
	Return delayed error code.  Remove GETDENTS_64BIT_ALIGNED
	conditional.
	* sysdeps/unix/sysv/linux/wordsize-64/readdir_r.c: Do not define
	GETDENTS_64BIT_ALIGNED.
	* sysdeps/unix/sysv/linux/i386/readdir64_r.c: Likewise.
	* manual/filesys.texi (Reading/Closing Directory): Document
	ENAMETOOLONG return value of readdir_r.  Recommend readdir more
	strongly.
	* manual/conf.texi (Limits for Files): Add portability note to
	NAME_MAX, PATH_MAX.
	(Pathconf): Add portability note for _PC_NAME_MAX, _PC_PATH_MAX.

diff --git a/manual/conf.texi b/manual/conf.texi
index 7eb8b36..c720063 100644
--- a/manual/conf.texi
+++ b/manual/conf.texi
@@ -1149,6 +1149,9 @@ typed ahead as input.  @xref{I/O Queues}.
 @deftypevr Macro int NAME_MAX
 The uniform system limit (if any) for the length of a file name compon=
ent, not
 including the terminating null character.
+
+@strong{Portability Note:} On some systems, @theglibc{} defines
+@code{NAME_MAX}, but does not actually enforce this limit.
 @end deftypevr
=20
 @comment limits.h
@@ -1157,6 +1160,9 @@ including the terminating null character.
 The uniform system limit (if any) for the length of an entire file nam=
e (that
 is, the argument given to system calls such as @code{open}), including=
 the
 terminating null character.
+
+@strong{Portability Note:} @Theglibc{} does not enforce this limit
+even if @code{PATH_MAX} is defined.
 @end deftypevr
=20
 @cindex limits, pipe buffer size
@@ -1476,6 +1482,9 @@ Inquire about the value of @code{POSIX_REC_MIN_XF=
ER_SIZE}.
 Inquire about the value of @code{POSIX_REC_XFER_ALIGN}.
 @end table
=20
+@strong{Portability Note:} On some systems, @theglibc{} does not
+enforce @code{_PC_NAME_MAX} or @code{_PC_PATH_MAX} limits.
+
 @node Utility Limits
 @section Utility Program Capacity Limits
=20
diff --git a/manual/filesys.texi b/manual/filesys.texi
index 1df9cf2..814c210 100644
--- a/manual/filesys.texi
+++ b/manual/filesys.texi
@@ -444,9 +444,9 @@ symbols are declared in the header file @file{diren=
t.h}.
 @comment POSIX.1
 @deftypefun {struct dirent *} readdir (DIR *@var{dirstream})
 This function reads the next entry from the directory.  It normally
-returns a pointer to a structure containing information about the file=
=2E
-This structure is statically allocated and can be rewritten by a
-subsequent call.
+returns a pointer to a structure containing information about the
+file.  This structure is associated with the @var{dirstream} handle
+and can be rewritten by a subsequent call.
=20
 @strong{Portability Note:} On some systems @code{readdir} may not
 return entries for @file{.} and @file{..}, even though these are alway=
s
@@ -461,19 +461,61 @@ conditions are defined for this function:
 The @var{dirstream} argument is not valid.
 @end table
=20
-@code{readdir} is not thread safe.  Multiple threads using
-@code{readdir} on the same @var{dirstream} may overwrite the return
-value.  Use @code{readdir_r} when this is critical.
+To distinguish between an end-of-directory condition or an error, you
+must set @code{errno} to zero before calling @code{readdir}.  To avoid
+entering an infinite loop, you should stop reading from the directory
+after the first error.
+
+In POSIX.1-2008, @code{readdir} is not thread-safe.  In @theglibc{}
+implementation, it is safe to call @code{readdir} concurrently on
+different @var{dirstream}s, but multiple threads accessing the same
+@var{dirstream} result in undefined behavior.  @code{readdir_r} is a
+fully thread-safe alternative, but suffers from poor portability (see
+below).  It is recommended that you use @code{readdir}, with external
+locking if multiple threads access the same @var{dirstream}.
 @end deftypefun
=20
 @comment dirent.h
 @comment GNU
 @deftypefun int readdir_r (DIR *@var{dirstream}, struct dirent *@var{e=
ntry}, struct dirent **@var{result})
-This function is the reentrant version of @code{readdir}.  Like
-@code{readdir} it returns the next entry from the directory.  But to
-prevent conflicts between simultaneously running threads the result is
-not stored in statically allocated memory.  Instead the argument
-@var{entry} points to a place to store the result.
+This function is a version of @code{readdir} which performs internal
+locking.  Like @code{readdir} it returns the next entry from the
+directory.  To prevent conflicts between simultaneously running
+threads the result is stored inside the @var{entry} object.
+
+@strong{Portability Note:} It is recommended to use @code{readdir}
+instead of @code{readdir_r} for the following reasons:
+
+@itemize @bullet
+@item
+On systems which do not define @code{NAME_MAX}, it may not be possible
+to use @code{readdir_r} safely because the caller does not specify the
+length of the buffer for the directory entry.
+
+@item
+On some systems, @code{readdir_r} cannot read directory entries with
+very long names.  If such a name is encountered, @theglibc{}
+implementation of @code{readdir_r} returns with an error code of
+@code{ENAMETOOLONG} after the final directory entry has been read.  On
+other systems, @code{readdir_r} may return successfully, but the
+@code{d_name} member may not be NUL-terminated or may be truncated.
+
+@item
+POSIX-1.2008 does not guarantee that @code{readdir} is thread-safe,
+even when access to the same @var{dirstream} is serialized.  But in
+current implementations (including @theglibc{}), it is safe to call
+@code{readdir} concurrently on different @var{dirstream}s, so there is
+no need to use @code{readdir_r} in most multi-threaded programs.  In
+the rare case that multiple threads need to read from the same
+@var{dirstream}, it is still better to use @code{readdir} and external
+synchronization.
+
+@item
+It is expected that future versions of POSIX will obsolete
+@code{readdir_r} and mandate the level of thread safety for
+@code{readdir} which is provided by @theglibc{} and other
+implementations today.
+@end itemize
=20
 Normally @code{readdir_r} returns zero and sets @code{*@var{result}}
 to @var{entry}.  If there are no more entries in the directory or an
@@ -481,15 +523,6 @@ error is detected, @code{readdir_r} sets @code{*@v=
ar{result}} to a
 null pointer and returns a nonzero error code, also stored in
 @code{errno}, as described for @code{readdir}.
=20
-@strong{Portability Note:} On some systems @code{readdir_r} may not
-return a NUL terminated string for the file name, even when there is n=
o
-@code{d_reclen} field in @code{struct dirent} and the file
-name is the maximum allowed size.  Modern systems all have the
-@code{d_reclen} field, and on old systems multi-threading is not
-critical.  In any case there is no such problem with the @code{readdir=
}
-function, so that even on systems without the @code{d_reclen} member o=
ne
-could use multiple threads by using external locking.
-
 It is also important to look at the definition of the @code{struct
 dirent} type.  Simply passing a pointer to an object of this type for
 the second parameter of @code{readdir_r} might not be enough.  Some
diff --git a/sysdeps/posix/dirstream.h b/sysdeps/posix/dirstream.h
index a7a074d..8e8570d 100644
--- a/sysdeps/posix/dirstream.h
+++ b/sysdeps/posix/dirstream.h
@@ -39,6 +39,8 @@ struct __dirstream
=20
     off_t filepos;		/* Position of next entry to read.  */
=20
+    int errcode;		/* Delayed error code.  */
+
     /* Directory block.  */
     char data[0] __attribute__ ((aligned (__alignof__ (void*))));
   };
diff --git a/sysdeps/posix/opendir.c b/sysdeps/posix/opendir.c
index ddfc3a7..fc05b0f 100644
--- a/sysdeps/posix/opendir.c
+++ b/sysdeps/posix/opendir.c
@@ -231,6 +231,7 @@ __alloc_dir (int fd, bool close_fd, int flags, cons=
t struct stat64 *statp)
   dirp->size =3D 0;
   dirp->offset =3D 0;
   dirp->filepos =3D 0;
+  dirp->errcode =3D 0;
=20
   return dirp;
 }
diff --git a/sysdeps/posix/readdir_r.c b/sysdeps/posix/readdir_r.c
index b5a8e2e..8ed5c3f 100644
--- a/sysdeps/posix/readdir_r.c
+++ b/sysdeps/posix/readdir_r.c
@@ -40,6 +40,7 @@ __READDIR_R (DIR *dirp, DIRENT_TYPE *entry, DIRENT_TY=
PE **result)
   DIRENT_TYPE *dp;
   size_t reclen;
   const int saved_errno =3D errno;
+  int ret;
=20
   __libc_lock_lock (dirp->lock);
=20
@@ -70,10 +71,10 @@ __READDIR_R (DIR *dirp, DIRENT_TYPE *entry, DIRENT_=
TYPE **result)
 		  bytes =3D 0;
 		  __set_errno (saved_errno);
 		}
+	      if (bytes < 0)
+		dirp->errcode =3D errno;
=20
 	      dp =3D NULL;
-	      /* Reclen !=3D 0 signals that an error occurred.  */
-	      reclen =3D bytes !=3D 0;
 	      break;
 	    }
 	  dirp->size =3D (size_t) bytes;
@@ -106,29 +107,46 @@ __READDIR_R (DIR *dirp, DIRENT_TYPE *entry, DIREN=
T_TYPE **result)
       dirp->filepos +=3D reclen;
 #endif
=20
-      /* Skip deleted files.  */
+#ifdef NAME_MAX
+      if (reclen > offsetof (DIRENT_TYPE, d_name) + NAME_MAX + 1)
+	{
+	  /* The record is very long.  It could still fit into the
+	     caller-supplied buffer if we can skip padding at the
+	     end.  */
+	  size_t namelen =3D _D_EXACT_NAMLEN (dp);
+	  if (namelen <=3D NAME_MAX)
+	    reclen =3D offsetof (DIRENT_TYPE, d_name) + namelen + 1;
+	  else
+	    {
+	      /* The name is too long.  Ignore this file.  */
+	      dirp->errcode =3D ENAMETOOLONG;
+	      dp->d_ino =3D 0;
+	      continue;
+	    }
+	}
+#endif
+
+      /* Skip deleted and ignored files.  */
     }
   while (dp->d_ino =3D=3D 0);
=20
   if (dp !=3D NULL)
     {
-#ifdef GETDENTS_64BIT_ALIGNED
-      /* The d_reclen value might include padding which is not part of
-	 the DIRENT_TYPE data structure.  */
-      reclen =3D MIN (reclen,
-		    offsetof (DIRENT_TYPE, d_name) + sizeof (dp->d_name));
-#endif
       *result =3D memcpy (entry, dp, reclen);
-#ifdef GETDENTS_64BIT_ALIGNED
+#ifdef _DIRENT_HAVE_D_RECLEN
       entry->d_reclen =3D reclen;
 #endif
+      ret =3D 0;
     }
   else
-    *result =3D NULL;
+    {
+      *result =3D NULL;
+      ret =3D dirp->errcode;
+    }
=20
   __libc_lock_unlock (dirp->lock);
=20
-  return dp !=3D NULL ? 0 : reclen ? errno : 0;
+  return ret;
 }
=20
 #ifdef __READDIR_R_ALIAS
diff --git a/sysdeps/posix/rewinddir.c b/sysdeps/posix/rewinddir.c
index 2935a8e..d4991ad 100644
--- a/sysdeps/posix/rewinddir.c
+++ b/sysdeps/posix/rewinddir.c
@@ -33,6 +33,7 @@ rewinddir (dirp)
   dirp->filepos =3D 0;
   dirp->offset =3D 0;
   dirp->size =3D 0;
+  dirp->errcode =3D 0;
 #ifndef NOT_IN_libc
   __libc_lock_unlock (dirp->lock);
 #endif
diff --git a/sysdeps/unix/sysv/linux/i386/readdir64_r.c b/sysdeps/unix/=
sysv/linux/i386/readdir64_r.c
index 8ebbcfd..a7d114e 100644
--- a/sysdeps/unix/sysv/linux/i386/readdir64_r.c
+++ b/sysdeps/unix/sysv/linux/i386/readdir64_r.c
@@ -18,7 +18,6 @@
 #define __READDIR_R __readdir64_r
 #define __GETDENTS __getdents64
 #define DIRENT_TYPE struct dirent64
-#define GETDENTS_64BIT_ALIGNED 1
=20
 #include <sysdeps/posix/readdir_r.c>
=20
diff --git a/sysdeps/unix/sysv/linux/wordsize-64/readdir_r.c b/sysdeps/=
unix/sysv/linux/wordsize-64/readdir_r.c
index 5ed8e95..290f2c8 100644
--- a/sysdeps/unix/sysv/linux/wordsize-64/readdir_r.c
+++ b/sysdeps/unix/sysv/linux/wordsize-64/readdir_r.c
@@ -1,5 +1,4 @@
 #define readdir64_r __no_readdir64_r_decl
-#define GETDENTS_64BIT_ALIGNED 1
 #include <sysdeps/posix/readdir_r.c>
 #undef readdir64_r
 weak_alias (__readdir_r, readdir64_r)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
