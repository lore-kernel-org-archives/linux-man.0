From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: New fopencookie.3 man page
Date: Tue, 9 Sep 2008 07:58:31 +0200
Message-ID: <cfd18e0f0809082258n1736e764m9e038ecbdf3bf0c8@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Fran=E7ois_Wendling?= <frwendling-GANU6spQydw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, per-ENPyne5uQy1BDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

=46ran=E7ois, Per, and others,

Below, a new man page I wrote documenting fopencookie.3.  Review
comments welcome.

Cheers,

Michael

=2E\" Copyright (c) 2008, Linux Foundation, written by Michael Kerrisk
=2E\"      <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
=2E\"
=2E\" Permission is granted to make and distribute verbatim copies of t=
his
=2E\" manual provided the copyright notice and this permission notice a=
re
=2E\" preserved on all copies.
=2E\"
=2E\" Permission is granted to copy and distribute modified versions of=
 this
=2E\" manual under the conditions for verbatim copying, provided that t=
he
=2E\" entire resulting derived work is distributed under the terms of a
=2E\" permission notice identical to this one.
=2E\"
=2E\" Since the Linux kernel and libraries are constantly changing, thi=
s
=2E\" manual page may be incorrect or out-of-date.  The author(s) assum=
e no
=2E\" responsibility for errors or omissions, or for damages resulting =
from
=2E\" the use of the information contained herein.  The author(s) may n=
ot
=2E\" have taken the same level of care in the production of this manua=
l,
=2E\" which is licensed free of charge, as they might when working
=2E\" professionally.
=2E\"
=2E\" Formatted or processed versions of this manual, if unaccompanied =
by
=2E\" the source, must acknowledge the copyright and authors of this wo=
rk.
=2E\"
=2ETH FOPENCOOKIE 2 2008-09-10 "Linux" "Linux Programmer's Manual"
=2ESH NAME
fopencookie \- opening a custom stream
=2ESH SYNOPSIS
=2Enf
=2EB #include <stdio.h>

=2EBI "FILE *fopencookie(void *" cookie ", const char *" mode ,
=2EBI "                  cookie_io_functions_t " io_funcs );
=2Efi
=2ESH DESCRIPTION
The
=2EBR fopencookie ()
function allows the programmer to create a custom implementation
for a standard I/O stream.
This implementation can store the stream's data at a location of
its own choosing; for example,
=2EBR fopencookie ()
is used to implement
=2EBR fmemopen (3),
which provides a steam interface to data that is stored in a
buffer in memory.

In order to create a custom stream the programmer must:
=2EIP * 3
Implement four "hook" functions that are used internally by the
standard I/O library when performing I/O on the stream.
=2EIP *
Define a "cookie" data type,
a structure that provides bookkeeping information
(e.g., where to store data) used by the aforementioned hook functions.
The standard I/O package knows nothing about the contents of this cooki=
e
(thus it is typed as
=2EIR "void\ *"
when passed to
=2EBR fopencookie ()),
but automatically supplies the cookie
as the first argument when calling the hook functions.
=2EIP *
Call
=2EBR fopencookie ()
to open a new stream and associate the cookie and hook functions
with that stream.
=2EPP
The
=2EBR fopencookie ()
function serves a purpose similar to
=2EBR fopen (3):
it opens a new stream and returns a pointer to a
=2EI FILE
object that is used to operate on that stream.

The
=2EI cookie
argument is a pointer to the caller's cookie structure
that is to be associated with the new stream.
This pointer is supplied as the first argument when the standard I/O
library invokes any of the hook functions described below.

The
=2EI mode
argument serves the same purpose as for
=2EBR fopen (3).
The following modes are supported:
=2EIR r ,
=2EIR w ,
=2EIR a ,
=2EIR r+ ,
=2EIR w+ ,
and
=2EIR a+ .
See
=2EBR fopen (3)
for details.

The
=2EI io_funcs
argument is a structure that contains four fields pointing to the
programmer-defined hook functions that are used to implement this strea=
m.
The structure is defined as follows
=2Ein +4n
=2Enf

