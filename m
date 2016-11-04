From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Revised add_key(2) man page for review
Date: Fri, 4 Nov 2016 16:47:04 +0100
Message-ID: <9a5cc2a7-a505-9d0d-5b78-4bc5ab100ff1@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------F6DC985EE1C0B0785BB9247E"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------F6DC985EE1C0B0785BB9247E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi David (and anyone else with an interest to review)

Following on from the request_key(2) page that I already posted,
I've pasted the current draft of the add_key(2) below. The 
changes to this page are less wide-ranging than for request_key(2),
but you may also have suggestions for further changes to tha page.

Could you take a look please? (The page source file is attached,
in case you want to see all the formatting.)

Thanks,

Michael

====

NAME
       add_key - add a key to the kernel's key management facility

SYNOPSIS
       #include <sys/types.h>
       #include <keyutils.h>

       key_serial_t add_key(const char *type, const char *description,
                            const void *payload, size_t plen,
                            key_serial_t keyring);

       No glibc wrapper is provided for this system call; see NOTES.

DESCRIPTION
       add_key()  creates  or  updates  a  key  of  the given type and
       description, instantiates it with the payload of  length  plen,
       attaches  it  to  the  nominated  keyring, and return the key's
       serial number.

       The key type may reject the data if it is in the  wrong  format
       or is in some other way invalid.

       If  the destination keyring already contains a key that matches
       the specified type and description, then, if the key type  sup‐
       ports  it, that key will be updated rather than a new key being
       created; if not, a new key (with a different ID) will  be  cre‐
       ated  and  it will displace the link to the extant key from the
       keyring.

       The destination keyring serial number may be that  of  a  valid
       keyring for which the caller has write permission, or it may be
       one of the following special keyring IDs:

       KEY_SPEC_THREAD_KEYRING
              This  specifies  the  caller's  thread-specific  keyring
              (thread-keyring(7)).

       KEY_SPEC_PROCESS_KEYRING
              This specifies  the  caller's  process-specific  keyring
              (process-keyring(7)).

       KEY_SPEC_SESSION_KEYRING
              This  specifies  the  caller's  session-specific keyring
              (session-keyring(7)).

       KEY_SPEC_USER_KEYRING
              This specifies the caller's UID-specific keyring  (user-
              keyring(7)).

       KEY_SPEC_USER_SESSION_KEYRING
              This  specifies  the caller's UID-session keyring (user-
              session-keyring(7)).

   Key types
       The key type is a string that specifies the key's type.  Inter‐
       nally, the kernel defines a number of key types that are avail‐
       able in the core key management code.  Among the types that are
       available  for  user-space use and can be specified as the type
       argument to add_key() are the following:

       "user" This is a general purpose key type whose payload may  be
              read and updated by user-space applications.  The key is
              kept entirely within kernel  memory.   The  payload  for
              keys  of  this type is a blob of arbitrary data of up to
              32,767 bytes.

       "keyring"
              Keyrings are special key types that may contain links to
              sequences  of other keys of any type.  If this interface
              is used to create a keyring, then a NULL payload  should
              be specified, and plen should be zero.

       "logon" (since Linux 3.3)
              This  key type is essentially the same as "user", but it
              does not provide reading.  This is suitable for  storing
              payloads  that  you do not want to be readable from user
              space.

              This key type vets the description to ensure that it  is
              qualified  by  a "service" prefix, by checking to ensure
              that the description contains a ':' that is preceded  by
              other characters.

       "big_key" (since Linux 3.13)
              This  key type is similar to "user", but may hold a pay‐
              load of up to 1 MiB.  If the key payload is large,  then
              it  may  be stored in swap space rather than kernel mem‐
              ory.

       For further details on these key types, see keyrings(7).

RETURN VALUE
       On success, add_key() returns the serial number of the  key  it
       created  or updated.  On error, -1 is returned and errno is set
       to indicate the cause of the error.

ERRORS
       EACCES The keyring wasn't available  for  modification  by  the
              user.

       EDQUOT The  key quota for this user would be exceeded by creat‐
              ing this key or linking it to the keyring.

       EINVAL The size of the string (including the  terminating  null
              byte)  specified  in  type  or  description exceeded the
              limit (32 bytes and 4096 bytes respectively).

       EINVAL The payload data was invalid.

       EINVAL type was "logon" and the description was  not  qualified
              with a prefix string of the form "service:".

       EKEYEXPIRED
              The keyring has expired.

       EKEYREVOKED
              The keyring has been revoked.

       ENOKEY The keyring doesn't exist.

       ENOMEM Insufficient memory to create a key.

