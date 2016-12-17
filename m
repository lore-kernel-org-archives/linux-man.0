From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] request_key.2: add information regarding default
 keyring
Date: Sat, 17 Dec 2016 13:21:15 +0100
Message-ID: <6df2c812-c2d6-321c-902f-93b4d3aaa953@gmail.com>
References: <528b203d-ac72-e4a6-8517-e8c5c11055a4@gmail.com>
 <20161121205940.GA16505@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161121205940.GA16505@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Eugene, (and David)

[David, could you take a look at the FIXMEs below?]

On 11/21/2016 09:59 PM, Eugene Syromyatnikov wrote:
> ---
>  man2/request_key.2 | 47 ++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 42 insertions(+), 5 deletions(-)
> 
> diff --git a/man2/request_key.2 b/man2/request_key.2
> index a9d0561..e29ca06 100644
> --- a/man2/request_key.2
> +++ b/man2/request_key.2
> @@ -35,11 +35,6 @@ If the key is found or created,
>  attaches it to the keyring whose ID is specified in
>  .I dest_keyring
>  and returns the key's serial number.
> -.\" FIXME Is 'keyring' allowed to be 0? Reading the source, it appears so.
> -.\" In this case, by default, the key is assigned to the session keyring.
> -.\" But, the KEYCTL_SET_REQKEY_KEYRING also seems to have an influence here.
> -.\" What are the details here?
> -.\"
>  
>  .BR request_key ()
>  first recursively searches for a matching key in all of the keyrings
> @@ -104,6 +99,48 @@ This specifies the caller's UID-specific keyring
>  .B KEY_SPEC_USER_SESSION_KEYRING
>  This specifies the caller's UID-session keyring
>  .RB ( user-session-keyring (7)).
> +.PP
> +When the
> +.I dest_keyring
> +is specified to
> +.BR 0 ,
> +and no key construction have been performed, then no additional linking is done.
> +Otherwise, if new key is constructed, it would be linked to the "default"
> +keyring (which can be specified via the
> +.BR keyctl (2)
> +command
> +.BR KEYCTL_SET_REQKEY_KEYRING ).
> +More specifically, when kernel tries to determine to which keyring the
> +newly constructed key should be linked, it tries the following options, starting
> +from the value set via
> +.BR KEYCTL_SET_REQKEY_KEYRING " " keyctl (2)
> +command until it finds the first available one:
> +.IP \(bu 3
> +.\" 8bbf4976b59fc9fc2861e79cab7beb3f6d647640
> +Requestor keyring (specified via
> +.BR KEY_REQKEY_DEFL_REQUESTOR_KEYRING ,
> +since Linux 2.6.29)
> +.IP \(bu
> +Thread-specific keyring (specified via
> +.BR KEY_REQKEY_DEFL_THREAD_KEYRING )
> +.IP \(bu
> +Process-specific keyring (specified via
> +.BR KEY_REQKEY_DEFL_PROCESS_KEYRING )
> +.IP \(bu
> +Session-specific keyring (specified via
> +.BR KEY_REQKEY_DEFL_SESSION_KEYRING )
> +.IP \(bu
> +Session keyring for the process's user ID  (specified via
> +.BR KEY_REQKEY_DEFL_USER_SESSION_KEYRING ).
> +This keyring is expected to always exist.
> +.IP \(bu
> +UID-specific keyring (specified via
> +.BR KEY_REQKEY_DEFL_USER_KEYRING ).
> +This keyring is also expected to always exist.
> +.PP
> +Specifying
> +.B KEY_REQKEY_DEFL_DEFAULT
> +leads to starting from the beginning of the list.
>  .\"
>  .SS Requesting user-space instantiation of a key
>  If the kernel cannot find a key matching

Thanks. Everything that I tested concurs with your patch, but
I've done some rewording that makes things a bit clearer, and
I've added one or two details. 

How does the following look:

       The  dest_keyring serial number may be that of a valid keyring for
       which the caller has write permission, or it may  be  one  of  the
       following special keyring IDs:

       KEY_SPEC_THREAD_KEYRING
              This   specifies   the   caller's  thread-specific  keyring
              (thread-keyring(7)).

       KEY_SPEC_PROCESS_KEYRING
              This  specifies  the  caller's   process-specific   keyring
              (process-keyring(7)).

       KEY_SPEC_SESSION_KEYRING
              This  specifies the caller's session-specific keyring (ses‐
              sion-keyring(7)).

       KEY_SPEC_USER_KEYRING
              This specifies the  caller's  UID-specific  keyring  (user-
              keyring(7)).

       KEY_SPEC_USER_SESSION_KEYRING
              This  specifies the caller's UID-session keyring (user-ses‐
              sion-keyring(7)).

       When the dest_keyring is specified to 0, and no  key  construction
       have been performed, then no additional linking is done.

       Otherwise,  if  dest_keyring is 0 and a new key is constructed, the new
       key will be linked to the "default" keyring.  More precisely, when  the
       kernel  tries  to  determine to which keyring the newly constructed key
       should be linked, it tries the following keyrings, beginning  with  the
       keyring  set  via  the  keyctl(2) KEYCTL_SET_REQKEY_KEYRING command and
       continuing in the order shown below until it finds  the  first  keyring
       that exists:

       ·  The   requestor  keyring  (KEY_REQKEY_DEFL_REQUESTOR_KEYRING,  since
          Linux 2.6.29).

          ┌─────────────────────────────────────────────────────┐
          │FIXME                                                │
          ├─────────────────────────────────────────────────────┤
          │Actually, is the  preceding  point  correct?   If  I │
          │understand  correctly,  we'll only get here if won't │
          │refer to a keyring. Have I misunderstood?            │
          └─────────────────────────────────────────────────────┘

       ·  The thread-specific keyring (KEY_REQKEY_DEFL_THREAD_KEYRING).

       ·  The process-specific keyring (KEY_REQKEY_DEFL_PROCESS_KEYRING).

       ·  The session-specific keyring (KEY_REQKEY_DEFL_SESSION_KEYRING).

       ·  The    session    keyring    for    the    process's     user     ID
          (KEY_REQKEY_DEFL_USER_SESSION_KEYRING).  This keyring is expected to
          always exist.

          ┌─────────────────────────────────────────────────────┐
          │FIXME                                                │
          ├─────────────────────────────────────────────────────┤
          │Are there circumstances where  the  session  keyring │
          │does not exist?  What are they?                      │
          └─────────────────────────────────────────────────────┘

       ·  The   UID-specific   keyring  (KEY_REQKEY_DEFL_USER_KEYRING).   This
          keyring is also expected to always exist.

          ┌─────────────────────────────────────────────────────┐
          │FIXME                                                │
          ├─────────────────────────────────────────────────────┤
          │Are  there  circumstances  where  the   UID-specific │
          │keyring does not exist?  What are they?              │
          └─────────────────────────────────────────────────────┘

       If    the   keyctl(2)   KEYCTL_SET_REQKEY_KEYRING   command   specifies
       KEY_REQKEY_DEFL_DEFAULT (or  no  KEYCTL_SET_REQKEY_KEYRING  command  is
       performed),  then  the  kernel  looks  for  a keyring starting from the
       beginning of the list.

These changes have been pushed to the public branch:
http://git.kernel.org/cgit/docs/man-pages/man-pages.git/log/?h=draft_2_keys

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
