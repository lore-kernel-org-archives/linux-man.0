From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Revised request_key(2) man page for review
Date: Fri, 4 Nov 2016 16:45:38 +0100
Message-ID: <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------3B32074469DAFD11642A45F2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: mtk.manpages@gmail.com, keyrings@vger.kernel.org, linux-man <linux-man@vger.kernel.org>, Eugene Syromyatnikov <evgsyr@gmail.com>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------3B32074469DAFD11642A45F2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi David (and anyone else with an interest to review)

Triggered by Eugene Syromyatnikov's recent input for the keyctl(2)
man page, I've been doing a fair bit of work on improving the key
management syscall man pages, and wonder if I could ask you for 
some review  assistance?

First off, below, I've pasted the current draft of the request_key(2)
page, which has seen quite a a lot of changes (increasing from around
100 rendered lines to nearly 300). Could you take a look (and also take
a look at the outstanding FIXME)? (The page source file is attached,
in case you want to see all the formatting.)

Thanks,

Michael

====

NAME
       request_key  -  request  a key from the kernel's key management
       facility

SYNOPSIS
       #include <sys/types.h>
       #include <keyutils.h>

       key_serial_t request_key(const char *type, const char *description,
                                const char *callout_info,
                                key_serial_t dest_keyring);

       No glibc wrapper is provided for this system call; see NOTES.

DESCRIPTION
       request_key() attempts to find a key of the given type  with  a
       description  (name) that matches the specified description.  If
       such a key could not be found, then the key is optionally  cre‐
       ated.   If  the key is found or created, request_key() attaches
       it to the keyring whose ID is  specified  in  dest_keyring  and
       returns the key's serial number.


       ┌─────────────────────────────────────────────────────┐
       │FIXME                                                │
       ├─────────────────────────────────────────────────────┤
       │Is 'keyring' allowed to be 0? Reading the source, it │
       │appears so.  In this case, by default,  the  key  is │
       │assigned   to   the   session   keyring.   But,  the │
       │KEYCTL_SET_REQKEY_KEYRING  also  seems  to  have  an │
       │influence here.  What are the details here?          │
       │                                                     │
       └─────────────────────────────────────────────────────┘

       request_key()  first recursively searches for a matching key in
       all of the keyrings  attached  to  the  calling  process.   The
       keyrings  are  searched  in the order: thread-specific keyring,
       process-specific keyring, and then session keyring.

       If  request_key()  is  called  from  a   program   invoked   by
       request_key()  on  behalf  of  some other process to generate a
       key, then the keyrings of that other process will  be  searched
       next,  using that other process's user ID, group ID, supplemen‐
       tary group IDs, and security context to determine access.

       The search of the keyring tree is breadth-first:  the  keys  in
       each  keyring searched are checked for a match before any child
       keyrings are recursed into.  Only keys for which the caller has
       search  permission  be  found,  and only keyrings for which the
       caller has search permission may be searched.

       If the key is not found and callout  is  NULL,  then  the  call
       fails with the error ENOKEY.

       If  the key is not found and callout is not NULL, then the ker‐
       nel attempts to invoke a user-space program to instantiate  the
       key.  The details are given below.

       The  dest_keyring  serial number may be that of a valid keyring
       for which the caller has write permission, or it may be one  of
       the following special keyring IDs:

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

   Requesting user-space instantiation of a key
       If the kernel cannot find a key matching type and  description,
       and  callout  is not NULL, then the kernel attempts to invoke a
       user-space program to instantiate a key with the given type and
       description.  In this case, the following steps are performed:

       a)  The  kernel  creates  an  uninstantiated  key,  U, with the
           requested type and description.

       b)  The kernel creates an authorization key, V, that refers  to
           the  key  U  and  records  the  facts  that  the  caller of
           request_key(2) is:

           (1) the context in which the key U should  be  instantiated
               and secured, and

           (2) the  context  from which associated key requests may be
               satisfied.

           The authorization key is constructed as follows:

           *  The key type is ".request_key_auth".

           *  The key's UID and GID are the same as the  corresponding
              filesystem IDs of the requesting process.

           *  The key grants view, read, and search permissions to the
              key possessor as well as view  permission  for  the  key
              user.

           *  The  description  (name)  of  the key is the hexadecimal
              string representing the ID of the  key  that  is  to  be
              instantiated in the requesting program.

           *  The  payload of the key is taken from the data specified
              in callout_info.

           *  Internally, the kernel also records a record of the  PID
              of the process that called request_key(2).

       c)  The  kernel  creates  a  process that executes a user-space
           service such as request-key(8) with a new  session  keyring
           that contains a link to the authorization key, V.

           This  program  is  supplied with the following command-line
           arguments:

           [0] The string "/sbin/request-key".

           [1] The string "create" (indicating that a  key  is  to  be
               created).

           [2] The ID of the key that is to be instantiated.

           [3] The filesystem UID of the caller of request_key().

           [4] The filesystem GID of the caller of request_key().

           [5] The   ID  of  the  thread  keyring  of  the  caller  of
               request_key().  This may be zero if that keyring hasn't
               been created.

           [6] The  ID  of  the  process  keyring  of  the  caller  of
               request_key().  This may be zero if that keyring hasn't
               been created.

           [7] The  ID  of  the  session  keyring  of  the  caller  of
               request_key().

           Note: each of the command-line arguments that is a  key  ID
           is  encoded  in  decimal  (unlike  the  key  IDs  shown  in
           /proc/keys, which are shown as hexadecimal values).

       d)  The program spawned in the previous step:

           *  Assumes the authority to instantiate the key U using the
              keyctl(2)  KEYCTL_ASSUME_AUTHORITY  operation (typically
              via the keyctl_assume_authority(3) function).

           *  Obtains the callout data from the payload of the  autho‐
              rization  key  V (using the keyctl(2) KEYCTL_READ opera‐
              tion (or, more commonly,  the  keyctl_read(3)  function)
              with a key ID value of KEY_SPEC_REQKEY_AUTH_KEY).

           *  Instantiates the key (or execs another program that per‐
              forms that task), specifying the payload and destination
              keyring.   (The  destination  keyring that the requestor
              specified when calling  request_key()  can  be  accessed
              using  the  special  key ID KEY_SPEC_REQUESTOR_KEYRING.)
              Instantiation   is   performed   using   the   keyctl(2)
              KEYCTL_INSTANTIATE  operation  (or,  more  commonly, the
              keyctl_instantiate(3) function).   At  this  point,  the
              request_key(2)  call  completes, and the requesting pro‐
              gram can continue execution.

       If these steps are unsuccessful, then an ENOKEY error  will  be
       returned  to  the caller of request_key() and a temporary nega‐
       tive  key  will  be  installed  in  the  keyring  specified  by
       dest_keyring.   This  will expire after a few seconds, but will
       cause subsequent calls to request_key() to fail until it  does.
       The  purpose  of this negatively instantiated key is to prevent
       (possibly different) processes making repeated  requests  (that
       require  expensive request-key(8) upcalls) for a key that can't
       (at the moment) be positively instantiated.

       Once the key  has  been  instantiated,  the  authorization  key
       (KEY_SPEC_REQKEY_AUTH_KEY)  is  revoked,  and  the  destination
       keyring (KEY_SPEC_REQUESTOR_KEYRING) is  no  longer  accessible
       from the request-key(8) program.

       If  a  key is created, then—regardless of whether it is a valid
       key or a negative key—it will displace any other key  with  the
       same  type  and  description  from  the  keyring  specified  in
       dest_keyring.

