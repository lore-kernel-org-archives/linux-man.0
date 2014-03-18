From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: For review: open_by_name_at(2) man page [v2]
Date: Tue, 18 Mar 2014 13:55:15 +0100
Message-ID: <53284233.3050800@gmail.com>
References: <53271B69.3000305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53271B69.3000305@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Cc: mtk.manpages@gmail.com, Andreas Dilger <adilger@dilger.ca>, NeilBrown <neilb@suse.de>, Christoph Hellwig <hch@infradead.org>
List-Id: linux-man@vger.kernel.org

Hi Aneesh, (and others)

After integrating review comments from NeilBown and Christoph Hellwig,
here is draft 2 of a man page I've written for name_to_handle_at(2) and
open_by_name_at(2). Especially thanks to Neil's comments, several parts
of the page underwent a substantial rewrite. Would you be willing to=20
review it please, and let me know of any corrections/improvements?

There are some FIXMEs in the page that I would especially like some
help with.

Thanks,

Michael


'\" t -*- coding: UTF-8 -*-
=2E\" Copyright (c) 2014 by Michael Kerrisk <mtk.manpages@gmail.com>
=2E\"
=2E\" %%%LICENSE_START(VERBATIM)
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
=2E\" %%%LICENSE_END
=2E\"
=2ETH OPEN_BY_HANDLE_AT 2 2014-03-24 "Linux" "Linux Programmer's Manual=
"
=2ESH NAME
name_to_handle_at, open_by_handle_at \- obtain handle
for a pathname and open file via a handle
=2ESH SYNOPSIS
=2Enf
=2EB #define _GNU_SOURCE
=2EB #include <sys/types.h>
=2EB #include <sys/stat.h>
=2EB #include <fcntl.h>

=2EBI "int name_to_handle_at(int " dirfd ", const char *" pathname ,
=2EBI "                      struct file_handle *" handle ,
=2EBI "                      int *" mount_id ", int " flags );

=2EBI "int open_by_handle_at(int " mount_fd ", struct file_handle *" ha=
ndle ,
=2EBI "                      int " flags );
=2Efi
=2ESH DESCRIPTION
The
=2EBR name_to_handle_at ()
and
=2EBR open_by_handle_at ()
system calls split the functionality of
=2EBR openat (2)
into two parts:
=2EBR name_to_handle_at ()
returns an opaque handle that corresponds to a specified file;
=2EBR open_by_handle_at ()
opens the file corresponding to a handle returned by a previous call to
=2EBR name_to_handle_at ()
and returns an open file descriptor.
=2E\"
=2E\"
=2ESS name_to_handle_at()
The
=2EBR name_to_handle_at ()
system call returns a file handle and a mount ID corresponding to
the file specified by the
=2EIR dirfd
and
=2EIR pathname
arguments.
The file handle is returned via the argument
=2EIR handle ,
which is a pointer to a structure of the following form:

=2Ein +4n
=2Enf
struct file_handle {
    unsigned int  handle_bytes;   /* Size of f_handle [in, out] */
    int           handle_type;    /* Handle type [out] */
    unsigned char f_handle[0];    /* File identifier (sized by
                                     caller) [out] */
};
=2Efi
=2Ein
=2EPP
It is the caller's responsibility to allocate the structure
with a size large enough to hold the handle returned in
=2EIR f_handle .
Before the call, the
=2EIR handle_bytes
field should be initialized to contain the allocated size for
=2EIR f_handle .
(The constant
=2EBR MAX_HANDLE_SZ ,
defined in
=2EIR <fcntl.h> ,
specifies the maximum possible size for a file handle.)
Upon successful return, the
=2EIR handle_bytes
field is updated to contain the number of bytes actually written to
=2EIR f_handle .

The caller can discover the required size for the
=2EI file_handle
structure by making a call in which
=2EIR handle->handle_bytes
is zero;
in this case, the call fails with the error
=2EBR EOVERFLOW
and
=2EIR handle->handle_bytes
is set to indicate the required size;
the caller can then use this information to allocate a structure
of the correct size (see EXAMPLE below).

Other than the use of the
=2EIR handle_bytes
field, the caller should treat the
=2EIR file_handle
structure as an opaque data type: the
=2EIR handle_type
and
=2EIR f_handle
fields are needed only by a subsequent call to
=2EBR open_by_handle_at ().

