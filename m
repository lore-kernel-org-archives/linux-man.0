From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Revised request_key(2) man page for review
Date: Wed, 14 Dec 2016 15:23:39 +0100
Message-ID: <CAKgNAkiOzLwoLN-Kaa3-jHUJuYxp-YcL-5FbCe-pOkxGq_u5-g@mail.gmail.com>
References: <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>, keyrings@vger.kernel.org, linux-man <linux-man@vger.kernel.org>, Eugene Syromyatnikov <evgsyr@gmail.com>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hi David,

Might you also have a chance to take a look at this page?

Cheers,

Michael


On 4 November 2016 at 16:45, Michael Kerrisk (man-pages)
<mtk.manpages@gmail.com> wrote:
> Hi David (and anyone else with an interest to review)
>
> Triggered by Eugene Syromyatnikov's recent input for the keyctl(2)
> man page, I've been doing a fair bit of work on improving the key
> management syscall man pages, and wonder if I could ask you for
> some review  assistance?
>
> First off, below, I've pasted the current draft of the request_key(2)
> page, which has seen quite a a lot of changes (increasing from around
> 100 rendered lines to nearly 300). Could you take a look (and also take
> a look at the outstanding FIXME)? (The page source file is attached,
> in case you want to see all the formatting.)
>
> Thanks,
>
> Michael
>
> =3D=3D=3D=3D
>
> NAME
>        request_key  -  request  a key from the kernel's key management
>        facility
>
> SYNOPSIS
>        #include <sys/types.h>
>        #include <keyutils.h>
>
>        key_serial_t request_key(const char *type, const char *description=
,
>                                 const char *callout_info,
>                                 key_serial_t dest_keyring);
>
>        No glibc wrapper is provided for this system call; see NOTES.
>
> DESCRIPTION
>        request_key() attempts to find a key of the given type  with  a
>        description  (name) that matches the specified description.  If
>        such a key could not be found, then the key is optionally  cre=E2=
=80=90
>        ated.   If  the key is found or created, request_key() attaches
>        it to the keyring whose ID is  specified  in  dest_keyring  and
>        returns the key's serial number.
>
>
>        =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>        =E2=94=82FIXME                                                =E2=
=94=82
>        =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=A4
>        =E2=94=82Is 'keyring' allowed to be 0? Reading the source, it =E2=
=94=82
>        =E2=94=82appears so.  In this case, by default,  the  key  is =E2=
=94=82
>        =E2=94=82assigned   to   the   session   keyring.   But,  the =E2=
=94=82
>        =E2=94=82KEYCTL_SET_REQKEY_KEYRING  also  seems  to  have  an =E2=
=94=82
>        =E2=94=82influence here.  What are the details here?          =E2=
=94=82
>        =E2=94=82                                                     =E2=
=94=82
>        =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>
>        request_key()  first recursively searches for a matching key in
>        all of the keyrings  attached  to  the  calling  process.   The
>        keyrings  are  searched  in the order: thread-specific keyring,
>        process-specific keyring, and then session keyring.
>
>        If  request_key()  is  called  from  a   program   invoked   by
>        request_key()  on  behalf  of  some other process to generate a
>        key, then the keyrings of that other process will  be  searched
>        next,  using that other process's user ID, group ID, supplemen=E2=
=80=90
>        tary group IDs, and security context to determine access.
>
>        The search of the keyring tree is breadth-first:  the  keys  in
>        each  keyring searched are checked for a match before any child
>        keyrings are recursed into.  Only keys for which the caller has
>        search  permission  be  found,  and only keyrings for which the
>        caller has search permission may be searched.
>
>        If the key is not found and callout  is  NULL,  then  the  call
>        fails with the error ENOKEY.
>
>        If  the key is not found and callout is not NULL, then the ker=E2=
=80=90
>        nel attempts to invoke a user-space program to instantiate  the
>        key.  The details are given below.
>
>        The  dest_keyring  serial number may be that of a valid keyring
>        for which the caller has write permission, or it may be one  of
>        the following special keyring IDs:
>
>        KEY_SPEC_THREAD_KEYRING
>               This  specifies  the  caller's  thread-specific  keyring
>               (thread-keyring(7)).
>
>        KEY_SPEC_PROCESS_KEYRING
>               This specifies  the  caller's  process-specific  keyring
>               (process-keyring(7)).
>
>        KEY_SPEC_SESSION_KEYRING
>               This  specifies  the  caller's  session-specific keyring
>               (session-keyring(7)).
>
>        KEY_SPEC_USER_KEYRING
>               This specifies the caller's UID-specific keyring  (user-
>               keyring(7)).
>
>        KEY_SPEC_USER_SESSION_KEYRING
>               This  specifies  the caller's UID-session keyring (user-
>               session-keyring(7)).
>
>    Requesting user-space instantiation of a key
>        If the kernel cannot find a key matching type and  description,
>        and  callout  is not NULL, then the kernel attempts to invoke a
>        user-space program to instantiate a key with the given type and
>        description.  In this case, the following steps are performed:
>
>        a)  The  kernel  creates  an  uninstantiated  key,  U, with the
>            requested type and description.
>
>        b)  The kernel creates an authorization key, V, that refers  to
>            the  key  U  and  records  the  facts  that  the  caller of
>            request_key(2) is:
>
>            (1) the context in which the key U should  be  instantiated
>                and secured, and
>
>            (2) the  context  from which associated key requests may be
>                satisfied.
>
>            The authorization key is constructed as follows:
>
>            *  The key type is ".request_key_auth".
>
>            *  The key's UID and GID are the same as the  corresponding
>               filesystem IDs of the requesting process.
>
>            *  The key grants view, read, and search permissions to the
>               key possessor as well as view  permission  for  the  key
>               user.
>
>            *  The  description  (name)  of  the key is the hexadecimal
>               string representing the ID of the  key  that  is  to  be
>               instantiated in the requesting program.
>
>            *  The  payload of the key is taken from the data specified
>               in callout_info.
>
>            *  Internally, the kernel also records a record of the  PID
>               of the process that called request_key(2).
>
>        c)  The  kernel  creates  a  process that executes a user-space
>            service such as request-key(8) with a new  session  keyring
>            that contains a link to the authorization key, V.
>
>            This  program  is  supplied with the following command-line
>            arguments:
>
>            [0] The string "/sbin/request-key".
>
>            [1] The string "create" (indicating that a  key  is  to  be
>                created).
>
>            [2] The ID of the key that is to be instantiated.
>
>            [3] The filesystem UID of the caller of request_key().
>
>            [4] The filesystem GID of the caller of request_key().
>
>            [5] The   ID  of  the  thread  keyring  of  the  caller  of
>                request_key().  This may be zero if that keyring hasn't
>                been created.
>
>            [6] The  ID  of  the  process  keyring  of  the  caller  of
>                request_key().  This may be zero if that keyring hasn't
>                been created.
>
>            [7] The  ID  of  the  session  keyring  of  the  caller  of
>                request_key().
>
>            Note: each of the command-line arguments that is a  key  ID
>            is  encoded  in  decimal  (unlike  the  key  IDs  shown  in
>            /proc/keys, which are shown as hexadecimal values).
>
>        d)  The program spawned in the previous step:
>
>            *  Assumes the authority to instantiate the key U using the
>               keyctl(2)  KEYCTL_ASSUME_AUTHORITY  operation (typically
>               via the keyctl_assume_authority(3) function).
>
>            *  Obtains the callout data from the payload of the  autho=E2=
=80=90
>               rization  key  V (using the keyctl(2) KEYCTL_READ opera=E2=
=80=90
>               tion (or, more commonly,  the  keyctl_read(3)  function)
>               with a key ID value of KEY_SPEC_REQKEY_AUTH_KEY).
>
>            *  Instantiates the key (or execs another program that per=E2=
=80=90
>               forms that task), specifying the payload and destination
>               keyring.   (The  destination  keyring that the requestor
>               specified when calling  request_key()  can  be  accessed
>               using  the  special  key ID KEY_SPEC_REQUESTOR_KEYRING.)
>               Instantiation   is   performed   using   the   keyctl(2)
>               KEYCTL_INSTANTIATE  operation  (or,  more  commonly, the
>               keyctl_instantiate(3) function).   At  this  point,  the
>               request_key(2)  call  completes, and the requesting pro=E2=
=80=90
>               gram can continue execution.
>
>        If these steps are unsuccessful, then an ENOKEY error  will  be
>        returned  to  the caller of request_key() and a temporary nega=E2=
=80=90
>        tive  key  will  be  installed  in  the  keyring  specified  by
>        dest_keyring.   This  will expire after a few seconds, but will
>        cause subsequent calls to request_key() to fail until it  does.
>        The  purpose  of this negatively instantiated key is to prevent
>        (possibly different) processes making repeated  requests  (that
>        require  expensive request-key(8) upcalls) for a key that can't
>        (at the moment) be positively instantiated.
>
>        Once the key  has  been  instantiated,  the  authorization  key
>        (KEY_SPEC_REQKEY_AUTH_KEY)  is  revoked,  and  the  destination
>        keyring (KEY_SPEC_REQUESTOR_KEYRING) is  no  longer  accessible
>        from the request-key(8) program.
>
>        If  a  key is created, then=E2=80=94regardless of whether it is a =
valid
>        key or a negative key=E2=80=94it will displace any other key  with=
  the
