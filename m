From: Adhemerval Zanella <adhemerval.zanella-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Revised fmemopen(3) man page
Date: Fri, 11 Mar 2016 11:15:13 +0700
Message-ID: <56E24651.8060807@linaro.org>
References: <56DFA46F.1050509@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56DFA46F.1050509-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Pluzhnikov <ppluzhnikov-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

I am not the most qualified person to correct syntactic issues or
grammar, but regarding the contents it covers current functionalities
and previous bugs as I would expect, thanks!

On 09-03-2016 11:19, Michael Kerrisk (man-pages) wrote:
> Hello Adhemerval
>=20
> Since you recently did a reimplementation of fmemopen() (which
> Paul reminded me of) I've similarly just now done a major rework
> of the man page. Might you (or Paul, feel free to also chin in!),
> be willing to take a look at the text below and let me know if=20
> anything needs fixing?
>=20
> Thanks,
>=20
> Michael
>=20
> NAME
>        fmemopen -  open memory as stream
>=20
> SYNOPSIS
>        #include <stdio.h>
>=20
>        FILE *fmemopen(void *buf, size_t size, const char *mode);
>=20
>    Feature    Test    Macro   Requirements   for   glibc   (see   fea=
=E2=80=90
>    ture_test_macros(7)):
>=20
>        fmemopen():
>            Since glibc 2.10:
>                _POSIX_C_SOURCE >=3D 200809L
>            Before glibc 2.10:
>                _GNU_SOURCE
>=20
> DESCRIPTION
>        The fmemopen() function opens a stream that permits the  acces=
s
>        specified  by  mode.   The stream allows I/O to be performed o=
n
>        the string or memory buffer pointed to by buf.
>=20
>        The mode argument specifies the semantics of I/O on the stream=
,
>        and is one of the following:
>=20
>        r       The stream is opened for reading.
>=20
>        w       The stream is opened for writing.
>=20
>        a       Append; open the stream for writing, with the file ini=
=E2=80=90
>                tial position set to the first null byte.
>=20
>        r+      Open the stream for reading and writing.
>=20
>        w+      Open the stream for reading and  writing.   The  buffe=
r
>                contents  are  truncated  (i.e.,  '\0' is placed in th=
e
>                first byte of the buffer).
>=20
>        a+      Append; open the stream for reading and  writing,  wit=
h
>                the file initial position set to the first null byte.
>=20
>        The  stream  maintains  the  notion  of a current position, th=
e
>        location where the next I/O operation will be  performed.   Th=
e
>        current  position  is implicitly updated by I/O operations.  I=
t
>        can be explicitly updated using fseek(3), and determined  usin=
g
>        ftell(3).  In all modes other than append, the initial positio=
n
>        is set to the start of the buffer.  In append mode, if no  nul=
l
>        byte  is  found within the buffer, then the initial position i=
s
>        size+1.
>=20
>        If buf is specified as NULL, then fmemopen() allocates a buffe=
r
>        of size bytes.  This is useful for an application that wants t=
o
>        write data to a temporary buffer and then read it  back  again=
=2E
>        The  initial  position  is set to the start of the buffer.  Th=
e
>        buffer is automatically freed when the stream is closed.   Not=
e
>        that the caller has no way to obtain a pointer to the temporar=
y
>        buffer allocated by this call (but see open_memstream(3)).
>=20
>        If buf is not NULL, then it should point  to  a  buffer  of  a=
t
>        least len bytes allocated by the caller.
>=20
>        When  a  stream  that  has  been  opened for writing is flushe=
d
>        (fflush(3)) or closed (fclose(3)), a null byte  is  written  a=
t
>        the  end  of  the  buffer if there is space.  The caller shoul=
d
>        ensure that an extra byte is available in the buffer (and  tha=
t
>        size counts that byte) to allow for this.
>=20
>        In a stream opened for reading, null bytes ('\0') in the buffe=
r
>        do not cause read operations to return an  end-of-file  indica=
=E2=80=90
>        tion.   A  read  from the buffer will indicate end-of-file onl=
y
>        when the file current position advances  size  bytes  past  th=
e
>        start of the buffer.
>=20
>        Write operations take place either at the current position (fo=
r
>        modes other than append), or at the current size of the  strea=
m
>        (for append modes).
>=20
>        Attempts  to write more than size bytes to the buffer result i=
n
>        an error.  By default, such errors  will  be  visible  (by  th=
e
>        absence  of  data) only when the stdio buffer is flushed.  Dis=
=E2=80=90
>        abling buffering with the  following  call  may  be  useful  t=
o
>        detect errors at the time of an output operation:
>=20
>            setbuf(stream, NULL);
>=20
>        Alternatively,  the  caller can explicitly set buf as the stdi=
o
>        stream buffer, at the same time informing stdio of the buffer'=
s
>        size, using:
>=20
>            setbuffer(stream, buf, size);
>=20
> RETURN VALUE
>        Upon  successful completion, fmemopen() returns a FILE pointer=
=2E
>        Otherwise, NULL is returned and errno is set  to  indicate  th=
e
>        error.
>=20
> VERSIONS
>        fmemopen() was already available in glibc 1.0.x.
>=20
> ATTRIBUTES
>        For  an  explanation  of  the  terms  used in this section, se=
e
>        attributes(7).
>=20
>        =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=90
>        =E2=94=82Interface   =E2=94=82 Attribute     =E2=94=82 Value  =
 =E2=94=82
>        =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=A4
>        =E2=94=82fmemopen(), =E2=94=82 Thread safety =E2=94=82 MT-Safe=
 =E2=94=82