Together, the
=2EI pathname
and
=2EI dirfd
arguments identify the file for which a handle is to obtained.
There are four distinct cases:
=2EIP * 3
If
=2EI pathname
is a nonempty string containing an absolute pathname,
then a handle is returned for the file referred to by that pathname.
In this case,
=2EIR dirfd
is ignored.
=2EIP *
If
=2EI pathname
is a nonempty string containing a relative pathname and
=2EIR dirfd
has the special value
=2EBR AT_FDCWD ,
then
=2EI pathname
is interpreted relative to the current working directory of the caller,
and a handle is returned for the file to which it refers.
=2EIP *
If
=2EI pathname
is a nonempty string containing a relative pathname and
=2EIR dirfd
is a file descriptor referring to a directory, then
=2EI pathname
is interpreted relative to the directory referred to by
=2EIR dirfd ,
and a handle is returned for the file to which it refers.
(See
=2EBR openat (3)
for an explanation of why "directory file descriptors" are useful.)
=2EIP *
If
=2EI pathname
is an empty string and
=2EI flags
specifies the value
=2EBR AT_EMPTY_PATH ,
then
=2EIR dirfd
can be an open file descriptor referring to any type of file,
or
=2EBR AT_FDCWD ,
meaning the current working directory,
and a handle is returned for the file to which it refers.
=2EPP
The
=2EI mount_id
argument returns an identifier for the filesystem
mount that corresponds to
=2EIR pathname .
This corresponds to the first field in one of the records in
=2EIR /proc/self/mountinfo .
Opening the pathname in the fifth field of that record yields a file
descriptor for the mount point;
that file descriptor can be used in a subsequent call to
=2EBR open_by_handle_at ().

The
=2EI flags
argument is a bit mask constructed by ORing together
zero or more of the following value:
=2ETP
=2EB AT_EMPTY_PATH
Allow
=2EI pathname
to be an empty string.
See above.
(which may have been obtained using the
=2EBR open (2)
=2EB O_PATH
flag).
=2ETP
=2EB AT_SYMLINK_FOLLOW
By default,
=2EBR name_to_handle_at ()
does not dereference
=2EI pathname
if it is a symbolic link.
The flag
=2EB AT_SYMLINK_FOLLOW
can be specified in
=2EI flags
to cause
=2EI pathname
to be dereferenced if it is a symbolic link.
=2ESS open_by_handle_at()
The
=2EBR open_by_handle_at ()
system call opens the file referred to by
=2EIR handle ,
a file handle returned by a previous call to
=2EBR name_to_handle_at ().

The
=2EIR mount_fd
argument is a file descriptor for any object (file, directory, etc.)
in the mounted filesystem with respect to which
=2EIR handle
should be interpreted.
The special value
=2EB AT_FDCWD
can be specified, meaning the current working directory of the caller.

The
=2EI flags
argument
is as for
=2EBR open (2).
=2E\" FIXME: Confirm that the following is intended behavior.
=2E\"        (It certainly seems to be the behavior, from experimenting=
=2E)
If
=2EI handle
refers to a symbolic link, the caller must specify the
=2EB O_PATH
flag, and the symbolic link is not dereferenced (the
=2EB O_NOFOLLOW
flag, if specified, is ignored).

The caller must have the
=2EB CAP_DAC_READ_SEARCH
capability to invoke
=2EBR open_by_handle_at ().
=2ESH RETURN VALUE
On success,
=2EBR name_to_handle_at ()
returns 0,
and
=2EBR open_by_handle_at ()
returns a nonnegative file descriptor.

In the event of an error, both system calls return \-1 and set
=2EI errno
to indicate the cause of the error.
=2ESH ERRORS
=2EBR name_to_handle_at ()
and
=2EBR open_by_handle_at ()
can fail for the same errors as
=2EBR openat (2).
In addition, they can fail with the errors noted below.