VERSIONS
       This system call first appeared in Linux 2.6.10.

CONFORMING TO
       This system call is a nonstandard Linux extension.

NOTES
       No  wrapper for this system call is provided in glibc.  A wrap‐
       per is provided in the libkeyutils package.  When employing the
       wrapper in that library, link with -lkeyutils.

EXAMPLE
       The program below creates a key with the type, description, and
       payload specified in its command-line arguments, and links that
       key  into  the  session  keyring.   The following shell session
       demonstrates the use of the program:

           $ ./a.out user mykey "Some payload"
           Key ID is 64a4dca
           $ grep '64a4dca' /proc/keys
           064a4dca I--Q---    1 perm 3f010000  1000  1000 user    mykey: 12

   Program source

       #include <sys/types.h>
       #include <keyutils.h>
       #include <stdio.h>
       #include <stdlib.h>
       #include <string.h>

       #define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \
                               } while (0)

       int
       main(int argc, char *argv[])
       {
           key_serial_t key;

           if (argc != 4) {
               fprintf(stderr, "Usage: %s type description payload\n",
                       argv[0]);
               exit(EXIT_FAILURE);
           }

           key = add_key(argv[1], argv[2], argv[3], strlen(argv[3]),
                       KEY_SPEC_SESSION_KEYRING);
           if (key == -1)
               errExit("add_key");

           printf("Key ID is %lx\n", (long) key);

           exit(EXIT_SUCCESS);
       }

SEE ALSO
       keyctl(1), keyctl(2), request_key(2), keyctl(3), keyutils(7),
       keyrings(7), persistent-keyring(7), process-keyring(7),
       session-keyring(7), thread-keyring(7), user-keyring(7),
       user-session-keyring(7)

       The kernel source files Documentation/security/keys.txt and
       Documentation/security/keys-request-key.txt.



Linux                         2016-07-17                    ADD_KEY(2)

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

--------------F6DC985EE1C0B0785BB9247E
Content-Type: application/x-troff-man;
 name="add_key.2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="add_key.2"

.\" Copyright (C) 2006 Red Hat, Inc. All Rights Reserved.
.\"     Written by David Howells (dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org)
.\" and Copyright (C) 2016 Michael Kerrisk <mtk.man-pages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
.\"
.\" %%%LICENSE_START(GPLv2+_SW_ONEPARA)
.\" This program is free software; you can redistribute it and/or
.\" modify it under the terms of the GNU General Public License
.\" as published by the Free Software Foundation; either version
.\" 2 of the License, or (at your option) any later version.
.\" %%%LICENSE_END
.\"
.TH ADD_KEY 2 2016-07-17 Linux "Linux Key Management Calls"
.SH NAME
add_key \- add a key to the kernel's key management facility
.SH SYNOPSIS
.nf
.B #include <sys/types.h>
.B #include <keyutils.h>
.sp
.BI "key_serial_t add_key(const char *" type ", const char *" description ,
.BI "                     const void *" payload ", size_t " plen ,
.BI "                     key_serial_t " keyring ");"
.fi

No glibc wrapper is provided for this system call; see NOTES.
.SH DESCRIPTION
.BR add_key ()
creates or updates a key of the given
.I type
and
.IR description ,
instantiates it with the
.I payload
of length
.IR plen ,
attaches it to the nominated
.IR keyring ,
and return the key's serial number.
.P
The key type may reject the data if it is in the wrong format or
is in some other way invalid.
.P
If the destination
.I keyring
already contains a key that matches the specified
.IR type
and
.IR description ,
then, if the key type supports it,
that key will be updated rather than a new key being created;
if not, a new key (with a different ID) will be created
and it will displace the link to the extant key from the keyring.
.P
The destination
.I keyring
serial number may be that of a valid keyring for which the caller has
.I write
permission, or it may be one of the following special keyring IDs:
.\" FIXME Perhaps have a separate page describing special keyring IDs?
.TP
.B KEY_SPEC_THREAD_KEYRING
This specifies the caller's thread-specific keyring
.RB ( thread-keyring (7)).
.TP
.B KEY_SPEC_PROCESS_KEYRING
This specifies the caller's process-specific keyring
.RB ( process-keyring (7)).
.TP
.B KEY_SPEC_SESSION_KEYRING
This specifies the caller's session-specific keyring
.RB ( session-keyring (7)).
.TP
.B KEY_SPEC_USER_KEYRING
This specifies the caller's UID-specific keyring
.RB ( user-keyring (7)).
.TP
.B KEY_SPEC_USER_SESSION_KEYRING
This specifies the caller's UID-session keyring
.RB ( user-session-keyring (7)).
.SS Key types
The key
.I type
is a string that specifies the key's type.
Internally, the kernel defines a number of key types that are
available in the core key management code.
Among the types that are available for user-space use
and can be specified as the
.I type
argument to
.BR add_key ()
are the following:
.TP
.IR """user"""
This is a general purpose key type whose payload may be read and updated
by user-space applications.
The key is kept entirely within kernel memory.
The payload for keys of this type is a blob of arbitrary data
of up to 32,767 bytes.
.TP
.I """keyring"""
Keyrings are special key types that may contain links to sequences of other
keys of any type.
If this interface is used to create a keyring, then a NULL
.I payload
should be specified, and
.I plen
should be zero.
.TP
.IR """logon""" " (since Linux 3.3)"
.\" commit 9f6ed2ca257fa8650b876377833e6f14e272848b
This key type is essentially the same as
.IR """user""" ,
but it does not provide reading.
This is suitable for storing payloads
that you do not want to be readable from user space.