RETURN VALUE
       On success, request_key() returns the serial number of the  key
       it found or caused to be created.  On error, -1 is returned and
       errno is set to indicate the cause of the error.

ERRORS
       EACCES The keyring wasn't available  for  modification  by  the
              user.

       EDQUOT The  key quota for this user would be exceeded by creat‐
              ing this key or linking it to the keyring.

       EINTR  The request was interrupted by a signal; see signal(7).

       EINVAL The size of the string (including the  terminating  null
              byte)  specified  in  type  or  description exceeded the
              limit (32 bytes and 4096 bytes respectively).

       EINVAL The size of the string (including the  terminating  null
              byte) specified in callout_info exceeded the system page
              size.

       EKEYEXPIRED
              An expired key was found, but no  replacement  could  be
              obtained.

       EKEYREJECTED
              The attempt to generate a new key was rejected.

       EKEYREVOKED
              A  revoked  key  was  found, but no replacement could be
              obtained.

       ENOKEY No matching key was found.

       ENOMEM Insufficient memory to create a key.

VERSIONS
       This system call first appeared in Linux 2.6.10.

CONFORMING TO
       This system call is a nonstandard Linux extension.

NOTES
       No wrapper for this system call is provided in glibc.  A  wrap‐
       per is provided in the libkeyutils package.  When employing the
       wrapper in that library, link with -lkeyutils.