=2EBR name_to_handle_at ()
can fail with the following errors:
=2ETP
=2EB EINVAL
=2EI flags
includes an invalid bit value.
=2ETP
=2EB EINVAL
=2EIR handle_bytes\->handle_bytes
is greater than
=2EBR MAX_HANDLE_SZ .
=2ETP
=2EB ENOENT
=2EI pathname
is an empty string, but
=2EBR AT_EMPTY_PATH
was not specified in
=2EIR flags .
=2ETP
=2EB ENOTDIR
The file descriptor supplied in
=2EI dirfd
does not refer to a directory,
and it it is not the case that both
=2EI flags
includes
=2EBR AT_EMPTY_PATH
and
=2EI pathname
is an empty string.
=2ETP
=2EB EOPNOTSUPP
The filesystem does not support decoding of a pathname to a file handle=
=2E
=2ETP
=2EB EOVERFLOW
The
=2EI handle->handle_bytes
value passed into the call was too small.
When this error occurs,
=2EI handle->handle_bytes
is updated to indicate the required size for the handle.
=2E\"
=2E\"
=2EPP
=2EBR open_by_handle_at ()
can fail with the following errors:
=2ETP
=2EB EBADF
=2EIR mount_fd
is not an open file descriptor.
=2ETP
=2EB EINVAL
=2EI handle->handle_bytes
is greater than
=2EBR MAX_HANDLE_SZ
or is equal to zero.
=2ETP
=2EB ELOOP
=2E\" FIXME (see earlier FIXME). Is this the intended behavior?
=2EI handle
refers to a symbolic link, but
=2EB O_PATH
was not specified in
=2EIR flags .
=2ETP
=2EB EPERM
The caller does not have the
=2EBR CAP_DAC_READ_SEARCH
capability.
=2ETP
=2EB ESTALE
The specified
=2EI handle
is no longer valid.
=2ESH VERSIONS
These system calls first appeared in Linux 2.6.39.
=2ESH CONFORMING TO
These system calls are nonstandard Linux extensions.
=2ESH NOTES
A file handle can be generated in one process using
=2EBR name_to_handle_at ()
and later used in a different process that calls
=2EBR open_by_handle_at ().

Not all filesystem types support the translation of pathnames to
file handles.
=2E\" FIXME NeilBrown noted:
=2E\"    ESTALE is also returned if the filesystem does not support
=2E\"    file-handle -> file mappings.
=2E\"    On filesystems which don't provide export_operations (/sys /pr=
oc
=2E\"    ubifs romfs cramfs nfs coda ... several others) name_to_handle=
_at
=2E\"    will produce a generic handle using the 32 bit inode and 32 bi=
t
=2E\"    i_generation. open_by_name_at given this (or any) filehandle
=2E\"    will fail with ESTALE.
=2E\" However, on /proc and /sys, at least, name_to_handle_at() fails w=
ith
=2E\" EOPNOTSUPP. Are there really filesystems that can deliver ESTALE =
(the
=2E\" same error as for an invalid file handle) in the above circumstan=
ces?

A file handle may become invalid ("stale") if a file is deleted,
or for other filesystem-specific reasons.
Invalid handles are notified by an
=2EB ESTALE
error from
=2EBR open_by_name_at ().

These system calls are designed for use by user-space file servers.
=46or example, a user-space NFS server might generate a file handle
and pass it to an NFS client.
Later, when the client wants to open the file,
it could pass the handle back to the server.
=2E\" https://lwn.net/Articles/375888/
=2E\"	"Open by handle" - Jonathan Corbet, 2010-02-23
This sort of functionality allows a user-space file server to operate i=
n
a stateless fashion with respect to the files it serves.

If
=2EI pathname
refers to a symbolic link and
=2EIR flags
does not specify
=2EBR AT_SYMLINK_FOLLOW ,
then
=2EBR name_to_handle_at ()
returns a handle for the link (rather than the file to which it refers)=
=2E
=2E\" commit bcda76524cd1fa32af748536f27f674a13e56700
The process receiving the handle can later perform operations
on the symbolic link by converting the handle to a file descriptor usin=
g
=2EBR open_by_handle_at ()
with the
=2EBR O_PATH
flag, and then passing the file descriptor as the
=2EIR dirfd
argument in system calls such as
=2EBR readlinkat (2)
and
=2EBR fchownat (2).
=2ESS Obtaining a persistent filesystem ID
The mount IDs in
=2EIR /proc/self/mountinfo
can be reused as filesystems are unmounted and mounted.
Therefore, the mount ID returned by
=2EBR name_to_handle_at (3)
(in
=2EIR *mount_id )
should not be treated as a persistent identifier
for the corresponding mounted filesystem.
However, an application can use the information in the
=2EI mountinfo
record that corresponds to the mount ID
to derive a persistent identifier.

=46or example, one can use the device name in the fifth field of the
=2EI mountinfo
record to search for the corresponding device UUID via the symbolic lin=
ks in
=2EIR /dev/disks/by-uuid .
(A more comfortable way of obtaining the UUID is to use the
=2E\" e.g., http://stackoverflow.com/questions/6748429/using-libblkid-t=
o-find-uuid-of-a-partition
=2EBR libblkid (3)
library.)
That process can then be reversed,
using the UUID to look up the device name,
and then obtaining the corresponding mount point,
in order to produce the
=2EIR mount_fd
argument used by
=2EBR open_by_name_at ().
=2ESH EXAMPLE
The two programs below demonstrate the use of
=2EBR name_to_handle_at ()
and
=2EBR open_by_handle_at ().
The first program
=2ERI ( t_name_to_handle_at.c )
uses
=2EBR name_to_handle_at ()
to obtain the file handle and mount ID
for the file specified in its command-line argument;
the handle and ID are written to standard output.

The second program
=2ERI ( t_open_by_handle_at.c )
reads a mount ID and file handle from standard input.
The program then employs
=2EBR open_by_handle_at ()
to open the file using that handle.
If an optional command-line argument is supplied, then the
=2EIR mount_fd
argument for
=2EBR open_by_handle_at ()
is obtained by opening the directory named in that argument.
Otherwise,
=2EIR mount_fd
is obtained by scanning
=2EIR /proc/self/mountinfo
to find a record whose mount ID matches the mount ID
read from standard input,
and the mount directory specified in that record is opened.
(These programs do not deal with the fact that mount IDs are not persis=
tent.)

The following shell session demonstrates the use of these two programs:

=2Ein +4n
=2Enf
$ \fBecho 'Kannst du bitte =C3=BCberlegen?' > cecilia.txt\fP
$ \fB./t_name_to_handle_at cecilia.txt > fh\fP
$ \fB./t_open_by_handle_at < fh\fP
open_by_handle_at: Operation not permitted
$ \fBsudo ./t_open_by_handle_at < fh\fP      # Need CAP_SYS_ADMIN
Read 28 bytes
$ \fBrm cecilia.txt\fP
=2Efi
=2Ein

Now we delete and (quickly) re-create the file so that
it has the same content and (by chance) the same inode.
Nevertheless,
=2EBR open_by_handle_at ()
recognizes that the original file referred to by the file handle
no longer exists.

=2Ein +4n
=2Enf
$ \fBstat \-\-printf=3D"%i\\n" cecilia.txt\fP       # Display inode num=
ber=20
4072121
$ \fBrm cecilia.txt\fP
$ \fBecho 'Kannst du bitte =C3=BCberlegen?' > cecilia.txt\fP
$ \fBstat \-\-printf=3D"%i\\n" cecilia.txt\fP       # Check inode numbe=
r
4072121
$ \fBsudo ./t_open_by_handle_at < fh\fP
open_by_handle_at: Stale NFS file handle
=2Efi
=2Ein
=2ESS Program source: t_name_to_handle_at.c
\&
=2Enf
#define _GNU_SOURCE
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

#define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \\
                        } while (0)

