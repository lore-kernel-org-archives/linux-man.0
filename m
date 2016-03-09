From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Revised fmemopen(3) man page
Date: Wed, 9 Mar 2016 05:19:59 +0100
Message-ID: <56DFA46F.1050509@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adhemerval Zanella <adhemerval.zanella-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Pluzhnikov <ppluzhnikov-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Adhemerval

Since you recently did a reimplementation of fmemopen() (which
Paul reminded me of) I've similarly just now done a major rework
of the man page. Might you (or Paul, feel free to also chin in!),
be willing to take a look at the text below and let me know if=20
anything needs fixing?

Thanks,

Michael

NAME
       fmemopen -  open memory as stream

SYNOPSIS
       #include <stdio.h>

       FILE *fmemopen(void *buf, size_t size, const char *mode);

   Feature    Test    Macro   Requirements   for   glibc   (see   fea=E2=
=80=90
   ture_test_macros(7)):

       fmemopen():
           Since glibc 2.10:
               _POSIX_C_SOURCE >=3D 200809L
           Before glibc 2.10:
               _GNU_SOURCE

DESCRIPTION
       The fmemopen() function opens a stream that permits the  access
       specified  by  mode.   The stream allows I/O to be performed on
       the string or memory buffer pointed to by buf.

       The mode argument specifies the semantics of I/O on the stream,
       and is one of the following:

       r       The stream is opened for reading.

       w       The stream is opened for writing.

       a       Append; open the stream for writing, with the file ini=E2=
=80=90
               tial position set to the first null byte.

       r+      Open the stream for reading and writing.

       w+      Open the stream for reading and  writing.   The  buffer
               contents  are  truncated  (i.e.,  '\0' is placed in the
               first byte of the buffer).

       a+      Append; open the stream for reading and  writing,  with
               the file initial position set to the first null byte.

       The  stream  maintains  the  notion  of a current position, the
       location where the next I/O operation will be  performed.   The
       current  position  is implicitly updated by I/O operations.  It
       can be explicitly updated using fseek(3), and determined  using
       ftell(3).  In all modes other than append, the initial position
       is set to the start of the buffer.  In append mode, if no  null
       byte  is  found within the buffer, then the initial position is
       size+1.

       If buf is specified as NULL, then fmemopen() allocates a buffer
       of size bytes.  This is useful for an application that wants to
       write data to a temporary buffer and then read it  back  again.
       The  initial  position  is set to the start of the buffer.  The
       buffer is automatically freed when the stream is closed.   Note
       that the caller has no way to obtain a pointer to the temporary
       buffer allocated by this call (but see open_memstream(3)).

       If buf is not NULL, then it should point  to  a  buffer  of  at
       least len bytes allocated by the caller.

       When  a  stream  that  has  been  opened for writing is flushed
       (fflush(3)) or closed (fclose(3)), a null byte  is  written  at
       the  end  of  the  buffer if there is space.  The caller should
       ensure that an extra byte is available in the buffer (and  that
       size counts that byte) to allow for this.

       In a stream opened for reading, null bytes ('\0') in the buffer
       do not cause read operations to return an  end-of-file  indica=E2=
=80=90
       tion.   A  read  from the buffer will indicate end-of-file only
       when the file current position advances  size  bytes  past  the
       start of the buffer.

       Write operations take place either at the current position (for
       modes other than append), or at the current size of the  stream
       (for append modes).

       Attempts  to write more than size bytes to the buffer result in
       an error.  By default, such errors  will  be  visible  (by  the
       absence  of  data) only when the stdio buffer is flushed.  Dis=E2=
=80=90
       abling buffering with the  following  call  may  be  useful  to
       detect errors at the time of an output operation:

           setbuf(stream, NULL);

       Alternatively,  the  caller can explicitly set buf as the stdio
       stream buffer, at the same time informing stdio of the buffer's
       size, using:

           setbuffer(stream, buf, size);

RETURN VALUE
       Upon  successful completion, fmemopen() returns a FILE pointer.
       Otherwise, NULL is returned and errno is set  to  indicate  the
       error.

VERSIONS
       fmemopen() was already available in glibc 1.0.x.

ATTRIBUTES
       For  an  explanation  of  the  terms  used in this section, see
       attributes(7).

       =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=90
       =E2=94=82Interface   =E2=94=82 Attribute     =E2=94=82 Value   =E2=
=94=82
       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=A4
       =E2=94=82fmemopen(), =E2=94=82 Thread safety =E2=94=82 MT-Safe =E2=
=94=82
       =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=98

CONFORMING TO
       POSIX.1-2008.  This function is not specified in  POSIX.1-2001,
       and is not widely available on other systems.

       POSIX.1-2008 specifies that 'b' in mode shall be ignored.  How=E2=