EXAMPLE
       The program below demonstrates the use of  request_key().   The
       type,  description,  and  callout_info arguments for the system
       call are taken from the values supplied  in  the  command  line
       arguments.   The call specifies the session keyring as the tar‐
       get keyring.

       In order to demonstrate this program, we first create  a  suit‐
       able entry in the file /etc/request-key.conf.

           $ sudo sh
           # echo 'create user mtk:* *   /bin/keyctl instantiate %k %c %S' \
                     > /etc/request-keys.conf
           # exit

       This entry specifies that when a new "user" key with the prefix
       "mtk:" must be instantiated, that task should be performed  via
       the  keyctl(1)  command's  instantiate operation.  (The program
       could The arguments supplied to the instantiate operation  are:
       the  ID  of  the uninstantiated key (%k); the callout data sup‐
       plied to the request_key() call (%c); and the  session  keyring
       (%S)  of  the  requestor  (i.e.,  the caller of request)key()).
       i(See request-key.conf(5) for details of these % specifiers.)

       Then we run the program and check the contents of /proc/keys to
       verify that the requested kay has been instantiated:

           $ ./a.out user mtk:key1 "Payload data"
           $ grep '2dddaf50' /proc/keys
           2dddaf50 I--Q---   1 perm 3f010000  1000  1000 user   mtk:key1: 12

   Program source
       The program below
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
               fprintf(stderr, "Usage: %s type description callout-data\n",
                       argv[0]);
               exit(EXIT_FAILURE);
           }

           key = request_key(argv[1], argv[2], argv[3],
                             KEY_SPEC_SESSION_KEYRING);
           if (key == -1)
               errExit("request_key");

           printf("Key ID is %lx\n", (long) key);

           exit(EXIT_SUCCESS);
       }

SEE ALSO
       keyctl(1), add_key(2), keyctl(2), keyctl(3), keyrings(7),
       keyutils(7), capabilities(7), persistent-keyring(7),
       process-keyring(7), session-keyring(7), thread-keyring(7),
       user-keyring(7), user-session-keyring(7), request-key(8)

       The kernel source files Documentation/security/keys.txt and
       Documentation/security/keys-request-key.txt.



Linux                         2016-10-08                REQUEST_KEY(2)

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/

--------------3B32074469DAFD11642A45F2
Content-Type: application/x-troff-man;
 name="request_key.2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="request_key.2"

.\" Copyright (C) 2006 Red Hat, Inc. All Rights Reserved.
.\"     Written by David Howells (dhowells@redhat.com)
.\" and Copyright (C) 2016 Michael Kerrisk <mtk.man-pages@gmail.com>
.\"
.\" %%%LICENSE_START(GPLv2+_SW_ONEPARA)
.\" This program is free software; you can redistribute it and/or
.\" modify it under the terms of the GNU General Public License
.\" as published by the Free Software Foundation; either version
.\" 2 of the License, or (at your option) any later version.
.\" %%%LICENSE_END
.\"
.TH REQUEST_KEY 2 2016-10-08 Linux "Linux Key Management Calls"
.SH NAME
request_key \- request a key from the kernel's key management facility
.SH SYNOPSIS
.nf
.B #include <sys/types.h>
.B #include <keyutils.h>
.sp
.BI "key_serial_t request_key(const char *" type ", const char *" description ,
.BI "                         const char *" callout_info ,
.BI "                         key_serial_t " dest_keyring ");"
.fi

No glibc wrapper is provided for this system call; see NOTES.
.SH DESCRIPTION
.BR request_key ()
attempts to find a key of the given
.I type
with a description (name) that matches the specified
.IR description .
If such a key could not be found, then the key is optionally created.
If the key is found or created,
.BR request_key ()
attaches it to the keyring whose ID is specified in
.I dest_keyring
and returns the key's serial number.
.\" FIXME Is 'keyring' allowed to be 0? Reading the source, it appears so.
.\" In this case, by default, the key is assigned to the session keyring.
.\" But, the KEYCTL_SET_REQKEY_KEYRING also seems to have an influence here.
.\" What are the details here?
.\"

.BR request_key ()
first recursively searches for a matching key in all of the keyrings
attached to the calling process.
The keyrings are searched in the order: thread-specific keyring,
process-specific keyring, and then session keyring.
.P
If
.BR request_key ()
is called from a program invoked by
.BR request_key ()
on behalf of some other process to generate a key, then the keyrings of that
other process will be searched next,
using that other process's user ID, group ID,
supplementary group IDs, and security context to determine access.
.\" David Howells: we can then have an arbitrarily long sequence
.\" of "recursive" request-key upcalls. There is no limit, other
.\" than number of PIDs, etc.
.P
The search of the keyring tree is breadth-first:
the keys in each keyring searched are checked for a match before any child
keyrings are recursed into.
Only keys for which the caller has
.I search
permission be found, and only keyrings for which the caller has
.I search
permission may be searched.
.P
If the key is not found and
.I callout
is NULL, then the call fails with the error
.BR ENOKEY .