struct cookie_io_functions_t {
    cookie_read_function_t  *read;
    cookie_write_function_t *write;
    cookie_seek_function_t  *seek;
    cookie_close_function_t *close;
};

=2Efi
=2Ein
The four fields are as follows:
=2ETP
=2EI cookie_read_function_t *read
This function implements read operations for the stream.
When called, it receives three arguments:

    ssize_t read(void *cookie, char *buf, size_t size);

The
=2EI buf
and
=2EI size
arguments are, respectively,
a buffer into which input data can be placed and the size of that buffe=
r.
As its function result, the
=2EI read
function should return the number of bytes copied into
=2EIR buf ,
0 on end of file, or \-1 on error.
The
=2EI read
function should update the stream offset appropriately.

If
=2EI *read
is a NULL pointer,
then reads from the custom stream always return end of file.
=2ETP
=2EI cookie_write_function_t *write
This function implements write operations for the stream.
When called, it receives three arguments:

    ssize_t write(void *cookie, const char *buf, size_t size);

The
=2EI buf
and
=2EI size
arguments are, respectively,
a buffer of data to be output to the stream and the size of that buffer=
=2E
As its function result, the
=2EI write
function should return the number of bytes copied from
=2EIR buf ,
or \-1 on error.
The
=2EI write
function should update the stream offset appropriately.

If
=2EI *write
is a NULL pointer,
then output to the stream is discarded.
=2ETP
=2EI cookie_seek_function_t *seek
This function implements seek operations on the stream.
When called, it receives three arguments:

    int seek(void *cookie, off64_t *offset, int whence);

The
=2EI *offset
argument specifies the new file offset depending on which
of the following three values is supplied in
=2EIR whence :
=2ERS
=2ETP 10
=2EB SEEK_SET
The stream offset should be set
=2EI *offset
bytes from the start of the stream.
=2ETP
=2EB SEEK_CUR
=2EI *offset
should be added to the current stream offset.
=2ETP
=2EB SEEK_END
The stream offset should be set to the size of the stream plus
=2EIR *offset .
=2ERE
=2EIP
Before returning, the
=2EI seek
function should update
=2EI *offset
to indicate the new stream offset.

As its function result, the
=2EI seek
function should return 0 on success, and \-1 on error.

If
=2EI *seek
is a NULL pointer,
then it is not possible to perform seek operations on the stream.
=2ETP
=2EI cookie_close_function_t *close
This function closes the stream.
The hook function can do things such as freeing buffers allocated
for the stream.
When called, it receives one argument:

    int close(void *cookie);

The
=2EI cookie
argument is the cookie that the programmer supplied when calling
=2EBR fopencookie ().

As its function result, the
=2EI close
function should return 0 on success, and
=2EB EOF
on error.

If
=2EI *close
is NULL, then no special action is performed when the stream is closed.
=2ESH RETURN VALUE
On success
=2EBR fopencookie ()
returns a pointer to the new stream.
On error, NULL is returned.
=2E\" .SH ERRORS
=2E\" It's not clear if errno ever gets set...
=2ESH CONFORMING TO
This function is a non-standard GNU extension.
=2ESH EXAMPLE
The program below implements a custom stream whose functionality
is similar (but not identical) to that available via
=2EBR fmemopen (3).
It implements a stream whose data is stored in a memory buffer.
The program writes its command-line arguments to the stream,
and then seeks through the stream reading two out of every
five characters and writing them to standard output.
The following shell session demonstrates the use of the program:
=2Ein +4n
=2Enf

$ ./a.out 'hello world'
/he/
/ w/
/d/
Reached end of file

=2Efi
=2Ein
Note that a more general version of the program below
could be improved to more robustly handle various error situations
(e.g., opening a stream with a cookie that already has an open stream;
closing a stream that has already been closed).
=2Enf

#define _GNU_SOURCE
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define INIT_BUF_SIZE 4

struct memfile_cookie {
    char   *buf;        /* Dynamically sized buffer for data */
    size_t  allocated;  /* Size of buf */
    size_t  endpos;     /* Number of characters in buf */
    off_t   offset;     /* Current file offset in buf */
};