>        same  type  and  description  from  the  keyring  specified  in
>        dest_keyring.
>
> RETURN VALUE
>        On success, request_key() returns the serial number of the  key
>        it found or caused to be created.  On error, -1 is returned and
>        errno is set to indicate the cause of the error.
>
> ERRORS
>        EACCES The keyring wasn't available  for  modification  by  the
>               user.
>
>        EDQUOT The  key quota for this user would be exceeded by creat=E2=
=80=90
>               ing this key or linking it to the keyring.
>
>        EINTR  The request was interrupted by a signal; see signal(7).
>
>        EINVAL The size of the string (including the  terminating  null
>               byte)  specified  in  type  or  description exceeded the
>               limit (32 bytes and 4096 bytes respectively).
>
>        EINVAL The size of the string (including the  terminating  null
>               byte) specified in callout_info exceeded the system page
>               size.
>
>        EKEYEXPIRED
>               An expired key was found, but no  replacement  could  be
>               obtained.
>
>        EKEYREJECTED
>               The attempt to generate a new key was rejected.
>
>        EKEYREVOKED
>               A  revoked  key  was  found, but no replacement could be
>               obtained.
>
>        ENOKEY No matching key was found.
>
>        ENOMEM Insufficient memory to create a key.
>
> VERSIONS
>        This system call first appeared in Linux 2.6.10.
>
> CONFORMING TO
>        This system call is a nonstandard Linux extension.
>
> NOTES
>        No wrapper for this system call is provided in glibc.  A  wrap=E2=
=80=90
>        per is provided in the libkeyutils package.  When employing the
>        wrapper in that library, link with -lkeyutils.
>
> EXAMPLE
>        The program below demonstrates the use of  request_key().   The
>        type,  description,  and  callout_info arguments for the system
>        call are taken from the values supplied  in  the  command  line
>        arguments.   The call specifies the session keyring as the tar=E2=
=80=90
>        get keyring.
>
>        In order to demonstrate this program, we first create  a  suit=E2=
=80=90
>        able entry in the file /etc/request-key.conf.
>
>            $ sudo sh
>            # echo 'create user mtk:* *   /bin/keyctl instantiate %k %c %S=
' \
>                      > /etc/request-keys.conf
>            # exit
>
>        This entry specifies that when a new "user" key with the prefix
>        "mtk:" must be instantiated, that task should be performed  via
>        the  keyctl(1)  command's  instantiate operation.  (The program
>        could The arguments supplied to the instantiate operation  are:
>        the  ID  of  the uninstantiated key (%k); the callout data sup=E2=
=80=90
>        plied to the request_key() call (%c); and the  session  keyring
>        (%S)  of  the  requestor  (i.e.,  the caller of request)key()).
>        i(See request-key.conf(5) for details of these % specifiers.)
>
>        Then we run the program and check the contents of /proc/keys to
>        verify that the requested kay has been instantiated:
>
>            $ ./a.out user mtk:key1 "Payload data"
>            $ grep '2dddaf50' /proc/keys
>            2dddaf50 I--Q---   1 perm 3f010000  1000  1000 user   mtk:key1=
: 12
>
>    Program source
>        The program below
>        #include <sys/types.h>
>        #include <keyutils.h>
>        #include <stdio.h>
>        #include <stdlib.h>
>        #include <string.h>
>
>        #define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \
>                                } while (0)
>
>        int
>        main(int argc, char *argv[])
>        {
>            key_serial_t key;
>
>            if (argc !=3D 4) {
>                fprintf(stderr, "Usage: %s type description callout-data\n=
",
>                        argv[0]);
>                exit(EXIT_FAILURE);
>            }
>
>            key =3D request_key(argv[1], argv[2], argv[3],
>                              KEY_SPEC_SESSION_KEYRING);
>            if (key =3D=3D -1)
>                errExit("request_key");
>
>            printf("Key ID is %lx\n", (long) key);
>
>            exit(EXIT_SUCCESS);
>        }
>
> SEE ALSO
>        keyctl(1), add_key(2), keyctl(2), keyctl(3), keyrings(7),
>        keyutils(7), capabilities(7), persistent-keyring(7),
>        process-keyring(7), session-keyring(7), thread-keyring(7),
>        user-keyring(7), user-session-keyring(7), request-key(8)
>
>        The kernel source files Documentation/security/keys.txt and
>        Documentation/security/keys-request-key.txt.
>
>
>
> Linux                         2016-10-08                REQUEST_KEY(2)
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