If the key is not found and
.I callout
is not NULL, then the kernel attempts to invoke a user-space
program to instantiate the key.
The details are given below.

The
.I dest_keyring
serial number may be that of a valid keyring for which the caller has
.I write
permission, or it may be one of the following special keyring IDs:
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
.\"
.SS Requesting user-space instantiation of a key
If the kernel cannot find a key matching
.IR type
and
.IR description ,
and
.I callout
is not NULL, then the kernel attempts to invoke a user-space
program to instantiate a key with the given
.IR type
and
.IR description .
In this case, the following steps are performed:
.IP a) 4
The kernel creates an uninstantiated key, U, with the requested
.I type
and
.IR description .
.IP b)
The kernel creates an authorization key, V,
.\" struct request_key_auth, defined in security/keys/internal.h
that refers to the key U and records the facts that the caller of
.BR request_key (2)
is:
.RS
.IP (1) 4
the context in which the key U should be instantiated and secured, and
.IP (2) 
the context from which associated key requests may be satisfied.
.RE
.IP
The authorization key is constructed as follows:
.RS
.IP * 3
The key type is
.IR """.request_key_auth""" .
.IP *
The key's UID and GID are the same as the corresponding filesystem IDs
of the requesting process.
.IP *
The key grants
.IR view ,
.IR read ,
and
.IR search
permissions to the key possessor as well as
.IR view
permission for the key user.
.IP *
The description (name) of the key is the hexadecimal
string representing the ID of the key that is to be instantiated
in the requesting program.
.IP *
The payload of the key is taken from the data specified in
.IR callout_info .
.IP *
Internally, the kernel also records a record of the PID of the process
that called
.BR request_key (2).
.RE
.IP c)
The kernel creates a process that executes a user-space service such as
.BR request-key (8)
with a new session keyring that contains a link to the authorization key, V.
.\" The request-key(8) program can be invoked in circumstances *other* than
.\" when triggered by request_key(2). For example, upcalls from places such
.\" as the DNS resolver.

This program is supplied with the following command-line arguments:
.RS
.IP [0] 4
The string
.IR """/sbin/request-key""" .
.IP [1]
The string
.I """create"""
(indicating that a key is to be created).
.IP [2]
The ID of the key that is to be instantiated.
.IP [3]
The filesystem UID of the caller of
.BR request_key ().
.IP [4]
The filesystem GID of the caller of
.BR request_key ().
.IP [5]
The ID of the thread keyring of the caller of
.BR request_key ().
This may be zero if that keyring hasn't been created.
.IP [6]
The ID of the process keyring of the caller of
.BR request_key ().
This may be zero if that keyring hasn't been created.
.IP [7]
The ID of the session keyring of the caller of
.BR request_key ().
.RE
.IP
.IR Note :
each of the command-line arguments that is a key ID is encoded in
.IR decimal
(unlike the key IDs shown in
.IR /proc/keys ,
which are shown as hexadecimal values).
.IP d)
The program spawned in the previous step:
.RS
.IP * 3
Assumes the authority to instantiate the key U using the
.BR keyctl (2)
.BR KEYCTL_ASSUME_AUTHORITY
operation (typically via the
.BR keyctl_assume_authority (3)
function).
.IP *
Obtains the callout data from the payload of the authorization key V
(using the
.BR keyctl (2)
.BR KEYCTL_READ
operation (or, more commonly, the
.BR keyctl_read (3)
function) with a key ID value of
.BR KEY_SPEC_REQKEY_AUTH_KEY ).
.IP *
Instantiates the key
(or execs another program that performs that task),
specifying the payload and destination keyring.
(The destination keyring that the requestor specified when calling
.BR request_key ()
can be accessed using the special key ID
.BR KEY_SPEC_REQUESTOR_KEYRING .)
.\" Should an instantiating program be using KEY_SPEC_REQUESTOR_KEYRING?
.\" I couldn't find a use in the keyutils git repo.
.\" According to David Howells:
.\" * This feature is provided, but not used at the moment.
.\" * A key added to that ring is then owned by the requester
Instantiation is performed using the
.BR keyctl (2)
.BR KEYCTL_INSTANTIATE
operation (or, more commonly, the
.BR keyctl_instantiate (3)
function).
At this point, the
.BR request_key (2)
call completes, and the requesting program can continue execution.
.RE
.P
If these steps are unsuccessful, then an
.BR ENOKEY
error will be returned to the caller of
.BR request_key ()
and a temporary negative key will be installed in the keyring specified by
.IR dest_keyring .
This will expire after a few seconds, but will cause subsequent calls to
.BR request_key ()
to fail until it does.
The purpose of this negatively instantiated key is to prevent
(possibly different) processes making repeated requests
(that require expensive
.BR request-key (8)
upcalls) for a key that can't (at the moment) be positively instantiated.