int
main(int argc, char *argv[])
{
    struct file_handle *fhp;
    int mount_id, fhsize, s;

    if (argc < 2 || strcmp(argv[1], "\-\-help") =3D=3D 0) {
        fprintf(stderr, "Usage: %s pathname\\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    /* Allocate file_handle structure */

    fhsize =3D sizeof(struct file_handle *);
    fhp =3D malloc(fhsize);
    if (fhp =3D=3D NULL)
        errExit("malloc");

    /* Make an initial call to name_to_handle_at() to discover
       the size required for file handle */

    fhp\->handle_bytes =3D 0;
    s =3D name_to_handle_at(AT_FDCWD, argv[1], fhp, &mount_id, 0);
    if (s !=3D \-1 || errno !=3D EOVERFLOW) {
        fprintf(stderr, "Unexpected result from name_to_handle_at()\\n"=
);
        exit(EXIT_FAILURE);
    }

    /* Reallocate file_handle structure with correct size */

    fhsize =3D sizeof(struct file_handle) + fhp\->handle_bytes;
    fhp =3D realloc(fhp, fhsize);         /* Copies fhp\->handle_bytes =
*/
    if (fhp =3D=3D NULL)
        errExit("realloc");

    /* Get file handle from pathname supplied on command line */

    if (name_to_handle_at(AT_FDCWD, argv[1], fhp, &mount_id, 0) =3D=3D =
\-1)
        errExit("name_to_handle_at");

    /* Write mount ID, file handle size, and file handle to stdout,
       for later reuse by t_open_by_handle_at.c */

    if (write(STDOUT_FILENO, &mount_id, sizeof(int)) !=3D sizeof(int) |=
|
            write(STDOUT_FILENO, &fhsize, sizeof(int)) !=3D sizeof(int)=
 ||
            write(STDOUT_FILENO, fhp, fhsize) !=3D fhsize) {
        fprintf(stderr, "Write failure\\n");
        exit(EXIT_FAILURE);
    }

    exit(EXIT_SUCCESS);
}
=2Efi
=2ESS Program source: t_open_by_handle_at.c
\&
=2Enf
#define _GNU_SOURCE
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \\
                        } while (0)

/* Scan /proc/self/mountinfo to find the line whose mount ID matches
   \(aqmount_id\(aq. (An easier way to do this is to install and use th=
e
   \(aqlibmount\(aq library provided by the \(aqutil\-linux\(aq project=
=2E)
   Open the corresponding mount path and return the resulting file
   descriptor. */

static int
open_mount_path_by_id(int mount_id)
{
    char *linep;
    size_t lsize;
    char mount_path[PATH_MAX];
    int fmnt_id, fnd, nread;
    FILE *fp;

    fp  =3D fopen("/proc/self/mountinfo", "r");
    if (fp =3D=3D NULL)
        errExit("fopen");

    for (fnd =3D 0; !fnd ; ) {
        linep =3D NULL;
        nread =3D getline(&linep, &lsize, fp);
        if (nread =3D=3D \-1)
            break;

	nread =3D sscanf(linep, "%d %*d %*s %*s %s", &fmnt_id, mount_path);
        if (nread !=3D 2) {
            fprintf(stderr, "Bad sscanf()\\n");
            exit(EXIT_FAILURE);
        }

        free(linep);

        if (fmnt_id =3D=3D mount_id)
            fnd =3D 1;
    }

    fclose(fp);

    if (!fnd) {
        fprintf(stderr, "Could not find mount point\\n");
        exit(EXIT_FAILURE);
    }

    return open(mount_path, O_RDONLY | O_DIRECTORY);
}

int
main(int argc, char *argv[])
{
    struct file_handle *fhp;
    int mount_id, fd, mount_fd, fhsize;
    ssize_t nread;
#define BSIZE 1000
    char buf[BSIZE];

    if (argc > 1 && strcmp(argv[1], "\-\-help") =3D=3D 0) {
        fprintf(stderr, "Usage: %s [mount\-dir]]\\n",
                argv[0]);
        exit(EXIT_FAILURE);
    }

    /* Read data produced by t_name_to_handle_at.c */

    if (read(STDIN_FILENO, &mount_id, sizeof(int)) !=3D sizeof(int))
        errExit("read");

    if (read(STDIN_FILENO, &fhsize, sizeof(int)) !=3D sizeof(int))
        errExit("read");

    fhp =3D malloc(fhsize);
    if (fhp =3D=3D NULL)
        errExit("malloc");

    if (read(STDIN_FILENO, fhp, fhsize) !=3D fhsize)
        errExit("read");

    /* Obtain file descriptor for mount point, either by opening
       the pathname specified on the command line, or by scanning
       /proc/self/mounts to find a mount that matches the \(aqmount_id\=
(aq
       obtained by name_to_handle_at() (in t_name_to_handle_at.c) */

    if (argc > 1)
        mount_fd =3D open(argv[1], O_RDONLY | O_DIRECTORY);
    else
        mount_fd =3D open_mount_path_by_id(mount_id);

    if (mount_fd =3D=3D \-1)
        errExit("opening mount fd");

    /* Open name using handle and mount point */

    fd =3D open_by_handle_at(mount_fd, fhp, O_RDONLY);
    if (fd =3D=3D \-1)
        errExit("open_by_handle_at");

    /* Try reading a few bytes from the file */

    nread =3D read(fd, buf, BSIZE);
    if (nread =3D=3D \-1)
        errExit("read");
    printf("Read %ld bytes\\n", (long) nread);

    exit(EXIT_SUCCESS);
}
=2Efi
=2ESH SEE ALSO
=2EBR blkid (1),
=2EBR findfs (1),
=2EBR open (2),
=2EBR libblkid (3),
=2EBR mount (8)

The
=2EI libblkid
and
=2EI libmount
documentation under the latest
=2EI util-linux
release at
=2EUR https://www.kernel.org/pub/linux/utils/util-linux/
=2EUE