ssize_t
memfile_write(void *c, const char *buf, size_t size)
{
    char *new_buff;
    struct memfile_cookie *cookie =3D c;

    /* Buffer too small? Keep doubling size until big enough */

    while (size + cookie\->offset > cookie->allocated) {
        new_buff =3D realloc(cookie\->buf, cookie->allocated * 2);
        if (new_buff =3D=3D NULL) {
            return \-1;
        } else {
            cookie\->allocated *=3D 2;
            cookie\->buf =3D new_buff;
        }
    }

    memcpy(cookie\->buf + cookie->offset, buf, size);

    cookie\->offset +=3D size;
    if (cookie\->offset > cookie->endpos)
        cookie\->endpos =3D cookie->offset;

    return size;
}

ssize_t
memfile_read(void *c, char *buf, size_t size)
{
    ssize_t xbytes;
    struct memfile_cookie *cookie =3D c;

    /* Fetch minimum of bytes requested and bytes available */

    xbytes =3D size;
    if (cookie\->offset + size > cookie->endpos)
        xbytes =3D cookie\->endpos - cookie->offset;
    if (xbytes < 0)     /* offset may be past endpos */
       xbytes =3D 0;

    memcpy(buf, cookie\->buf + cookie->offset, xbytes);

    cookie\->offset +=3D xbytes;
    return xbytes;
}

int
memfile_seek(void *c, off64_t *offset, int whence)
{
    off64_t new_offset;
    struct memfile_cookie *cookie =3D c;

    if (whence =3D=3D SEEK_SET)
        new_offset =3D *offset;
    else if (whence =3D=3D SEEK_END)
        new_offset =3D cookie\->endpos + *offset;
    else if (whence =3D=3D SEEK_CUR)
        new_offset =3D cookie\->offset + *offset;
    else
        return \-1;

    if (new_offset < 0)
        return \-1;

    cookie\->offset =3D new_offset;
    *offset =3D new_offset;
    return 0;
}

int
memfile_close(void *c)
{
    struct memfile_cookie *cookie =3D c;

    free(cookie\->buf);
    cookie\->allocated =3D 0;
    cookie\->buf =3D NULL;

    return 0;
}

int
main(int argc, char *argv[])
{
    cookie_io_functions_t  memfile_func =3D {
        .read  =3D memfile_read,
        .write =3D memfile_write,
        .seek  =3D memfile_seek,
        .close =3D memfile_close
    };
    FILE *fp;
    struct memfile_cookie mycookie;
    ssize_t nread;
    long p;
    int j;
    char buf[1000];

    /* Set up the cookie before calling fopencookie() */

    mycookie.buf =3D malloc(INIT_BUF_SIZE);
    if (mycookie.buf =3D=3D NULL) {
        perror("malloc");
        exit(EXIT_FAILURE);
    }

    mycookie.allocated =3D INIT_BUF_SIZE;
    mycookie.offset =3D 0;
    mycookie.endpos =3D 0;

    fp =3D fopencookie(&mycookie,"w+", memfile_func);
    if (fp =3D=3D NULL) {
        perror("fopencookie");
        exit(EXIT_FAILURE);
    }

    /* Write command\-line arguments to our file */

    for (j =3D 1; j < argc; j++)
        if (fputs(argv[j], fp) =3D=3D EOF) {
            perror("fputs");
            exit(EXIT_FAILURE);
        }

    /* Read two bytes out of every five, until EOF */

    for (p =3D 0; ; p +=3D 5) {
        if (fseek(fp, p, SEEK_SET) =3D=3D \-1) {
            perror("fseek");
            exit(EXIT_FAILURE);
        }
        nread =3D fread(buf, 1, 2, fp);
        if (nread =3D=3D \-1) {
            perror("fread");
            exit(EXIT_FAILURE);
        }
        if (nread =3D=3D 0) {
            printf("Reached end of file\\n");
            break;
        }

        printf("/%.*s/\\n", nread, buf);
    }

    exit(EXIT_SUCCESS);
}
=2Efi
=2ESH SEE ALSO
=2EBR fclose (3),
=2EBR fmemopen (3),
=2EBR fopen (3),
=2EBR fseek (3)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