Once the key has been instantiated, the authorization key
.RB ( KEY_SPEC_REQKEY_AUTH_KEY )
is revoked, and the destination keyring
.RB ( KEY_SPEC_REQUESTOR_KEYRING )
is no longer accessible from the
.BR request-key (8)
program.

If a key is created, then\(emregardless of whether it is a valid key or
a negative key\(emit will displace any other key with
the same type and description from the keyring specified in
.IR dest_keyring .
.SH RETURN VALUE
On success,
.BR request_key ()
returns the serial number of the key it found or caused to be created.
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
.B EINTR
The request was interrupted by a signal; see
.BR signal (7).
.TP
.B EINVAL
The size of the string (including the terminating null byte) specified in
.I type
or
.I description
exceeded the limit (32 bytes and 4096 bytes respectively).
.TP
.B EINVAL
The size of the string (including the terminating null byte) specified in
.I callout_info
exceeded the system page size.
.TP
.B EKEYEXPIRED
An expired key was found, but no replacement could be obtained.
.TP
.B EKEYREJECTED
The attempt to generate a new key was rejected.
.TP
.B EKEYREVOKED
A revoked key was found, but no replacement could be obtained.
.TP
.B ENOKEY
No matching key was found.
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
The program below demonstrates the use of
.BR request_key ().
The
.IR type ,
.IR description ,
and
.BR callout_info
arguments for the system call are taken from the values
supplied in the command line arguments.
The call specifies the session keyring as the target keyring.

In order to demonstrate this program,
we first create a suitable entry in the file
.IR /etc/request-key.conf .

.in +4n
.nf
$ sudo sh
# \fBecho 'create user mtk:* *   /bin/keyctl instantiate %k %c %S' \\\fP
          \fB> /etc/request-keys.conf\fP
# \fBexit\fP
.fi
.in

This entry specifies that when a new "user" key with the prefix
"mtk:" must be instantiated, that task should be performed via the
.BR keyctl (1)
command's
.B instantiate
operation.
(The program could 
The arguments supplied to the
.B instantiate
operation are:
the ID of the uninstantiated key
.RI ( %k );
the callout data supplied to the
.BR request_key ()
call
.RI ( %c );
and the session keyring
.RI ( %S )
of the requestor (i.e., the caller of
.BR request)key ()).
i(See
.BR request-key.conf (5)
for details of these
.I %
specifiers.)

Then we run the program and check the contents of
.IR /proc/keys
to verify that the requested kay has been instantiated:

.in +4n
.nf
$ \fB./a.out user mtk:key1 "Payload data"\fP
$ \fBgrep \(aq2dddaf50\(aq /proc/keys\fP
2dddaf50 I--Q---   1 perm 3f010000  1000  1000 user   mtk:key1: 12
.fi
.in
.SS Program source
The program below
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
        fprintf(stderr, "Usage: %s type description callout\-data\\n",
                argv[0]);
        exit(EXIT_FAILURE);
    }

    key = request_key(argv[1], argv[2], argv[3],
                      KEY_SPEC_SESSION_KEYRING);
    if (key == \-1)
        errExit("request_key");

    printf("Key ID is %lx\\n", (long) key);

    exit(EXIT_SUCCESS);
}
.fi
.SH SEE ALSO
.ad l
.nh
.BR keyctl (1),
.BR add_key (2),
.BR keyctl (2),
.BR keyctl (3),
.BR keyrings (7),
.BR keyutils (7),
.BR capabilities (7),
.BR persistent\-keyring (7),
.BR process\-keyring (7),
.BR session\-keyring (7),
.BR thread\-keyring (7),
.BR user\-keyring (7),
.BR user\-session\-keyring (7),
.BR request\-key (8)

The kernel source files
.IR Documentation/security/keys.txt
and
.IR Documentation/security/keys\-request\-key.txt .

--------------3B32074469DAFD11642A45F2--