>        =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=98
>=20
> CONFORMING TO
>        POSIX.1-2008.  This function is not specified in  POSIX.1-2001=
,
>        and is not widely available on other systems.
>=20
>        POSIX.1-2008 specifies that 'b' in mode shall be ignored.  How=
=E2=80=90
>        ever, Technical Corrigendum 1 adjusts  the  standard  to  allo=
w
>        implementation-specific  treatment  for this case, thus permit=
=E2=80=90
>        ting the glibc treatment of 'b'.
>=20
> NOTES
>        There is no file descriptor associated  with  the  file  strea=
m
>        returned by this function (i.e., fileno(3) will return an erro=
r
>        if called on the returned stream).
>=20
>        With version 2.22, binary mode (see below)  was  removed,  man=
y
>        longstanding  bugs  in  the  implementation  of fmemopen() wer=
e
>        fixed, and a new versioned symbol was created for  this  inter=
=E2=80=90
>        face.
>=20
>    Binary mode
>        From  version  2.9  to 2.21, the glibc implementation of fmemo=
=E2=80=90
>        pen() supported a "binary" mode, enabled by specifying the let=
=E2=80=90
>        ter  'b' as the second character in mode.  In this mode, write=
s
>        don't implicitly add a  terminating  null  byte,  and  fseek(3=
)
>        SEEK_END  is relative to the end of the buffer (i.e., the valu=
e
>        specified by the size argument), rather than the current strin=
g
>        length.
>=20
>        An  API  bug  afflicted  the  implementation of binary mode: t=
o
>        specify binary mode, the 'b' must be the  second  character  i=
n
>        mode.   Thus,  for  example,  "wb+" has the desired effect, bu=
t
>        "w+b" does not.  This is inconsistent  with  the  treatment  o=
f
>        mode by fopen(3).
>=20
>        Binary  mode was removed in glibc 2.22; a 'b' specified in mod=
e
>        has no effect.
>=20
> BUGS
>        In versions of glibc before 2.22, if size is specified as zero=
,
>        fmemopen()  fails with the error EINVAL.  It would be more con=
=E2=80=90
>        sistent if this case successfully created a  stream  that  the=
n
>        returned  end  of  file  on the first attempt at reading; sinc=
e
>        version 2.22, the glibc implementation provides that behavior.
>=20
>        In versions of glibc before 2.22, specifying append  mode  ("a=
"
>        or "a+") for fmemopen() sets the initial buffer position to th=
e
>        first null byte, but (if the file offset is reset to a locatio=
n
>        other  than  the  end  of the stream) does not force subsequen=
t
>        writes to append at the end of the stream.  This bug  is  fixe=
d
>        in glibc 2.22.
>=20
>        In versions of glibc before 2.22, if the mode argument to fmem=
=E2=80=90
>        open() specifies append ("a" or "a+"), and  the  size  argumen=
t
>        does  not  cover  a  null  byte  in  buf,  then,  according  t=
o
>        POSIX.1-2008, the initial buffer position should be set to  th=
e
>        next  byte  after the end of the buffer.  However, in this cas=
e
>        the glibc fmemopen() sets the buffer position to -1.  This  bu=
g
>        is fixed in glibc 2.22.
>=20
>        In  versions of glibc before 2.22, when a call to fseek(3) wit=
h
>        a whence value of SEEK_END was performed on a stream created b=
y
>        fmemopen(),  the  offset  was subtracted from the end-of-strea=
m
>        position, instead of being added.  This bug is fixed  in  glib=
c
>        2.22.
>=20
>        The glibc 2.9 addition of "binary" mode for fmemopen() silentl=
y
>        changed the ABI: previously, fmemopen() ignored 'b' in mode.
>=20
> EXAMPLE
>        The program below uses fmemopen() to open an input buffer,  an=
d
>        open_memstream(3)  to  open  a dynamically sized output buffer=
=2E
>        The program scans its input string (taken  from  the  program'=
s
>        first  command-line  argument) reading integers, and writes th=
e
>        squares of these integers to the output buffer.  An example  o=
f
>        the output produced by this program is the following:
>=20
>            $ ./a.out '1 23 43'
>            size=3D11; ptr=3D1 529 1849
>=20
>    Program source
>=20
>        #define _GNU_SOURCE
>        #include <string.h>
>        #include <stdio.h>
>        #include <stdlib.h>
>=20
>        #define handle_error(msg) \
>            do { perror(msg); exit(EXIT_FAILURE); } while (0)
>=20
>        int
>        main(int argc, char *argv[])
>        {
>            FILE *out, *in;
>            int v, s;
>            size_t size;
>            char *ptr;
>=20
>            if (argc !=3D 2) {
>                fprintf(stderr, "Usage: %s '<num>...'\n", argv[0]);
>                exit(EXIT_FAILURE);
>            }
>=20
>            in =3D fmemopen(argv[1], strlen(argv[1]), "r");
>            if (in =3D=3D NULL)
>                handle_error("fmemopen");
>=20
>            out =3D open_memstream(&ptr, &size);
>            if (out =3D=3D NULL)
>                handle_error("open_memstream");
>=20
>            for (;;) {
>                s =3D fscanf(in, "%d", &v);
>                if (s <=3D 0)
>                    break;
>=20
>                s =3D fprintf(out, "%d ", v * v);
>                if (s =3D=3D -1)
>                    handle_error("fprintf");
>            }
>=20
>            fclose(in);
>            fclose(out);
>=20
>            printf("size=3D%zu; ptr=3D%s\n", size, ptr);
>=20
>            free(ptr);
>            exit(EXIT_SUCCESS);
>        }
>=20
> SEE ALSO
>        fopen(3), fopencookie(3), open_memstream(3)
>=20
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