=80=90
       ever, Technical Corrigendum 1 adjusts  the  standard  to  allow
       implementation-specific  treatment  for this case, thus permit=E2=
=80=90
       ting the glibc treatment of 'b'.

NOTES
       There is no file descriptor associated  with  the  file  stream
       returned by this function (i.e., fileno(3) will return an error
       if called on the returned stream).

       With version 2.22, binary mode (see below)  was  removed,  many
       longstanding  bugs  in  the  implementation  of fmemopen() were
       fixed, and a new versioned symbol was created for  this  inter=E2=
=80=90
       face.

   Binary mode
       From  version  2.9  to 2.21, the glibc implementation of fmemo=E2=
=80=90
       pen() supported a "binary" mode, enabled by specifying the let=E2=
=80=90
       ter  'b' as the second character in mode.  In this mode, writes
       don't implicitly add a  terminating  null  byte,  and  fseek(3)
       SEEK_END  is relative to the end of the buffer (i.e., the value
       specified by the size argument), rather than the current string
       length.

       An  API  bug  afflicted  the  implementation of binary mode: to
       specify binary mode, the 'b' must be the  second  character  in
       mode.   Thus,  for  example,  "wb+" has the desired effect, but
       "w+b" does not.  This is inconsistent  with  the  treatment  of
       mode by fopen(3).

       Binary  mode was removed in glibc 2.22; a 'b' specified in mode
       has no effect.

BUGS
       In versions of glibc before 2.22, if size is specified as zero,
       fmemopen()  fails with the error EINVAL.  It would be more con=E2=
=80=90
       sistent if this case successfully created a  stream  that  then
       returned  end  of  file  on the first attempt at reading; since
       version 2.22, the glibc implementation provides that behavior.

       In versions of glibc before 2.22, specifying append  mode  ("a"
       or "a+") for fmemopen() sets the initial buffer position to the
       first null byte, but (if the file offset is reset to a location
       other  than  the  end  of the stream) does not force subsequent
       writes to append at the end of the stream.  This bug  is  fixed
       in glibc 2.22.

       In versions of glibc before 2.22, if the mode argument to fmem=E2=
=80=90
       open() specifies append ("a" or "a+"), and  the  size  argument
       does  not  cover  a  null  byte  in  buf,  then,  according  to
       POSIX.1-2008, the initial buffer position should be set to  the
       next  byte  after the end of the buffer.  However, in this case
       the glibc fmemopen() sets the buffer position to -1.  This  bug
       is fixed in glibc 2.22.

       In  versions of glibc before 2.22, when a call to fseek(3) with
       a whence value of SEEK_END was performed on a stream created by
       fmemopen(),  the  offset  was subtracted from the end-of-stream
       position, instead of being added.  This bug is fixed  in  glibc
       2.22.

       The glibc 2.9 addition of "binary" mode for fmemopen() silently
       changed the ABI: previously, fmemopen() ignored 'b' in mode.

EXAMPLE
       The program below uses fmemopen() to open an input buffer,  and
       open_memstream(3)  to  open  a dynamically sized output buffer.
       The program scans its input string (taken  from  the  program's
       first  command-line  argument) reading integers, and writes the
       squares of these integers to the output buffer.  An example  of
       the output produced by this program is the following:

           $ ./a.out '1 23 43'
           size=3D11; ptr=3D1 529 1849

   Program source

       #define _GNU_SOURCE
       #include <string.h>
       #include <stdio.h>
       #include <stdlib.h>

       #define handle_error(msg) \
           do { perror(msg); exit(EXIT_FAILURE); } while (0)

       int
       main(int argc, char *argv[])
       {
           FILE *out, *in;
           int v, s;
           size_t size;
           char *ptr;

           if (argc !=3D 2) {
               fprintf(stderr, "Usage: %s '<num>...'\n", argv[0]);
               exit(EXIT_FAILURE);
           }

           in =3D fmemopen(argv[1], strlen(argv[1]), "r");
           if (in =3D=3D NULL)
               handle_error("fmemopen");

           out =3D open_memstream(&ptr, &size);
           if (out =3D=3D NULL)
               handle_error("open_memstream");

           for (;;) {
               s =3D fscanf(in, "%d", &v);
               if (s <=3D 0)
                   break;

               s =3D fprintf(out, "%d ", v * v);
               if (s =3D=3D -1)
                   handle_error("fprintf");
           }

           fclose(in);
           fclose(out);

           printf("size=3D%zu; ptr=3D%s\n", size, ptr);

           free(ptr);
           exit(EXIT_SUCCESS);
       }

SEE ALSO
       fopen(3), fopencookie(3), open_memstream(3)


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