This key type vets the
.I description
to ensure that it is qualified by a "service" prefix,
by checking to ensure that the
.I description
contains a ':' that is preceded by other characters.
.TP
.IR """big_key""" " (since Linux 3.13)"
.\" commit ab3c3587f8cda9083209a61dbe3a4407d3cada10
This key type is similar to
.IR """user""" ,
but may hold a payload of up to 1 MiB.
If the key payload is large,
then it may be stored in swap space rather than kernel memory.
.PP
For further details on these key types, see
.BR keyrings (7).
.SH RETURN VALUE
On success,
.BR add_key ()
returns the serial number of the key it created or updated.
On error, \-1 is returned and
.I errno
is set to indicate the cause of the error.
.SH ERRORS
.TP
.B EACCES
The keyring wasn't available for modification by the user.
.TP
.B EDQUOT
The key quota for this user would be exceeded by creating this key or linking
it to the keyring.
.TP
.B EINVAL
The size of the string (including the terminating null byte) specified in
.I type
or
.I description
exceeded the limit (32 bytes and 4096 bytes respectively).
.TP
.B EINVAL
The payload data was invalid.
.TP
.B EINVAL
.IR type
was
.IR """logon"""
and the
.I description
was not qualified with a prefix string of the form
.IR """service:""" .
.TP
.B EKEYEXPIRED
The keyring has expired.
.TP
.B EKEYREVOKED
The keyring has been revoked.
.TP
.B ENOKEY
The keyring doesn't exist.
.TP
.B ENOMEM
Insufficient memory to create a key.
.SH VERSIONS
This system call first appeared in Linux 2.6.10.
.SH CONFORMING TO
This system call is a nonstandard Linux extension.
.SH NOTES
No wrapper for this system call is provided in glibc.
A wrapper is provided in the
.IR libkeyutils
package.
When employing the wrapper in that library, link with
.IR \-lkeyutils .
.SH EXAMPLE
The program below creates a key with the type, description, and payload
specified in its command-line arguments,
and links that key into the session keyring.
The following shell session demonstrates the use of the program:

.in +4n
.nf
$ \fB./a.out user mykey "Some payload"\fP
Key ID is 64a4dca
$ \fBgrep \(aq64a4dca\(aq /proc/keys\fP
064a4dca I--Q---    1 perm 3f010000  1000  1000 user    mykey: 12
.fi
.in
.SS Program source
\&
.nf
#include <sys/types.h>
#include <keyutils.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \\
                        } while (0)

int
main(int argc, char *argv[])
{
    key_serial_t key;

    if (argc != 4) {
        fprintf(stderr, "Usage: %s type description payload\\n",
                argv[0]);
        exit(EXIT_FAILURE);
    }

    key = add_key(argv[1], argv[2], argv[3], strlen(argv[3]),
                KEY_SPEC_SESSION_KEYRING);
    if (key == \-1)
        errExit("add_key");

    printf("Key ID is %lx\\n", (long) key);

    exit(EXIT_SUCCESS);
}
.fi
.SH SEE ALSO
.ad l
.nh
.BR keyctl (1),
.BR keyctl (2),
.BR request_key (2),
.BR keyctl (3),
.BR keyutils (7),
.BR keyrings (7),
.BR persistent\-keyring (7),
.BR process\-keyring (7),
.BR session\-keyring (7),
.BR thread\-keyring (7),
.BR user\-keyring (7),
.BR user\-session\-keyring (7)

The kernel source files
.IR Documentation/security/keys.txt
and
.IR Documentation/security/keys\-request\-key.txt .

--------------F6DC985EE1C0B0785BB9247E--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
